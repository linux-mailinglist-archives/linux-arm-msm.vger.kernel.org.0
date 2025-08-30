Return-Path: <linux-arm-msm+bounces-71290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D6FB3CF70
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 23:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C1887C31A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 21:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499B324BBF0;
	Sat, 30 Aug 2025 21:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BUWTch62";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="hsWzPOXj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29C213C3F6;
	Sat, 30 Aug 2025 21:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756588547; cv=none; b=ap+ukb9cOj2oKmWQmgoWycgFLiXMGsTEOrUt/hy1ZXc6LdeGYn2gHMBvqu+63V6ZX3qbuOHZL3Uc/NYbDnJgQVYwoyXhUnUnv3l26JJj0O+Izy2e3pULQF3OOr/H1M+YgBQNPhOYInG2sit7LdjES5xSLnVObBuh0OnI0BOy57A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756588547; c=relaxed/simple;
	bh=g6eA9zW07eEDawCbAbLUTxP89TMFmmXjHUmQQnyxs1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXqUyRKR87A7P3zaMZSpe7qP7wBTnkjtl2xhL2YzHTedIQrEDIzE22XT4xIQVWbznV4KjNGU5MgS4vckgSnF6rzFDUjHRqEPON+ywfOFuaIFGIw0EVssMFo4Xi0JT7rvH7LYvcqKLhhKxXbF2UDFu8BbRfNqS6+V6zEhl+rFbLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BUWTch62; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=hsWzPOXj; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756588403; bh=wPempubpHHvrR9g5D8PVkJk
	FN5fonYSZwrd4p7zMV0I=; b=BUWTch62Xlh9+i0kizw0nMI3Zvl0wK2iXQzkGh6pOcScOyXRHN
	Gk/FW+7/ptQifNmYNcOknrl0PAlAv19qoFcCMcTONdxrofQJu581yhtBLdQo74VXi768ZzIK4zk
	CWvwn1fQhDcYZFaEy+9v9tmFIhMBgwGix19x0t+xWJLrzWL+2mv3g8IZUqyfk5qriSwCgsEc457
	TZ2wJtgYT2o7gO6UZNUVLLO/Y03svRSFfSD+wXTDdDQPzjouPMapIwWo9deY18PN+GglUIKOi+d
	EbpY7M4PqibpcTCF4D6XSfVdSsADhonuq+uPUZ78aDOjBjFBTDKkaQAltu0CVUVwweg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1756588403; bh=wPempubpHHvrR9g5D8PVkJk
	FN5fonYSZwrd4p7zMV0I=; b=hsWzPOXjwnJQtRY5Dm8Q3ABw7+xlZZ2MIVeuwyQqHqOPOnLkyY
	uWkGdFcEqIaksUoDWON4XgBVKXHLa1a+jjAA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Sat, 30 Aug 2025 23:13:21 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: msm8953: add spi_7
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250830-msm8953-spi-fix-v1-3-89950eaf10fe@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756588401; l=2108;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=g6eA9zW07eEDawCbAbLUTxP89TMFmmXjHUmQQnyxs1M=;
 b=UvjD1KQGsFARptLxJsznEa9xK1VWIRXyhUuzGHMw4Yy0cYbMIE4weYjxH+9P2neNrx9wZckL4
 Otpke86jG63DKAyTiM96jAlEV4oudfQfgrzmCcrDqgpIVHFf5fEzVTY
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Add spi_7 can be found in MSM8953 devices.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index 1b3e68aed9450f61d14fe6c16a4dd513c815c6da..76317c5783496675a549815bbed71fd214590dd1 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -870,6 +870,38 @@ spi-pins {
 				};
 			};
 
+			spi_7_default: spi-7-default-state {
+				cs-pins {
+					pins = "gpio136";
+					function = "blsp_spi7";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio135", "gpio137", "gpio138";
+					function = "blsp_spi7";
+					drive-strength = <12>;
+					bias-disable;
+				};
+			};
+
+			spi_7_sleep: spi-7-sleep-state {
+				cs-pins {
+					pins = "gpio136";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				spi-pins {
+					pins = "gpio135", "gpio137", "gpio138";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			uart_5_default: uart-5-default-state {
 				pins = "gpio16", "gpio17", "gpio18", "gpio19";
 				function = "blsp_uart5";
@@ -1880,6 +1912,26 @@ i2c_7: i2c@7af7000 {
 			status = "disabled";
 		};
 
+		spi_7: spi@7af7000 {
+			compatible = "qcom,spi-qup-v2.2.1";
+			reg = <0x07af7000 0x600>;
+			interrupts = <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>;
+			clock-names = "core", "iface";
+			clocks = <&gcc GCC_BLSP2_QUP3_SPI_APPS_CLK>,
+				 <&gcc GCC_BLSP2_AHB_CLK>;
+			dmas = <&blsp2_dma 8>, <&blsp2_dma 9>;
+			dma-names = "tx", "rx";
+
+			pinctrl-names = "default", "sleep";
+			pinctrl-0 = <&spi_7_default>;
+			pinctrl-1 = <&spi_7_sleep>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+		};
+
 		i2c_8: i2c@7af8000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
 			reg = <0x07af8000 0x600>;

-- 
2.51.0


