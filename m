Return-Path: <linux-arm-msm+bounces-46242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0138BA1D725
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3980118864FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:48:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8711F200121;
	Mon, 27 Jan 2025 13:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zxBNuz8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DD11FFC73
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985693; cv=none; b=cHx57q9FtkyGuoKsGQKbidmLmlDw6vB9gg2zt22En5bfoXdc0+UXAvpD1SyfB4NnnjEoQimlzzldtjQlTPwDqsJ34ewsGI480RSiDnpC1LZUZfr6a7pYFdw3jidSeaOCcoFk9TZGGftIyCes4PUPvTWqsqE23pdBWoaHdnLQLBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985693; c=relaxed/simple;
	bh=/xQudqtCxeqrB0ErnhOJYPSAK4eJAE2jYZ7/chNw1DQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zfd/6890X6LItc+tK5JBA5iUMAQd/n3O9HF5peu73Cw8YWadNLkvnzRV+x+fr7vw+aKIusKIVzKzdYHeaUr5+waIPVtLK8rUy1a76zVR++CPKD1WdsV8dQjTrrpkDKrJOrtHjEu4m89gS2a2pbBqtaPsg1FWHqf1j4Rb8mTVPVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zxBNuz8R; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4361f09be37so7286725e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985690; x=1738590490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UO/TGdaYfbbJAWZ5sXmjr9WMWvrhCE+Vvt2NbPtHrcM=;
        b=zxBNuz8Rui9m1RV+pTo1MjukpfhAv3mmyC1tHQ72Bpq/mF9k5ELBiHdP7qoPhcD9Ep
         0C9kWiFobMiQUQTEDThWxH975psYgNgQ6R3Yx+ZfmwgFHx7rucGLhW8ovnR7Pi4vXuMv
         ag0rW1bLkj4Xd392pU8T6/r3syME6Q5IO/eQCyuHyp4RxkP4lHC6eFrGJK/7BC1GETlS
         ggNGjBgi9HXgk43bwry6v09X27k3xT294O3qAzf9kTPZ/6TOoMRnKGSq1oWmzwgVMfZI
         7AB7/qhVu/RayKV/QA3pdQF9hv/axDL143n2HX/lc/YldgYhsuo4sTZkki/Q2jiNTvF+
         V5Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985690; x=1738590490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UO/TGdaYfbbJAWZ5sXmjr9WMWvrhCE+Vvt2NbPtHrcM=;
        b=WL7GHn1b3V7gFdqugDHE1lPbILWU+M5QrGw4tLGOT4zDR81qSgdUXKkz5/QQTYB77Q
         7NrHz+TN7AFMheVoMG+7gow2N67RkRO53saxgKAk801Ds23Q3smzaRllSxnkKSgoqfkR
         w/L5VKmP5vBW1CvlLY5fw9mu9z8IJUrGlCipUEBx0CNW6+axa3b/WpDVndJl1ssz4yVO
         dZvgGP20UB4iGhYH05D48ld6i6vLBcaaxVhXCLHX1Qde8D8t6MN/SFq+/f/jGzk/9KY7
         alXAX1G2UlKgYAiJS46/bjYJQdhnOUVZ5T7tHQ4oLya9dBc1ksQ3owpGorVAofPOKCxI
         4AQQ==
X-Gm-Message-State: AOJu0YzmmzGrxwFb/6tNgQ4Mxi3Vq1l2C6i38wSeaLoTcEzKJihVQyVD
	qraL+p5qARkWWW7YU5BpkMPAi0/HnzwZ0zF42+UznwvKQ7wF1NKDeotUtrP8VtY=
X-Gm-Gg: ASbGncu5RftVzCBkwGole7j1fheNv55p/bHaiyBTqGPoEuxnuc3kLjDYycPVN8t62Gl
	+7itK8f9EOyaEzw9c+o1rlkWWrS41M7WHpAs9q/6g/kKzj5HWGn46jcVfNJd8Z5tTW3+NVgzTV7
	3soEk7dOM0rPuYdPRKSX77nYS2bnaBKtAfrbUUN6XC3PQVXeSI+g+8vMEAXGFyXqV7h6wYSa5ZQ
	elO+J4iRNnY7Doru1H9T2S9hKhkEMK08SaFwpgRtk9//iVzkiVPNVW+XgDxZ67lrbEqYiair9la
	K6qzlzQpHQeSquIU430=
X-Google-Smtp-Source: AGHT+IEZeqcVjKWYJrycKAHg9B9LDmbIACsnF3VQqjsTthNpyDX7q4+omoikYew0mZXuVoAC5TruQA==
X-Received: by 2002:a05:600c:1f93:b0:436:ee2e:ef12 with SMTP id 5b1f17b1804b1-438914318b9mr144823995e9.5.1737985689769;
        Mon, 27 Jan 2025 05:48:09 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:35 +0100
Subject: [PATCH 02/24] ARM: dts: qcom: msm8974: Use the header with DSI phy
 clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-2-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2496;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/xQudqtCxeqrB0ErnhOJYPSAK4eJAE2jYZ7/chNw1DQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46AzW7sbxwFLqMYSEROwN0M6q2JnbKPlGlkP
 iQxmAmg7tWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOgAAKCRDBN2bmhouD
 15x5D/oDkZAk3JYdcdyz1bbG5TobvxL6fskayWRoDO47SAZ70kBO/WH/oE3fJeDcIUPXPYE1VVL
 /uKcfONG/KgUh20ay+Aa8he/WBFwLbAYuMCEvfLfJreK/KROniF8P88JlPtn3bqWVdAWkAKt/SP
 vt8owjJCeJi0PIp6Tbx+6lQTQr7kkKXNcTSrzcYz7cUGwHay5n4iZIMeFtnbwKDH4PHhsADlJgh
 x+uqRHC29daHFSXD2rDs1jiAH8YryOmBvTD6p2LaqXESA2IU9bROsjkJzIw+Wyo/Fhxw9EIxhBt
 3q4ndYnuWYETeOGMMmPvXS+Oz1Fuez/Q2zQLKsdXNIKLvvUYaBKStbyKZrlBRAdemMqbZJTt15z
 ejtZkz9dXkVl1bKfZpP+XqGGc6ItZerOFJAJ9Vc2HEUOiQq/+MgspPjXJmunUBUJV7+F0ZcOFPG
 weFlqh6Tbuh4TjI9v2KWhl78IbbR3tTSvMsyQ+vJX6ITNM1IgbKEextw+CVVGxTJDbZTzkiNxUW
 Cih5bs6McZG2NcyFhnJamUQU18fDLIr/tJv+TKKGBJwoCN3eBwHosmt39A1iOLxwBYxu44LavbN
 /YPG8lGx8fa2aIebBvg32lfPecPnzbaKzRw1M4tRL51KadCnbG9x0Tf/1V61dxs+NDWIDWqCP8t
 HWeBwOHk/WaUiwQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
index e3f9c56a778cf8c64735ede1e85286bde12c1c87..7e119370f3375573e284587d48aef6dca3ed707f 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
@@ -3,6 +3,7 @@
 
 #include <dt-bindings/interconnect/qcom,msm8974.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8974.h>
 #include <dt-bindings/clock/qcom,mmcc-msm8974.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
@@ -1871,10 +1872,10 @@ mmcc: clock-controller@fd8c0000 {
 				 <&gcc GPLL0_VOTE>,
 				 <&gcc GPLL1_VOTE>,
 				 <&rpmcc RPM_SMD_GFX3D_CLK_SRC>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi1_phy 1>,
-				 <&mdss_dsi1_phy 0>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <0>;
@@ -1961,8 +1962,10 @@ mdss_dsi0: dsi@fd922800 {
 				interrupt-parent = <&mdss>;
 				interrupts = <4>;
 
-				assigned-clocks = <&mmcc BYTE0_CLK_SRC>, <&mmcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clocks = <&mmcc BYTE0_CLK_SRC>,
+						  <&mmcc PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_AHB_CLK>,
@@ -2032,8 +2035,10 @@ mdss_dsi1: dsi@fd922e00 {
 				interrupt-parent = <&mdss>;
 				interrupts = <4>;
 
-				assigned-clocks = <&mmcc BYTE1_CLK_SRC>, <&mmcc PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+				assigned-clocks = <&mmcc BYTE1_CLK_SRC>,
+						  <&mmcc PCLK1_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&mmcc MDSS_MDP_CLK>,
 					 <&mmcc MDSS_AHB_CLK>,

-- 
2.43.0


