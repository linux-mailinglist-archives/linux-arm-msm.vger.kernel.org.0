Return-Path: <linux-arm-msm+bounces-4526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B794A81193A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 17:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2E076B20E95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 16:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9BFC33CFD;
	Wed, 13 Dec 2023 16:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bwDCU34T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B11DB9
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:25:41 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50be9e6427dso7585919e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702484739; x=1703089539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NEzLaoNa4BA2w8OvaI5sizwaYC3nqK5NDpqXu6xPo90=;
        b=bwDCU34TKOnn+rqduMXMYWzpqQM5AzEVU6bc5VmcCt0BSjXQyWIh1SuUPpoammUKh4
         wUgWCytNMULSJZmgDwWstN/JWh86Ll9VA6tXLfDHLC78tY07rpS8focHK1HPMvldES3g
         E60GLPnWZVEWAU+ziYQ4qrqDKOM1OSWhN4r4kapHVW2dGRGAVknLQ6qA5VUGmcvb6smC
         5v59m2nhyScF4oq3ic+G76k9p724JEFisBcbgqmjE69zUiUrzW9YT61V+5ULRCVMEC7z
         M8SDj9Pp9UuID+zyC1ynobqBZjuLYmGKpSHHfn5Tg8LEvH4seFz81/VjmK8YzyRon41+
         gtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484739; x=1703089539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEzLaoNa4BA2w8OvaI5sizwaYC3nqK5NDpqXu6xPo90=;
        b=l+yJzhxoeSMzqUEGI/MZx0fRkFNgHxga6dRITAzaN6cG3kk2wUWBHcZhLqNPO9Bsqu
         iisTueuT8JakFrcKtjQYtDrco0PIxrZvTmDlwi0MI9SIdU+5/kfB5UjXH4QpQswbMrSP
         IKbGKXZ+p0+Y/ZET5yLgsMZhM66ms55vGG4QH9r4JPaRo0ugC8KE0+IdWNMoWbttgs31
         FCFHulJv9gWkVasppK1mx6mowSS69JrYJM+FZdVSNANwUuVuRfU46Nv+sBH65cc1590n
         n4KVFixuukNoSWWdjAaF6NYWl5NR86kNAYcBRH9jhxqdMmhqXRSCxDQv1ewtLD9NyHKX
         NF3Q==
X-Gm-Message-State: AOJu0Ywk55vOXKhyq9Iyc8+P+aYeUkW1rjVhWbQk5WKhdc73YXevy6HJ
	zKuaxRHUByE0oWer66OryXmatg==
X-Google-Smtp-Source: AGHT+IG5E98UlR0GcrnhVIDtGNzI9Lp1cS9Z1Gd+hPYxMOSd7wpz4W9RmVacJEy0D/WAkK4N263y/Q==
X-Received: by 2002:a05:6512:110d:b0:50b:f858:f138 with SMTP id l13-20020a056512110d00b0050bf858f138mr4628794lfg.89.1702484739673;
        Wed, 13 Dec 2023 08:25:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id kv18-20020a17090778d200b00a1dfc541282sm8048914ejc.225.2023.12.13.08.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:25:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] arm64: dts: qcom: sm8450: move Soundwire pinctrl to its nodes
Date: Wed, 13 Dec 2023 17:25:32 +0100
Message-Id: <20231213162536.171475-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pin configuration for Soundwire bus should be set in Soundwire
controller nodes, not in the associated macro codec node.  This
placement change should not have big impact in general, because macro
codec is a clock provider for Soundwire controller, thus its devices is
probed first.  However it will have impact for disabled Soundwire buses,
e.g. WSA2, because after this change the pins will be left in default
state.

We also follow similar approach in newer SoCs, like Qualcomm SM8650.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Not tested on HW.
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 12e55a0c7417..3b6ea9653d2a 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2160,8 +2160,6 @@ wsa2macro: codec@31e0000 {
 
 			#clock-cells = <0>;
 			clock-output-names = "wsa2-mclk";
-			pinctrl-names = "default";
-			pinctrl-0 = <&wsa2_swr_active>;
 			#sound-dai-cells = <1>;
 		};
 
@@ -2173,6 +2171,9 @@ swr4: soundwire-controller@31f0000 {
 			clock-names = "iface";
 			label = "WSA2";
 
+			pinctrl-0 = <&wsa2_swr_active>;
+			pinctrl-names = "default";
+
 			qcom,din-ports = <2>;
 			qcom,dout-ports = <6>;
 
@@ -2208,8 +2209,6 @@ rxmacro: codec@3200000 {
 
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
-			pinctrl-names = "default";
-			pinctrl-0 = <&rx_swr_active>;
 			#sound-dai-cells = <1>;
 		};
 
@@ -2223,6 +2222,9 @@ swr1: soundwire-controller@3210000 {
 			qcom,din-ports = <0>;
 			qcom,dout-ports = <5>;
 
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
 			qcom,ports-sinterval-low =	/bits/ 8 <0x03 0x1f 0x1f 0x07 0x00>;
 			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00>;
 			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00>;
@@ -2254,8 +2256,6 @@ txmacro: codec@3220000 {
 
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
-			pinctrl-names = "default";
-			pinctrl-0 = <&tx_swr_active>;
 			#sound-dai-cells = <1>;
 		};
 
@@ -2275,8 +2275,6 @@ wsamacro: codec@3240000 {
 
 			#clock-cells = <0>;
 			clock-output-names = "mclk";
-			pinctrl-names = "default";
-			pinctrl-0 = <&wsa_swr_active>;
 			#sound-dai-cells = <1>;
 		};
 
@@ -2288,6 +2286,9 @@ swr0: soundwire-controller@3250000 {
 			clock-names = "iface";
 			label = "WSA";
 
+			pinctrl-0 = <&wsa_swr_active>;
+			pinctrl-names = "default";
+
 			qcom,din-ports = <2>;
 			qcom,dout-ports = <6>;
 
@@ -2318,6 +2319,9 @@ swr2: soundwire-controller@33b0000 {
 			clock-names = "iface";
 			label = "TX";
 
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
 			qcom,din-ports = <4>;
 			qcom,dout-ports = <0>;
 			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
-- 
2.34.1


