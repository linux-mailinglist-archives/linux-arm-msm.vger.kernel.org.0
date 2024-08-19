Return-Path: <linux-arm-msm+bounces-28978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B42BC956B67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 15:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43045282F8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 13:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A679C16C841;
	Mon, 19 Aug 2024 12:59:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA4916BE12;
	Mon, 19 Aug 2024 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.33.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724072389; cv=none; b=JNhI5FD/A1dF+ZbQ7NSffgA1H8KprwHaN3uM8ntAv8TmcDJfK/EHKOl8DvSyKjaA8xst+3p2/d3NPauEq5AQrRcVxFM+4HrH3fzbyyyf4IYgedYcg6/on1tVJk0GYJ+QrWyUXwHhPkvVhbRMpDvbq12PT5uUljmd6gZUoDkcu7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724072389; c=relaxed/simple;
	bh=uK3MQe9P1cLB7v2We933qbfjP8STr4jPcaOGuWi5V/E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eA/YBG1xI+e0nytWH9dSP/1Qsiil/qR++puAdRgkt70M7FQA8LZKXQER64xMCQYEmarxHlUWRmrkGVae/WRGBdMiBGYURJ+GXT81VurXyKcmp/4jwTb1ydu4CR4Z1Xv3WcRkRFNm+3yUA1txyiCZyKgmIJQ692bNaGwdQRF2RUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr; spf=pass smtp.mailfrom=srs.iliad.fr; arc=none smtp.client-ip=212.27.33.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=freebox.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=srs.iliad.fr
Received: from ns.iliad.fr (localhost [127.0.0.1])
	by ns.iliad.fr (Postfix) with ESMTP id 8E84020989;
	Mon, 19 Aug 2024 14:59:37 +0200 (CEST)
Received: from [127.0.1.1] (freebox.vlq16.iliad.fr [213.36.7.13])
	by ns.iliad.fr (Postfix) with ESMTP id 7CD0E2097B;
	Mon, 19 Aug 2024 14:59:37 +0200 (CEST)
From: Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [PATCH 0/2] Work around reserved SMMU context bank on msm8998
Date: Mon, 19 Aug 2024 14:59:34 +0200
Message-Id: <20240819-smmu-v1-0-bce6e4738825@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALZBw2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
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

Changes in v2:
- Use the compatible prop instead of a specific prop to trigger work-around (Bjorn & Caleb)
- Add qcom,msm8998-lpass-smmu compatible string
- Link to v1: https://lore.kernel.org/r/20240814-smmu-v1-0-3d6c27027d5b@freebox.fr

---
Marc Gonzalez (2):
      iommu/arm-smmu-qcom: hide last LPASS SMMU context bank from linux
      arm64: dts: qcom: msm8998: add qcom,msm8998-lpass-smmu compatible

 arch/arm64/boot/dts/qcom/msm8998.dtsi      | 2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)
---
base-commit: edb6307a8d9be5052ba5ce121e0bd55900ce44c4
change-id: 20240814-smmu-d572c1a16aac

Best regards,
-- 
Marc Gonzalez <mgonzalez@freebox.fr>


