Return-Path: <linux-arm-msm+bounces-33363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A9F992C81
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:03:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72C191F23A91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89091CC159;
	Mon,  7 Oct 2024 13:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+gCwTPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3FC18BC14;
	Mon,  7 Oct 2024 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728306166; cv=none; b=iGrG4DBk7UMcav5I3i1g0fujultDWFe4jBn92znJkS5iL0EPuaCPDOKFlt+7P1z/fRMeW6CYq+y3o2ZieJsT5sUEg9Xkn7mxhbrADlBwTzczJjqOANNk6R8pYdBtDDKc8dqVX6y8pDCf1a189A8b4MqJTGLTR5zCixV/gW3oUHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728306166; c=relaxed/simple;
	bh=XRKirzTFIMSNivmZVp/8Jy1ydUCi/RswBiDISnxwc/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfI1/xOUG5wy3ODDZQ0rdFxBIHDST9LmO11I6eGpKY6PJh2dwXHfIOrVXY4md38+QgykxRsKtMNMV5e6HXvfLxBiwgAo8/UsGYqyyHNyBjahSsy4laumhMijVChgKrPiVVeW3KPap9NNDjPbrInF70Ihq+cDWteMvh1bjHJ1Ewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+gCwTPe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20b86298710so36347865ad.1;
        Mon, 07 Oct 2024 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728306164; x=1728910964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rqykl1jSbR3Xf0wddDtKRGArfsd/LgQPVty+FehECcE=;
        b=g+gCwTPewa6G2h4g10u8ojAanT70ML0MvZd/K/XMH4spbVtehXo5B1ayMUis8FvPk+
         ffqlON8Gl4NV0IjfO/4G8oip6R5b0JXtXHo9et9zn9GdK1sBAcfRktb/xNn6wSx55O/i
         Jc6ThKpUKPe+kO7brijSqNOGnjvE//vpXg5OvKZPTaHbj/GJ5mdmgPNVvyyR9yuc0bIq
         GTrMPrLoz8fDlDdbuUs9e6rV7MQIBrggikUqccsLCxrOW6IX5cmrVCDuz3S7DGpFEwOM
         0IP/oVLAUGgiuufoJjQQHCoQMWZEARDoLHBGc3WcSW95UU36WUuHWNGZ1ObIPPFgNcZe
         hGIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728306164; x=1728910964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rqykl1jSbR3Xf0wddDtKRGArfsd/LgQPVty+FehECcE=;
        b=W0oxLojkBps36MffQljqQN4EB56OYXkqO+o2Nj8n5Ll4+nbUUEco9/Q6/hZgPtiPmt
         HrHKqhsIN+C0UQ2Y2GkwNeb9SK4kfotLpdlh/KaMDjT097FFW3zBLElvoWRENFq4QkrC
         7mvNKMDycRoY00L/sdu6QaA8A6qoo9OzZzWVVQ25WLEE+01szA5aw3qgQxQ5OIAiaqUa
         +xmC4qy13bjFlk8eraas/rrcR5dW9uHmrM9CPBhkupXeM8PZu14d+OJBb6Sq7SPBmJwk
         42R8v70BrAUgpg8vZzuUjjbUMkdfn8bVzun5WaZMMTpVkzZK7x983IAs2uWdj72k3DjB
         IaKg==
X-Forwarded-Encrypted: i=1; AJvYcCVjyl+q0rNTiL27Io1RGM+HR+GDR2emBPrdQUoVAWPv38Jn4KFe9h+zk0tvUzRJaQj8+hABSlpDaTov3iQd@vger.kernel.org, AJvYcCVumAJ/Q3ByoIpmtgj0LnUUJVspYXkVu9wve5TZIiYjy+Ykn9YizT0KEqnJs303ii6yHXmhTtTiVTiq@vger.kernel.org
X-Gm-Message-State: AOJu0YyMbRLNSJ35aWN+L8Ipt5a/V1LOTYxdBpD+nhApNQLNglSzE0iQ
	1X2RdHEBrjB9HjJuUiUjlXAGXpePL5Dv9vJvt2KQjjsSS04BXw8x
X-Google-Smtp-Source: AGHT+IHgj18A/vjl7cwbS7J5GjAsyapY1A8uAmSx9GKN/DSCI14RjjrVWvOelKONI7gJCiAOxdqTIQ==
X-Received: by 2002:a17:903:41c2:b0:20b:c1e4:2d5d with SMTP id d9443c01a7336-20bfe494d53mr158699775ad.34.1728306163666;
        Mon, 07 Oct 2024 06:02:43 -0700 (PDT)
Received: from localhost.localdomain ([103.149.249.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20b128847sm5306654a91.49.2024.10.07.06.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:02:43 -0700 (PDT)
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
	Jianhua Lu <lujianhua000@gmail.com>
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
Date: Mon,  7 Oct 2024 21:02:50 +0800
Message-ID: <20241007130251.125022-2-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20241007130251.125022-1-lujianhua000@gmail.com>
References: <20241007130251.125022-1-lujianhua000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add wifi node and this wifi module is connected to pice port.
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
changes in v2:
1. add ath11k-calibration-variant property.

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
2.46.0


