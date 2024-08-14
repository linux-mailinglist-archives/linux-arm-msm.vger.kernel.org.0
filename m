Return-Path: <linux-arm-msm+bounces-28503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A96951C6A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 16:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2262E2820F5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Aug 2024 14:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186451B29B9;
	Wed, 14 Aug 2024 14:00:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67A71B1410;
	Wed, 14 Aug 2024 14:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644022; cv=none; b=aKByCs5zixroR4+73v0Jc9lgWBJNfSfxTZTJeZJUFh9g4b4RXJd6ycIAa/X3eD/65jk6Dxsx8JXPlDAsz3yanhL1atFOTxNfH3nv3bcgF817dHiZ4tmSjxGNFqlmvu/q9NsFmRmtuwBgbUrWVI4Dx7Ue5UmrqC6S4XKo5EhUk/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644022; c=relaxed/simple;
	bh=/6cw3tOWL+4l0726raXhGXm3cR28e6PNK5EJ2Dqp760=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=s6OFLP+niOA0AWVJ+7S/qgJGLUUYblM3SVQKmVhQqWkp/41OX+TyE5ougHuudft+s65El0qcRVIKJEKCN6RBSHpUdLxq8yc+SoEYtJnpWm6cMnumhWu15LbVfTVHrpokckUnkcz9hGXGzt805/oEB/zc1q/Cn4ua4qy7GBa+J8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id D1FE520990;
	Wed, 14 Aug 2024 16:00:09 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id BDAD920988;
	Wed, 14 Aug 2024 16:00:09 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH 0/2] Work around reserved SMMU context bank on msm8998
Date: Wed, 14 Aug 2024 15:59:54 +0200
Message-Id: <20240814-smmu-v1-0-3d6c27027d5b@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFq4vGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDC0MT3eLc3FLdFFNzo2TDREOzxMRkJaDSgqLUtMwKsDHRsbW1ACh0KDJ
 WAAAA
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

This patch series:
1) introduces a DT prop "qcom,last-ctx-bank-reserved" to indicate
that FW reserves the last context bank of a given SMMU.
2) tweaks the driver to "hide" the last context bank from Linux.

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
Marc Gonzalez (2):
      dt-bindings: arm-smmu: Add qcom,last-ctx-bank-reserved
      iommu/arm-smmu-qcom: hide last context bank from linux

 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c            | 5 +++++
 2 files changed, 11 insertions(+)
---
base-commit: c934f6908ad1f210c1d1e289934d1182a6e7cb62
change-id: 20240814-smmu-d572c1a16aac

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>


