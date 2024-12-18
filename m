Return-Path: <linux-arm-msm+bounces-42687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C039F69AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 16:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CB8627A317F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 15:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C4D1DF27F;
	Wed, 18 Dec 2024 15:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NT6+IU9/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161311D5CD1;
	Wed, 18 Dec 2024 15:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734534736; cv=none; b=hLKBrrh83N8oMddkRV7ytattK902JIULdmPeUOE+WuxJ9eJykWI2GpweQUYhtt+WMW5XWOhQA/LYm6uZ/olXzgh9zUxTXJRqCxajVxn9I4pLCL/SyU7aSBJkgot94U0nQz0Wkk3SxlL0x3Dui+FGCKCKah992T2as7nBbp3Gzl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734534736; c=relaxed/simple;
	bh=p5cMFkJ9gRwZ5AgewC9tDBzzEnQZ2muN1IqKlnZYyUU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HzWBDJHpXEMu95sDemIDa5Br/1fSbnvr4z+sA3rwmAsp4B/fPqyGj/PPosuGDy6uPu3Tc4qsvn+cXLKY7v261y1sv1+KeSkTvDdZgEqPIk5hjYlMwnnVbmljIrLkCIBytkMj6PB3tLzOSN+RUUZTLlNAbG6v2SUi0jDIcCNN2Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NT6+IU9/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BICNRsn031095;
	Wed, 18 Dec 2024 15:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vXWeOLufzG6qOho9GXBHZD
	hZfPWfGghhkoCfsJN4o2Y=; b=NT6+IU9/ZBXKnawvYFd9BbarVrcxzd9hNCs/C+
	yhM68UcyaNYQ3GLPeC4pMSZ0XaFZ0XXvsEUtTJ2O6o3UFGj3xDmtZ55a0GHOepOy
	FLb5cvcaOEC7jxt7v+YO0Ko/OmpLlS6Ms+Qkqlt7WglyMdWChMFiv0S0WTGfxRf/
	8yxbG7ZAH9kHNVCR0y5bUH3POhhohIfT/pYjzgbBci2gP8Ric8UMa7OL8gIa1Pcw
	3vcJrZxb2LMj0Hmu9HTDWwNGLo1TBuGx4CicRN1KwdTeuvD32kUOTyL4w0+Ew8gf
	x5W6MNidVvYA7n8sD55g2xgh4izhDc9Zc3aWZlSpa7T+MTCg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43kxby8ej3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 15:11:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BIFBtfE027582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 15:11:55 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 07:11:51 -0800
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>, <bvanassche@acm.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V4] scsi: ufs: qcom: Enable UFS Shared ICE Feature
Date: Wed, 18 Dec 2024 20:41:17 +0530
Message-ID: <20241218151118.18683-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.47.1
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
X-Proofpoint-GUID: 0dyS3F0XqluTWaZAhawv9uF6AxDxEMBK
X-Proofpoint-ORIG-GUID: 0dyS3F0XqluTWaZAhawv9uF6AxDxEMBK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180118

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
 drivers/ufs/host/ufs-qcom.c | 36 +++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h | 45 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 68040b2ab5f8..9bcfb40e9993 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -105,6 +105,25 @@ static struct ufs_qcom_host *rcdev_to_ufs_host(struct reset_controller_dev *rcd)
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
+	uint8_t val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
+	u32 config;
+
+	if (!is_ice_config_supported(host))
+		return;
+
+	config = val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24);
+
+	ufshcd_writel(hba, ICE_ALLOCATOR_TYPE, REG_UFS_MEM_ICE_CONFIG);
+	ufshcd_writel(hba, config, REG_UFS_MEM_ICE_NUM_CORE);
+}
 
 static inline void ufs_qcom_ice_enable(struct ufs_qcom_host *host)
 {
@@ -196,6 +215,11 @@ static inline int ufs_qcom_ice_suspend(struct ufs_qcom_host *host)
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
@@ -435,6 +459,8 @@ static int ufs_qcom_hce_enable_notify(struct ufs_hba *hba,
 		err = ufs_qcom_enable_lane_clks(host);
 		break;
 	case POST_CHANGE:
+		ufs_qcom_config_ice_allocator(host);
+
 		/* check if UFS PHY moved from DISABLED to HIBERN8 */
 		err = ufs_qcom_check_hibern8(hba);
 		ufs_qcom_enable_hw_clk_gating(hba);
@@ -932,6 +958,14 @@ static void ufs_qcom_set_host_params(struct ufs_hba *hba)
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
@@ -940,6 +974,8 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
 	hba->caps |= UFSHCD_CAP_WB_EN;
 	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
+
+	ufs_qcom_set_host_caps(hba);
 }
 
 /**
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index b9de170983c9..b59d18bebd00 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -196,7 +196,8 @@ struct ufs_qcom_host {
 #ifdef CONFIG_SCSI_UFS_CRYPTO
 	struct qcom_ice *ice;
 #endif
-
+	#define UFS_QCOM_CAP_ICE_CONFIG BIT(0)
+	u32 caps;
 	void __iomem *dev_ref_clk_ctrl_mmio;
 	bool is_dev_ref_clk_enabled;
 	struct ufs_hw_version hw_ver;
@@ -226,6 +227,48 @@ ufs_qcom_get_debug_reg_offset(struct ufs_qcom_host *host, u32 reg)
 	return UFS_CNTLR_3_x_x_VEN_REGS_OFFSET(reg);
 };
 
+#ifdef CONFIG_SCSI_UFS_CRYPTO
+static inline bool is_ice_config_supported(struct ufs_qcom_host *host)
+{
+	return (host->caps & UFS_QCOM_CAP_ICE_CONFIG);
+}
+
+/* ICE configuration to share AES engines among TX stream and RX stream */
+#define ICE_ALLOCATOR_TYPE 2
+#define REG_UFS_MEM_ICE_CONFIG 0x260C
+#define REG_UFS_MEM_ICE_NUM_CORE  0x2664
+
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
+#endif /* UFS_CRYPTO */
+
 #define ufs_qcom_is_link_off(hba) ufshcd_is_link_off(hba)
 #define ufs_qcom_is_link_active(hba) ufshcd_is_link_active(hba)
 #define ufs_qcom_is_link_hibern8(hba) ufshcd_is_link_hibern8(hba)
-- 
2.47.1


