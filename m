Return-Path: <linux-arm-msm+bounces-29419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B642F95D985
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 01:12:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA7901C21E2E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 23:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0BF1C8FCF;
	Fri, 23 Aug 2024 23:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOp7aAFF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA2C195;
	Fri, 23 Aug 2024 23:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724454727; cv=none; b=GcnUwLL/nQMt4moEzzmS+1SZ0LgIxFAFXG59cd0CqSwGT0KeuCbnnar+3l8irEOTti0jgewz05/ceedhxSewjnpZrfkEWXvjMXnPsZck3BXjpqVvJc1wogEpnu/RwhamrA6oF2MNgMAe81PFam8BL6BGZqNV6QjQ8ixeNQcCN/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724454727; c=relaxed/simple;
	bh=YI7IRkaJ3EfhYHm4WUDr42kxZuTU0IHj5kwNKoD7h7Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DG0oHhW4YjkNsuJJSV3lSDtBaspuNgVJ/DIOFnMt/XReYQktPweky8p1JKT+VWqQK4L08yNM6q194qOJWnwRA9mGf/KxVHVTZNym1tZP9uAlnFMphrDAN6oQLUyxSl9Fgowll/5wUYvrtJCcfaJHHyPM8bfXYX6PzOi4bfAQUzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOp7aAFF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A32C32786;
	Fri, 23 Aug 2024 23:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724454726;
	bh=YI7IRkaJ3EfhYHm4WUDr42kxZuTU0IHj5kwNKoD7h7Y=;
	h=From:Date:Subject:To:Cc:From;
	b=VOp7aAFF3mINLLoKsuyxfBuKRqB+SuwjLfLSil65HdtFgh1+6huaD+MpUnK+qRJjB
	 7/A31idlxNOZeVUomfZQLNALjX45TBA9yoEDOpNcMZ0ITNBNV7aof9tJ7TMMtq5PL2
	 3+qiRXYDYSI3aelyDFqC8Iz44l0YOIpPfsCJ6s6LTb2WNWJzKlauT0FXyaRJ6Vjf8h
	 kea0Vol1iUoeHj1EdicZnYRsQjv6ctNHPnWmItN+rgDfrkJ1B+mn7qsHdBoCvGLgth
	 j1b13rGgP/mEtkljs9ssL7svE4krPjcCUo/jtJTmrFOMEOvCzSRxO0KCGgax+Q6092
	 qfCfoeaNGBM+Q==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 24 Aug 2024 01:12:01 +0200
Subject: [PATCH v2] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/
 16K pages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240824-topic-845_gpu_smmu-v2-1-a302b8acc052@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEAXyWYC/22NwQ6CMBAFf4Xs2Zq2oEVP/ochpJSlbBRKWiAa0
 n+3knjzOJO8eRsE9IQBrtkGHlcK5MYE8pCB6fVokVGbGCSXBVfyzGY3kWFlcarttNRhGBamG5W
 XndJc5AbScPLY0WuP3qvEPYXZ+ff+sYqv/eUu/3KrYIKVmCupm6bFQtwe6Ed8Hp23UMUYP4U0X
 U21AAAA
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724454724; l=2539;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=Oe0I3xruTRwKQHvvq9uqhvIoICiJTWXHJSTJikeT6WM=;
 b=lfjEUIfrLxCTM1F6xcBnuFC7bbDE0b2o0/H/WC7i0+JH0EnXupF8hAV1QKAjqlL/oEuK1Efp/
 mJ2L9S3WlnZB1tGaPWj1TJjSTPQnrydPKWrhQbUD8emmV7kt4J+IbWh
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

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
---
Changes in v2:
- Extend to all Qualcomm SMMUv2 implementations
- Link to v1: https://lore.kernel.org/r/20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 36c6b36ad4ff..cca6d5b0bf5d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -338,6 +338,14 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
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
@@ -436,6 +444,7 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
 
 static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
+	.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,

---
base-commit: 9243b36b254ffe3809eb0c8c565c287511a07f20
change-id: 20240726-topic-845_gpu_smmu-ab738f7a013c

Best regards,
-- 
Konrad Dybcio <quic_kdybcio@quicinc.com>


