Return-Path: <linux-arm-msm+bounces-29122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC89587F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 15:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 171A01F22C3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 13:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47AE3191F82;
	Tue, 20 Aug 2024 13:27:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94706191F86;
	Tue, 20 Aug 2024 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724160461; cv=none; b=h0O7iHQLSi0h9La55w9mE92WLC6RIYld2rSUT7fqp/jU1PHVZzAeFw7wAeb/cFdsHr56iaFbAX2YbNRQMCAqWjnz+eVlkJ1UUexCsRVDMiNMBx4xKPKD+SXQ+Ff9xMcEQOqkN0wt+N1+JzTkDKzMJ8ZOuqIxiibSoq4moi4y07Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724160461; c=relaxed/simple;
	bh=WgMvhD6cuag6dUYVIdapvUjvrcTNcu+CX/nWDTdVGwU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M4PbePgURUtdBygezFTuy89vpiS20l+VXO76AR93ETEpsAW3FumEe6j7pF2R2Xssfd80bYE/Q+2H5YJv7ZxVFHfYVut+VhWZoGOQzh9n7/VOeqda1GSqSw6lijEY1KQfunCWgkZihW4ibdJwAseGzga05eZBmpic3MEVdzDRQ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id BB3FB209EF;
	Tue, 20 Aug 2024 15:27:28 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id A487920582;
	Tue, 20 Aug 2024 15:27:28 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Date: Tue, 20 Aug 2024 15:27:19 +0200
Subject: [PATCH v3] iommu/arm-smmu-qcom: hide last LPASS SMMU context bank
 from linux
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240820-smmu-v3-1-2f71483b00ec@freebox.fr>
X-B4-Tracking: v=1; b=H4sIALaZxGYC/zXMQQ6DIBCF4auYWZcGEJV21Xs0LhCHykIxQ0tsD
 Hcvtenyf3n5dohIHiNcqx0Ik48+LCXqUwV2MssDmR9Lg+RScS0Ui/P8YmPTSSuMaI2xUK4rofP
 bwdz70pOPz0DvQ03iu/6Byw9IgnE2WGxRdbXWsrk5QhzCdnYEfc75A8Pkt+CZAAAA
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
Changes in v3:
- Use very specific test (hack) to avoid changing the binding (Bjorn)
- Link to v2: https://lore.kernel.org/r/20240819-smmu-v1-0-bce6e4738825@freebox.fr

Changes in v2:
- Use the compatible prop instead of a specific prop to trigger work-around (Bjorn & Caleb)
- Add qcom,msm8998-lpass-smmu compatible string
- Link to v1: https://lore.kernel.org/r/20240814-smmu-v1-0-3d6c27027d5b@freebox.fr

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

Specifically, here:

	qsmmu->bypass_cbndx = smmu->num_context_banks - 1;
	arm_smmu_cb_write(smmu, qsmmu->bypass_cbndx, ARM_SMMU_CB_SCTLR, 0);

and here:

	arm_smmu_write_context_bank(smmu, i);
	arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);

It is likely that FW reserves the last context bank for its own use,
thus a simple work-around would be: DON'T USE IT in Linux.

For reference, the lpass_q6_smmu node looks like this:

	lpass_q6_smmu: iommu@5100000 {
		compatible = "qcom,msm8998-smmu-v2", "qcom,smmu-v2";
		reg = <0x05100000 0x40000>;
		clocks = <&gcc HLOS1_VOTE_LPASS_ADSP_SMMU_CLK>;
		clock-names = "iface";

		#global-interrupts = <0>;
		#iommu-cells = <1>;
		interrupts =
			<GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
			<GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;

power-domains = <&gcc LPASS_ADSP_GDSC>;
		status = "disabled";
	};
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 7e65189ca7b8c..625db1d00fe5e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -282,6 +282,13 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 	u32 smr;
 	int i;
 
+	/*
+	 * MSM8998 LPASS SMMU reports 13 context banks, but accessing
+	 * the last context bank crashes the system.
+	 */
+	if (of_device_is_compatible(smmu->dev->of_node, "qcom,msm8998-smmu-v2") && smmu->num_context_banks == 13)
+		smmu->num_context_banks = 12;
+
 	/*
 	 * Some platforms support more than the Arm SMMU architected maximum of
 	 * 128 stream matching groups. For unknown reasons, the additional

---
base-commit: 96a96aed6bb75b5c212f233b6c059a9354cdeebe
change-id: 20240814-smmu-d572c1a16aac

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>


