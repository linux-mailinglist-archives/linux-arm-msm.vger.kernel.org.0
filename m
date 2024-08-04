Return-Path: <linux-arm-msm+bounces-27847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA5946C7F
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 07:43:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B3BD1C21478
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2024 05:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546742C87A;
	Sun,  4 Aug 2024 05:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V5bbXfbp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4713D994
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Aug 2024 05:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722750038; cv=none; b=XKp2i0DzOEggHVgTujsbrC8ediK6K75YqdvWJmdtjx1aSjnrc/us+kWrTbP3qiu+pyfWIM7hy9MkOyoCgN9lPvJPiNFda8ToiL43oWWgKzLqSCulodsMBb/9/1GZ+A/jZwbbw+soTA6bSF8C+FE4OF+8soLlG/VfBnvGZEplHEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722750038; c=relaxed/simple;
	bh=jVYTvN/M5oXQ0cuOojPrVIEl/Z9fBYssaRlhkXEzBxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gD/Hntnw9hfjE27wdrP1++tXwaoGUXwwpQwoSpA1RD8ECB6PAn/t1KjiwiUBLfDelq8T4NEn2BmeSuvRwYN4GG7INHl83x+UOS0J2fHi82LKq8aY2+yCOTloztU+6fhFL4T5AkRmc9VE8gqQiQU0/BShQuxNPDJt0IlRWSLsUOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V5bbXfbp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2f15dd0b489so30966281fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Aug 2024 22:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722750035; x=1723354835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rGZoVd2rDgNeiiA+eJxTSi+RLq7K+EuCeMoKQavvKp8=;
        b=V5bbXfbpkO5lLAl9VtWGBuGemgtN5/PwNwLKQquGOtJGlvSQQZTiq/oCz4947N8Poj
         I2jVwuQJOv2qJzh7dBlLQKF7f3+ZJEUjELdungX5J44jkxBzUoNeHunCAPklRYiwZu+D
         cpUlik0poCQaRVdXnJoWg5AURpaZ2JsmPc0oiqrkams5mKdcDO40OqdNX0FyIRLZJA+C
         epkOU0fco9e5yoPO4Tk/aEbaKo8tY08GMBBKF5hdiKPZ9bMPmGu1PwB3LsO+gfpaKJHw
         3VS+88UUQl1EGPafVzokIr/pkhMLvDVtH4ZylkCzdIsNKPyCMDn68Illv04xUpfKZvS0
         //ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722750035; x=1723354835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGZoVd2rDgNeiiA+eJxTSi+RLq7K+EuCeMoKQavvKp8=;
        b=phI/3lglbBMn83+5SdDRF1bNA8rYUypPMFEiPihoqiQYefH48ir7iRvbSg9qInXCom
         LOqdOP/WLzQ+9YmjTYhh7XVEg0gArU8lxfvG//xbUiX8Ks0aZFgVyD+I1nqhHar0mvOG
         ntkIEUc2I0OkiZ6iP43WzsCa7yeKd6DQUGG2Co5xTgtMDAUt7uwUs1q0sHwZdxFljLMf
         2eVWace0q/aCs3WhxsCaMJLOLfFKa57g69GMg98k90UK2j10hGUEzdPIMVVm42FL2GRV
         F6+KtIdWd384AvasLbrpQpJmOQqYLIhjYI4ZF30HbyrsDUipsw4Q4gt5aI/KXnQMTeNk
         zV8g==
X-Gm-Message-State: AOJu0Yzfe6INDJt5SJIitWrEtpG398ZCWLfDy4JItyLmK9w1Uki/Hgnc
	MN+0oYpjFEJcYIdUUXdJYWul5RIv+lHDb6rzivvE3WatoaCZdVeg3HZLjIJRtVE=
X-Google-Smtp-Source: AGHT+IEPlAu7+t1OD9xkZBZB+NNWj0yEEWFX5JqjgVG0e9+KB+gZngiGtuqgNS6nmYBsvDyIL2hvxA==
X-Received: by 2002:a05:6512:12d2:b0:52c:82fa:ef7b with SMTP id 2adb3069b0e04-530bb3a351cmr4927864e87.44.1722750034659;
        Sat, 03 Aug 2024 22:40:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9bc3bd7sm292248466b.34.2024.08.03.22.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Aug 2024 22:40:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 04 Aug 2024 08:40:14 +0300
Subject: [PATCH 10/11] arm64: dts: qcom: sm8350: add refgen regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240804-sm8350-fixes-v1-10-1149dd8399fe@linaro.org>
References: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
In-Reply-To: <20240804-sm8350-fixes-v1-0-1149dd8399fe@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>, 
 Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Georgi Djakov <djakov@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mike Tipton <quic_mdtipton@quicinc.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1354;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=jVYTvN/M5oXQ0cuOojPrVIEl/Z9fBYssaRlhkXEzBxU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9p6EfvbJs11IWt2KySeq1a453nXk+N4QleS7+4FFfmh7
 112W23pZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBElrex/xVnkppt/SZk00ar
 XNlFkenx77pbV31njlzh7OjUJ13Q3GwY/XSPo82lVULHrvZ8NNqZZXh065xDLesqVII2VKSdfu5
 arcjOJneoNEL89RtDbb93903q20stEmVC56iv+z2dj+uNkeC+pNtXjKQEVJ1kNJnPrGRb3W5yWf
 Zr/64NMvznzzsmW13fOy0oYLPYJnXLbU8vrz/fuzus9mnQo/81uaYXfPXCum6/4Kj2rl0akxile
 +xCyJ35Armi1uZaiWuYnGXK3Z8vmv9jynIj7w61x9PYvLelyTwOUm46fsu7QM21R1ejaGNWTbj2
 tybFiW83CnZLLDnNoR7vs6dfiGON4BpN1qgvW++tfMsMAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On SM8350 platform the DSI internally is using the refgen regulator. Add
corresponding device node and link it as a supply to the DSI node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 27f36e6366df..37a2aba0d4ca 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2251,6 +2251,12 @@ usb_2_hsphy: phy@88e4000 {
 			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
 		};
 
+		refgen: regulator@88e7000 {
+			compatible = "qcom,sm8350-refgen-regulator",
+				     "qcom,sm8250-refgen-regulator";
+			reg = <0x0 0x088e7000 0x0 0x84>;
+		};
+
 		usb_1_qmpphy: phy@88e8000 {
 			compatible = "qcom,sm8350-qmp-usb3-dp-phy";
 			reg = <0 0x088e8000 0 0x3000>;
@@ -2710,6 +2716,7 @@ mdss_dsi0: dsi@ae94000 {
 
 				operating-points-v2 = <&dsi0_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				refgen-supply = <&refgen>;
 
 				phys = <&mdss_dsi0_phy>;
 
@@ -2808,6 +2815,7 @@ mdss_dsi1: dsi@ae96000 {
 
 				operating-points-v2 = <&dsi1_opp_table>;
 				power-domains = <&rpmhpd RPMHPD_MMCX>;
+				refgen-supply = <&refgen>;
 
 				phys = <&mdss_dsi1_phy>;
 

-- 
2.39.2


