Return-Path: <linux-arm-msm+bounces-39765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFBA9DF5E3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 14:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D5BB281B07
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Dec 2024 13:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADAA11D2B23;
	Sun,  1 Dec 2024 13:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSS+aunV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278AE1CB32A;
	Sun,  1 Dec 2024 13:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733061428; cv=none; b=V3PayTrdmce2bbXoRpPwzbZAyzNwJtkzULwpI57fGgBHMACtwcWucnO4x3AlTkeSYa92PEcZQPzoqtKyoE7PV7RzrvE+ggpDlxEvulPo9psYErW7Fz2CKh+ifAg4RTBd7pJT1WMv5O/nvmwd4DYLGtQ9tCs8LiSDz07udr4MQHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733061428; c=relaxed/simple;
	bh=VMFEqZVRlb6cshNCwjbde3cKjBI4tuJCd2Ku+pLNrmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eh1hHzbptbjxbMy6EHlTJIzSHigGPqwRS+DnBVp9afvmCpS+9pYvhA5k1lyE8K4/HpKoR2RF+L/uoBYnsN9WKpQt0QNjfB5+wRjf8Vk5dnHo8BhcI+ge1Krr9ynHZ+vZf5V46uPRsS7PN3sHb+WMRTb1s/vuSxZZwwmokyhDA6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSS+aunV; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so2636349a12.3;
        Sun, 01 Dec 2024 05:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733061426; x=1733666226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8BEB2d9VDDivv3uuqrErXlNfZp57BYmvdkGk2vj1t0=;
        b=dSS+aunVYZgXwtM/2g9LyWuTk78iHoZf+p9IgMQqXFDXD0ulimw4vJZIe1cqxrdnUc
         DO+0hCUmkcO6mam0+mMM56bPR7yq/EB9/jxNnvwx8U+d3/ikT9/KnFv/NjsSeaNCirPc
         4hEPguFV8sh85gm9ZvZGDPn81lFyrPLhHSBTPy6gJ0VBvMBPJpu96kyNXC2pum++dTm3
         7v+EgcAWR8Yzwap+VDdNdwJaunWifn4y8jEu6YdbPBhFHeXeUdTgtdF2agEq2qrJ3RFJ
         oRnmeJUaHFD8Qp0TjwJ1BAakXstSalW+RYchiibb95kOJuxAK/jm+DUPyZjM4EzZjeB7
         3bBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733061426; x=1733666226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z8BEB2d9VDDivv3uuqrErXlNfZp57BYmvdkGk2vj1t0=;
        b=Awk7TVmg8piH9K50sB1S6tGG/R1UDdz/aoEph9NmaEGERbmttk2pR157grbSI03bxo
         ar7sxIPs5f2Vn8bBI2q/c4jbBUvilUPMWptk2PBERKW5m7vEbX1ACYchcleiHK0k5XAV
         mLdqkrgY/5BT4Zkp7miTyRSS9IzVjlvusyX6hQxy8yRN1kb8gq99xyhW81TRbWVKt4YC
         E/D52PDhAsi/dJCwr56npsE6SbN7RlfMBohhVHAy/IbX09hqiYAhxAazMGJsicIWTIFm
         RB/zN+hj/G26N2+BKI0yi9Y5z7Z6NoZFAiWQ2oIwD6Tf0ZXovcu1ON2ZgkSNRnKRM3lD
         QbPA==
X-Forwarded-Encrypted: i=1; AJvYcCVB+DoXYAPu4p0tqVrozfC5cahh6ZPj0S9REAI7NE4ZMQJTGoO79LD8/e223OBJPj3h3buq+LECsYNU@vger.kernel.org, AJvYcCVfa9Oig+UezGJ5pLQJqw6o0hMg1q8/nzcxSOOfK8t1H9mgjVzJcxeYGvMDd2gGnD0J8M7u/++DJyXTLLu3@vger.kernel.org
X-Gm-Message-State: AOJu0YxfubCjxMlsQE0gwq1LKnyPHaDSaWxj/0xmZVGzSS5tNCXo7uaI
	mNA/WD9rLtzwryi2aUUeiIPlTIscnyxcrdTvWuUl8u6sOdXNornX
X-Gm-Gg: ASbGncsBcvuWuxLMJM9aL6Rkjdk7oP2JU6PGWaVNkAU2DEUxkHB04Fx+5OtDD/6j3v2
	x4hLtkP2T2FbnBSxNV0WErt3lG8357gE0JxbLwFaT/Za2yq9LAPPpmIyYnnZihnqvhmghwvn3X1
	qdEYOQm95ZW9uEvfzKF0zkOo5YJIUtR4Yjzisw3gfxTV1zErleOUI+A5jwjAY9Mv8fctl0VID1x
	0F2uCpeRybnBvxWZ5CsJ/dtrunXN03yLo/YxImJHgfz3hfCuoQQFlaQeiqM6VNy6Rj9
X-Google-Smtp-Source: AGHT+IFJjj9F4dXNsBy6kw3+QYCWUsKYkEUj+Q4WLS4WR0HTA1qQwKaj+2crHZAGT7A5uyFQQuWvMg==
X-Received: by 2002:a05:6a21:7e02:b0:1e1:f5a:c027 with SMTP id adf61e73a8af0-1e10f5adc02mr16461640637.43.1733061426284;
        Sun, 01 Dec 2024 05:57:06 -0800 (PST)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c30e2d8sm5260617a12.38.2024.12.01.05.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 05:57:05 -0800 (PST)
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
Subject: [PATCH v4 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Date: Sun,  1 Dec 2024 21:57:15 +0800
Message-ID: <20241201135716.141691-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241201135716.141691-1-lujianhua000@gmail.com>
References: <20241201135716.141691-1-lujianhua000@gmail.com>
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
changes in v4:
1. pick up Dmitry Baryshkov's Reviewed-by

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
2.47.0


