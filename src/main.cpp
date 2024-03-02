#include <cstdio>

#include <crow/app.h>
#include <crow/http_request.h>
#include <crow/http_response.h>

int main(int argc, const char **argv) {
	crow::SimpleApp app;

	crow::mustache::set_base("templates");

	CROW_ROUTE(app, "/auth/authorize")
	.methods("GET"_method)
	([](const crow::request& req) {
		const static auto page = crow::mustache::load("auth/authorize.html");
		return page.render();
	});

	app.port(8123).multithreaded().run();
}
