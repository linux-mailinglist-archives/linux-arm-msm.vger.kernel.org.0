Return-Path: <linux-arm-msm+bounces-4533-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAC281195F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 17:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D4DE1F21853
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 16:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F274F35EF5;
	Wed, 13 Dec 2023 16:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPaCDW3X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07FC8AC
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:29:06 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50be10acaf9so7005471e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Dec 2023 08:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702484944; x=1703089744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEzLaoNa4BA2w8OvaI5sizwaYC3nqK5NDpqXu6xPo90=;
        b=EPaCDW3X65pt9lfhQDirUMYk6SCoBK/3UDqFB0I/I4ffRoHzcZgU/2n/oE3Y8VJ1ST
         09QWKkA3NX+8kwydIeMpnuL1Tic5bu6GdW32RMYHKCTFDkhcQu/uEya/clUz9upHQG36
         vmY7SPwX7Dg65keGSow7WOFAk6MRnUrywU2g0RYMuEkXCa19Ku6luR09CVKDAz1cgsOA
         9VKgkj5OJgXoBwPcrcrLNIJd34Ib3aoanBKNwsO5zaczD1lzxGUP84mSLx2VaA/mG8wA
         UHu5Am8ufx7NHpWmsY9wskoPFxCughn9IKmGm9fGnjq2IS9gsLcWY6zSzeJ59JIRZPUV
         Q3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702484944; x=1703089744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEzLaoNa4BA2w8OvaI5sizwaYC3nqK5NDpqXu6xPo90=;
        b=VtYw2uMdWlvXHtvZo4adaWJo9ttukkU9LSiO8Bj40MRSR92d8g9UtXRDmf7Q7gYDJK
         8NyDseXomUMaLXzDCHCbj4ZjWUq7cRQod4ka3k0fV4iSpvh92bi7gh2+WghovMLSBouf
         rzXZFUUpScklkJ0k5ilqabf8+WcdmfQHEWYyIY/irUGS2YCHkXKASDs70/kZfoZtuhcj
         cpCYQ8ZBSOig5jSBX4fH3jWYsbHLcRDGc3DOIwoi79+oi9swiaK2ogwy1AyDNITNXohl
         OdXhVUO0+jK7GnKB4jDpR7+m1Jqyg84d/HQfyLSuHvtR/A6h3Md+ZOypNKJmIVwBtUvt
         2X3w==
X-Gm-Message-State: AOJu0YxH4N46Jnt80PYGab8o7uuuHA/7Z0RSbGjJ/2wAepYagy4FkI1Y
	7azO0JgHhy1iig9SeqjH/herLQ==
X-Google-Smtp-Source: AGHT+IHtY5gkQmmJhndNfLTuymBN96U+PgF076ivxPPJWBCxoTTijgt9TkViwC9hvJ0o+aI9ZxUjpA==
X-Received: by 2002:a19:5e1d:0:b0:50b:f03c:1eb2 with SMTP id s29-20020a195e1d000000b0050bf03c1eb2mr3934707lfb.20.1702484944075;
        Wed, 13 Dec 2023 08:29:04 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id br7-20020a056512400700b0050bfe37d28asm1641026lfb.34.2023.12.13.08.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:29:03 -0800 (PST)
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
Subject: [PATCH v2 1/4] arm64: dts: qcom: sm8450: move Soundwire pinctrl to its nodes
Date: Wed, 13 Dec 2023 17:28:53 +0100
Message-Id: <20231213162856.188566-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231213162856.188566-1-krzysztof.kozlowski@linaro.org>
References: <20231213162856.188566-1-krzysztof.kozlowski@linaro.org>
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


