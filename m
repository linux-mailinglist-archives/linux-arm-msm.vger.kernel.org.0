Return-Path: <linux-arm-msm+bounces-53484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65790A7F9D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 11:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62BFA3B802F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 09:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88B82673BC;
	Tue,  8 Apr 2025 09:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JaywXpnO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5545266F1E
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 09:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104759; cv=none; b=UfwLlnTC9Ouu/6HS0lEuybFIiVxsnwBVb4L9Ebl2dJuq1YtNcf+N+n6afx6XQ2PiywnNkIYhiPMYLVdrfg8XbX+zANfW22cqmJD3MVF2BFK16haDeT1XlUUSDHH06+87718/y68OCNVDQdT7sQ06R1esfDXb/paRbBsrGxRoJg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104759; c=relaxed/simple;
	bh=REq//oy73mH/h5lNz+iVbDqbplG98PAySiLDqGuR4jI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7x33lRMDG8a1Wbh6JnPzWBi+Dok0uUQZ80c6gktP9gP/Y8iIEswCepiXWmaQr1ViY5TSHb4Pu8bcUuwSCzeCFd4BLTMrWDHv/PA4KOtiv/7LjBpmVNL2caSgEZHdBZ6IXfh7OeZZTavazLggatjS5GU2cZnRHDEHnYup/xVZxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JaywXpnO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so3980395e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 02:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744104756; x=1744709556; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ctURsd9G+U/PEjXlsGbFa8+aNFnKOpQVoAc0DuOftQ=;
        b=JaywXpnOb7uN7QQEa7MavYbI2DeAesqq2s/dmLpZ9apuAfzyFUr0a4aP2Gfje5IF5o
         ru+zVX0BDANGZjowONzemtnYpv70c/Ln4/064zkFDNFmMNHrk4rIxSOA0qHg5IbX83WF
         tSZ4spL29NnOFDKO9HhEV6q8a8g0cBZBCD1DLAcRdDvz+Wp/MQMosreXhP31WClpnqaZ
         Qq2C8tdUw0B4C3xlplrITXL7y1m9G+xkh1sSDlWcDbBFzGk3XgvOh5zeNBCauiOKxLf/
         4kcEyan7stAV4otSPqf2TyV2yJIeA5apmd1o7pJ1h9+7q5AOHzb0LsL5P7GeKFfPvEt/
         sCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104756; x=1744709556;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ctURsd9G+U/PEjXlsGbFa8+aNFnKOpQVoAc0DuOftQ=;
        b=fFIxw3U+sE1hZr6vEd59GBkDNJfjYwRugQi+IN/UTDgCYNu5ENHRyFkaxzFI/O7oun
         yjmhZWgg6ugtZDOgd7qihsuPj5CMBAq3vSpl3JTO0s5MOSFOAKvxqK2/A9yjeHuObNuK
         T7vR2ugClhFx9eEKC43WHjZC9PQaOOxESE/hiaDWlLwr0pd2PSPC6LgnqoT4ZwQkkQZ1
         1HUaTffOs5NDKOXWbrD4H9PZA0g77IXaPgPpbe89sysEt1W9vj9Km7rHIgxJf5j9bvny
         aSdr1VpvDXPaSC32fwtThAtFM/1XKIw5HJOBFZFl4SZY82BobFafhfXBC5TP6IBe2bFm
         j90w==
X-Gm-Message-State: AOJu0YzHGUfsKg1TFsgVlEzZt0kLXvK7NbO1GqiZxl41x2fmc1w0s8SP
	8YJp/+nxTKGRqGm7vgtYF8c3wzGSs1gtFjx6z13HYUNAqNFyZSAJXKyKakOooJ8=
X-Gm-Gg: ASbGncswKkswShM77GEouoMxUEy3AaNCYjCUSSsVRH4KaMmxuSPG6v35a3mHWK60uS5
	UZfrSIW3MyoVA8IN4ESqOaDDeyNjg4AZatnqReX+9VmdoGAQYvi0GRoCCVZB3sBngk51gtESaPV
	m+hr63xz6u/e8It1QGfH2eWcr+SUg4hXHxZya4dT5uokDYwQxwaT3vqh3ldtJQERl9t/LuBpR4V
	q9mcThMCFeKAZ2+QbJn4Ls8jJcyXuZdQY+gvx1FyOca7CNBihiJz/piajCvMyL9x5Wm6KTpkIoy
	fJcsBDdd5Z/H0J94NRQmdooSnj8PI/yCPhKsqsUGWyHXjxUZ8GJNDbLvvBZrE3/+shAgd3itTA=
	=
X-Google-Smtp-Source: AGHT+IGuBVcD2BeAZdqlboCqmslcTSi7evJW4vaLgo6KiIOXrnR0Es99/FhsYV5pONCnhu1lCv1YEA==
X-Received: by 2002:a05:600c:1c1c:b0:43d:fa59:bce9 with SMTP id 5b1f17b1804b1-43ecfa4d95bmr46957675e9.9.1744104755868;
        Tue, 08 Apr 2025 02:32:35 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm153680085e9.19.2025.04.08.02.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:32:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 08 Apr 2025 11:32:01 +0200
Subject: [PATCH v2 04/24] arm64: dts: qcom: msm8917: Use the header with
 DSI phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dts-qcom-dsi-phy-clocks-v2-4-73b482a6dd02@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1668;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=REq//oy73mH/h5lNz+iVbDqbplG98PAySiLDqGuR4jI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn9O0Z0K6AZbp9lJjNm1A9aWJUL03RSPS87Y2O2
 S1qzr/JcweJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/TtGQAKCRDBN2bmhouD
 18FmEACDHBaAfKNhrI6XLABsWGiySavI/eTkZ0MQPoVOzVeDk8xSJoWSXtpwMF9qmilMawQe15c
 lXqUbxsAH7cD/axEwyQt48BI3HPCLOmH4eqycvpef+eQ6NfZQu8LpupuddSgStACkGBCqiADAt/
 zRrQtDvCT5ReS1sAyDG8JouXQDeQB4jOgwP2C9ygOFEMj1KYaWG0wO0XO42MsinRDTBS/lCgNWY
 jUz5BXIfCUB4sGuXoHl3twSMaSi526l5lqftkBPaqF4LCKA8mV1nd4UqdICRlFrWgv0JQA66e3t
 G2mKWpfiURcO7Uw9AzL8sxfb988ih6NdBV0ICgG94dw0lUETu1zNEVsZwpmnVZEiZAfSQgqT/L3
 LxXjCcqmgGzftfRIu63wD+hdrCo1fjTDRKipWiJK8o2rmo4Sb/yIqyxhNQtHJX8S8NsBBzIaAY7
 KD2r0lyQxRnJyWR2L/tiNKhvW8L4CRE9o8Mg3urMTSQnmKqbpoLhOIu5U8mc/7UEEVUIY0FF+oC
 SuGYO8crsMz9qoVofeWSeX9Nzj9VyZ5eCzPImbl+b4V3wI9QWP0Yb6OAbZ+mQRTycRp/zkpJj7W
 tRx957wobkvvkzFqFaX5EksTYK3JeysmV3Xlw8y8LamY0VuiBEHtuWy1efnqEqi/6KhlGpvNHCP
 g3Cbj47Ww8n9qtg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8917.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917.dtsi b/arch/arm64/boot/dts/qcom/msm8917.dtsi
index 9d8358745c91c53dc19a07dbb1a326daef92e235..8a642fce2e40d6d252a1cfbdfed602e6789ef09a 100644
--- a/arch/arm64/boot/dts/qcom/msm8917.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8917.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8917.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -961,8 +962,8 @@ gcc: clock-controller@1800000 {
 			#power-domain-cells = <1>;
 			clocks = <&xo_board>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>;
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>;
 			clock-names = "xo",
 				      "sleep_clk",
 				      "dsi0pll",
@@ -1051,8 +1052,8 @@ mdss_dsi0: dsi@1a94000 {
 
 				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
 						  <&gcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&gcc GCC_MDSS_MDP_CLK>,
 					 <&gcc GCC_MDSS_AHB_CLK>,

-- 
2.45.2


