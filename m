Return-Path: <linux-arm-msm+bounces-46247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8029A1D733
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:49:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F32821883159
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298A620127D;
	Mon, 27 Jan 2025 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tqgzmOpl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AE2201113
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985700; cv=none; b=oPXq4IcEbodOONXk1XsODOxG3XWI32slV+n1pDz+yIcNWe9kg7HMFfDGYwREBam4hX29vXty1EqvCkSL0/M6zQs78agZmOtLH/ktTRerib4mXuykfhMBng8AqEs6HT8nGwtlph6P7ZVRlyPdmMA67kjUd4oosh3ohuSDFRh1fo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985700; c=relaxed/simple;
	bh=xnXmj4e3tGtHbKZD6dRjpRih/cmTT/iR1kKvlqmHanY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cj8s2K/bYWj5sfdheXG8G4rgTvd7mJHDJXS5/sEyl18w/7wJCpHwKjtOmwKyOMI8R8D2Pk0qO7U68+Z+kzB918Zt8sUL3sEn/2C6OHbHvm9LEfTfIpAN/oq5zxyCIbRhHgx76xYM78HQ8UtZd6ce2Cx8MFtYlMV4NUKclKv4HCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tqgzmOpl; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43637977fa4so3928645e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985696; x=1738590496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Wipkn4oUshaV2zs7mkyIs94gtpMOU1nFJLilmOSM5I=;
        b=tqgzmOplxgsYhxjRbSeZvC6xEc9fkruzyyKFD0MtJ4pSu9JTdgq3LIJrsdRHZh9N6V
         pSNpv8+9rDMojNOkXBmyd1Ig9lfCZrPE/y416cI2qoCHiNwcpPDJE+Fgqp4CAWab++2h
         Fi8v3mYYXynd/FNIDYckjr9FvToDmAHHdL/Whz0xO0LHGO83J4T12wpTycTTEw5cgEV8
         KMiM9vInRANYizoiZlJlB4N8gWG87Acz9vY3IEH5WgAsICBfLSAy9+79iyhB7GALGwpg
         ziBtX69KxvCjPdN3mEGLQdjP+ZvYPX7BQ2fPv0SxODMxX7ncBTCVvHtUwU6FhT3ibc7B
         d+kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985696; x=1738590496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Wipkn4oUshaV2zs7mkyIs94gtpMOU1nFJLilmOSM5I=;
        b=KDf3TNgDGfmWgT9jjB5r/F+NK/wFWU/WPHLGCwQFcwTaklaqQ2jiKnTC0nF1RJ4Alz
         t2k+HxmIH4R/hQqzuz2frzQvGW5DFnUxoTigdHw4+kF7V3kOcX9/S4cQQ/y0prc5Ligl
         MNJ/LhqZg1A/8zgWnb19q05NEPVZq/cp9S5npdUhKTNB8Os4upxBQEcMYeN2HPbX3TSN
         VJxJVwaCC7OuE0zne3p9yWYKK9AxWBfAxJEgcpTycXECgSgIjZlbddRu884Y3++HFiUP
         uxzCjKuw3vf+9MU5qDW9kfBcnp4UIov60asfvsWRLH2B3Eoq2X1opaBtF0nFyMa8oXEI
         vaVQ==
X-Gm-Message-State: AOJu0YxiIKtR0ZgXIR7P5sfEQUijDEhbALfPkw3ZKf/LC2u5bdihxAUU
	ITog+FTFSjdKI/waA8lJE6hyM+yIVTEILDUtBzt7+1WrJUGvhEPoSpNYWBF/lLUpCnrRg4cv2iX
	d
X-Gm-Gg: ASbGncsXZ3Y+nYHiPyf0oTos1IOPqqrwijCzeysIaMYM47HQ7fWoc8km98ScY4MpGRo
	PJJRTD/Do3JEi9AjQUylIwB6DglpJeI1jpQnsC6OZXHbFlBabMaUjB7VzEpFwl8d+8CWxF2dbMN
	ar8PSpI/bXxKHiHSrjdiPmhS+KYdRHf1fYBLTaNRr+sbwSUcCXlLDRqEIvDxvwIQzLiOQUxmOR/
	8NeTTsPkxVhXhYbdojbSwfU62QZiHXBWsJ2xbSA5nZ7sTV9AXlmIIwYoAuFmmU8qJdsGvGbiJKa
	xwxevmtsTu5gQfHtwKM=
X-Google-Smtp-Source: AGHT+IEmbmkAIgTWVJa5wTjurZcYUWJ+ZmHHBmFejHicvGcRW/Rt3PrDTapMYDd0YE64Ue64J6uxvw==
X-Received: by 2002:a05:600c:1c23:b0:436:488f:4e4 with SMTP id 5b1f17b1804b1-4389149cc76mr139232945e9.8.1737985694929;
        Mon, 27 Jan 2025 05:48:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:39 +0100
Subject: [PATCH 06/24] arm64: dts: qcom: msm8953: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-6-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2265;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=xnXmj4e3tGtHbKZD6dRjpRih/cmTT/iR1kKvlqmHanY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46EpdpNgSQQ06lYinYMBv4a+LtI4XQ089eRf
 T7TW9jDrDeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOhAAKCRDBN2bmhouD
 1956D/9GubEVTvKDe1gvVG1Bv0gZ9XzelITEiRjL7SrX0NlUR4BKKjFKkbGxQlmnUFTu0G/21IT
 wlyNBp/F3bPci2I75u4mzsIKsiTlcUn0l0yQVOAfZcOggoQicGuORl3znUWa/yqK1lIph2592+u
 lqdDOI3MOV3GEqEAElOjUG3FCOvqOfMUJYNTh/4TTAhp0XyjMRMnFZiaMbsmGvFSyaS350i2QET
 xdty7/BYcs9hHcRn/HV9UOKrwkIx64xjP3nNCw3La8BbdNOLvOnMUd6JhsOYcV1BRewYtP8yav9
 vOmI6ma7ASvtgTEYuZevJ6TuUyQ0tsh4blCI9Fd30f4nHNi4vnGpSzaTTKdbBbT7bpHTNgd9zSm
 IWP8IpjqjrL2CR5sXy34SdnX255gt9PTDgX7xBpg5gjib29BqEH7SWFEgdphyW2XpvuxdQW+yCz
 Ye/6nybAQK+o8NpyrcVRasQAA8nqOkdtNFF8RFidLRg53t3pmnUsnGWo5/oCzKVQQgS5aaIyvdD
 IBnnDzNIpsiPksyx0e+BI3CQ93Tt/FrRydGHh10lmG1TCdKKk8Drh171GKsamkkSQsCWmogB/i0
 Qsp3lPl9J74uelMyh457jHjq2xdE1Slpd9ohuj3RMSuKMOQ9vxoos9Bny5lReEWy+eNcLtMalTb
 uQvgd2yNy1XZTNw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/msm8953.dtsi | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index af4c341e2533ef2cca593e0dc97003334d3fd6b7..4793a60fa946195d3220b6c44dec170d443f56db 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /* Copyright (c) 2022, The Linux Foundation. All rights reserved. */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8953.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -807,10 +808,10 @@ gcc: clock-controller@1800000 {
 			#power-domain-cells = <1>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi1_phy 1>,
-				 <&mdss_dsi1_phy 0>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>;
 			clock-names = "xo",
 				      "sleep",
 				      "dsi0pll",
@@ -917,8 +918,8 @@ mdss_dsi0: dsi@1a94000 {
 
 				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
 						  <&gcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&gcc GCC_MDSS_MDP_CLK>,
 					 <&gcc GCC_MDSS_AHB_CLK>,
@@ -987,8 +988,8 @@ mdss_dsi1: dsi@1a96000 {
 
 				assigned-clocks = <&gcc BYTE1_CLK_SRC>,
 						  <&gcc PCLK1_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi1_phy 0>,
-							 <&mdss_dsi1_phy 1>;
+				assigned-clock-parents = <&mdss_dsi1_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi1_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&gcc GCC_MDSS_MDP_CLK>,
 					 <&gcc GCC_MDSS_AHB_CLK>,

-- 
2.43.0


