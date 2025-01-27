Return-Path: <linux-arm-msm+bounces-46256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE09A1D759
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E31E165CC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 394B0204C1B;
	Mon, 27 Jan 2025 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQzmbsoD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED8E204687
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985711; cv=none; b=KiWHQr4ML+IshT6tO5zEwgTQRxzeGYm2YpAsmr/ZRth5CUG0/NEHeRtkRbE7UfwXcVzPK9i8NcqARMvbCAW/4usp7P5xzxqA4zzJaNvxv50WFE+a6fgtlwg9HjB2p+zmfahXB6E/SzvE4FfE9UFyJwFFAuEBL3825g8IAee5OR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985711; c=relaxed/simple;
	bh=h0cVw3WhBwhxWApd6NyQCFGpyPBt3xdpuWP2D0cWTpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YW3jcmqaAusS5Xrv+e4t8iVqts3HF12BfWqx0IIwyecG5bWOn4Tlw/9NIses2IsTnqm4I7/5KrHPicBbC0IdyJ8cpxThRzJOVxN0FmUG6/JvQ2oxhhwGtjpI07Y0UNG9Pu3f2/rLX8YCtIq+hjaaCWIAA2XRA4+a4+A6bA+jkLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XQzmbsoD; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4361aa6e517so7279095e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985707; x=1738590507; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mY8RQtjFV+gxytYKCRNZfQ8KR5dAf8lraKLA1ofVlco=;
        b=XQzmbsoDb+cNFg+diIMTuvC1R71gpzLIcZtZkrw3+yQTMlI82mR57AmaTGAdBIkdSl
         gSJg98K67xx30IBDT2mko2+cWfvuyaEFC/YPpyTUO4E+Twq6+aMucWHCFSikVGWL+4+m
         kVUYH0SEBztixhGhZLIJUkiXuh/Pm+C7L0CUed2KeABPY5oIPYmBmbytNCc5/90SndhL
         CWlY1Vcov/DshA/J6al0UtatdxQgvC+D6/7xtj/0uC0/SBgLHBaiYx8J/ykt/rjVY7x1
         gWS3KpHbhQK+dii43I0TNoE+Cl2qlnMGfYhc+AAAXmVMu/sRsi2Y1fzjEPTPm4/h18ob
         gwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985707; x=1738590507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mY8RQtjFV+gxytYKCRNZfQ8KR5dAf8lraKLA1ofVlco=;
        b=t8XEyswOLSDhulXVVIUN346TqY0UJdtR0xRV7zZAhQbqkCqp47evnFBl9z3RGZ9ogr
         vtLMLkH2n3BhBQI/sunjbXLkKt1P3NNQOdf81fkAM8GEXZcipKAlDeCm9xxOke3fQdn/
         sDv5Ns42534/GB5gEvZFWht+Al03L58uYhePrlQ/2gqfiQakL4NK1RUliaY6xT3+RQ+w
         hiNKtBvg6icecTf5i6u7p40CRj0DU4MPvl5S29BTjB0QHAxGuIODgSoCBqlFJP4hXumv
         Vks6Nul7XM6kuqUbX5FbtDAVe8D1p0yqf1/zLwatxsoI4t+iU8RIf/HLIa98+OMRywZU
         fV1Q==
X-Gm-Message-State: AOJu0Yw2scnYwSbKydzD5hzNkiQeCfZDwP+Qfnv2VYMDCeYke84BiaT4
	KsCqXUs1pNl0Cr55Dx6H7yhgPvj01RQ6flqWsEI+vqU1QRlRcAEMv8/+6LUVH+0=
X-Gm-Gg: ASbGncvBVlF4gMP05860z+tHIX5taFNIfUpbFEsgxZ9tUK//0Hbe+4OPjh5dHhhrdyB
	e/3T+H5VDerAxV/LQ74euZIcfrqIAn2TMs9ZV8zppzzzmRgFaaPBr2YgfUUapICxLB0e/EmoIMI
	BU57U4UPeArrIZ8yZ6kl2FqN9ftOXjh0hCHcwyWYnz+noQ11Ve5Y9O0mcMVm+tln+WvNBp2WRw7
	odcTFd2OGue54Qh02emA5CsAdXM8LexcU3BLkWMu1z8m0P9vNiHc9I6BTniFs85J865wirrA1UJ
	COFxZ/OSSG+UQVP6BfU=
X-Google-Smtp-Source: AGHT+IHYNAjO3ohTdcNEKnNNfGumM+VSrKwMfMbaJmkLmJbYqUNosj5ab8kqUUiRToaXhPBPSxsPYQ==
X-Received: by 2002:a05:600c:4f54:b0:434:f9c1:a5b1 with SMTP id 5b1f17b1804b1-4389141c9cemr144223645e9.3.1737985707345;
        Mon, 27 Jan 2025 05:48:27 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:49 +0100
Subject: [PATCH 16/24] arm64: dts: qcom: sm6115: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-16-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1770;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=h0cVw3WhBwhxWApd6NyQCFGpyPBt3xdpuWP2D0cWTpA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46NdjnUQ62jxyJHl7jB+tJb+rml19JaIusJ2
 vlqC/BMnTyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOjQAKCRDBN2bmhouD
 1yijD/sGCCYjELVMBo9So0fhD95G96vzudT1GT1MD0sR7vK0T/5CvDitMC68zZ23IDMAR/Ao+/t
 /66qC0MY57ryHytXZw8pXTbvK4wWmvLQOFiaT650VHSI4vglnSqjL8hROyDZ0z+8jOVtTvfBjze
 vohPzJlPeDOLQamXS85KrFFFnsZw7ogVkTIZd7k40GlnOVTTt9GqgbzIsv3zx6fvTs/o2R/q7K7
 uJO36P5CioBxZ/vNiZ4alUFrQWlO396abBk1UKIwYCuvHzYTkn9wuCIn+CDJwfy/veP5IVHgmlO
 64dA1fEI+Su53VNkn1dhXApV5yeesGt77T18I9J+lg938rj/8tqvT9FVTJCLtpnHgQ8mtkXnpYs
 JCGawBRAyzR38kT6bcH50mol4M5I1xLfwAbTry5rqJzLhXRJcKZI34WPHYjH9WPbLkDumKoPBtv
 3EnGGPAaijQBbNq/XyxDPyXXOahvGt8Gghz9UPfvlnw/eyuMF614hdu++xJCuR8BIyr4BkV93ys
 cOS+jBCquqhqB5fkO/4XHf47EuM88WGnowYEFu2dhd2J5UfiAIGcFKresZOPtHIcYvYjYXY2rut
 flWYkoAXXQr0Iq+bijTMfl9IlHKyjszWD4ZySn7BVxMfTU0UlHuoyJ0NQG92ugmmovp9qF7McRp
 LFBIEQ6XX87ZHpA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 94c081bf7a892654e684ad806621a14dfd4407ab..55a0db0ed9cbfa2560e94ca8160a31ff3f1efc25 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2021, Iskren Chernev <iskren.chernev@gmail.com>
  */
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm6115.h>
 #include <dt-bindings/clock/qcom,sm6115-dispcc.h>
 #include <dt-bindings/clock/qcom,sm6115-gpucc.h>
@@ -1960,7 +1961,8 @@ mdss_dsi0: dsi@5e94000 {
 
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmpd SM6115_VDDCX>;
@@ -2034,8 +2036,8 @@ dispcc: clock-controller@5f00000 {
 			reg = <0x0 0x05f00000 0 0x20000>;
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;

-- 
2.43.0


