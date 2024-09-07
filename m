Return-Path: <linux-arm-msm+bounces-31214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EA19703C4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 20:49:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 424F91C20D20
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 18:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1430316B3BC;
	Sat,  7 Sep 2024 18:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F2OW4QDQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3832166F39
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Sep 2024 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725734908; cv=none; b=LZc0eBfOHxo67yNHiK4qB4hgn4jI1InUONbpU2zzJvt48iMSl++rBKVeOGlt1uJxpHHzaZEMZ2DoD5zSgWy+efZMTOdfCTZXh+XuB8y4ud/ZBcVJswvcz7zYIYdQGgLLKjQjcfhM5vU9XjzLXjUl0d6B/b5sl5i7AXryjh1icsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725734908; c=relaxed/simple;
	bh=m8Zi+I7r4mzRkaQx4Q0uAvjUN8Er2tlAYnR9jC1UHiY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+U955JoGmTvyFu/XU+pJah3DM/EcyHbcrQZbx9drp/l3fTE7yeYeUlya212pDyF+CWxB37t3UpnT5U9P6XpBj2Ez191IqHJeRKL8NY4Uu2+LFzxNmpig0JahLz8clyXoBLaPM4FRJqSFbkFMqMNqsM1ra1/4HT+pWmG20eMJlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F2OW4QDQ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f75e5f3debso4053861fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Sep 2024 11:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725734904; x=1726339704; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hL1dl2amOVSJoO70LsDuP43oRXVn+WYe2abWDJx9WBc=;
        b=F2OW4QDQQHDhtnUmOQolvCbBFVIpg+FVfuWCqYm0wmtSJvSEBPzc1JAPSewtb2UMc/
         JnxchQrEhnGFUz/uzMwoyeQAadTIov45F77s2ghgV4Al1RkMlYg2bEcnJMRfGMZLcqct
         teJ7HYyzwe9tLvL4/HHWBQ66GXfoxsPz34K+yGqFwFTyZsPcqlNS3LIywYhYT9hW1owj
         i3ZRCeBdEmEVvC1DZZIUX2VMMe7IsiqaDu3rF+rpFtl1vufLTiYiA+cKoHTGSoDJORfz
         g/DehRAjU02F+xgaWNLJhTQjElbFu5U6yuNWiCYElosVhfSoE1+Larun77dtwp3c1aNb
         uzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725734904; x=1726339704;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hL1dl2amOVSJoO70LsDuP43oRXVn+WYe2abWDJx9WBc=;
        b=u2vHCmMPjMzdK4Ll4dfISrPm2U68MCPQN/71SS0I1slu1IGvej2fvp3UTFpGoAobXZ
         3OpLM6nHfpPnEMbDCcid0s5wb+IHeIoJjmRsZEVvV92ti9PT6reFgkk2/6zzrNXy/ze9
         tLgmk/qTXAF/ljS75WGBi/LZJ/7gKZv6yy81p+1V2twlwvtTZ24ZERKJYl6CSjPytMYN
         jlB+qPRmNuUAzsWxL92neZ1egmKkfsDo2XZVdv87n0op5Hx2IKzSfopd/9QbtCoH88u2
         WIZpo1A9CoxoBxQgROaKCHuVrHJan8zCSucsFeowGaKcntZMzKSBsRhh7LsHhj54WE1+
         PB6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXzWdbu6y91waoPk8IDswDiVa9Vw03nU5C209XAH9xhCDkuZTvEHHdCiyAAY7YCTZr4fWnsZjGmCXAMWA9i@vger.kernel.org
X-Gm-Message-State: AOJu0YwoGM0MAU2jeYqZ4XWO+bou2DB2s8WBNX0IZmE5JR5m9ssO9Sw7
	VBWg+B9TgPV5Sa5lt+5/4Jl16/XC1/iK6nfFfVDQu2DXyo45RN3vLgS/yUnirhg=
X-Google-Smtp-Source: AGHT+IG58gmWVk9fhlraqb5aPvd2mdHJvcE/HBMUnVruL6uhb+sYPDa968ikGXxOgKNrOey3AJXC2A==
X-Received: by 2002:a2e:be9e:0:b0:2f7:5914:c22e with SMTP id 38308e7fff4ca-2f75b87ec72mr17930011fa.6.1725734903789;
        Sat, 07 Sep 2024 11:48:23 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c0b1af3sm2271861fa.129.2024.09.07.11.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 11:48:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 07 Sep 2024 21:48:17 +0300
Subject: [PATCH 6/7] arm64: dts: qcom: sdm630: add WiFI device node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-sdm660-wifi-v1-6-e316055142f8@linaro.org>
References: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
In-Reply-To: <20240907-sdm660-wifi-v1-0-e316055142f8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=m8Zi+I7r4mzRkaQx4Q0uAvjUN8Er2tlAYnR9jC1UHiY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3J/ySmr6XcpVpgukwQyVFouN74yoqzLc+oHg4
 jmtygX/pVqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtyf8gAKCRCLPIo+Aiko
 1dPwCACKHKRnAYP+o0a7nDiomZPJ1StU5CG1h4B+3pdo2s5q7n4Cbpk91b5RsdifWtVHW4QQO4K
 vnX2NV+OIvBQhHNbNCSANijMPk8Hf4DbIinGV1I9G1ShIdGjvv7rfq9Su2OPFFg1WOussGxre+E
 6hGbLT2YrlZKtO5HKTYhEC7IrlftsXKHlCPxZeld61nTxWJZNvzJoifbqZMCT3UCIy8SWngE7j2
 YOKLzOU67j4Li2c1yO/AaIGhjx1DYnn9rOP6hAe+cmgxifCW0XjMTv4uEqV06Ulh8b2qFaSWHZh
 QCeOWE4asT4+t9tcQaVmspLRVXYSq5CtCSAJNYxAMMUcHmts
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add device node for the WiFi device being a part of the integrated
SDM660 / SDM630 platforms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index dc8bc63bdc70..4536fa45869a 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -2412,6 +2412,33 @@ intc: interrupt-controller@17a00000 {
 			redistributor-stride = <0x0 0x20000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		wifi: wifi@18800000 {
+			compatible = "qcom,wcn3990-wifi";
+			reg = <0x18800000 0x800000>;
+			reg-names = "membase";
+			memory-region = <&wlan_msa_mem>;
+			clocks = <&rpmcc RPM_SMD_RF_CLK1_PIN>;
+			clock-names = "cxo_ref_clk_pin";
+			interrupts =
+				<GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>;
+			iommus = <&anoc2_smmu 0x1a00>,
+				 <&anoc2_smmu 0x1a01>;
+			qcom,snoc-host-cap-8bit-quirk;
+			qcom,no-msa-ready-indicator;
+			status = "disabled";
+		};
 	};
 
 	sound: sound {

-- 
2.39.2


