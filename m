Return-Path: <linux-arm-msm+bounces-53483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E4A7F9B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A98E1888574
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F8F4266F1B;
	Tue,  8 Apr 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iN3VpLWH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2554B265601
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104757; cv=none; b=M59K2Tv1i25PMbBhj1FspBfTXAXFc4eJxBDS8LY1PNcX/LRfcoVwEMg9x6HgmlJeiWJ/kykLhW3wgUyBVBWd8Y4j6VekdMfEJN0s6KuumJuYmRssw3fHSZuQ19iLlYDignZ+fLbgbaWvO4CGTvFXJr6s79ceZWJJ9wvbceOPTpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104757; c=relaxed/simple;
	bh=9dTu5cJR0mzFiNKVaPPyKiW2ceceHKQPw4FgTBSDtlI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDNdSruknjcs64f78K9kz7VzhPZsxq8JW3iGBk1WAwrMjyOPGkZL39VBZmXbLMjZbVIZwUW05Lize1PJdMr5y++0MNqVQ+tBbbGKLrp4Uedc2y+J7sGwtpp5WQx1rDXTfF3T+6LjPAHJXcRDgTYuRP9SNRdDK9p2EsUZnU1QCDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iN3VpLWH; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf89f81c5so3754125e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104752; x=1744709552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93S2cU/5K6451UV5IGWLL5IC5mrjUL/5VksM4Ixrdxw=;
        b=iN3VpLWH8EaaYYelo/kZIaDdttSgcdOLUwTviwSn9JN075Tgzrb174sBiy7YWSyvR/
         M87uAKWDfWhsINbh7zVLIxn80nAvmD/TV9Qa2xk8im61usIED9lYdTnvljYMOSw/haEo
         09QNlZYrkkWn3V8SXzUGnLP/vsFHU0ub+MV6lF9biO4C/Vh6R5BjOM0KmKcBSDNlAw+Q
         1orsUMGWsSML9vy7YwfJXBJB7IW4FyNaE4syWyYr90F75IfEEWL6EeiTojGAZBUlAl3R
         CTr972CdjOR0QxFGTg+WS8/rCD866vvUKrz9BASq+7/PuT8th6HVZF6fnLJHksUjwu4z
         k1Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104752; x=1744709552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93S2cU/5K6451UV5IGWLL5IC5mrjUL/5VksM4Ixrdxw=;
        b=Lvx+tbeRqECfIe4DkMbiMNZWrKi2WGburEOATnvtkjnfIvD5S8eTU5/CvrnI5UwB3r
         sFurw5DLCpsit1W0238xuv3FpWLj7m9NRb1hoSq5BTKi1/8VjlYx6CAy1YiDV4NFv6u4
         dV64I9VU+4+VZXnja8B3YaqYmZ5Ylr69zg6r3F8MZkoOxG0zQLyftK9Rntitoi/HHdMx
         1aybGR0LKjBHtuMYxm0DcgaGnFUCwm2AAy+8xpWLGG9kZSHOLORZyifkKkBOlUVwaGej
         G1KYLyb5Y09OyUBeEdMq0RIivs2V8m/N+2s1aXFBC57yb3/fO7eK3GrIiiEpyzS68Hi0
         xr4A==
X-Gm-Message-State: AOJu0YwGkQVrh+FUon1HEqLPVbDsYFLmU6Pm8IFprzNQoxPDtXjHBLfF
	PZKk4k4vJigmo9L0tJfOqPfFXDFTsEI8G5dJl93FwjjjjX2gI6ZvELtfapy12IE=
X-Gm-Gg: ASbGncsBrSA21FOigSdv1Dv/A8B5Xk9p/LwbTt8t/o12ogY8s/XhXySzf1gmVCED2lf
	cVEO8mlDRrXIJY6AcEwPAivmaptnP2P+TVXGfNsj5T1eP1ipLmJYqWEZ+mW0PRRCLGfvvdnzope
	0M/WAqGY+t3Qofikjpy6bSSVD8xBnq6LP25Ut0AKcoBggd7MVrbRTCcYq+ooP2RDHOcmvCrZm3A
	ZNeyfaWKCmgfUuLzQWgqrncZqXE2+Xj/KZZJN8XComWB12gX64FiPDff9CIsQlAg8nt5/Ivvs9G
	GiJEutEzh6+gYkYXhjslhYHhinudNmejSyb1FZSLptjFHi47s6hsq9xrFmobxG4=
X-Google-Smtp-Source: AGHT+IHIr+08qekvaZsnAWbu2F6fmQSJhLtTKen79irhOP99xqo99esuicbuA3JJXK0Ygbd1BS0nlQ==
X-Received: by 2002:a05:600c:3b9e:b0:439:9595:c8f4 with SMTP id 5b1f17b1804b1-43ecf57e944mr54219515e9.0.1744104752230;
        Tue, 08 Apr 2025 02:32:32 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:31:59 +0200
Subject: [PATCH v2 02/24] ARM: dts: qcom: msm8974: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-2-73b482a6dd02@linaro.org>
References: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
In-Reply-To: <20250408-dts-qcom-dsi-phy-clocks-v2-0-73b482a6dd02@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2507;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=9dTu5cJR0mzFiNKVaPPyKiW2ceceHKQPw4FgTBSDtlI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0XV8/QJ1VnDqEZxPhRF7jGDmwg7tcbQIT27
 n8lyhObpiqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtFwAKCRDBN2bmhouD
 15heD/41qJE91ticVKIdgXihxpPeIC09GL7lZCkyxgfsHmWWfbMR2kPM+WuO21MZUsHST5fB9yT
 PhUdzOjeMpuAIxOM1/Q1dLM0jrTAbGPwJAlaSeH39aO2J4/W5CbUywW0zX9FW7OQgsWw8r0P6ea
 69vvYigxzWA8U/PSFzpmrkvJoFKTaPDdpufVMmPFbSYX1mymDLhMDWxgYQMkb5hvT45HhOSlYC+
 WOu3HG+KjFlpRharwmwDI8kZrE8NwWVr+ssR11XdGhQ+uHLovyKWEftvwUm1oGITZH61tZ2T3VS
 h+pjnvP4cd5MLo0RknDQihI2xMWrqqFwaZDtN9GjQhD1g6S53L6N5mI1YKjSXQPdvg1gjgY99AB
 VN9X5RCvmPuEHpZuHsqFakPhGiGQ78Ppt9C/jz6gqlBTuj+ncPQfecGYCZiE3BrbSsHcq03f6cK
 m7Cd+6eb6m3Nx0VQ7WTbvDR5+P7OuUrPK+aMKUMOTfRP9ccAxVHuHU5bfavk6BJBKeL5zTHDde/
 Kz5lrMeOHqcFGAu623CL27/QjRroxP4duPqGnnhB9+lQ4svSi3N6iR+09Pvatds9PLjg3EyhBnG
 R2mjvAgMSKNq12nPgui8KdfFpWjC6ma1SELch6M5VbYJNH2Byb42LdrHLAkru951XT7NAf9qZVZ
 9Ot6/ZCcTNMhyEQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
2.45.2


