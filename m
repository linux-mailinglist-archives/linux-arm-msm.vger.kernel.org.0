Return-Path: <linux-arm-msm+bounces-71292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FAEB3CF7F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 23:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C1447A27E4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 21:17:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB00256C70;
	Sat, 30 Aug 2025 21:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="o7W+15EU";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hANspEkQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FE1218ADD;
	Sat, 30 Aug 2025 21:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756588719; cv=none; b=Ifr8JVqDU8/8JBe9+5TMVgSyR4RykbgySg7PuF+W/7nAHSQUeyVztOQfpekIyB1LUzzTjLmQMS+vX3zdUv2pkHlapigBZRLz6LQWBZ6oAO03m91XMcm/jLjpWeLYc15jZiyQPfF7uUSO2VEzYJ4DCkJNsE2+uVN+5uf7eXE8h+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756588719; c=relaxed/simple;
	bh=CBLy8/WYPaCr1SzkbgPD1dFINhkAMk8tA0yM0q/hdOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kdsiYUw4BiWDbbFDGbYGhLK7R04QfLtHnzdZNGr0E5bsV18jam0OD+yWfW/kOZmXqbRj3cDO9JdoBd5L5mluVnofzHfYAgHrbVSnrRoAcsYkoP/T2fS/ueNtYEZ0sg11dmixoOFmDidWjxGy3VJfK0tk+qkVUIkzljPCzunf5vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=o7W+15EU; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hANspEkQ; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756588402; bh=vp9BFqVCsrqy1VHNRz6BRNP
	RHNjMy4Nb9AHUlnIB13c=; b=o7W+15EU+XH1qJUE+6ek49u3494KU9MloIINDjEwejASdPGFVr
	7QQbTBtEhsDlUWO6cHAYtx+Qt7bkiIeTAmJztq37P31f/QNQwwmmf9J5KG0gM0RtIsV39y138ij
	g4p0xa9ATzalURP+VZnw8s2oRO5TBziqpdgNOMcBsD+Mfdge0xXffa5ENJ+gXwU/qSg72kD/vGe
	uHzr8WSiW0rKNJsbloxcT0AaFZBAxHDozS8vMMucgdR9wsZ92Kg17BWLNLE5krvkiID05GnJwWS
	BWVYnywYVUVhf0kqVpNOstBg3/hqzFi5HICkOfh7WXz2GMQNMdWtHbFhOTOo3ED7+CQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756588402; bh=vp9BFqVCsrqy1VHNRz6BRNP
	RHNjMy4Nb9AHUlnIB13c=; b=hANspEkQpLBmx+Qo0aihkxM759im+SMg1BaMFlwYMlalnPM9p7
	Hf2CMs3/zMTo04sgYDT62Vj11P8SS6sGW/CA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 30 Aug 2025 23:13:20 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: msm8953: correct SPI pinctrls
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250830-msm8953-spi-fix-v1-2-89950eaf10fe@mainlining.org>
References: <20250830-msm8953-spi-fix-v1-0-89950eaf10fe@mainlining.org>
In-Reply-To: <20250830-msm8953-spi-fix-v1-0-89950eaf10fe@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gianluca Boiano <morf3089@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756588401; l=3489;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=CBLy8/WYPaCr1SzkbgPD1dFINhkAMk8tA0yM0q/hdOU=;
 b=5lnR9XHUIvmTuSrO8zDAx76BQoW3NmGbdKdCmIGfMWsKPokFDukb2a6usYc/ha5zshdGhHITC
 SltZ2LwJYPmBuIhejD8i0u61fQ8A2NjPR5oZul0pbLgXMVw1VwWZfrQ
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

SPI pinctrls should handle 4 pins MOSI, MISO, CLK and CS.
This change adding the missing pins for pinctrls and correcting
CS pins according to downstream sources.

Fixes: be69109e93c78 ("arm64: dts: qcom: msm8953: add SPI interfaces")
Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 102 ++++++++++++++++++++++++++--------
 1 file changed, 78 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 14dd17278ae0850df1dafad19a569ffc5afb174b..1b3e68aed9450f61d14fe6c16a4dd513c815c6da 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -775,45 +775,99 @@ i2c_8_sleep: i2c-8-sleep-state {
 			};
 
 			spi_3_default: spi-3-default-state {
-				pins = "gpio10", "gpio11";
-				function = "blsp_spi3";
-				drive-strength = <2>;
-				bias-disable;
+				cs-pins {
+					pins = "gpio10";
+					function = "blsp_spi3";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio8", "gpio9", "gpio11";
+					function = "blsp_spi3";
+					drive-strength = <12>;
+					bias-disable;
+				};
 			};
 
 			spi_3_sleep: spi-3-sleep-state {
-				pins = "gpio10", "gpio11";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
+				cs-pins {
+					pins = "gpio10";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio8", "gpio9", "gpio11";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
 			};
 
 			spi_5_default: spi-5-default-state {
-				pins = "gpio18", "gpio19";
-				function = "blsp_spi5";
-				drive-strength = <2>;
-				bias-disable;
+				cs-pins {
+					pins = "gpio18";
+					function = "blsp_spi5";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio16", "gpio17", "gpio19";
+					function = "blsp_spi5";
+					drive-strength = <12>;
+					bias-disable;
+				};
 			};
 
 			spi_5_sleep: spi-5-sleep-state {
-				pins = "gpio18", "gpio19";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
+				cs-pins {
+					pins = "gpio18";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio16", "gpio17", "gpio19";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
 			};
 
 			spi_6_default: spi-6-default-state {
-				pins = "gpio22", "gpio23";
-				function = "blsp_spi6";
-				drive-strength = <2>;
-				bias-disable;
+				cs-pins {
+					pins = "gpio22";
+					function = "blsp_spi6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio20", "gpio21", "gpio23";
+					function = "blsp_spi6";
+					drive-strength = <12>;
+					bias-disable;
+				};
 			};
 
 			spi_6_sleep: spi-6-sleep-state {
-				pins = "gpio22", "gpio23";
-				function = "gpio";
-				drive-strength = <2>;
-				bias-disable;
+				cs-pins {
+					pins = "gpio22";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio20", "gpio21", "gpio23";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
 			};
 
 			uart_5_default: uart-5-default-state {

-- 
2.51.0


