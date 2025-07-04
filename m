Return-Path: <linux-arm-msm+bounces-63771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C487AF99DF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 19:39:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E73E5A8205
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 17:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B42326229;
	Fri,  4 Jul 2025 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCFn7mTP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D55A3196DA;
	Fri,  4 Jul 2025 17:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751650587; cv=none; b=W9crWKb1Us/6j8W3Def4VeGAlTXbptVDW63ZXJkaI0J2BMi9er3iWJg0HJ7S88wmVT5Pn7j682zvXyuj6Ql3SHseE/DDeEuRoNiNe6qcTWu9JifX1sIPnKvalK3HUxyZY23Jdtj2M0TCZzVaaBBS4BIpHkSw4baBjxrs2RHYyAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751650587; c=relaxed/simple;
	bh=qbOr0CUqiIJcAM/bRqbNIazzER6BJEWViUbA8ztMfaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lnTBSBdG7eeB25Lv4PhdMVAxS/G1qDBsdi+d20M2G30omUt7VnGPy3qBTAXm6463QpFt/OnWBZcpGbwIN60v+pY+UHd+F0XHkBYIuokBQYUTPOteWydmsvlHCR5pfm4vNqMIpr3t7PX7ZYsOabNu6T4Nn/DtfWXz1gW8x3FTiic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCFn7mTP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F42C4CEE3;
	Fri,  4 Jul 2025 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751650587;
	bh=qbOr0CUqiIJcAM/bRqbNIazzER6BJEWViUbA8ztMfaY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eCFn7mTPgobDbEOPdKMqI8g1ZjUR/xkelO+YMjIi4CrrnliFdq5Am/jjQci/Raan6
	 m52h+7owl2snbxUq+VKhnq+MRO7hiRDguTVGpX2ouFhRl12w/T3p/jrOe9bxr5wmX0
	 5kUpYQegOu/uyeRV93x1bqXL5r/gx3K4jxWGxt0pgK+EqcYRnRwuAb+MuMF6Yyb1w1
	 ywItFBHMpT2ExuC8Baeci/R2VdjbKdzVSKyzo+cBnmVKZ+9C4SDaOMVL0j+g8sv/UY
	 YoAx2ZjjU/9vpFzojY8/Op3V21rWutj4AstJBoHAVgpi/QYPT4uw03QbzRdwzsHIO7
	 GmTL5EvtTvJbA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 04 Jul 2025 19:36:11 +0200
Subject: [PATCH RFC/RFT 3/5] ufs: ufs-qcom: Don't try to map inexistent
 regions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-topic-qcom_ufs_mcq_cleanup-v1-3-c70d01b3d334@oss.qualcomm.com>
References: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
In-Reply-To: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Asutosh Das <quic_asutoshd@quicinc.com>, 
 Bart Van Assche <bvanassche@acm.org>, 
 Stanley Chu <stanley.chu@mediatek.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Can Guo <quic_cang@quicinc.com>, Nitin Rawat <quic_nitirawa@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751650573; l=6857;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ZEgdzYx+3tElY3LFFpAjG3ai4YoFjeOlp4I3Wy7XHJI=;
 b=9Yh++BDf7RsYHuQ5w7zoCrA+Cd+NgK6p/YZaN4gfAjJHUXuwLf7NPevY7po4TvTo+NCWVyJeE
 mgINw34lEMuB8tXKAiNuHeX5zuaYGEpCfIEbGglR9bRobsROL9Hurq4
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[CS]Q[DI] regions are intertwined within each op region (of which there
are many) and aren't actually separate register block.
Remove the confusing logic that suggests otherwise and simplify the
code a lot.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 107 ++++++++++++++++----------------------------
 drivers/ufs/host/ufs-qcom.h |   4 ++
 2 files changed, 43 insertions(+), 68 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 67929a3e6e6242a93ed4c84cb2d2f7f10de4aa5e..52dc0da042cb62a6c28b40e429773808299e102f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1715,7 +1715,7 @@ static void ufs_qcom_dump_testbus(struct ufs_hba *hba)
 }
 
 static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
-			      const char *prefix, enum ufshcd_res id)
+			      const char *prefix, void __iomem *base)
 {
 	u32 *regs __free(kfree) = NULL;
 	size_t pos;
@@ -1728,7 +1728,7 @@ static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 		return -ENOMEM;
 
 	for (pos = 0; pos < len; pos += 4)
-		regs[pos / 4] = readl(hba->res[id].base + offset + pos);
+		regs[pos / 4] = readl(base + offset + pos);
 
 	print_hex_dump(KERN_ERR, prefix,
 		       len > 4 ? DUMP_PREFIX_OFFSET : DUMP_PREFIX_NONE,
@@ -1739,30 +1739,31 @@ static int ufs_qcom_dump_regs(struct ufs_hba *hba, size_t offset, size_t len,
 
 static void ufs_qcom_dump_mcq_hci_regs(struct ufs_hba *hba)
 {
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct dump_info {
+		void __iomem *base;
 		size_t offset;
 		size_t len;
 		const char *prefix;
-		enum ufshcd_res id;
 	};
 
 	struct dump_info mcq_dumps[] = {
-		{0x0, 256 * 4, "MCQ HCI-0 ", RES_MCQ},
-		{0x400, 256 * 4, "MCQ HCI-1 ", RES_MCQ},
-		{0x0, 5 * 4, "MCQ VS-0 ", RES_MCQ_VS},
-		{0x0, 256 * 4, "MCQ SQD-0 ", RES_MCQ_SQD},
-		{0x400, 256 * 4, "MCQ SQD-1 ", RES_MCQ_SQD},
-		{0x800, 256 * 4, "MCQ SQD-2 ", RES_MCQ_SQD},
-		{0xc00, 256 * 4, "MCQ SQD-3 ", RES_MCQ_SQD},
-		{0x1000, 256 * 4, "MCQ SQD-4 ", RES_MCQ_SQD},
-		{0x1400, 256 * 4, "MCQ SQD-5 ", RES_MCQ_SQD},
-		{0x1800, 256 * 4, "MCQ SQD-6 ", RES_MCQ_SQD},
-		{0x1c00, 256 * 4, "MCQ SQD-7 ", RES_MCQ_SQD},
+		{hba->mcq_base, 0x0, 256 * 4, "MCQ HCI-0 "},
+		{hba->mcq_base, 0x400, 256 * 4, "MCQ HCI-1 "},
+		{host->mcq_vs_base, 0x0, 5 * 4, "MCQ VS-0 "},
+		{host->opr_start_base, 0x0, 256 * 4, "MCQ SQD-0 "},
+		{host->opr_start_base, 0x400, 256 * 4, "MCQ SQD-1 "},
+		{host->opr_start_base, 0x800, 256 * 4, "MCQ SQD-2 "},
+		{host->opr_start_base, 0xc00, 256 * 4, "MCQ SQD-3 "},
+		{host->opr_start_base, 0x1000, 256 * 4, "MCQ SQD-4 "},
+		{host->opr_start_base, 0x1400, 256 * 4, "MCQ SQD-5 "},
+		{host->opr_start_base, 0x1800, 256 * 4, "MCQ SQD-6 "},
+		{host->opr_start_base, 0x1c00, 256 * 4, "MCQ SQD-7 "},
 	};
 
 	for (int i = 0; i < ARRAY_SIZE(mcq_dumps); i++) {
 		ufs_qcom_dump_regs(hba, mcq_dumps[i].offset, mcq_dumps[i].len,
-				   mcq_dumps[i].prefix, mcq_dumps[i].id);
+				   mcq_dumps[i].prefix, mcq_dumps[i].base);
 		cond_resched();
 	}
 }
@@ -1891,74 +1892,44 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 }
 #endif
 
-/* Resources */
-static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
-	{.name = "mcq",},
-	/* Submission Queue DAO */
-	{.name = "mcq_sqd",},
-	/* Submission Queue Interrupt Status */
-	{.name = "mcq_sqis",},
-	/* Completion Queue DAO */
-	{.name = "mcq_cqd",},
-	/* Completion Queue Interrupt Status */
-	{.name = "mcq_cqis",},
-	/* MCQ vendor specific */
-	{.name = "mcq_vs",},
-};
-
 static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
 {
 	struct platform_device *pdev = to_platform_device(hba->dev);
-	struct ufshcd_res_info *res;
-	int i, ret;
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct resource *sqd_res;
 
-	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
-
-	for (i = 0; i < RES_MAX; i++) {
-		res = &hba->res[i];
-		res->resource = platform_get_resource_byname(pdev,
-							     IORESOURCE_MEM,
-							     res->name);
-		if (!res->resource) {
-			dev_info(hba->dev, "Resource %s not provided\n", res->name);
-			continue;
-		}
-
-		res->base = devm_ioremap_resource(hba->dev, res->resource);
-		if (IS_ERR(res->base)) {
-			dev_err(hba->dev, "Failed to map res %s, err=%d\n",
-					 res->name, (int)PTR_ERR(res->base));
-			ret = PTR_ERR(res->base);
-			res->base = NULL;
-			return ret;
-		}
-	}
-
-	res = &hba->res[RES_MCQ];
-	if (res->base)
+	hba->mcq_base = devm_platform_ioremap_resource_byname(pdev, "mcq");
+	if (!hba->mcq_base)
 		return -EINVAL;
 
-	hba->mcq_base = res->base;
+	sqd_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mcq_sqd");
+	if (!sqd_res)
+		return -EINVAL;
+
+	host->opr_start_base = devm_ioremap_resource(hba->dev, sqd_res);
+	if (!host->opr_start_base)
+		return -EINVAL;
+
+	host->opr_start_off = sqd_res->start - hba->hci_res->start;
+
+	host->mcq_vs_base = devm_platform_ioremap_resource_byname(pdev, "mcq_vs");
+	if (!host->mcq_vs_base)
+		return -EINVAL;
 
 	return 0;
 }
 
 static int ufs_qcom_op_runtime_config(struct ufs_hba *hba)
 {
-	struct ufshcd_res_info *sqdao_res;
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct ufshcd_mcq_opr_info_t *opr;
 	int i;
 
-	sqdao_res = &hba->res[RES_MCQ_SQD];
-	if (!sqdao_res->base)
-		return -EINVAL;
-
 	for (i = 0; i < OPR_MAX; i++) {
 		opr = &hba->mcq_opr[i];
-		opr->offset = sqdao_res->resource->start -
-			      hba->hci_res->start + 0x40 * i;
+		opr->offset = host->opr_start_off + 0x40 * i;
 		opr->stride = 0x100;
-		opr->base = sqdao_res->base + 0x40 * i;
+		opr->base = host->opr_start_base + 0x40 * i;
 	}
 
 	return 0;
@@ -1973,12 +1944,12 @@ static int ufs_qcom_get_hba_mac(struct ufs_hba *hba)
 static int ufs_qcom_get_outstanding_cqs(struct ufs_hba *hba,
 					unsigned long *ocqs)
 {
-	struct ufshcd_res_info *mcq_vs_res = &hba->res[RES_MCQ_VS];
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 
-	if (!mcq_vs_res->base)
+	if (!host->mcq_vs_base)
 		return -EINVAL;
 
-	*ocqs = readl(mcq_vs_res->base + UFS_MEM_CQIS_VS);
+	*ocqs = readl(host->mcq_vs_base + UFS_MEM_CQIS_VS);
 
 	return 0;
 }
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 0a5cfc2dd4f7d999dac9cbd671a078a65f877b68..7300e91a435607a2cef1a4f12a8c5c1201586783 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -281,6 +281,10 @@ struct ufs_qcom_host {
 	u32 phy_gear;
 
 	bool esi_enabled;
+
+	void __iomem *opr_start_base;
+	resource_size_t opr_start_off;
+	void __iomem *mcq_vs_base;
 };
 
 struct ufs_qcom_drvdata {

-- 
2.50.0


