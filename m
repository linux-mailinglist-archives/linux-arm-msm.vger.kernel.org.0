Return-Path: <linux-arm-msm+bounces-31209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 180DF9703B6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 20:48:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71A90B23126
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 18:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192B7166F03;
	Sat,  7 Sep 2024 18:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Hl7C49sT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4CE16191B
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Sep 2024 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725734905; cv=none; b=DtaRiw90QpRs5Xf6ISrTvvZR9I2ivUWsFsIthXPWVzVaObqWaP8oWeZ9EngzP53dCEalOPRQW2ZDdAFIeJpnFQX9TsGZ/infHv1rWqhGRd4VjlCBNPZv5JbJpp3gnOk/M+3wbt3xPjFaqFATy9gwwlZu80iszJFoXO/zipF3HoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725734905; c=relaxed/simple;
	bh=G8XjAsr7l2bULeKDkj37t5ZchnBw4CW6FlfjTvSZkX0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gDNcIVpY6S9Q5RfT3Ls7kIdLKpM7FGTqnDMo+WJmjtxKQ3oxi3rjAbHWQDGu9kPaKGgnc7R4j+GYMZkAaoCeP9yw2Q+H7BK/ZtrJGTOggG9/FbiI4R+fIr8LDbZ0tkElcY1qkBa9B8P0fnbPi1T82no+vnIkmS6gnb5WHdAhyS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Hl7C49sT; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f502086419so38319091fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Sep 2024 11:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725734901; x=1726339701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jpkFdCDWxG+jHgwK52QzUzAkGgglAsm4AAFdePfcRFY=;
        b=Hl7C49sTshX8Iex8j0mXUJl0p1u+r7/xCnj8t/QjngPOo3my6XS27xxcJVzpuIRC8l
         X4kjJNs4Tg5vZ2wYy0hmSOWa0FBeK8NdT5vpV73VBFV+Iym5C81gIoCzlXd0m3pbX7kZ
         g4Cl5YIldaQx+RR/o10ma27uwmZGJPsb1uWBc6uj/JUb+iCsJH0mSSHTAk0++9UKukC+
         7hTFzSGaLiECC2M4iyU3kxrQpvExIz7RbmMFWqwEIpcGh7xpnnoR0PtiOGjofaZKLqsT
         HtH8ZqyQqndccbFjTyyghNVTkKuD58GGetH+sLQvfRthSsk6+UjYGfTsmfCXAmfUzO9r
         8y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725734901; x=1726339701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpkFdCDWxG+jHgwK52QzUzAkGgglAsm4AAFdePfcRFY=;
        b=jAUFuKE4eJ8//lYRod1y3knqAa7KGHpep59DvyX3jnLFwAPoIE18wx5divuzTsntg+
         kw7umt9FG+VSO52wMn2WM11iXrpmeBuVBxOWmyZldxVI/nz83zNXc0HXlmn7Lnit4d9q
         B9b4GhC7XhIO8+iSIr06NK5KWEikVlFTr1+kox4vFfFVeez2Qyqmqfpbx4PRRS/DjQ3Q
         ynX6q+n+u5qR0OS4kX1PABjuXR3lPPs0+8tttj6PRkw57YEO/GSsQerKCSkeg+zkoxoG
         VJocf2P8dnacB7JNOm6BCK/ZUYlDOUqFX0dKeNpamtv3sPQT1v9ki4VT8QpxSn0JEm9X
         UsBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/ywhMMRByohm/5gF9Bjr/eIg2kx1qP48RiprHnwCIt86ITvBEwoW4Q3wVwBl+RgrKNghu4E/AkJOG1ue4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2zk3/n/ucyQr+p7o/DWJUmPimpLUFVt02PdTHJAOBIwVvEBT8
	1HbMp2a+BQKK4Rv0VVg/7lensNBaSUY4HL4hlKdVU5skAPyzkMhd5ZxvhleR2TA=
X-Google-Smtp-Source: AGHT+IEGc+rw8n897S3k/I+r66uqWMoCaEiaxiGscVL7WMTLCAC9tURU0h8WtjoSPAnSuDv8f4FDdg==
X-Received: by 2002:a2e:6111:0:b0:2f3:e2fd:7dcd with SMTP id 38308e7fff4ca-2f751ea7abdmr36668801fa.6.1725734900596;
        Sat, 07 Sep 2024 11:48:20 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f75c0b1af3sm2271861fa.129.2024.09.07.11.48.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Sep 2024 11:48:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 07 Sep 2024 21:48:13 +0300
Subject: [PATCH 2/7] arm64: dts: qcom: sdm630: enable GPU SMMU and GPUCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240907-sdm660-wifi-v1-2-e316055142f8@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=G8XjAsr7l2bULeKDkj37t5ZchnBw4CW6FlfjTvSZkX0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm3J/xN40BsuEdXIGn7p9ScsoJtdiTQB8SViteB
 gBGFCIKcZuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtyf8QAKCRCLPIo+Aiko
 1ZcRB/9PjGkhtUodJVh3czV+ADqc3yYyhY69r+wl7qdHHU3JzuspOjFVoU7ZuoqO/THcsYrx6wh
 LmYqzCA+xmVgYwm4sp07bWG0O/4lMNAv/3BR6OdEHyfP82lLpx+ZRsb2ivv8ccP9rOMYaQWe1G3
 F7ay5oXlt3EUu5Nexny42eGZI8QY4Zq1ojF6hIcbwAZbrHXQcIwpkR9G78ACDBjodJIKCBrxWTR
 eDgg+hxpGLLGDqvotRO5ud5gXAlZiU0EstTkAygeVPGOOC2TqSTfXGMXNtcnVrSHx6ltk2oZmFq
 maTpaJaHMZmCeRXNHNAhZlTM9sgMK7AvwdhJx2gZlUV2akfY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as the arm-smmu-qcom driver gained workarounds for the Adreno SMMU,
it becomes possible to safely enable GPU on the devices. Enable GPU SMMU
and GPU clock controller. GPU should be enabled for target devices that
have ZAP shader blob.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index c8da5cb8d04e..40ad99d75738 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1186,8 +1186,6 @@ kgsl_smmu: iommu@5040000 {
 				<GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>;
-
-			status = "disabled";
 		};
 
 		gpucc: clock-controller@5065000 {
@@ -1203,7 +1201,6 @@ gpucc: clock-controller@5065000 {
 			clock-names = "xo",
 				      "gcc_gpu_gpll0_clk",
 				      "gcc_gpu_gpll0_div_clk";
-			status = "disabled";
 		};
 
 		lpass_smmu: iommu@5100000 {

-- 
2.39.2


