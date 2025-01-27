Return-Path: <linux-arm-msm+bounces-46257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B778A1D75C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 14:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86B4118870E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 13:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43530204F63;
	Mon, 27 Jan 2025 13:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WfXC+wYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E64200105
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 13:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737985712; cv=none; b=XqYTaUtrNgCunt3WMvhhFxlELrSgjJFpQAyEeJcCx7PsOkEv5boBcrT+pGKXkwuhIaCbD3GnC4ApOnd1q40upe9SipxIpiuRRyH962gQyoeIsOKyzTma3B4XtrJZey9KRqCxnfnVV0Z4KdqPr0WzcKI/kZN9df4n+wWeKp+HwCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737985712; c=relaxed/simple;
	bh=+L433Yl3Zzrnry7JXzlnKWgfrMjqPTc4+gapWr3I8Ho=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Abr1UXcKxL6F3wvmTKpjA5AtbWbKsQu5a2hG37s/lKO1M/3DOz5YSvCA7OuvdIdqdc9yVhWjGPuLp3MmaJHEiAAlZaoL4P2puqH8fmMaGd6uXmcXNZVtkxDMv18TXhyQfPW5WOEIx5d936gdN/H4cquYVu4mVwvSmcapW6E8oO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WfXC+wYF; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso7075355e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 05:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737985708; x=1738590508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYkNGe29Upyq6ssbNwJlDIdHAdHJmuQtSsDGs6xqZMs=;
        b=WfXC+wYFZt0KTQFxeLpI9cTMeJZdseuzmIWNvl/eIcflE2PUVjXyUMHjkS5xZCNM8D
         Y5j+MYTNq3xhwtl7T3d6VuHaNGvfknjJ58ansjsqTCFCgFxiKaLBjeTt+OcT6EqkOXZL
         gzz7y1MzQzxHL+oWhzCUafKO9Celfuq7w1+KOOS4HIjc/DkDbUGrvI0mgTx3Nlq9XBkc
         gIpYPSyopVHz598/AxlTmrERbwAICrmrdY5rtvYQzUe0bMabWbUzcVJVI/2QjCK0hdQj
         1Z+2nEqojEzKlul7ozlQmhBZAOBNq/sDYfwaMATyL/s6GeTXcManI/IeUBN4SD6mdpYy
         QqyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737985708; x=1738590508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MYkNGe29Upyq6ssbNwJlDIdHAdHJmuQtSsDGs6xqZMs=;
        b=Vl1RoOchgYULMVvJrNZYjQ29UYRWazxxE3xuc9kGWA/agLKtiAQuthIM//pJYA4rhm
         neEJz79vcm2nTrYyAvUx4fMnAOfMW1Al1bPmQX3p+B1kB2dycN1Y75NT3ffJa1RUZZhr
         VyoF7cxm865X7j1+hTaKTAyzkrc/Mtdo01hYISQG8sKqjeS11iuffSmsl1OlxakcSgJd
         Rw1LBbvSy07takom7mJ4FXNp7Kz+qLTRgvPFS4YxCESDYLkJr8V9nNw+oIs4Nv14UqAC
         83QJ7ur6Tkhd7+qeNPfLe0L6l0sF31DznM/50IUjnttUE7c+gu2RS2/kotuPlZ7vaPot
         ocLw==
X-Gm-Message-State: AOJu0YxVQSJU32bao+Ov0Ddt32hiJegyMZrtWt5R7EhdVVz9ONtOpS/b
	MtxbVfMSe9uJYgqZ0VTEQ0+e7uFtkTdwN8hZc6ZoAlVsR7BVPtM5FZsGbuCVvMo=
X-Gm-Gg: ASbGncvFUZMn+0Ogbfa533CT2uMG4Z5LwcUo1KD7v25sAG+3c4UJXspBBLF09DYyJ6Y
	Siqw7IhBVrTrUHC7Yt6+AERIn8JeAaeZj3Z76Qcl9fFzIPCMYLUx+DpsGsUmxFuZDfAyhjkFGxf
	yQnqNwPT2Jb1PRFIUYqh2EZKfeyxerKSmfQVTPArtt1gQ0m0BXYExUYGxQWtZYvcfxPaU5Au1kH
	nXg++601CxCC3onlEJnOJmttMlIBGef1g2i+W6jS7nZ/qFz9fLcy3UCDDokEE/idhgIyuJKC7lJ
	dtQo+78Uh/n0blCgbds=
X-Google-Smtp-Source: AGHT+IE5KEYzBDGYiS2uQmvn5C/NU99+xyOP77f/1jGhwDCqLUW41RJp6oOJLKD1EdXIQaREcbNJGg==
X-Received: by 2002:a05:600c:cc8:b0:42c:aeee:e603 with SMTP id 5b1f17b1804b1-4389db13a7fmr143638795e9.7.1737985708555;
        Mon, 27 Jan 2025 05:48:28 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd47f292sm131038555e9.3.2025.01.27.05.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:48:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 27 Jan 2025 14:47:50 +0100
Subject: [PATCH 17/24] arm64: dts: qcom: sm6125: Use the header with DSI
 phy clock IDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-dts-qcom-dsi-phy-clocks-v1-17-9d8ddbcb1c7f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1673;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=+L433Yl3Zzrnry7JXzlnKWgfrMjqPTc4+gapWr3I8Ho=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnl46OknAu0+T56HuIeLnhOy6OqkupQl2wN/jO1
 3Iuh/wj0+aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ5eOjgAKCRDBN2bmhouD
 1wtTEACHggAnsgBUonHw9//LYN0VlB4gy7ZCRs719mespUZGh4beNDJ7e+W/3oQBhPaOBTUYCmm
 gO9PlPAmHw2vC73yE30LVLOYkJaGpApDjG9my2E7/+xcZ8u2v6syoRffJ1sFVYFROUnxQqJsbWU
 8wyRpn9sh8wMAG2BavqTUqg9JfVOF3g2nK+PzfCdmdBVmuTafymuaj5V6197rxiOecnMcM3o0v7
 XBiSyGt0Ju8JSJduI+XSIhXwW4dn6+WPGi7/Ses1AMgY/d7fEkTRaGDD9g4wOLX4ryf+4CUEq9b
 GHXDqZDcCp2gsSfGduUEVUvXpT2eaiinVGxhG9V6lCkXUdb578dycyUvgio5+O6g5aMziQbbweD
 GQ5AxZsTVPCJPC2dY3rqCW4RPsKsH0l+sdDJrtKm7Uuhc0moXqpJbBoljiNzH6+5T/rLUQsjuVa
 ypwSGkNOCY8e/XI5mWaZSO0AZjUfn40RwrA2CfsxcoyEH9tP4rRO6UOoZ1utRDW+9VTji/f8ee5
 hSDWK3/6f7ZDqX2Nqd54zMdrk5/A9HDIaCmBpQ+Q0DIqZDzxuYnmD0vZsXSZOc6eQ64OcKkFq0i
 9bMmDQ8T77kUI4hpiZlUf/5IBuygfyJOtTOyKO/lnZDowy8ClXDyezdaosw58t74v673QLeV5ZD
 TepsH7HqOxg+uNQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use the header with DSI phy clock IDs to make code more readable.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/all/20250127132105.107138-1-krzysztof.kozlowski@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 350d807a622fd9276e1f12ef7f5bebab50aea15e..091dbdd171b46c1aacb37b90c3fbce14422aa031 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-sm6125.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,gcc-sm6125.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
@@ -1340,7 +1341,8 @@ mdss_dsi0: dsi@5e94000 {
 					      "bus";
 				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
 						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
-				assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
 
 				operating-points-v2 = <&dsi_opp_table>;
 				power-domains = <&rpmpd SM6125_VDDCX>;
@@ -1415,8 +1417,8 @@ dispcc: clock-controller@5f00000 {
 			reg = <0x05f00000 0x20000>;
 
 			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
-				 <&mdss_dsi0_phy 0>,
-				 <&mdss_dsi0_phy 1>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <0>,

-- 
2.43.0


