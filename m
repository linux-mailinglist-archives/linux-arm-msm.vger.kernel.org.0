Return-Path: <linux-arm-msm+bounces-42553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019F9F4E19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 15:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4265D189347D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 14:42:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FED1F5411;
	Tue, 17 Dec 2024 14:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gPBBvYfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72151F6667;
	Tue, 17 Dec 2024 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734446497; cv=none; b=JdSyUvz+R5P39uDk4EjglJ17O0ZEk3GAgfjowZpdLL+bMWGCwpB+UXlf64rihNqXoqIf4YzfdjiqspSl84M01cmPog4QmDoVvvg0wj9s8Nae0cfB4dugCGi6xytKSdQSUREDd6O0T+Jwy/jbz/5tpZhfdqJja/VgvSquC5alEBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734446497; c=relaxed/simple;
	bh=+m/8Fr5fZ5//R02G7uIa0aNtQI8MEh+z3EFaN5lwOxo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uZ+HyRoh5sZuWf3gxbzkCmmZE/8bHtwwAN6uxhFWYRPjbjSdGbH5KDpjT0uLOwdv0+LNQeQBhsf2a16HgYBJ4kRkjCRi1VRq2nW7Vk7flyM9yXCkW/Mgjvp1jZsHJv7el2DtTqVN6n8rrMZfnh5dxACnulq8zILmfxSVBCU5Mto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gPBBvYfE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH7sq8F003197;
	Tue, 17 Dec 2024 14:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RbAetlWVKEkBn1pzHug7Ej
	z3qNj28XlZjoBvIavHL7w=; b=gPBBvYfEhNVtjeKzDplwvhMKg4x+W6oMO4xGaw
	xeEpqFrdjjmIaLTYEc7HZjA6ZvIarxW59cVxnmTagv9kwuys0sXxnZ6sMHlNhDtH
	3wh5cDZBr714cohfwq4MYiDldOHX0xjqEfCLlkb5JajUwZAjnSXXnz8No8YCfn/k
	yDJOQ+6/g1uXQwMr/G1GRzo/PhV2FyRIuKXt42uYw0yWKZrzgAfYaQQxQq2Igp0D
	iIKjhW1ZztNGpX6D81I8wmT/GePx0YsevPUZyRpPSP08W1Z0y1vC/IQA36IDr+WH
	cGA93A5hqPo8Bdn1HX4XdPriwFqtYzdKjv6mGwNG6nK4YrYg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k5aw928x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 14:41:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHEfMHV023030
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 14:41:22 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 06:41:19 -0800
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>,
        <James.Bottomley@HansenPartnership.com>, <martin.petersen@oracle.com>,
        <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Naveen Kumar Goud Arepalli
	<quic_narepall@quicinc.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3] scsi: ufs: qcom: Enable UFS Shared ICE Feature
Date: Tue, 17 Dec 2024 20:10:59 +0530
Message-ID: <20241217144059.30693-1-quic_rdwivedi@quicinc.com>
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
X-Proofpoint-ORIG-GUID: mB8F4S1UlNlRQ9ek6vGxkQyDMK2Ygj2B
X-Proofpoint-GUID: mB8F4S1UlNlRQ9ek6vGxkQyDMK2Ygj2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170116

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
index 68040b2ab5f8..22985ea22e15 100644
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
+	unsigned int val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
+	unsigned int config;
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


