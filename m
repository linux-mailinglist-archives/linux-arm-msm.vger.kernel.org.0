Return-Path: <linux-arm-msm+bounces-71741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3D6B41726
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E083A17C0AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:48:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E8AA2E175F;
	Wed,  3 Sep 2025 07:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gTvYA1pE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CBE2D8387;
	Wed,  3 Sep 2025 07:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885710; cv=none; b=iBB+TWhWogNjZXQZwLUR1YCg75+PHbPRg61KfeZK+ux2HmNLhQJ5N7LGvQBt3LpM46+xmSd0+wmmRbm6a95AgLD5X6uw+KKNkK922LRCZlCbfmyJ8zpXfx2eMmsI9B0VH4mgYMDm5/A0vTgWtlaHEPddHNUdAOJnXCb1c7fe618=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885710; c=relaxed/simple;
	bh=w1XilPzLEUSfji61HB87PTYTwIgQUse/Ec80TcNkpIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WToCacSUMzuWE01kcgT75LIWYzFAd/3tMkJAnOZEW589mK3J8fMz4eEo6EVB1RmsUtewWGQ26oNOvkqxuTJQBPR4T1blPPfZW4+zYIlB62Lomz2+vNCfLXIVYmk7gMrX+q/SyRYjQ89himyRlhzAeKPtAuK6nbgBtrOgB0bkXLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gTvYA1pE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5831i2lM020050;
	Wed, 3 Sep 2025 07:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jse0dLypAG6
	ayJqC+gB+wPari5DeAXIspJcLpt6u614=; b=gTvYA1pEHCK7ryQnaoPCHLK1qS0
	hYBFSK3n7I+4DZ7/cBN11HWVvA9menBTbh6KPLHSAk7YI8kUpZEmzJbvr3uODy0g
	vZFWFPWvJPY1hkeqFy+U0zg1KarQmiBm/cR/dQgHenVtB8yHM34U1JrqyiRVn2pK
	foM19Om9287DZn8iAPHGlZR4bAknpW7DCKAaYm5nKPiSAHrgQQfuvkBOi925MIcX
	iV5P2FEqmkDLF8GpOctlKEp2D9//7J0YW6RAAjZMZZtrKrliNeJ6cZRTbOvBw+J5
	CXSSpaD0hGhJAl/BDs6qaOs8V0Bn6GUk4d0zFVcCPVGB4nBCP+ufbaD2LNg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48urw02qst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Sep 2025 07:48:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5837mIv2002093;
	Wed, 3 Sep 2025 07:48:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 48utcm5cy3-1;
	Wed, 03 Sep 2025 07:48:18 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5837mHEA002083;
	Wed, 3 Sep 2025 07:48:18 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 5837mHWI002077;
	Wed, 03 Sep 2025 07:48:17 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 3436E602767; Wed,  3 Sep 2025 13:18:17 +0530 (+0530)
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com
Cc: krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Subject: [PATCH V4 1/2] ufs: ufs-qcom: Streamline UFS MCQ resource mapping
Date: Wed,  3 Sep 2025 13:18:14 +0530
Message-ID: <20250903074815.8176-2-nitin.rawat@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com>
References: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CqUtcbAOeDa05p9hiQ6j8aoaiufzxf2Z
X-Proofpoint-ORIG-GUID: CqUtcbAOeDa05p9hiQ6j8aoaiufzxf2Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyNyBTYWx0ZWRfX4uC9ehRPSBUT
 K09Ke0mL7QT5v74UgHa85uQP8pQxtvkom9sHW9ea5Nnv7i3maaEsD1T/VR351tDWqmhas9PKWsE
 GFmhiPhflMuJK1qqWR5+g5MdMWmOMnXEnvJX4DqPRRRrf8G3noYcuQmVPpVz/wawi+zycGNpio0
 u5TJPS+CSzs8hCJioMSRZligZNWwem8yF57O04C8+kZUBrTlE9KwsgDwVsPR2P+o6+zMRHGmVd1
 5KzZ48lR9I8RLq1GlM+kOaz93fjAYDGY8WlAUQt5By+mFinKzvukLegH2kr7irDG5GSMlyicY07
 k0zM5sA0aIzj2EQ0o5spqJN/ajwrwl5xYjfQyerfzIHXBHfmmSBxh5pgoWo6W1hW8C/X6j3dsg3
 qU6yigE9
X-Authority-Analysis: v=2.4 cv=NrDRc9dJ c=1 sm=1 tr=0 ts=68b7f2c5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=SDEZs4RMqE_WqPO6PPEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300027

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

The change aligns the driver implementation with the device tree
binding specification, which defines a single 'mcq' memory region
rather than multiple separate regions.

Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 140 ++++++++++++------------------------
 drivers/ufs/host/ufs-qcom.h |  26 +++++--
 2 files changed, 66 insertions(+), 100 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 9574fdc2bb0f..1383538b1ed8 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1910,116 +1910,68 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
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
+	struct resource *res;

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
+	/* Map the MCQ configuration region */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "mcq");
+	if (!res) {
+		dev_err(hba->dev, "MCQ resource not found in device tree\n");
+		return -ENODEV;
 	}

-	res->base = devm_ioremap_resource(hba->dev, res_mcq);
-	if (IS_ERR(res->base)) {
-		dev_err(hba->dev, "MCQ registers mapping failed, err=%d\n",
-			(int)PTR_ERR(res->base));
-		ret = PTR_ERR(res->base);
-		goto ioremap_err;
+	hba->mcq_base = devm_ioremap_resource(hba->dev, res);
+	if (IS_ERR(hba->mcq_base)) {
+		dev_err(hba->dev, "Failed to map MCQ region: %ld\n",
+			PTR_ERR(hba->mcq_base));
+		return PTR_ERR(hba->mcq_base);
 	}

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

-	if (!mem_res->base || !sqdao_res->base)
-		return -EINVAL;
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
@@ -2034,12 +1986,8 @@ static int ufs_qcom_get_hba_mac(struct ufs_hba *hba)
 static int ufs_qcom_get_outstanding_cqs(struct ufs_hba *hba,
 					unsigned long *ocqs)
 {
-	struct ufshcd_res_info *mcq_vs_res = &hba->res[RES_MCQ_VS];
-
-	if (!mcq_vs_res->base)
-		return -EINVAL;
-
-	*ocqs = readl(mcq_vs_res->base + UFS_MEM_CQIS_VS);
+	/* Read from MCQ vendor-specific register in MCQ region */
+	*ocqs = readl(hba->mcq_base + UFS_MEM_CQIS_VS);

 	return 0;
 }
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index e0e129af7c16..25552c65eded 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -33,6 +33,28 @@
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
+#define REG_UFS_MCQ_STRIDE          UFS_QCOM_MCQ_STRIDE
+
+/* MCQ Vendor specific address offsets (relative to MCQ_CONFIG_BASE) */
+#define UFS_MEM_VS_BASE 0x4000
+#define UFS_MEM_CQIS_VS 0x4008
+
 /* QCOM UFS host controller vendor specific registers */
 enum {
 	REG_UFS_SYS1CLK_1US                 = 0xC0,
@@ -95,10 +117,6 @@ enum {
 	REG_UFS_SW_H8_EXIT_CNT			= 0x2710,
 };

-enum {
-	UFS_MEM_CQIS_VS		= 0x8,
-};
-
 #define UFS_CNTLR_2_x_x_VEN_REGS_OFFSET(x)	(0x000 + x)
 #define UFS_CNTLR_3_x_x_VEN_REGS_OFFSET(x)	(0x400 + x)

--
2.50.1


