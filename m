Return-Path: <linux-arm-msm+bounces-33797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2FB997F4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 10:19:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB144B2502D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 08:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CEAB1E3DF5;
	Thu, 10 Oct 2024 07:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGN1wog/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B421E3DE6;
	Thu, 10 Oct 2024 07:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728544956; cv=none; b=UrCLdRZN8/oybPxHA6nWUrlrSsgcDzj8Rzd+ig64RkAi16gaFx7b5F52QqA3fzuj6zAPQSY4lePt7J2jg5s4A4DVs3SgvMqNJWH+d6eTKugbZpjBMcAHjfHifhNihMNUsoNT9fDPHYTjQwy1tPfzVWaBqqvDp0snTj2WPMOlXWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728544956; c=relaxed/simple;
	bh=jpNJuBZVqp/0mSeHxtnAODo0kh5Pk622q793EOojwSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZX0tM9tFYAnX45DKgNBlE1VnAguUUxF43a2vgha3y0Mx2nSuzDn3tVlIUEVkBTzUgyRvx9SwkQQehUkbT8Wv2oi7jCOcE4r955quLA9tBFkdu0Frxxig3e89YRsw3eaVE17mnozBc8YnakG5LfikmGND3e4j+BvpNYom0o91+D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGN1wog/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20c693b68f5so5703525ad.1;
        Thu, 10 Oct 2024 00:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728544954; x=1729149754; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKw/JoI0r8yQE1Dp1vopxnWx9JbnMVopH/+pwaMqF7g=;
        b=mGN1wog/+K2AhMTk7YCu7oYiz68A0xqXFgBrWZvn/LdepLy3T4gy/YIiDeHpjVhbOz
         APrOtk0XkF0yktK9m64kPvN+O8Fy2a0ThoPppsdBTtUDThR8u3xfb+lD6ATm6/O3yYcC
         86eIY135KDKkT/+AEvzquFrM3j4tSDVRywS4kgvnDlS6d5RRV+2kwgNg0DnCQXA327JA
         DjpAQuGOifv8V/sMSgUy6AjTbt8FFdKGvlMbvaXKkb9OyVZvzE2aA1gs6p6bsI8Ns0Jw
         7TOAwXketO3cDU76L0vkZkMrIjLZYca3Gel1F8mFi2x4Lybg0xC1mcTz6qTn3U2KWdHL
         y1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728544954; x=1729149754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKw/JoI0r8yQE1Dp1vopxnWx9JbnMVopH/+pwaMqF7g=;
        b=RZwr3Bb06CE4VEv6aQFB/RSuMBQn87GPcx46U1zak+lV+YEInF8mLP1Di6ZoUfHfyf
         Y1ZmjNvc0xliXSQUEhGWDTF6Ithsmsl3rlmAgLQcOEgepdT74DRFDW2lFfbe7tA2wQgS
         AKDR6phJWI+Rtl9JjJ4pnyxqdwanO8kDWF9eEyH80INKKYxxiVbU13ds9E9p9YzbIPah
         j9shKPvJYxPxtbjLRnQUZvSBiYUMD1abPLBBFbtYVaeS+4SOIFTYOoeyL52IGof6ZsTH
         ocbq6jfX0/Qp3pEXUeVeXapcP+/sGmUZP799IroDuevBYowaWVFz2aauuzaj9iQDy//r
         Z+hA==
X-Forwarded-Encrypted: i=1; AJvYcCW3d0soayJ9HE4Ywx6v72xXc6F2O3yeHRZlwpO2MjfEwetBtm6r+3wIkjH1246fF942ZkIETWjZwFg7@vger.kernel.org, AJvYcCWRzKZKTr+3MjQobwSbzxC5gHiVOccClLy2CtWbTI4AqD5G/Kl0veut5tuyHZIQYlkkUFViiQJ6Ssl2dX6S@vger.kernel.org
X-Gm-Message-State: AOJu0YzgafFdpjawbqTC/HLXczyu96ZWY+2e+4SQcrzhozj8bvxeVLHQ
	dhxdemOmvOU966QN2JiiJX2z2FrOo4fIEwOpYl2RGUMpZktUkpWXrbY6tw==
X-Google-Smtp-Source: AGHT+IFEq4jKqyPTtrzF+iLBOHfODKPUhCo/6KznjZq89UYKbOSWLmD2ggVpEKQQSFSYTEieqOZZ6A==
X-Received: by 2002:a17:902:f687:b0:20b:a9b2:b560 with SMTP id d9443c01a7336-20c636d6b88mr60719135ad.6.1728544954238;
        Thu, 10 Oct 2024 00:22:34 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c21616csm4413865ad.224.2024.10.10.00.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 00:22:33 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ath11k@lists.infradead.org,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Date: Thu, 10 Oct 2024 15:22:42 +0800
Message-ID: <20241010072243.10227-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241010072243.10227-1-lujianhua000@gmail.com>
References: <20241010072243.10227-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add wifi node and this wifi module is connected to PCIe port.
The following is qca6390 probe message:
  ath11k_pci 0000:01:00.0: Adding to iommu group 12
  ath11k_pci 0000:01:00.0: BAR 0 [mem 0x60400000-0x604fffff 64bit]: assigned
  ath11k_pci 0000:01:00.0: enabling device (0000 -> 0002)
  ath11k_pci 0000:01:00.0: MSI vectors: 32
  ath11k_pci 0000:01:00.0: qca6390 hw2.0
  ath11k_pci 0000:01:00.0: chip_id 0x0 chip_family 0xb board_id 0xff soc_id 0xffffffff
  ath11k_pci 0000:01:00.0: fw_version 0x10121492 fw_build_timestamp 2021-11-04 11:23 fw_build_id

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
changes in v3:
1. fix commit message typo (pice -> PCIe).

changes in v2:
1. add qcom,ath11k-calibration-variant property.

 .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
index ebea283f56ea..7a55e271c3ac 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
@@ -680,6 +680,25 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+
+		qcom,ath11k-calibration-variant = "Xiaomi_Pad_5Pro";
+	};
+};
+
 &pm8150_gpios {
 	vol_up_n: vol-up-n-state {
 		pins = "gpio6";
-- 
2.46.1


