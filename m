Return-Path: <linux-arm-msm+bounces-46630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F80A247ED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 10:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12A013A8220
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 09:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5A5156885;
	Sat,  1 Feb 2025 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MI40yARE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F4F1552ED
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Feb 2025 09:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738401513; cv=none; b=VARHPvxDI0Ou1snpUdAhh0WEXvNHRCpTqfjHjoDDuTR10VR46c2stsJFcKUZARXekfk0+HS7LS4ItHuScPP228MWwEsvuFbnDo/roPsR5bjI5wHcoMRYc7EO0Q/biag2Rc+tUnns4fh4JjGP5nLOgbSjrTKA04Do0PB8ZkfzDaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738401513; c=relaxed/simple;
	bh=o+8DevsM1iaqcb/GhD2I1DkFB8Jlc7QezSs3Fq1Rsw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EB4SNpygsBsN3IPDFbbv/ywMU9kkH5G2L0E8F5jEJKZKNUf/a1fYs5ymRtNwGYU+PG/lZT/VhGMrfJOgp5nZwDZvQOx1BKov2DLvB+OOlS2R9FiF6fZySuFETW85Ov2+Kzfa/1So2onNFsyJtdafBlpxoGCaccwnu2L6fMBAzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MI40yARE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54025432becso2939138e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Feb 2025 01:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738401509; x=1739006309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+lgLGZWjFpK9B/4WeyffioCfDC0xJ+bQNU5Gxwj0GUw=;
        b=MI40yARECCOLXnqu9OVdXKHnDoA1JI1t1ZoZ9cCoyCOnwmje7DtbsxGKq099ZxHtmV
         ov+hw829L4aYNSu8vIx4/djIEGniT+f+YDDKsBaYy+qoxBpsdx52e3awGV4jnaeL90hJ
         fH0TD8TbOR0NcD6W1d8/IHXCssE8haoyxdMQsx05cv9kZmDO9rj388Xf0VLW+uaHRZFv
         krZXiOxvzoPvh4cvyBvntq+Pyf8OnqhpqkLCwsHFlGI+lIKgqvwAIDHSzh+fTAandIFU
         YULY9HNL4ifyzemfT4wimNa4R6kcWMaFdRtOEpRE4z3G7YJmuVj07pchreKPT/BfjGQ9
         EIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738401509; x=1739006309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+lgLGZWjFpK9B/4WeyffioCfDC0xJ+bQNU5Gxwj0GUw=;
        b=Yqs3ecNfkYjKsn/gT/sOIltE2i8FSBoeGVoJ6mstZ7Pe5RAuCT+uHBVmfbLWzRVGek
         zGbFmhM2aYVu1d7gPuQeQCPPoi39DEBcQKiHW9Gzu1sfY+ZujK1Lb6A6TdcoVS+TcQ8v
         mNHFcOj20/HzAYgjLslqc/Au205Dnqd6NQ8L1pAUg4WgtL0OFWLfsmbuaF4oW9N029rM
         4SET3JXtpisvK+D2pZSsY754bhvpY5OV1ZjMq1wGMkawHfkO13IzlMuU3aZk8q58c4Oq
         UdNXktzajRbYmk6PsdlSw6KXQ1HjfaSwAgEnLa5e/o2/JSKgw+WTS0sh42dsMv3rxK8e
         AkFw==
X-Forwarded-Encrypted: i=1; AJvYcCUNdIJ4qOAgoZ9eNeaBMY38qZBy7c9sh0IBKCnBXE1C787JvBGaXMF3xB3l9W/9OxgpMSQl5ArzE6p86POV@vger.kernel.org
X-Gm-Message-State: AOJu0Yydc7dWaC5dnk6jmSbaTQZ5D30htUd+mHf9drdLwEQNJ3RzMbdm
	uQdVglV31GvG//gC2Wz94VdNw2NSfeV8AQhzDx2K1bJwyWYNUcg3fr/dotgTvVcz/GjsWNXW9Dk
	vAhHFufXY
X-Gm-Gg: ASbGncvwjFea5BhBvvxDTqoPSxuYGaOLOmAvG/Ziip8tedZjUvhteCXzhJ80b32rpOR
	YkD5Laemi+VPVl0ULr+7pIT+pSmJroIePNXKwGv3aRYSCuKdXrqGmEotwx5FLyS4k/fUESq9dJ/
	q1LUqUlf+8o5eQFr8Wv0NOvm8L3yxY4ibJK5CVg8hktEWGLnIa4YDQrvPlNwkpnU5eODDOnkXvl
	b8xlLghxP4bNspxYJqq37A1AXAc/Gm57Q6P3wXw221VytHWdoh+xCPpGxeW2IshocxbgPW2HvlM
	Umw1cXWssUGAFt/RbxgmZZQ=
X-Google-Smtp-Source: AGHT+IGr4PwaiWR7G1QCP3Rr9SzVohcwWvRF8e/2VShv5xpdY9BeXClPPRYD1JGD0VZo1re6hr0Inw==
X-Received: by 2002:a05:6512:2254:b0:542:91a5:301b with SMTP id 2adb3069b0e04-543e4c310d1mr4040893e87.38.1738401509447;
        Sat, 01 Feb 2025 01:18:29 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebe0ff47sm711234e87.93.2025.02.01.01.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 01:18:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 01 Feb 2025 11:18:14 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: qcm2290: add UART3 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250201-rb1-bt-v1-3-ae896c4923d8@linaro.org>
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
In-Reply-To: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1329;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=o+8DevsM1iaqcb/GhD2I1DkFB8Jlc7QezSs3Fq1Rsw8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnnebbd7G2yReQbJB4c/wrZaIA6CoRAPgUuFieQ
 tWdrRc1SsGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ53m2wAKCRCLPIo+Aiko
 1c6yCACtxVgMqIZxd540jUuEN0xogW1bn7YdDq8a36W8k8iYMfglPHfCdbsbvR5ORyyxOtcOitH
 /UXevzq2g6CJEM0HUyhPMKDxwrnWBMxy+jxeuetcFlJFCwVHtsmHYVZkvAHjtldryICWi4cgl5v
 /NiNZxOxk4V8Eg/FiqN1YrDuIQPiFWC+3Ub3CODDTIoI84TufYsQhWbyj11yzzXYG4f9jM9kPMH
 Da86bu8uRQdRodDB9HgeiNRQJsbPs6GW4J1uXClgiaDOnDeuXrr4ABxH0kbXM1gA7WfCfxSqaGt
 8luBUZiaUUmNhGcHwFvURYJaCNP4tDv/LuwwqTNRDch/j/XY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On QCM2290-based devices the SE3 is used for the Bluetooth chips. Add
corresponding device node.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcm2290.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index f0746123e594d5ce5cc314c956eaca11556a9211..5f92eb16482a0ea5f8436cfa7e55849f171ebd24 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -1239,6 +1239,21 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 				status = "disabled";
 			};
 
+			uart3: serial@4a8c000 {
+				compatible = "qcom,geni-uart";
+				reg = <0x0 0x04a8c000 0x0 0x4000>;
+				interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
+				clock-names = "se";
+				interconnects = <&qup_virt MASTER_QUP_CORE_0 RPM_ALWAYS_TAG
+						 &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
+						<&bimc MASTER_APPSS_PROC RPM_ALWAYS_TAG
+						 &config_noc MASTER_APPSS_PROC RPM_ALWAYS_TAG>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+				status = "disabled";
+			};
+
 			i2c4: i2c@4a90000 {
 				compatible = "qcom,geni-i2c";
 				reg = <0x0 0x04a90000 0x0 0x4000>;

-- 
2.39.5


