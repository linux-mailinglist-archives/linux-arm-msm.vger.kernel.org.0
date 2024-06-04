Return-Path: <linux-arm-msm+bounces-21573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC92A8FAFB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 12:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 728121F22F69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 10:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB0C1448EE;
	Tue,  4 Jun 2024 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qll63JQM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD1E144D1C
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jun 2024 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717496105; cv=none; b=UbCfVvb0afdSp8YMU50N3vknc+VyvXQ0W61d8flktxxrzmAQ8YrsEjbJcvGR4nGM6QfyO191l1AwTyenKa2xHT13urSeI1EJZXSbS3Tc6PcfOz/7834eE5iy0rH5bJg7sHUs7UWi00KSF3mJymDUJzP+pI7ZxnjvnLsI0zANvZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717496105; c=relaxed/simple;
	bh=Kdcf4gyifMvsfIuC5jmydzekNdCdDS2WOulnau3ZpVE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mw9bmgJL83ndrSETmxYJu72pNqOmj1esE/wPAjgVv8zTNjtjy+nPtcykoj9d7q56bBmUqgmiDUIXaVSiPtRo9OtMJ93CwWbnJ7Co/YtxM3ELAOrImcENy8EaWXzuwSD9IN1/woAzfjFxFT/Of5qzTV75eOgI/sU9dvdmFl9Ph/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qll63JQM; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e724bc46c4so60770061fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jun 2024 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717496101; x=1718100901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j1FiKRjpwxHYIU9bA81jIkxWG1M5TraYGBQQXJ18994=;
        b=Qll63JQMrbnkAZSyxy4Ek00jhjwNQr41IPkTpnsMrqJocxCm0XYkl/1/hwSqHTiHEh
         p8KTmBl1uOm0N4NCPVYEfUZBeS6ctv3Q/Ebl6dhlAuGGvcL8dCYaa5kqdsk1PmshsTCn
         FyvHOxfzPJ0MrMVnKqMsDS0dC4NF+SOQrvum4ELLh/z1cCYZ3BQSpfdVa1uqNb1vuvZl
         htibsb7fOu+pgnqTtLpBA8+6r2QsmDvBGq8BAPXOg6AfAGzaj9/8B2DT0MNwvJOL9vQJ
         7njgsWaHSagiKXquoG/kXsqAvrh/YlPMuB/V7FDAG47Fp1IIlvaMHCRbv314xdD6quQr
         JcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717496101; x=1718100901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j1FiKRjpwxHYIU9bA81jIkxWG1M5TraYGBQQXJ18994=;
        b=qYQlXRo+zMaHA4LwPCM2BW1mS5kCbpc2gv99WKQ1y79sjQ1JAk2cf8cHJTY1RNiTuU
         h4/q5tbTH1Oqhz6quZrCmQFnGOYiEYyMwnszWu2l4KKmwVudSGhHnQ/hraXID5Czh7KJ
         s2Hvn3Sb6+Yr62pLA3yujdrVKOi3tVatCl/e4qIjzesO+f4FnjTSv5rVDpA8q1EBKKd+
         8IxppWFHfbk92blnLi4ZXevwI9XlZ4/+3cfteclGAm8ess+S1R5r5CaJwTPu2zxwy4VB
         QCHlAkvfWMNG9KGHBCY4uKWAERb5xgf1XbZZSHw9Od3ZVeP9TciJS+gHY+LYvGGArXlg
         wwsg==
X-Forwarded-Encrypted: i=1; AJvYcCVj5MQFIThOU7mr+vRakdilX6liFSGsedGYm1gF7GDLSBeEqB0fT2nMDrX1PxXuwscxeRvlOP0q41v6gdjpx1HO8o529xhhEuhL2L97jg==
X-Gm-Message-State: AOJu0YwSO0ONK1IeheiqERPz1UtCIaJGpNEdsf529WVFIOXoJ+Fshh0/
	Y6UVpfzsmCjKF0sRbElUkHO9JMGlTW5EcJyQ7biv0Pt68pkxdi6Tat44d8N63yV+oNZJ1GMUgjE
	u
X-Google-Smtp-Source: AGHT+IHqunSpSEno7XIpTMSA1ZqbhFUvvCLc6ZuqU+J8t9dY5ZulvB+57VicGIOgT1SORhXY0R0a8w==
X-Received: by 2002:a05:651c:d:b0:2ea:81cc:b146 with SMTP id 38308e7fff4ca-2ea9512b1a0mr74966371fa.18.1717496101503;
        Tue, 04 Jun 2024 03:15:01 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91cf0bcdsm14715451fa.120.2024.06.04.03.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 03:15:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 04 Jun 2024 13:14:59 +0300
Subject: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: switch I2C2 to i2c-gpio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240604-rb12-i2c2g-pio-v1-2-f323907179d9@linaro.org>
References: <20240604-rb12-i2c2g-pio-v1-0-f323907179d9@linaro.org>
In-Reply-To: <20240604-rb12-i2c2g-pio-v1-0-f323907179d9@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Kdcf4gyifMvsfIuC5jmydzekNdCdDS2WOulnau3ZpVE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmXukiGa2sOetdv23AiU1xg+flJKQkPu/8mVACg
 aEuNfzvQsSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZl7pIgAKCRCLPIo+Aiko
 1V0kB/4zi4Phlou1SrTZg8LRE6lrnUqLb8X5a1e/4rXTNWVNqN0zxEMWco5Slv+rZ2R2uOQAU5A
 xuW4zvkMAbHqi3W9924qQa3wbD41H/yZaSHAAYkDH46HVMISE65ngNFLCxMlrFZaeq2GY73blk7
 xkHaJK2dyFbj1x2eF7dNCEM5E3Zk3FQ8IJQXfsXORVp2hFQNEcEPce3Y8mv35040kujixVkzFL9
 VodjV+/aGp4oGVk11S9uRoUnjMOYfVl9WbLr+SdxswZ29Hap6hKERn4TFIdWCaia2pPC/vgQwxP
 r3Pg2tsr3L9lJcYDBD/84gC5dA0ymRS3CYGWdg2ma/x335oO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the Qualcomm RB2 platform the I2C bus connected to the LT9611UXC
bridge under some circumstances can go into a state when all transfers
timeout. This causes both issues with fetching of EDID and with
updating of the bridge's firmware. While we are debugging the issue,
switch corresponding I2C bus to use i2c-gpio driver. While using
i2c-gpio no communication issues are observed.

This patch is asusmed to be a temporary fix, so it is implemented in a
non-intrusive manner to simply reverting it later.

Fixes: f7b01e07e89c ("arm64: dts: qcom: qrb4210-rb2: Enable display out")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
index 2c39bb1b97db..5bfbd81db032 100644
--- a/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
+++ b/arch/arm64/boot/dts/qcom/qrb4210-rb2.dts
@@ -60,6 +60,17 @@ hdmi_con: endpoint {
 		};
 	};
 
+	i2c2_gpio: i2c2-gpio {
+		compatible = "i2c-gpio";
+
+		sda-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&tlmm 7 GPIO_ACTIVE_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "disabled";
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -190,7 +201,7 @@ zap-shader {
 	};
 };
 
-&i2c2 {
+&i2c2_gpio {
 	clock-frequency = <400000>;
 	status = "okay";
 

-- 
2.39.2


