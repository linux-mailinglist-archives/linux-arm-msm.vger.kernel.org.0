Return-Path: <linux-arm-msm+bounces-46279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C898A1D960
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 16:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3264A7A2D9A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602591459F6;
	Mon, 27 Jan 2025 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ef8VFCvJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4DA6A33B;
	Mon, 27 Jan 2025 15:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737991191; cv=none; b=CmCEj2bCFU2QYaEG6Tvv6zILCH91QLjv9/HjI+PjT7hi4Sds/k3pG4D28WZ1DC9QiOEWMJBdsuqyetc3ap3DJIgPhQNn6U6FM42MYPceoFFVbr7fwR0kveTCSupw7dSde1uy3w6ppIPhyt3vDuuocmOkNTR2txoZzdLsPmgNKsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737991191; c=relaxed/simple;
	bh=DZwJFuM02wGQta47IJnvQuV2GJviniwkR+wf8MqeHbM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aEt+iywVpp7lHKfA929b3qcDttubsXWWEY0ve7zu7azBoQDR+kocNMyoGjx5rdxjYK9dXVdIVsdk7OJdx4T0nFDtrC9DskA4knLpmvLzp/vp8qGvyPhpH2DwKfVBOm9qMO9E4a4fVvu990z4xfmW5vsJNJxXozbfc3ExcHQffns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ef8VFCvJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RBh8m2018895;
	Mon, 27 Jan 2025 15:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+kd5POEy5XyVZuucBMkx+c
	4SRm/oK5oOeqH+9y2qR2M=; b=Ef8VFCvJsMceS3Qu4JRlaBCGFqNxZE3b5SOWm2
	SlVVUY/cdybxwBiEg1s84DNEb7LXohMm48R3LSjiusC8/nmKufmfcLCDfhEfQexd
	K73SRkhTuyWjs5nB1l567VrJMA2e13kkc7rQtRXtIpCUie2wZSHD3UUhketbguu+
	m4/VF9yyOHqDDWM/kNm/AjIH+WbUb7pW/Cob3yBjKmV15TnU7rfKOl/lb7erdqVr
	e3oDuHDnDNfPNcYuWuvo8tzsiyl/vpbL6SXwWv1L5Nc/DjK5VcsiYbGrGLuYlusB
	5rjg7LbyhujPDevolDUB7+wiVFLPLesdntb2yquATaWHnXjg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44e9h08cnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 15:18:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50RFITJa023993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 Jan 2025 15:18:29 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 27 Jan 2025 07:18:26 -0800
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>, <bvanassche@acm.org>, <ebiggers@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V11] scsi: ufs: qcom: Enable UFS Shared ICE Feature
Date: Mon, 27 Jan 2025 20:48:15 +0530
Message-ID: <20250127151815.6049-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T-BxqEii5PciNpwlDbzI8hXxNyMnccYI
X-Proofpoint-GUID: T-BxqEii5PciNpwlDbzI8hXxNyMnccYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_07,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270122

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
Changes from v10:
1. Addressed Manivannan's comment to align the shared ICE register
   definitions with the existing vendor-specific registers.

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
 drivers/ufs/host/ufs-qcom.c | 37 ++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h | 40 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

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
index b9de170983c9..d4241e6793d1 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -50,6 +50,10 @@ enum {
 	 */
 	UFS_AH8_CFG				= 0xFC,
 
+	/* bit definition for REG_UFS_MEM_ICE_CONFIG register */
+	REG_UFS_MEM_ICE_CONFIG			= 0x260C,
+	REG_UFS_MEM_ICE_NUM_CORE		= 0x2664,
+
 	REG_UFS_CFG3				= 0x271C,
 
 	REG_UFS_DEBUG_SPARE_CFG			= 0x284C,
@@ -110,6 +114,9 @@ enum {
 /* bit definition for UFS_UFS_TEST_BUS_CTRL_n */
 #define TEST_BUS_SUB_SEL_MASK	GENMASK(4, 0)  /* All XXX_SEL fields are 5 bits wide */
 
+/* bit definition for UFS Shared ICE config */
+#define UFS_QCOM_CAP_ICE_CONFIG BIT(0)
+
 #define REG_UFS_CFG2_CGC_EN_ALL (UAWM_HW_CGC_EN | UARM_HW_CGC_EN |\
 				 TXUC_HW_CGC_EN | RXUC_HW_CGC_EN |\
 				 DFC_HW_CGC_EN | TRLUT_HW_CGC_EN |\
@@ -135,6 +142,37 @@ enum {
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
@@ -196,7 +234,7 @@ struct ufs_qcom_host {
 #ifdef CONFIG_SCSI_UFS_CRYPTO
 	struct qcom_ice *ice;
 #endif
-
+	u32 caps;
 	void __iomem *dev_ref_clk_ctrl_mmio;
 	bool is_dev_ref_clk_enabled;
 	struct ufs_hw_version hw_ver;
-- 
2.48.0


