Return-Path: <linux-arm-msm+bounces-46245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26520A1D72F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E27FC7A406D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E1A1201256;
	Mon, 27 Jan 2025 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhSCZk0i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C2720103D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985699; cv=none; b=fT29r/uFu04rilNd7sp9haJ9WsU1pXa69iwkGkTY2Q9c9RkdhhTTshL0A6PGn15B3a4k7PfZvjNleleqV3aSIlE2No/X99D10DdRWMv8t8MsdBiojSAvMg5L+uJBu1WvgjJDELekg47UhhVRReIsZ5dum7cFW9RRb/YOHZVO7zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985699; c=relaxed/simple;
	bh=02DMujMQn2T1XhC7RvzjIa2ucfVSM94krm7R6DPwio8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZiQictlivokQ61Y1lFDwhvyzd7DPCNDUGwU+lNoQx3kwsnpZun66/J502Q2SQT1YpMR9lF9BRcGw14HZZq5mUFwkQX6ZIV1HPROLO+G0zWRjZZQjqjBOdSLE78uFvUU1Z3cyrBhGph/AGu2dcIFCeVbBw+iXI2U+Owd9hehTTmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XhSCZk0i; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361f09be37so7286845e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985693; x=1738590493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XINxUO6RsL+/yLXF/kte390dxVrYuWbYZgqCNw/ODrQ=;
        b=XhSCZk0iUnSa31Kr8g1012c+SOwJNYd5muQzwrTQUWXjlZTVuZ9oHdfQ5k6t7741bn
         YUA/+pVYv5EeFEpDNbpG7qEJxI04nZdsZQmRL/RbFFPZXJ7qDDf1vD4NLK+y/Cylatug
         EciErJgfGTAusrYZLi8Und3V+ZbFOYDnT/1rOiT4hgBjeBimlyDxvmDhkDbE30XOA9C0
         y4xUcq66EHmwiI5qTDsnQepDBwYyBBG8sKCZY3lhmVUW2ntjUIW7Y1DYjmJVGyzjoc9W
         bbk9UZCGmrl9Kd50wge5abHkEAJGOCoA6FZLgz+6FEDpdLs4wXOSW0+5E0EmbaZd0Z5c
         w3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985693; x=1738590493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XINxUO6RsL+/yLXF/kte390dxVrYuWbYZgqCNw/ODrQ=;
        b=SgJEJbvPbf9n7NLxuNhISoYJc5OrBD9lgkIu2NODjVhyDQGvpyBMQ2adDI7CPpmsit
         H29GYyPd/BERRP7MplBmz4pRS2gUvyZPGyzPA3E5wU2nW/lVR53L041AT6/5FKmxYN3K
         7g9eYs39Vp1PxHrquV1LjMjNEEUhuMETP/8wVYuTsN4fSmuM/FEFgOm32k22+tsnwc2Y
         UhDFZi4/x6rou7QWCcvSvlDi2OTWImpMs+M/GpIMiyiQmTZskj7VzMNHrao5WN9266wS
         6qLtqLJNk0wqQztINR9O1rpYdXG0gwtWdOS5X2rl8+FD7aZsUGEN7TjGYzuBUoPZcAHZ
         1usw==
X-Gm-Message-State: AOJu0Yw1mJgTcogSUKet7AjFq9Sngo9Td50dsBnTgnBcMISRNIna4mBL
	CWx1IhBfHLuUw0WWcmqEnWwEUOzRFCH1Ohe5EMlaCmbf8SVP/7QAXUL4riE2ePA=
X-Gm-Gg: ASbGncv31QKPiyL54GwkAM8bYrlAnFq8vdb9gBDBUiqdmI/FxBxzjmP+vSl9CB2WrHw
	otu8jWBS9SlFHnHv9SuCmHn2c3IhehOpnk2w1qSl3rIAV/kGrNllNK02x8YO7CoXnj8xxyacsfC
	rabNdTPKjzvS7j3yz4bNX1inElhbzzI4pwRHUHYHlGn5jfEsZW3Lt+M84lST2c3EKNicgJDSkng
	wgCBV4mzA351kBkRyMQplLNJhwTXNx86jExfhSK2S/xg3QY+glvABzcrDLtRr4ZYmS7DR1qPILy
	8tqq11Rl8YzRQypqNYA=
X-Google-Smtp-Source: AGHT+IF5eCzx5sh585VYY0c6nXMl4UjYtR7pwjRxVVYFLUtIRaznI9uSnEF5/wTnTUlO93pwQXLjow==
X-Received: by 2002:a05:600c:1d07:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-4389141cda7mr141182545e9.4.1737985693551;
        Mon, 27 Jan 2025 05:48:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:38 +0100
Subject: [PATCH 05/24] arm64: dts: qcom: msm8939: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-5-9d8ddbcb1c7f@linaro.org>
References: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
In-Reply-To: <20250127-dts-qcom-dsi-phy-clocks-v1-0-9d8ddbcb1c7f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=02DMujMQn2T1XhC7RvzjIa2ucfVSM94krm7R6DPwio8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46DXYqCeBvjczYMSbTtjGRcDg4MzevHGtrmO
 tMCfEvWpjuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOgwAKCRDBN2bmhouD
 1+6LD/oC/ZGvPTNqAO5BRYpJOzp5sDNS/Vhp4/3yfmD3T9cAxkFO4KwID0NtwGKw3U5HcF/9V8S
 FAZzB+riIKHeTt0rKWpz+NdI9uYjVE7To+dCaOUl7rqZrSi1LSTqfi6hSX8ZNHNB4Ejg9RG6hqi
 7c4piRqzrpj0X6kSzGVDyJxU8fup3dVrOLnBcWul6FzO56JIJmIWVOCjH9Pdy1WF2TSRRdZjWA2
 aibj22RheJeRmYNXhu3EV1vGfC2QXOv8U4Amkln/3EFjrK7HBamCvslGjCrv+D5EPH+E8OvuY6a
 +VWoHFtcMxuulIpl3cSe55WofH0GFNf0sBaxi0Mqbz7L/21qUbHG9UaZYfWdSNSEdSUxcAOWIVz
 a/E6GVNO61r9H63EVgRtBx8FB+Dt0oKwCDw4RWEzkTE4EIuWaWaHa3Na+p84l8yNC7uli72Vaxh
 QL1x4/KD2Cak+iOQVMzYd3BVinMf1y2V87YPBYba1KwzhEnqUITHg6037Y4pvaK5JZZOtLQaTyt
 Ut6Im7EhbUkbb+3TOcBo12ttUe4TZqftgkyNG70+42HH2rCJv0+xTQzUBWN/MEX+l01+KAPG78p
 0bJ70978E0rxztI9PkSyoGDZWe/CQwElLrizCsSf3WRjFSs/5sNzmQr2Kl6ryoNQboCwcDaM7RV
 LekCImniR0JayZg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/msm8939.dtsi | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8939.dtsi b/arch/arm64/boot/dts/qcom/msm8939.dtsi
index 7cd5660de1b33def5b9dc8a0d02583c3eaffb17f..5e8c3ac39de8b1f974a7e1499c7c805f21735569 100644
--- a/arch/arm64/boot/dts/qcom/msm8939.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8939.dtsi
@@ -4,6 +4,7 @@
  * Copyright (c) 2020-2023, Linaro Limited
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8939.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/interconnect/qcom,msm8939.h>
@@ -1172,8 +1173,8 @@ gcc: clock-controller@1800000 {
 			reg = <0x01800000 0x80000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <0>;
@@ -1291,8 +1292,8 @@ mdss_dsi0: dsi@1a98000 {
 					      "core";
 				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
 						  <&gcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				phys = <&mdss_dsi0_phy>;
 				status = "disabled";
@@ -1360,8 +1361,8 @@ mdss_dsi1: dsi@1aa0000 {
 					      "core";
 				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
 						  <&gcc PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 				phys = <&mdss_dsi1_phy>;
 				status = "disabled";
 

-- 
2.43.0


