Return-Path: <linux-arm-msm+bounces-27198-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 015DF93EFFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AAE5F28342E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 08:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D0613CFA3;
	Mon, 29 Jul 2024 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyZzHb2v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2047713C9A7;
	Mon, 29 Jul 2024 08:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722242276; cv=none; b=QR+ZypUqQRaXeEhtCKrtVsk5MiP3U9+NVtkSS/mrIXl/GrQdn4Rz2gAaUeaCkgimuGHMJIvWwZvfFJ1XshR5YJXOsMWhfRbnD6zxHyl5Ltam1oq7f8IC250HFZwUnZ0O8Pye1fHxr+F5764FimD9/LAI87gAh2h44BRFJEwm3Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722242276; c=relaxed/simple;
	bh=V9wFi+MX2139fI/I1jgkjhCzse15vxUwsNcBTc5sszY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=GRYn3Pg7d7KmKz+I/xhXyFMUrQsbTLxvFncydDUULd+zpxn3XQn6v75G+wTkdUzRwNYTk9wl/Ohdo0fn3yGDcpim/EgQbtCKNTN+wEhW9cRENlnHLlUvQIdZh151k1PxYJ8Pc1OvzgK1w3s8mrKxY/F51jDeBfRdRq8BFnNuyNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyZzHb2v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DFB0C32786;
	Mon, 29 Jul 2024 08:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722242276;
	bh=V9wFi+MX2139fI/I1jgkjhCzse15vxUwsNcBTc5sszY=;
	h=From:Date:Subject:To:Cc:From;
	b=IyZzHb2vH+E0LTpNKmwOtI8sgfUgguJwCTeV4822DeBWr4CbUrjTG5SC8J5ZFvpEc
	 TEvSLqKME1VRrCbO+syepVH2Xkmon0CPp/bYSQFFHRAqaGjhN7E3it70evYv+2wGMO
	 u7wPFcvYoD/OzWnG1W3G6vr+hvCv0+UW3/t16rG9HExpH8yxq2WlLKgVbhViMQZ0Gg
	 0pgL2cXiw3vzFOA58XRr5q2LksCMp092sdfLxGzQUNcDIPPfOsQyC9/VoZP/mwK27q
	 ql6zVEBL8dLi61HyVykxhhh+YOKynyy/JnJFEqp2rc8+BpZdtUirGmOOTS0BUlSiDU
	 odE1ktcY5KaOw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 29 Jul 2024 10:37:48 +0200
Subject: [PATCH] iommu/arm-smmu-qcom: Work around SDM845 Adreno SMMU w/ 16K
 pages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240729-topic-845_gpu_smmu-v1-1-8e372abbde41@kernel.org>
X-B4-Tracking: v=1; b=H4sIANtUp2YC/x3MQQqAIBBA0avIrBPMLKOrRITZWLOoRDOC6O5Jy
 7f4/4GIgTBCxx4IeFGkY88oCwZ2NfuCnOZskEIqoWXDz8OT5a2qx8WnMW5b4mbSVeu0EWVlIYc
 +oKP7n/bD+360dp+KZAAAAA==
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, iommu@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722242271; l=2469;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=2WVG4OVq/a0X1nt/OAVRPPSlDahdsoGHbN6xyxn5/YE=;
 b=hGjcIevB0Wn7lOG4ywLtp4lmqnr4qxzsOJxqCNiUIqZyUhcghFBYu93Rj0DFKYBbHubGFVdV1
 +URYCL6jDIQCy6PVA0crNynhwSa+8s061yIQ2CyNJ2CeSxTik1wPU/H
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
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

Hide 16K support on SDM845's Adreno SMMU to work around this.

Reported-by: Sumit Semwal <sumit.semwal@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
There's a mismatch in sender/committer addresses but that's "fine":
https://lore.kernel.org/linux-usb/2024072734-scenic-unwilling-71ea@gregkh/
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 36c6b36ad4ff..d25825c05817 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -338,6 +338,15 @@ static int qcom_smmu_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static int qcom_adreno_smmuv2_cfg_probe(struct arm_smmu_device *smmu)
+{
+	/* SDM845 Adreno SMMU advertizes 16K pages support, but something is broken */
+	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm845-smmu-v2"))
+		smmu->features &= ~ARM_SMMU_FEAT_FMT_AARCH64_16K;
+
+	return 0;
+}
+
 static void qcom_smmu_write_s2cr(struct arm_smmu_device *smmu, int idx)
 {
 	struct arm_smmu_s2cr *s2cr = smmu->s2crs + idx;
@@ -436,6 +445,7 @@ static const struct arm_smmu_impl sdm845_smmu_500_impl = {
 
 static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
+	.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,

---
base-commit: 931a3b3bccc96e7708c82b30b2b5fa82dfd04890
change-id: 20240726-topic-845_gpu_smmu-ab738f7a013c

Best regards,
-- 
Konrad Dybcio <konradybcio@kernel.org>


