Return-Path: <linux-arm-msm+bounces-53295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62907A7CE3D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 15:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 456353A7AA4
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Apr 2025 13:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBEF21859D;
	Sun,  6 Apr 2025 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="S0T6TwBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AFF128819;
	Sun,  6 Apr 2025 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743947567; cv=none; b=RTjWlXbeBQXyYf0hwxwZgY3VG5Vshaz+OHkr351Vw7o2B7cDNREZEV66UHDgJycIfNbeC/eSYEg6Kd/CoerZpZ7s4/ZqAPfw2JdyjD5EWJ5EmbfHexMj9sobuVdOLs7suvspIR/+ZxXm99lZhMpCDH1GMBs1sAbCRQ1KKdVBq7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743947567; c=relaxed/simple;
	bh=ygpZXMmw+ffqg9whjNZRRdHxV50dkG23lRvv9fZH0Oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hgx5TMLxOjiaF5S9rGLe6y9iD/b+mad5DrI3/vLRetoooR+rntXfbm6u+bnw3tV9DY2OBLv6qf8MwWvV7m8BdfK+W5DWbCqkBS312G5xnho2jA0rN4NhQwc7ninvf/H28ZuasE2uMn5QxJlqiYK92cm57ypIReuO92npw3Mq67c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=S0T6TwBW; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1743947563; bh=ygpZXMmw+ffqg9whjNZRRdHxV50dkG23lRvv9fZH0Oo=;
	h=From:Date:Subject:To:Cc;
	b=S0T6TwBWaDbl/avFw74ECVwyUnL4ZbHcfBod5pwQhDnGIS6bYR9KC1OEBbBx/zZvj
	 q0LRDO2R9veEClft9c8cWcQXHenM+TCwuKMR9sBwDDx5IVTW58LU69dJNoK6lXwPaW
	 5rM3MJ6K/YrSZxIlAZD4ho5C7RWNkANjhuEEHXtw=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Sun, 06 Apr 2025 15:52:02 +0200
Subject: [PATCH] arm64: dts: qcom: msm8953: Add uart_5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-msm8953-uart_5-v1-1-7e4841674137@lucaweiss.eu>
X-B4-Tracking: v=1; b=H4sIAAGH8mcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEwMz3dziXAtLU2Pd0sSiknhT3TQzM+PU1BQzMwMTQyWgpoKi1LTMCrC
 B0bG1tQCe8n9eYAAAAA==
X-Change-ID: 20250406-msm8953-uart_5-f663eed66041
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Kaechele <felix@kaechele.ca>, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2017; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=sY1dlhOD+AOX05Avg9WD5isESSfn1Anr8cj+Q664BQE=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBn8ocqHA4ugnabrbuLYIy4qJaqJiP2ZdIHX1hzf
 J+biE/58XiJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ/KHKgAKCRBy2EO4nU3X
 VpiIEACJd7VMoHa/8ejn3+GtFDb28fUwdVjvTcCAdVs6n3c86adn4wJFK7Gk/7VxTH81GSScwXs
 kOieJS/YH3NmMWnnOAwMj30TEvGK/sgoycKMvoATKeotCgK2YovADUcdHYgAmT6larp5sUb+XUT
 MVP+Z6O2COKmGcWf+KbVhHC7qvyinmG8nxoZdWjne9QLysmiOVNgZaubgE51Dp9VeeGE6Hin8ks
 tKJEBCl+PwRchxtV4GbNfXoYeglpl4Kg9TMNqGn57dkjrq3WaBl+Rl4sPccJywrLleuAxvavrCT
 ZFAiJG+FC3nN3PLbQaTCZVrbdPb4kViPL38xtmhP8XkaZTGiz/5M4EQi548vPIUXI2K6po1UBK0
 IbQhio+CHWPDUwTGUAWKlX1Mao/X7tajunlSN+MqEZGIu8zAlmqyMkjtdaowX/y7Ao/Gr7uezpk
 9FTGIu6xYl6hQUN4Rx7F5DkUhY7ZJ1ooK/JdSQMNfUL5gtHjPmty6xs/Fs1c2sMnLjQRbQzoBlD
 ya0XkPN04YzV7j6fQycDTaCXmxladvnVRn9A5XMNk4Rp3tGgtarVVZq9UQjGbVxWiPejt3BgtSq
 //ywfKbf/rAPTmT3hVKbmHctFK7NXi5bikZIfzivzWDVBo2QFIsD8eT6nd9wXlwfSVJS05SJgKp
 vApoGDalhj1mfKQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

From: Felix Kaechele <felix@kaechele.ca>

Add the node and pinctrl for uart_5 found on the MSM8953 SoC.

Signed-off-by: Felix Kaechele <felix@kaechele.ca>
[luca: Prepare patch for upstream submission]
Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index af4c341e2533ef2cca593e0dc97003334d3fd6b7..3d6ab83cbce4696a8eb54b16fdb429e191f44637 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -767,6 +767,20 @@ spi_6_sleep: spi-6-sleep-state {
 				bias-disable;
 			};
 
+			uart_5_default: uart-5-default-state {
+				pins = "gpio16", "gpio17", "gpio18", "gpio19";
+				function = "blsp_uart5";
+				drive-strength = <16>;
+				bias-disable;
+			};
+
+			uart_5_sleep: uart-5-sleep-state {
+				pins = "gpio16", "gpio17", "gpio18", "gpio19";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			wcnss_pin_a: wcnss-active-state {
 
 				wcss-wlan2-pins {
@@ -1592,6 +1606,24 @@ blsp2_dma: dma-controller@7ac4000 {
 			qcom,controlled-remotely;
 		};
 
+		uart_5: serial@7aef000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x07aef000 0x200>;
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_BLSP2_UART1_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			dmas = <&blsp2_dma 0>, <&blsp2_dma 1>;
+			dma-names = "tx", "rx";
+
+			pinctrl-0 = <&uart_5_default>;
+			pinctrl-1 = <&uart_5_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			status = "disabled";
+		};
+
 		i2c_5: i2c@7af5000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x07af5000 0x600>;

---
base-commit: a4cda136f021ad44b8b52286aafd613030a6db5f
change-id: 20250406-msm8953-uart_5-f663eed66041

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


