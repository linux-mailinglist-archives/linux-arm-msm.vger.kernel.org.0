Return-Path: <linux-arm-msm+bounces-32484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A154985F43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 15:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BBAE1C25818
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 13:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E2213C9C7;
	Wed, 25 Sep 2024 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVE9oXYD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F20A2216B7;
	Wed, 25 Sep 2024 12:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727266511; cv=none; b=nVykYXiVx2SNLiY0dTDmHFdtl6xP4+UL52C+iGh76IMJLgmX7kBqx8/5+hoVErXJUJfzizhXnY4dROVvihhc0H7UXBrfBvHlgGkdSpmu+Z7KLyJeWe756/CwICDcahTPVuj2T0Ohyjxeu98fsVS+YwSD8Qbor0EaZiaRfmBxyDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727266511; c=relaxed/simple;
	bh=rQzAu1YCouUI30PAM1f23KyOnqHh5mvEmb3jdWPljMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mRcQbPWtgSL0CbtE0sbenbnR5Qud2YG8tCJJYfMb/7u/RiYW2Oi3BIigluLe4W08qICDFKT/tLDBRhjz8bY09ax+aAoe0k867Jm0A5G/UavB3GBsfcF0Dj+NOp78aCVRYa7QJGrFo42KRMoAGpzwIKb8QTmWAtfdZjL+4v1sD2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVE9oXYD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7743C4CECF;
	Wed, 25 Sep 2024 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727266511;
	bh=rQzAu1YCouUI30PAM1f23KyOnqHh5mvEmb3jdWPljMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UVE9oXYDlAl0ql5NqsrUnIKmcHJcHeAVFQtZgVQGy/TdZWimmC1BwVGQhasmtYovV
	 BJMQIOeCbUUD0FHdb+7VIAq/7VO6vuv8uejkQXdrSfCmihBBFm/dc87VCyP4a6Ot8O
	 kuWvTV6d6kBsIKYpi6eNI7/dXBk7IsH7O0ojT0icz3TdveOelWQj3BqxQ7iOEYa5mS
	 u0sunHpYS/J+pDzpoUJRxSetxxaxlq9CnWuIl7tWpytZ+xdYuNfpoHFL3QFlhWsnqO
	 qcBd6kig6uQtCXqRQWfeuT5buqEn1WQXqHrkNltwnTmzpeTQMlAbnx8ys9scVXEL/r
	 7ucEIcDjfFDJw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Will Deacon <will@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	robdclark@gmail.com,
	joro@8bytes.org,
	iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 079/139] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/ 16K pages
Date: Wed, 25 Sep 2024 08:08:19 -0400
Message-ID: <20240925121137.1307574-79-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@linaro.org>

[ Upstream commit 2d42d3ba443706c9164fa0bef4e5fd1c36bc1bd9 ]

SDM845's Adreno SMMU is unique in that it actually advertizes support
for 16K (and 32M) pages, which doesn't hold for newer SoCs.

This however, seems either broken in the hardware implementation, the
hypervisor middleware that abstracts the SMMU, or there's a bug in the
Linux kernel somewhere down the line that nobody managed to track down.

Booting SDM845 with 16K page sizes and drm/msm results in:

*** gpu fault: ttbr0=0000000000000000 iova=000100000000c000 dir=READ
type=TRANSLATION source=CP (0,0,0,0)

right after loading the firmware. The GPU then starts spitting out
illegal intstruction errors, as it's quite obvious that it got a
bogus pointer.

Moreover, it seems like this issue also concerns other implementations
of SMMUv2 on Qualcomm SoCs, such as the one on SC7180.

Hide 16K support on such instances to work around this.

Reported-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Link: https://lore.kernel.org/r/20240824-topic-845_gpu_smmu-v2-1-a302b8acc052@quicinc.com
Signed-off-by: Will Deacon <will@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b899a7b7fa935..db2092d5af5eb 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -341,6 +341,14 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static int qcom_adreno_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
+{
+	/* Support for 16K pages is advertised on some SoCs, but it doesn't seem to work */
+	smmu->features &= ~ARM_SMMU_FEAT_FMT_AARCH64_16K;
+
+	return 0;
+}
+
 static void qcom_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
 {
 	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
@@ -431,6 +439,7 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
 
 static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
+	.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
-- 
2.43.0


