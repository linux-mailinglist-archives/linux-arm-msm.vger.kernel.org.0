Return-Path: <linux-arm-msm+bounces-44516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D44A06E96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 08:04:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7865E167A6C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 07:04:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8971A0BFB;
	Thu,  9 Jan 2025 07:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Y+ctwC3A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2374337160;
	Thu,  9 Jan 2025 07:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736406281; cv=none; b=ptKMljZAXpxIjnmZn0j1S0tJ2q7czz/pucrKe2pHo/67UYN0Q/jJQAyZfr27blpzVgW42SyXyxzLY246bZZ2fbk/GwTjNP0M4mSyrXwr30DMipa3DonXYZyvq7nueBYwI5T67nP50hoD1i2fZF5GIAxx+QxBc/HHdbxP4qoMK+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736406281; c=relaxed/simple;
	bh=woxLb+0wS3wxExOB7T3NnE6qpa7rQS3ayiDLRdK1yAc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=k3mRj2wksGOJjdXSmG3j2CauOK5mkuj4OVwLBHmVHvJGbqMQ7agUzoj6L7RPV52FpDoU57gcgO6Ggg2WhSdn9kLfQV/xuEz6QTO2F7UwAuH8AqNgWuXUTA4xlspCQertcgC5tapsxIx0b46cYJmgiN3EWzLLL7BHyJ6OsX1P4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Y+ctwC3A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5095mFku027056;
	Thu, 9 Jan 2025 07:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pcrTEpBzuUwh+gwvERwnV+
	KFAfwJkshMP3aWngGtrL8=; b=Y+ctwC3AKEsCLDMeg6Z97sWfUnCO1VuVcqmYD6
	AlIL/w98Hs/753ryXMyGLtSbBR4HD9Lze7QZIZONR+6a9IBrO6JZY6oTV5z0NWKG
	yE398VR3COezGliiEGBCp3yOc7rUjipohlc3ylJNHI7h/iY2cNAvTAWhFtzQapt6
	2Y0fukxSmE7dIIKXWqocHN79/Rv2lL+BE14znXfpGsnoaXv5kQCTpsz52ANFBFJR
	006t4ejW2BllWXy9jOS79RZp0zfVeEiSyzun4fJxgOlgM7cZC57ihMPOe70T2lLZ
	8hCZJEaXllJ616j3tZCPO/ngWTKGgOyNEf5PYMZTi+Ux+n4Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4428mf859q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 07:04:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 509747v4003765
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 07:04:07 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 23:04:04 -0800
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>, <bvanassche@acm.org>, <ebiggers@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V10] scsi: ufs: qcom: Enable UFS Shared ICE Feature
Date: Thu, 9 Jan 2025 12:33:52 +0530
Message-ID: <20250109070352.8801-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bWFoh0cpvBMnribOXRtAO7DIs7fLafWI
X-Proofpoint-ORIG-GUID: bWFoh0cpvBMnribOXRtAO7DIs7fLafWI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501090056

By default, the UFS controller allocates a fixed number of RX
and TX engines statically. Consequently, when UFS reads are in
progress, the TX ICE engines remain idle, and vice versa.
This leads to inefficient utilization of RX and TX engines.

To address this limitation, enable the UFS shared ICE feature for
Qualcomm UFS V5.0 and above. This feature utilizes a pool of crypto
cores for both TX streams (UFS Write – Encryption) and RX streams
(UFS Read – Decryption). With this approach, crypto cores are
dynamically allocated to either the RX or TX stream as needed.

Co-developed-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
---
Changes from v9:
1. Addressed Manivannan's comment to pair ufs_qcom_config_ice_allocator
   with ufs_qcom_ice_enable.
2. Addressed Manivannan's comment to avoid guarding the definitions.
3. Addressed Manivannan's comment to align bit definitions.
2. Addressed Manivannan's comment to use enum for register definitions.

Changes from v8:
1. Addressed Manivannan's comment to call ufs_qcom_config_ice_allocator()
   from ufs_qcom_ice_enable().
2. Addressed Manivannan's comment to place UFS_QCOM_CAP_ICE_CONFIG
   definition outside of the ufs_qcom_host struct.
3. Addressed Manivannan's comment to align ICE definitions with
   other definitions.

Changes from v7:
1. Addressed Eric's comment to perform ice configuration only if
   UFSHCD_CAP_CRYPTO is enabled.
 
Changes from v6: 
1. Addressed Eric's comment to replace is_ice_config_supported() helper
   function with a conditional check for UFS_QCOM_CAP_ICE_CONFIG.

Changes from v5: 
1. Addressed Bart's comment to declare the "val" variable with
   the "static" keyword.

Changes from v4:
1. Addressed Bart's comment to use get_unaligned_le32() instead of
   bit shifting and to declare val with the const keyword.

Changes from v3:
1. Addressed Bart's comment to change the data type of "config" to u32
   and "val" to uint8_t.

Changes from v2:
1. Refactored the code to have a single algorithm in the code and
enabled by default.
2. Revised the commit message to incorporate the refactored change.
3. Qcom host capabilities are now enabled in a separate function.

Changes from v1:
1. Addressed Rob's and Krzysztof's comment to fix dt binding compilation
   issue.
2. Addressed Rob's comment to enable the nodes in example.
3. Addressed Eric's comment to rephrase patch commit description.
   Used terminology as ICE allocator instead of ICE algorithm.
4. Addressed Christophe's comment to align the comment as per kernel doc.
---
 drivers/ufs/host/ufs-qcom.c | 37 ++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h | 42 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 68040b2ab5f8..83bf156eb171 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -15,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset-controller.h>
 #include <linux/time.h>
+#include <linux/unaligned.h>
 
 #include <soc/qcom/ice.h>
 
@@ -105,6 +106,26 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
 }
 
 #ifdef CONFIG_SCSI_UFS_CRYPTO
+/**
+ * ufs_qcom_config_ice_allocator() - ICE core allocator configuration
+ *
+ * @host: pointer to qcom specific variant structure.
+ */
+static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
+{
+	struct ufs_hba *hba = host->hba;
+	static const uint8_t val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
+	u32 config;
+
+	if (!(host->caps & UFS_QCOM_CAP_ICE_CONFIG) ||
+			!(host->hba->caps & UFSHCD_CAP_CRYPTO))
+		return;
+
+	config = get_unaligned_le32(val);
+
+	ufshcd_writel(hba, ICE_ALLOCATOR_TYPE, REG_UFS_MEM_ICE_CONFIG);
+	ufshcd_writel(hba, config, REG_UFS_MEM_ICE_NUM_CORE);
+}
 
 static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
@@ -196,6 +217,11 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
 {
 	return 0;
 }
+
+static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
+{
+}
+
 #endif
 
 static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
@@ -439,6 +465,7 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 		err = ufs_qcom_check_hibern8(hba);
 		ufs_qcom_enable_hw_clk_gating(hba);
 		ufs_qcom_ice_enable(host);
+		ufs_qcom_config_ice_allocator(host);
 		break;
 	default:
 		dev_err(hba->dev, "%s: invalid status %d\n", __func__, status);
@@ -932,6 +959,14 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
 	host_params->hs_tx_gear = host_params->hs_rx_gear = ufs_qcom_get_hs_gear(hba);
 }
 
+static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
+	if (host->hw_ver.major >= 0x5)
+		host->caps |= UFS_QCOM_CAP_ICE_CONFIG;
+}
+
 static void ufs_qcom_set_caps(struct ufs_hba *hba)
 {
 	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
@@ -940,6 +975,8 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
 	hba->caps |= UFSHCD_CAP_WB_EN;
 	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
+
+	ufs_qcom_set_host_caps(hba);
 }
 
 /**
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index b9de170983c9..2975a9e545fa 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -76,6 +76,12 @@ enum {
 	UFS_MEM_CQIS_VS		= 0x8,
 };
 
+/* QCOM UFS host controller Shared ICE registers */
+enum {
+	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
+	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
+};
+
 #define UFS_CNTLR_2_x_x_VEN_REGS_OFFSET(x)	(0x000 + x)
 #define UFS_CNTLR_3_x_x_VEN_REGS_OFFSET(x)	(0x400 + x)
 
@@ -110,6 +116,9 @@ enum {
 /* bit definition for UFS_UFS_TEST_BUS_CTRL_n */
 #define TEST_BUS_SUB_SEL_MASK	GENMASK(4, 0)  /* All XXX_SEL fields are 5 bits wide */
 
+/* bit definition for UFS Shared ICE config */
+#define UFS_QCOM_CAP_ICE_CONFIG BIT(0)
+
 #define REG_UFS_CFG2_CGC_EN_ALL (UAWM_HW_CGC_EN | UARM_HW_CGC_EN |\
 				 TXUC_HW_CGC_EN | RXUC_HW_CGC_EN |\
 				 DFC_HW_CGC_EN | TRLUT_HW_CGC_EN |\
@@ -135,6 +144,37 @@ enum {
 #define UNIPRO_CORE_CLK_FREQ_201_5_MHZ         202
 #define UNIPRO_CORE_CLK_FREQ_403_MHZ           403
 
+/* ICE allocator type to share AES engines among TX stream and RX stream */
+#define ICE_ALLOCATOR_TYPE 2
+
+/*
+ * Number of cores allocated for RX stream when Read data block received and
+ * Write data block is not in progress
+ */
+#define NUM_RX_R1W0 28
+
+/*
+ * Number of cores allocated for TX stream when Device asked to send write
+ * data block and Read data block is not in progress
+ */
+#define NUM_TX_R0W1 28
+
+/*
+ * Number of cores allocated for RX stream when Read data block received and
+ * Write data block is in progress
+ * OR
+ * Device asked to send write data block and Read data block is in progress
+ */
+#define NUM_RX_R1W1 15
+
+/*
+ * Number of cores allocated for TX stream (UFS write) when Read data block
+ * received and Write data block is in progress
+ * OR
+ * Device asked to send write data block and Read data block is in progress
+ */
+#define NUM_TX_R1W1 13
+
 static inline void
 ufs_qcom_get_controller_revision(struct ufs_hba *hba,
 				 u8 *major, u16 *minor, u16 *step)
@@ -196,7 +236,7 @@ struct ufs_qcom_host {
 #ifdef CONFIG_SCSI_UFS_CRYPTO
 	struct qcom_ice *ice;
 #endif
-
+	u32 caps;
 	void __iomem *dev_ref_clk_ctrl_mmio;
 	bool is_dev_ref_clk_enabled;
 	struct ufs_hw_version hw_ver;
-- 
2.47.1


