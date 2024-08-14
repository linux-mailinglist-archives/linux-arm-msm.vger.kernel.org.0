Return-Path: <linux-arm-msm+bounces-28504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C557951C6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 16:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D1731C20E3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 14:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668351B29CB;
	Wed, 14 Aug 2024 14:00:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68931B1507;
	Wed, 14 Aug 2024 14:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644022; cv=none; b=N2tkXywI2HQFZdZa9cKFBub1OguWZ1+q2av/WzIOFlLOaNRK1Fuj7L9q1TcGS3EAE5xi+kRRNhmfMV/JMURJ2sFdoj9ujtnJE25vpcMQl3mqDCPV3B+wsw+fliT4y/Jw4PcmkvMW/f37LVoc+OndKmPLUY6SuhZ6U9+M+d/atz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644022; c=relaxed/simple;
	bh=RRdWvaaJjh2EukHMWmy8agmys/TF3UAfdsl3eILq5HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qwad2Wh4PE3q3s8Xce6XZ4Z8SXSuWT29q50tVVVVNJ+CwHG88U2xE1CLfg8RSObVtqYaJ8i/lBQufmaJ8HOaJW7UYjiy/WQ1Ff64Y3k1MZmYYsB7TXCzgc4DITEsycKtxsuESAlppBxFtOkYJIxzYC2qEVintGks6lYxvXSmTns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id DE9D42099D;
	Wed, 14 Aug 2024 16:00:09 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id CE1972098C;
	Wed, 14 Aug 2024 16:00:09 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Wed, 14 Aug 2024 15:59:56 +0200
Subject: [PATCH 2/2] iommu/arm-smmu-qcom: hide last context bank from linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-smmu-v1-2-3d6c27027d5b@freebox.fr>
References: <20240814-smmu-v1-0-3d6c27027d5b@freebox.fr>
In-Reply-To: <20240814-smmu-v1-0-3d6c27027d5b@freebox.fr>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

On qcom msm8998, writing to the last context bank of lpass_q6_smmu
(base address 0x05100000) produces a system freeze & reboot.

Specifically, here:

	qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
	arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);

and here:

	arm_smmu_write_context_bank(smmu, i);
	arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);

It is likely that FW reserves the last context bank for its own use,
thus a simple work-around would be: DON'T USE IT in Linux.

If we decrease the number of context banks, last one will be "hidden".

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 7e65189ca7b8c..e2e1fd9e2452b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -282,6 +282,11 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 	u32 smr;
 	int i;
 
+	if (of_property_read_bool(smmu->dev->of_node, "qcom,last-ctx-bank-reserved")) {
+		dev_warn(smmu->dev, "hiding last ctx bank from linux");
+		--smmu->num_context_banks;
+	}
+
 	/*
 	 * Some platforms support more than the Arm SMMU architected maximum of
 	 * 128 stream matching groups. For unknown reasons, the additional

-- 
2.34.1


