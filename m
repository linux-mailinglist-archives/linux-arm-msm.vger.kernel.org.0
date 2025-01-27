Return-Path: <linux-arm-msm+bounces-46264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A45BFA1D772
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF31518877E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED9D2063E9;
	Mon, 27 Jan 2025 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B8LDTQd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DD2205E24
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985721; cv=none; b=mdOhccvkK0fIM2SZa3YftwxxoVn5unNOOP6k8sOCkJQR5N58Slu+3HcVdjy7/Z/iOAzrT8lrIRqHjuMYVc9r4PS6PBtIb8+TKSpPTn4aVIS+hVK66fBoI0cyY1wu+twtH23YmghCwAuMXq7fOH8MVfgcDMt/2axNnLvfqQTaBzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985721; c=relaxed/simple;
	bh=ZNWZ53OBefAHq+U39bFO/GXkFnaY3CgEkgNxkdiZPqI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AG4+Piqh2IBVaN63zaQJMiGwR0iY8iKWaVlXFfYMTpgjVlM/QNJdj30cwWM3cJCKh25PMFAdE1vBCzoNWg1eE43zFYUVPQ4+TqsXFCKc6Wl+ZdxdXq7jEOidcQhFFI0tL0Qz09UXtbIH8Szxuim7bytDmQBc85DgQ5cfZrynKqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B8LDTQd0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43637977fa4so3929225e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985718; x=1738590518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79VuYiWG+YdXhRY760GBNkt8BJQ+hNMP5KMAUVHB8vY=;
        b=B8LDTQd01Ng725dRGRbuUySTTgDUCVT7WxQgRIdexF23YBWnFIJMNrhBIsiCvH1ivz
         nREFwl9N7elIRzo1pkPxRGHEuLKvPSWldIm6+u+04Z1w4MoAjw9Smvv+fQOSyIwRnSuq
         m1NnX9s1r7rd8G5d1IShCf7nbcDaolfsx/qzMHr/wdZpjltfB0bsZAzhMG+AfgTjFHrc
         rDa2c2bZT/vscYRFIZfMeGCVnZ1Hl5NDy0VxOCtEHyDLbSAMwqyYEl9IrIMuiKFtUHSi
         z0clXWhjFrn1B1eIUmnYgd3+cOtc1/Go7bgepE3gBRgRNkjldKc/MeFM+Vzv1MlqF+Mn
         FDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985718; x=1738590518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79VuYiWG+YdXhRY760GBNkt8BJQ+hNMP5KMAUVHB8vY=;
        b=kdE5HELHMJSVX0/vSMySR8tKqnUS9QX3/BRJrBRSXclxSFXsBbEFprT6iKONKvH4aS
         8/EBktIb4Rx6J+PY9dnFscxtx+Qd3FQqgLxbDgdOY2JBoYO94w8PofLP+hUHE3/si3zq
         MX9lKKb2F+mwBShNv8jvDJBBlZgCCUDBpBaFuU1nEzrWmTdZac34fsT4AsyQ7JzStlGT
         0NwvXcx+Lhrh/tkAQCxG/FaPSrwxcj70CFxr/x0vCRhbR66max1swjXLfOv9zEOHBsVm
         r1QZvrEHXIC9lxBliir8tebq/kB8t9qG7YZ3Gp5e0mo7NBeQGkqZMbO+1Hv2KujSqQQ8
         WgXA==
X-Gm-Message-State: AOJu0Yxzih/OHhvvwcciIHwsDj8QmiZhbnGsvaseZ0Y3UassgjMo+jBZ
	fsSp7A2w93FQaWPOUSgHbNnRFeCmYjaoX5ZhRMym5Yx2oZQG2SGSyb0DqY+hI2s=
X-Gm-Gg: ASbGncuwxV1RlRWtjUGZyLkUMYP1J0zq7W97NG6eF7PrkAWUVZ32P0eBXg0Ch75nSTP
	4zxaQZylRV0R5X/3ELEnp4BGb7A+Tv90rbob6Jt9hgSbmJz5K7Be/d3REiO56fL+Aib5nPHUvk2
	R4kSmugx2sBql4PjKqY0wrHkGaWBP9AxSHdf17xjtzSxGqwfiBha16VXc7duqI3N+gkUtt4KC0N
	Xyc4qwFe7RkjwRqXxkgCrY2Pye0NyLcAXRGSAcIMuTgCnncIEkBq0a9J56InlUiQRvtrdjFjAHC
	YKCKJzaCgGGyjQtidVI=
X-Google-Smtp-Source: AGHT+IFIf54qA23eh4T9bUqg1Zo8GrAU3j4GgDYJj1E5G0CMaHC0UfYtPwHm5WxXURw0EoE8aDk0IA==
X-Received: by 2002:a05:600c:4743:b0:434:fecf:cb2f with SMTP id 5b1f17b1804b1-43891460b86mr146306465e9.5.1737985717848;
        Mon, 27 Jan 2025 05:48:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:37 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:57 +0100
Subject: [PATCH 24/24] arm64: dts: qcom: sm8650: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-24-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2280;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZNWZ53OBefAHq+U39bFO/GXkFnaY3CgEkgNxkdiZPqI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46USSj3kBLnNAOz8JkBctwkOUt5CZ9MXTC/d
 yHzQU8sDU6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOlAAKCRDBN2bmhouD
 1wYvD/4gN9t5/79kex56ZlZ8tA3pa0ZszOSk70ssn9R16hp3+Jg4PvY4b3nn8ebBSAAJpdNiAD7
 DWFws4yMLYRKp51T2uowCYw46L6uIes/zOxs58clUB7wkUBQhcpoKJLPrLrgKuSKsq8aXiGju0y
 yR13GJGdCiTWdgDyUGuL8o76Hqzl9tU9QMPbGjpyvrG/YCmSIbWIxq4/XRV2USCBCZV2pJpVEd/
 /9BrkGLeUuv8h9pKYzspb/QvZg0zcsuuui0OQNwtdj/FBTAyyKtPcvrKO/vXJyEIC6xKFUMPkww
 YgVSG+1NaNMc7kuELjbuvNP5Fpj5VniFhP43djK+YiZQsZQiROIro6KJxhIOxjSNFrDuocgJnT6
 EwggS9qCHyAKG7UZJu4oTMlqQJQgktqWTZOulLBaOw6QCelcYy4ol67qLZeedCtC3CqbSFOUF6V
 mxMMZY8mJiXJ1rdv+PXmblnvSIM7cRLS80bhGZjLe/G2spJSXW+oR3XJRAPM73pZ1lrNQxr0b2o
 NgRtw72jJy9Hm73tJ8O7JmwUqEENVxRY45a77/5Efxsjtcc2m/+ZqeigPs+WyQXG7e4PG4v8tgO
 FXJqh0SBwXJ1s6l4brDiJhFLx+yD1GfaoAxgvuvkQkakIoBz8JFonjqZak0fOOd+O5fpAUnA7Tl
 LFGHRv+OREZNaww==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86684cb9a9325618ddb74458621cf4bbdc1cc0d1..8c26520201e5bd2bc830356d9a21d9fbf9897dbe 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2023, Linaro Limited
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8650-camcc.h>
 #include <dt-bindings/clock/qcom,sm8650-dispcc.h>
@@ -3775,8 +3776,8 @@ mdss_dsi0: dsi@ae94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 
@@ -3872,8 +3873,8 @@ mdss_dsi1: dsi@ae96000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&mdss_dsi_opp_table>;
 
@@ -4020,10 +4021,10 @@ dispcc: clock-controller@af00000 {
 				 <&bi_tcxo_ao_div2>,
 				 <&gcc GCC_DISP_AHB_CLK>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi1_phy 0>,
-				 <&mdss_dsi1_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
 				 <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
 				 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
 				 <0>, /* dp1 */

-- 
2.43.0


