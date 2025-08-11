Return-Path: <linux-arm-msm+bounces-68379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 622ADB20C21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:38:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3093B6927
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 14:33:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408B82DEA73;
	Mon, 11 Aug 2025 14:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S8QRs7yq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30211255F24;
	Mon, 11 Aug 2025 14:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754922752; cv=none; b=CKfk+5sebRYB/9tITsyVY1bKwB3/tR61yInrsn+Twmva1K7vOucNMeOS27zmfvuAvDIpYHKCJc5Wd+tMrb81b+g4/hzzZEcCOZgSLIAcYdidFqqMLY5PVhRz81WPvbFhC6MzldtDDfugYhzI4VErBCuw7QfEIqy7/McApAmr5tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754922752; c=relaxed/simple;
	bh=ZD+oDYILvKCgsmOsEcuByvlTIPl+vdRsvXFLyOT0bSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Kw8R/9HPVo/x8u+eulQLYI0Y6mSraEsbl5mQ9QcxjwzXWCrt2WstauNw7NgkYTgIwp59gf4xX3X4rZatq+C5cpADy7Gnbz2tWRz/r7dDY6O8pNVgwQNGdxQW2fojK2/oIa8QCGThRJtzGwzSKzpegL4TGLemrdEtYPKrB2ot94c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S8QRs7yq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9d9vG013072;
	Mon, 11 Aug 2025 14:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pjwefa2jS5uMMt6KTXE7QGTiB18tbor1b7TEsfCX8/c=; b=S8QRs7yqG2vL35QY
	SKkOJWIg7UQY5H2/O3A+foVmSpYM5+kVqDzxUdYp/8MYKdrhHgXB771veKLrNKkU
	RmJrzNpeV5TErc65LGie9plC+yDiL+fnVFzsF/dE2SJLcWEjs71aIrGJLPio3Prg
	1yatywhwlmATxwPx7lCFLeSx4ktONc+/GspAYsxJ/3B1AfY9M8/uHKg4AwmoAzbA
	O4WYljgrWjrUVubheBi5JC5wjiPQXmSTDrxdngcU2LeqfqTqFr5YwTKRkzad3uH6
	2b+j/OxY0ICQpTYsGy/aA6iI5Ufp1Hcl2L26rsO6h9Yxlu7iPPsaoaHTBLpmSNMv
	OPl8/w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmmv1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:32:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BEWI21008456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 14:32:18 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 11 Aug 2025 07:32:13 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <agross@kernel.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 4/4] ufs: ufs-qcom: Streamline UFS MCQ resource mapping
Date: Mon, 11 Aug 2025 20:01:39 +0530
Message-ID: <20250811143139.16422-5-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
References: <20250811143139.16422-1-quic_rdwivedi@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=6899fef3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=Vw9JBbwhpujn7zzuK4AA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: EKwbWLYvFHhp0uAh9ZhS1kFJgxKW2N12
X-Proofpoint-ORIG-GUID: EKwbWLYvFHhp0uAh9ZhS1kFJgxKW2N12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX/ysUZFQ+LyHP
 YFI6hderrE4uowD2T6GvQYT5cGgDuhV0wtd30d+p7glGWgc8+Fz4YfjcJ87FRmJceR+7ZW3PIcf
 IP5Gdoo6ZT/Bnlc73z06Fsi9dJNo+HkTdbN4z40sUbiNLCINBUAf8dQqkFPB/oKugQxVybILI+d
 qv8umd1u8Jp4WU8Ub6MGOOvSDvAmmzYec09zhXMOvtDV8CBl0/KGJXHRKFthcP1im/GASJ+atSp
 VTgfCt5x7QuL2ZLSAeY5jtE9wrc2t3k0ext0PPY89aQLzdgiRRFrd2XHLH0b4BH4WhQcLGrQEsx
 Vw0wznIlrnSqHi+5qxao71Cj79smFkSkJt4g/RbCi29+xqHAsw7FD7SstrnvUyFYgmRTdLnaSq8
 rhrX3Wd0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_03,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000

From: Nitin Rawat <quic_nitirawa@quicinc.com>

The current MCQ resource configuration involves multiple resource
mappings and dynamic resource allocation.

Simplify the resource mapping by directly mapping the single "mcq"
resource from device tree to hba->mcq_base instead of mapping multiple
separate resources (RES_UFS, RES_MCQ, RES_MCQ_SQD, RES_MCQ_VS).

It also uses predefined offsets for MCQ doorbell registers (SQD,
CQD, SQIS, CQIS) relative to the MCQ base,providing clearer memory
layout clarity.

Additionally update vendor-specific register offset UFS_MEM_CQIS_VS
offset from 0x8 to 0x4008 to align with the hardware programming guide.

The new approach assumes the device tree provides a single "mcq"
resource that encompasses the entire MCQ configuration space, making
the driver more maintainable and less prone to resource mapping errors.

Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 146 +++++++++++++-----------------------
 drivers/ufs/host/ufs-qcom.h |  21 +++++-
 2 files changed, 72 insertions(+), 95 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 76fc70503a62..984d16b4075a 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1910,116 +1910,73 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 	hba->clk_scaling.suspend_on_no_request = true;
 }
 
-/* Resources */
-static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
-	{.name = "ufs_mem",},
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
-	struct resource *res_mem, *res_mcq;
-	int i, ret;
-
-	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
-
-	for (i = 0; i < RES_MAX; i++) {
-		res = &hba->res[i];
-		res->resource = platform_get_resource_byname(pdev,
-							     IORESOURCE_MEM,
-							     res->name);
-		if (!res->resource) {
-			dev_info(hba->dev, "Resource %s not provided\n", res->name);
-			if (i == RES_UFS)
-				return -ENODEV;
-			continue;
-		} else if (i == RES_UFS) {
-			res_mem = res->resource;
-			res->base = hba->mmio_base;
-			continue;
-		}
+	struct resource *res;
 
-		res->base = devm_ioremap_resource(hba->dev, res->resource);
-		if (IS_ERR(res->base)) {
-			dev_err(hba->dev, "Failed to map res %s, err=%d\n",
-					 res->name, (int)PTR_ERR(res->base));
-			ret = PTR_ERR(res->base);
-			res->base = NULL;
-			return ret;
-		}
+	/* Map the MCQ configuration region */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mcq");
+	if (!res) {
+		dev_err(hba->dev, "MCQ resource not found in device tree\n");
+		return -ENODEV;
 	}
 
-	/* MCQ resource provided in DT */
-	res = &hba->res[RES_MCQ];
-	/* Bail if MCQ resource is provided */
-	if (res->base)
-		goto out;
-
-	/* Explicitly allocate MCQ resource from ufs_mem */
-	res_mcq = devm_kzalloc(hba->dev, sizeof(*res_mcq), GFP_KERNEL);
-	if (!res_mcq)
-		return -ENOMEM;
-
-	res_mcq->start = res_mem->start +
-			 MCQ_SQATTR_OFFSET(hba->mcq_capabilities);
-	res_mcq->end = res_mcq->start + hba->nr_hw_queues * MCQ_QCFG_SIZE - 1;
-	res_mcq->flags = res_mem->flags;
-	res_mcq->name = "mcq";
-
-	ret = insert_resource(&iomem_resource, res_mcq);
-	if (ret) {
-		dev_err(hba->dev, "Failed to insert MCQ resource, err=%d\n",
-			ret);
-		return ret;
+	hba->mcq_base = devm_ioremap_resource(hba->dev, res);
+	if (IS_ERR(hba->mcq_base)) {
+		dev_err(hba->dev, "Failed to map MCQ region: %ld\n",
+			PTR_ERR(hba->mcq_base));
+		return PTR_ERR(hba->mcq_base);
 	}
 
-	res->base = devm_ioremap_resource(hba->dev, res_mcq);
-	if (IS_ERR(res->base)) {
-		dev_err(hba->dev, "MCQ registers mapping failed, err=%d\n",
-			(int)PTR_ERR(res->base));
-		ret = PTR_ERR(res->base);
-		goto ioremap_err;
-	}
-
-out:
-	hba->mcq_base = res->base;
 	return 0;
-ioremap_err:
-	res->base = NULL;
-	remove_resource(res_mcq);
-	return ret;
 }
 
 static int ufs_qcom_op_runtime_config(struct ufs_hba *hba)
 {
-	struct ufshcd_res_info *mem_res, *sqdao_res;
 	struct ufshcd_mcq_opr_info_t *opr;
 	int i;
+	u32 doorbell_offsets[OPR_MAX];
 
-	mem_res = &hba->res[RES_UFS];
-	sqdao_res = &hba->res[RES_MCQ_SQD];
-
-	if (!mem_res->base || !sqdao_res->base)
+	if (!hba->mcq_base) {
+		dev_err(hba->dev, "MCQ base not mapped\n");
 		return -EINVAL;
+	}
+
+	/*
+	 * Configure doorbell address offsets in MCQ configuration registers.
+	 * These values are offsets relative to mmio_base (UFS_HCI_BASE).
+	 *
+	 * Memory Layout:
+	 * - mmio_base = UFS_HCI_BASE
+	 * - mcq_base  = MCQ_CONFIG_BASE = mmio_base + (UFS_QCOM_MCQCAP_QCFGPTR * 0x200)
+	 * - Doorbell registers are at: mmio_base + (UFS_QCOM_MCQCAP_QCFGPTR * 0x200) +
+	 * -				UFS_QCOM_MCQ_SQD_OFFSET
+	 * - Which is also: mcq_base +  UFS_QCOM_MCQ_SQD_OFFSET
+	 */
+
+	doorbell_offsets[OPR_SQD] = UFS_QCOM_SQD_ADDR_OFFSET;
+	doorbell_offsets[OPR_SQIS] = UFS_QCOM_SQIS_ADDR_OFFSET;
+	doorbell_offsets[OPR_CQD] = UFS_QCOM_CQD_ADDR_OFFSET;
+	doorbell_offsets[OPR_CQIS] = UFS_QCOM_CQIS_ADDR_OFFSET;
 
+	/*
+	 * Configure MCQ operation registers.
+	 *
+	 * The doorbell registers are physically located within the MCQ region:
+	 * - doorbell_physical_addr = mmio_base + doorbell_offset
+	 * - doorbell_physical_addr = mcq_base + (doorbell_offset - MCQ_CONFIG_OFFSET)
+	 */
 	for (i = 0; i < OPR_MAX; i++) {
 		opr = &hba->mcq_opr[i];
-		opr->offset = sqdao_res->resource->start -
-			      mem_res->resource->start + 0x40 * i;
-		opr->stride = 0x100;
-		opr->base = sqdao_res->base + 0x40 * i;
+		opr->offset = doorbell_offsets[i];  /* Offset relative to mmio_base */
+		opr->stride = UFS_QCOM_MCQ_STRIDE;  /* 256 bytes between queues */
+
+		/*
+		 * Calculate the actual doorbell base address within MCQ region:
+		 * base = mcq_base + (doorbell_offset - MCQ_CONFIG_OFFSET)
+		 */
+		opr->base = hba->mcq_base + (opr->offset - UFS_QCOM_MCQ_CONFIG_OFFSET);
 	}
 
 	return 0;
@@ -2034,12 +1991,13 @@ static int ufs_qcom_get_hba_mac(struct ufs_hba *hba)
 static int ufs_qcom_get_outstanding_cqs(struct ufs_hba *hba,
 					unsigned long *ocqs)
 {
-	struct ufshcd_res_info *mcq_vs_res = &hba->res[RES_MCQ_VS];
-
-	if (!mcq_vs_res->base)
+	if (!hba->mcq_base) {
+		dev_err(hba->dev, "MCQ base not mapped\n");
 		return -EINVAL;
+	}
 
-	*ocqs = readl(mcq_vs_res->base + UFS_MEM_CQIS_VS);
+	/* Read from MCQ vendor-specific register in MCQ region */
+	*ocqs = readl(hba->mcq_base + UFS_MEM_CQIS_VS);
 
 	return 0;
 }
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index e0e129af7c16..533e3297045f 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -33,6 +33,25 @@
 #define DL_VS_CLK_CFG_MASK GENMASK(9, 0)
 #define DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN             BIT(9)
 
+/* Qualcomm MCQ Configuration */
+#define UFS_QCOM_MCQCAP_QCFGPTR     224  /* 0xE0 in hex */
+#define UFS_QCOM_MCQ_CONFIG_OFFSET  (UFS_QCOM_MCQCAP_QCFGPTR * 0x200)  /* 0x1C000 */
+
+/* Doorbell offsets within MCQ region (relative to MCQ_CONFIG_BASE) */
+#define UFS_QCOM_MCQ_SQD_OFFSET     0x5000
+#define UFS_QCOM_MCQ_CQD_OFFSET     0x5080
+#define UFS_QCOM_MCQ_SQIS_OFFSET    0x5040
+#define UFS_QCOM_MCQ_CQIS_OFFSET    0x50C0
+#define UFS_QCOM_MCQ_STRIDE         0x100
+
+/* Calculated doorbell address offsets (relative to mmio_base) */
+#define UFS_QCOM_SQD_ADDR_OFFSET    (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_SQD_OFFSET)
+#define UFS_QCOM_CQD_ADDR_OFFSET    (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_CQD_OFFSET)
+#define UFS_QCOM_SQIS_ADDR_OFFSET   (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_SQIS_OFFSET)
+#define UFS_QCOM_CQIS_ADDR_OFFSET   (UFS_QCOM_MCQ_CONFIG_OFFSET + UFS_QCOM_MCQ_CQIS_OFFSET)
+
+#define REG_UFS_MCQ_STRIDE          UFS_QCOM_MCQ_STRIDE
+
 /* QCOM UFS host controller vendor specific registers */
 enum {
 	REG_UFS_SYS1CLK_1US                 = 0xC0,
@@ -96,7 +115,7 @@ enum {
 };
 
 enum {
-	UFS_MEM_CQIS_VS		= 0x8,
+	UFS_MEM_CQIS_VS		= 0x4008,
 };
 
 #define UFS_CNTLR_2_x_x_VEN_REGS_OFFSET(x)	(0x000 + x)
-- 
2.50.1


