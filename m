Return-Path: <linux-arm-msm+bounces-28977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76197956B63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 15:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32E9E2828E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D694F16C68B;
	Mon, 19 Aug 2024 12:59:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C541487FE;
	Mon, 19 Aug 2024 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724072388; cv=none; b=ORvKgNFFoewI8hehIK4pcveXGAJnPAl4rvxkBIwVNU1ZXS6XnfSJi78MidfUlyZyT8xfyG15/SblEl1LOW+uYazvBeN8EcnoqHczMDGSvZeCv7gv9rNUh8/4R9n86+UDffsKYNURfEqYi3t4R8+f8qyJPfFrv90HYoBu/C/LYZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724072388; c=relaxed/simple;
	bh=mVTUdHZIMPJ1+Lpr64UfYpEMVVQCY4Gv9UsTuKmzLRE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVLSM0EoBGQbivkenHQuH5nE74UVW08vkmr2UD1b6bReGteLjqAhg+LkkidpjxuOxO+/IGCQJgsuWyCoI6pVMciUqtYLnxChXlcs0BcDiIfF9wlMlMDINJa50dCD0Qjanwp0DQVyeG613Lk6GB5fsPZwb7uQQm8dQsCXQLTttXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 936A820990;
	Mon, 19 Aug 2024 14:59:37 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 83A9C20987;
	Mon, 19 Aug 2024 14:59:37 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Mon, 19 Aug 2024 14:59:35 +0200
Subject: [PATCH 1/2] iommu/arm-smmu-qcom: hide last LPASS SMMU context bank
 from linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240819-smmu-v1-1-bce6e4738825@freebox.fr>
References: <20240819-smmu-v1-0-bce6e4738825@freebox.fr>
In-Reply-To: <20240819-smmu-v1-0-bce6e4738825@freebox.fr>
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
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Marc Gonzalez <mgonzalez@freebox.fr>
X-Mailer: b4 0.13.0

On qcom msm8998, writing to the last context bank of lpass_q6_smmu
(base address 0x05100000) produces a system freeze & reboot.

The hardware/hypervisor reports 13 context banks for the LPASS SMMU
on msm8998, but only the first 12 are accessible...
Override the number of context banks

[    2.546101] arm-smmu 5100000.iommu: probing hardware configuration...
[    2.552439] arm-smmu 5100000.iommu: SMMUv2 with:
[    2.558945] arm-smmu 5100000.iommu: 	stage 1 translation
[    2.563627] arm-smmu 5100000.iommu: 	address translation ops
[    2.568923] arm-smmu 5100000.iommu: 	non-coherent table walk
[    2.574566] arm-smmu 5100000.iommu: 	(IDR0.CTTW overridden by FW configuration)
[    2.580220] arm-smmu 5100000.iommu: 	stream matching with 12 register groups
[    2.587263] arm-smmu 5100000.iommu: 	13 context banks (0 stage-2 only)
[    2.614447] arm-smmu 5100000.iommu: 	Supported page sizes: 0x63315000
[    2.621358] arm-smmu 5100000.iommu: 	Stage-1: 36-bit VA -> 36-bit IPA
[    2.627772] arm-smmu 5100000.iommu: 	preserved 0 boot mappings

Specifically, the crashes occur here:

	qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
	arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);

and here:

	arm_smmu_write_context_bank(smmu, i);
	arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);

It is likely that FW reserves the last context bank for its own use,
thus a simple work-around is: DON'T USE IT in Linux.

If we decrease the number of context banks, last one will be "hidden".

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 7e65189ca7b8c..d08c18edf5732 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -282,6 +282,11 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 	u32 smr;
 	int i;
 
+	if (of_device_is_compatible(smmu->dev->of_node, "qcom,msm8998-lpass-smmu")) {
+		dev_warn(smmu->dev, "hide last ctx bank from linux");
+		--smmu->num_context_banks;
+	}
+
 	/*
 	 * Some platforms support more than the Arm SMMU architected maximum of
 	 * 128 stream matching groups. For unknown reasons, the additional

-- 
2.34.1


