Return-Path: <linux-arm-msm+bounces-46243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFD3A1D727
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:48:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1837160B0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DF0200B98;
	Mon, 27 Jan 2025 13:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyginTFx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE96E20010C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985694; cv=none; b=RzgLy1jsFrYJHbUD+dG4VPMb8MKqA6zPNd5GRHtyfvSkyMb/cxFthj0ak55awI3Nx03QBz3WZaTqkm62bfFRIisbP6uiXemezRlYxrTIsXevfMLwlo0wn4Y06yY33pPfgDSN8BKunzF9TiHiuNPDUeme1wIXZWc6KKu/T0WIji0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985694; c=relaxed/simple;
	bh=1f9Aj8MwC8AbYTn18IevGUozb9K6WSQzc+/GF0jpt+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A+E1qJ2MgCLz4mZxwWIlN4rwDfnrhtGi9djODajwBIkQuRR6IPCAbnhZ3xxEULu8EXV7ARSmS/G+XCBOOaCp17E0uEXyQkSeRoHnEbwAyOzedxWBTg8e7H0rNOtqi4OkX3e+EtIpjxW8Y1eMI5H+H4y2zC9Sm2JTCsfUJHor2G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dyginTFx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434f398a171so3928735e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985691; x=1738590491; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiGtKjTaDDkHUxHqSeI5XYA2koECpvjRyleWrpjC2yI=;
        b=dyginTFxvPj+AJr4j2S056iFPXn60vVEymbQEcsmVswHMSiS+j3jN8mFawEU9S+mvG
         05oxzYT8Z/OjfRnB0VPbNwKhf5bbWerE2Gh88xcFNjd/ifxOhLeI1CcvadnQT4eve20L
         sSeOM6CXSn7G2gBVw/upOTqfREh5lkEb5bExZt04pXzYTqyV9KWhtHa8h9+t3O36FPJl
         NGOktDmv8lnKtC23RFkAQWMme9ydcEupCNslidlPlXrQd6vCvLfbxQ+OxNa6ET0fYcW5
         +nml4a4vXRpJv+6DBi/9bgN9VQBXMEkKB+ucewbB9/W9mUIevB6CVcKOJVSf3QQFMiWF
         3dxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985691; x=1738590491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OiGtKjTaDDkHUxHqSeI5XYA2koECpvjRyleWrpjC2yI=;
        b=DB36otrLrRGaTVz/Vz5j0FcTVlZp6TqCJxa+uuhWJ7wLhqw9pzXcnOsyq0kAgz+kZ0
         EeUMJfQWm1TCWXislxRsqs8JwdtiIsA+++io9YUXEH9vlY/L1b9dDrMk/V4G2nDC1GMD
         iyapxPM/RJZlurkiGshOUsOnqumcYJIZ2j4jzDV00yGawSKTARLcV/24fFN7wEsORjTy
         SdgfITPpoAILvaT5VHX4X6XTQg73mDuogcZN9hW29ofFPyMn+I2yOb9QrYGro1dztEni
         mz1KI6PEHgulB3BYy0u5PGk/ThH1Wcgk/avyrPZYhB3JjEsMDk4LTymKz56OUtekjeZL
         SIPA==
X-Gm-Message-State: AOJu0YyLuNnzcAQAYAbaKZc0JU3VyOrMimATOtvaGsCea1IpArqtng31
	Cqy6BuZkAk6LiJewVUn3H4CwsM3CNd4xaoYQsqQtRzHgtYzQmq/L+lMrI40VVqqWU4Qz3G/fgXG
	w
X-Gm-Gg: ASbGncuEZeBqSlVzfuyic+679/kjlsIXWZBdlFrR89qkH0P5NHMb2e01QTaKwCbldhQ
	LbkU5/9R7dmRQr9FhYrHRKP+daeGOOcP1f+CQJwKszkpxXCcsIfqUp0B0Ej902pGjXN4A3/ivYf
	NPYfGmgC6t4EXaMRCsQ+SgyIizQRC37HFaxkaF0IlGDKMIjwW1OYCXRwNLLCS4rgD4h3de2ATe8
	mUGDxAyzYu8fcyj2+CWjISmJQV18K8JSdpFL8qpWn7yS9XRTXATRjsVrP1ssC2X2yVWLglJd9vW
	Q/uDoipau3MqMtqwFpg=
X-Google-Smtp-Source: AGHT+IE44ZN+/hIIcgwp3dbYnDXJoz1iH2JzxerQzS0d17DbohyAA3wD4zrmjXywfBP9jlWOPObXcw==
X-Received: by 2002:a05:600c:4743:b0:434:fecf:cb2f with SMTP id 5b1f17b1804b1-43891460b86mr146300945e9.5.1737985691088;
        Mon, 27 Jan 2025 05:48:11 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:36 +0100
Subject: [PATCH 03/24] ARM: dts: qcom: msm8916: Use the header with DSI phy
 clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-3-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1f9Aj8MwC8AbYTn18IevGUozb9K6WSQzc+/GF0jpt+A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46BGhb3A5yQnfXIW9zoIDHUsnHheABEzxtP8
 dcDGIvf3LOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOgQAKCRDBN2bmhouD
 15vSD/4nNglo55cz8k5DRzmuVoECqrhMm5X5LmnI/u7+3PRAo48l5E6p+7bjdE5xJlg5eNUE0F/
 r12jVYn7RDB5SbeaOPv3MI5rn1JG4uOjdzDQ/8Qa3V/FmWyPanzfwrQm2NWIWVARsuTw4lZjbnL
 UL0fzlbgXuv1U3KxUmJpilq/xdWiaQhseGNgBAe+bVE+nF07NCEOr3dxTE9AZR23sGh33zzIkiF
 zcO3KLguWUHS/wpJFw8ioBJPd3F5x8K1pXyluY9eMheBwskykUOJuwcnI9VqsZLFUmD7/ceqhto
 QM5GATSaFBJoHpC7jz1VQ5UjKeIiUfYyiKWKGWx+cfU//SIqmunpfHsBPaFpB79YbV1td/NRfKk
 jkDz2qASQSXKHDQ6pj8yfFqPtMvORkW4c+Vdru2L6guTtq7RB3EpQ+qzC2VOroARsWmOV3W6bgM
 WTkVd3ybgKMQ7GP9wJVamNWXaN8BPzhQW0yoR9VaVgOkuMyV1ujmFLhELu36UEAU2LrkeNmuXCx
 2HKCFUVsG5YIjKOIqmElq3mKiskipP7H9tcsHe5fIUrN2Kum6vXjaK/h2IoC8PGVqpNGyMokgWG
 tsadW14aRlbhX+P4Tdqfp4SV1HBnrtgPqJ59Kq6P0O1TUjQKXUlSiDjO1ySlD2krMA+ztHAycjJ
 tAiieigXU+z738w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 8f35c9af18782aa1da7089988692e6588c4b7c5d..c89f9e92e832eae8f630555e9e7f5817d6731d4d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/arm/coresight-cti-dt.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-msm8916.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/interconnect/qcom,msm8916.h>
@@ -1497,8 +1498,8 @@ gcc: clock-controller@1800000 {
 			reg = <0x01800000 0x80000>;
 			clocks = <&xo_board>,
 				 <&sleep_clk>,
-				 <&mdss_dsi0_phy 1>,
-				 <&mdss_dsi0_phy 0>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <0>;
@@ -1590,8 +1591,8 @@ mdss_dsi0: dsi@1a98000 {
 
 				assigned-clocks = <&gcc BYTE0_CLK_SRC>,
 						  <&gcc PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>,
-							 <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				clocks = <&gcc GCC_MDSS_MDP_CLK>,
 					 <&gcc GCC_MDSS_AHB_CLK>,

-- 
2.43.0


