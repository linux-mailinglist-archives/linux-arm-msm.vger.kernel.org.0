Return-Path: <linux-arm-msm+bounces-32475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0B0985A8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 14:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C282E2847E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 12:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 100CA18CBF1;
	Wed, 25 Sep 2024 11:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lg6QwRdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69CA1B6556;
	Wed, 25 Sep 2024 11:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727264547; cv=none; b=BBqdoG8T+sWe9Zgc/hVwMjJ+0GmrTAkRkA42Ik9mXUImU0sbRlvcoTn/ip65PyjKpkPt5amizDikh6Dm9O0l8k3hQ1JeyyLOfq6cTD/tW+JOxAHNwkpqF/DbeK/z1FeH4MC+u/f8F9cyonvpT1vu5dW9eiLjt6BIHLXzl77LLXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727264547; c=relaxed/simple;
	bh=ce/FZwmoROaw6kUa43AajovDaYt4Ad1jNfBMo/F5Xgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q/N+DZaSe8BfmQtDH7qfn5uBppcjX/xzx1ruhjK2r2BMhC2s0JsDUWdNB76RIdZPtteOCmxZbYhWYGuNdgd0ZER/bM0lEKpRS4q0fAeSxjxayPW3l1kS3Fc5+bon5ZWhm/+nCKtWkcafgt4O6guXFAt6+Lm9IoGEPq1lQ1vvAlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lg6QwRdK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C075C4CEC3;
	Wed, 25 Sep 2024 11:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727264547;
	bh=ce/FZwmoROaw6kUa43AajovDaYt4Ad1jNfBMo/F5Xgk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lg6QwRdK0apVcd0xNbXPktWoV0mJVwwrLsEQt0IYZ8MWvpi5csFzVa+wpRrYKAkqT
	 dQ2kivnGByzk/VvV7A5T2JRT+d+X5a6gp2CYU7kWZ+M+BCeaoqMYOee8HLEwNlIzaG
	 71Swdq6CsD5bu3Ot0KqnB1C+YsBYp3EQxwxhoUn7SQBw3KiZvjOLI9C30kSoThg7gA
	 a+g3K7mv0z9XAcRyCv80FX2yQoYn+zhOZj+zKMslm06y3WhRZSA8lRTdba1yKmRIw2
	 6JrNDZ7amMOw7gwi9lU2kNB8ES12ZYGaMXu8Lur/sPyS6dibXELsqUkJuweGJsrhbU
	 aUluRGDj/TKGA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Marc Gonzalez <mgonzalez@freebox.fr>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 120/244] iommu/arm-smmu-qcom: hide last LPASS SMMU context bank from linux
Date: Wed, 25 Sep 2024 07:25:41 -0400
Message-ID: <20240925113641.1297102-120-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925113641.1297102-1-sashal@kernel.org>
References: <20240925113641.1297102-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11
Content-Transfer-Encoding: 8bit

From: Marc Gonzalez <mgonzalez@freebox.fr>

[ Upstream commit 3a8990b8a778219327c5f8ecf10b5d81377b925a ]

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
Reviewed-by: Caleb Connolly <caleb.connolly@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Link: https://lore.kernel.org/r/20240820-smmu-v3-1-2f71483b00ec@freebox.fr
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 36c6b36ad4ff7..b981ff25a983d 100644
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
-- 
2.43.0


