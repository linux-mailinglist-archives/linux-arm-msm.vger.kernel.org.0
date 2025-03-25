Return-Path: <linux-arm-msm+bounces-52435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BD6A6EBD3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 09:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BBE43A3302
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 08:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8EB62528FC;
	Tue, 25 Mar 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aZlDzCHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A8919E992;
	Tue, 25 Mar 2025 08:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742891982; cv=none; b=eQOItM37n4SY5scb3c7PvTABJA8apw/Nq/KMD5AtmMKTu191S1tE6tf63PpelfoSasBnuJyRsIUzthiQ7Ic3veimHrwhbhRX0/Nm9KwNq4R09OTUyt/daVNjSv822E3a1Q0Kn58ommTBrFQRcEvi68aE3yhT91JxSkngpb8Rj7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742891982; c=relaxed/simple;
	bh=OmsYjY5yuhog3AUO6eeJw3B07AToPwLvInl+g+pvIZ0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=go+FiZ+NkLbdexH5PrQlZeexV4y+93J6XVFTnYs0tHTFf78KQDSrWchTw4iPWlwwR2Phh/ETSK/aT6mmIBgehaBB+xHTAKioz0jHcXlHncYMwqiF3lYUWzeqQPmrIa63Du4PCoVqOYoqScaA73k3Cu0Cpllh5njkXtnIxUzROHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aZlDzCHT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52P5vvB1028794;
	Tue, 25 Mar 2025 08:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LnyKN1FXX0n2F6kcn6I7q4
	W3dNCz4sZ65CQJxKde9v0=; b=aZlDzCHTli9Pqebk2MhRflYq0e80Bjc3Qfy3w+
	ur2k8tjqsVDYI69UwRU+tc6FPd+zrpmJkyWUyrW2AzKJ2z5B07CMdyQamx+AOk2w
	I9QNYNc680Ymdw4Wlv1Nm3yWjsLavsHFyC9737LYi2rWYImPdXA5b2GvQp7iZKnA
	fXFxG5CFOpnt17KkLiVudcC9erjnNMtss19+gtd+Tv75R/WcbxdvywQHjHWzQuVQ
	sdYXAxSEhsEIW8/4hrYX//AFpXxNAymUBS4KuBOVF8/ca/M3iwQIYFpEGzbbl/Kz
	YfidWffZGcPA9ER3EGYfcoSjwJQbXuS5CEV7OYa3WN+3ym3g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hnyjexe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 08:39:21 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52P8dK9q008193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Mar 2025 08:39:20 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Mar 2025 01:39:17 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH] ufs: qcom: Add quirks for Samsung UFS devices
Date: Tue, 25 Mar 2025 14:08:57 +0530
Message-ID: <20250325083857.23653-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ybu95xRf c=1 sm=1 tr=0 ts=67e26bb9 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=2mOWynu0rIHtPa3Sm6gA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: zHxHOdfM0N1b--pvNzZK9vovEic5AHDq
X-Proofpoint-ORIG-GUID: zHxHOdfM0N1b--pvNzZK9vovEic5AHDq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_03,2025-03-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 lowpriorityscore=0 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250059

Introduce quirks for Samsung UFS devices to override PA hibern8 time,
PA TX HSG1 sync length, and TX_HS_EQUALIZER for the Qualcomm UFS Host
controller. These adjustments are essential to maintain the proper
functionality of Samsung UFS devices for Qualcomm UFS Host controller.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 66 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h | 25 +++++++++++++-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 23b9f6efa047..18ac687bc4ba 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -31,6 +31,10 @@
 	((((c) >> 16) & MCQ_QCFGPTR_MASK) * MCQ_QCFGPTR_UNIT)
 #define MCQ_QCFG_SIZE	0x40
 
+/* De-emphasis for gear-5 */
+#define DEEMPHASIS_3_5_dB	0x04
+#define NO_DEEMPHASIS		0x0
+
 enum {
 	TSTBUS_UAWM,
 	TSTBUS_UARM,
@@ -778,6 +782,24 @@ static int ufs_qcom_icc_update_bw(struct ufs_qcom_host *host)
 	return ufs_qcom_icc_set_bw(host, bw_table.mem_bw, bw_table.cfg_bw);
 }
 
+static void ufs_qcom_set_tx_hs_equalizer(struct ufs_hba *hba,
+				u32 gear, u32 tx_lanes)
+{
+	u32 equalizer_val;
+	int ret, i;
+
+	/* Determine the equalizer value based on the gear */
+	equalizer_val = (gear == 5) ? DEEMPHASIS_3_5_dB : NO_DEEMPHASIS;
+
+	for (i = 0; i < tx_lanes; i++) {
+		ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(TX_HS_EQUALIZER, i),
+					equalizer_val);
+		if (ret)
+			dev_err(hba->dev, "%s: failed equalizer lane %d\n",
+					__func__, i);
+	}
+}
+
 static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status status,
 				struct ufs_pa_layer_attr *dev_max_params,
@@ -829,6 +851,10 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 						dev_req_params->gear_tx,
 						PA_INITIAL_ADAPT);
 		}
+
+		if (hba->dev_quirks & UFS_DEVICE_QUIRK_PA_TX_DEEMPHASIS_TUNING)
+			ufs_qcom_set_tx_hs_equalizer(hba,
+				dev_req_params->gear_tx, dev_req_params->lane_tx);
 		break;
 	case POST_CHANGE:
 		if (ufs_qcom_cfg_timers(hba, dev_req_params->gear_rx,
@@ -878,6 +904,35 @@ static int ufs_qcom_quirk_host_pa_saveconfigtime(struct ufs_hba *hba)
 			    (pa_vs_config_reg1 | (1 << 12)));
 }
 
+static void ufs_qcom_override_pa_h8time(struct ufs_hba *hba)
+{
+	u32 pa_h8time = 0;
+	int ret;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
+				&pa_h8time);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get PA_HIBERN8TIME: %d\n", ret);
+		return;
+	}
+
+	 /* Increment by 1 to increase hibernation time by 100 µs */
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_HIBERN8TIME),
+				pa_h8time + 1);
+	if (ret)
+		dev_err(hba->dev, "Failed updating PA_HIBERN8TIME: %d\n", ret);
+}
+
+static void ufs_qcom_override_pa_tx_hsg1_sync_len(struct ufs_hba *hba)
+{
+	int err;
+
+	err = ufshcd_dme_peer_set(hba, UIC_ARG_MIB(PA_TX_HSG1_SYNC_LENGTH),
+					PA_TX_HSG1_SYNC_LENGTH_VAL);
+	if (err)
+		dev_err(hba->dev, "Failed (%d) set PA_TX_HSG1_SYNC_LENGTH\n", err);
+}
+
 static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 {
 	int err = 0;
@@ -885,6 +940,12 @@ static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 	if (hba->dev_quirks & UFS_DEVICE_QUIRK_HOST_PA_SAVECONFIGTIME)
 		err = ufs_qcom_quirk_host_pa_saveconfigtime(hba);
 
+	if (hba->dev_quirks & UFS_DEVICE_QUIRK_PA_HIBER8TIME)
+		ufs_qcom_override_pa_h8time(hba);
+
+	if (hba->dev_quirks & UFS_DEVICE_QUIRK_PA_TX_HSG1_SYNC_LENGTH)
+		ufs_qcom_override_pa_tx_hsg1_sync_len(hba);
+
 	return err;
 }
 
@@ -899,6 +960,11 @@ static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
 	{ .wmanufacturerid = UFS_VENDOR_WDC,
 	  .model = UFS_ANY_MODEL,
 	  .quirk = UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE },
+	{ .wmanufacturerid = UFS_VENDOR_SAMSUNG,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_PA_HIBER8TIME |
+		   UFS_DEVICE_QUIRK_PA_TX_HSG1_SYNC_LENGTH |
+		   UFS_DEVICE_QUIRK_PA_TX_DEEMPHASIS_TUNING },
 	{}
 };
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 919f53682beb..43274de24706 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -116,8 +116,11 @@ enum {
 				 TMRLUT_HW_CGC_EN | OCSC_HW_CGC_EN)
 
 /* QUniPro Vendor specific attributes */
+#define PA_TX_HSG1_SYNC_LENGTH	0x1552
 #define PA_VS_CONFIG_REG1	0x9000
 #define DME_VS_CORE_CLK_CTRL	0xD002
+#define TX_HS_EQUALIZER		0x0037
+
 /* bit and mask definitions for DME_VS_CORE_CLK_CTRL attribute */
 #define CLK_1US_CYCLES_MASK_V4				GENMASK(27, 16)
 #define CLK_1US_CYCLES_MASK				GENMASK(7, 0)
@@ -125,7 +128,6 @@ enum {
 #define PA_VS_CORE_CLK_40NS_CYCLES			0x9007
 #define PA_VS_CORE_CLK_40NS_CYCLES_MASK			GENMASK(6, 0)
 
-
 /* QCOM UFS host controller core clk frequencies */
 #define UNIPRO_CORE_CLK_FREQ_37_5_MHZ          38
 #define UNIPRO_CORE_CLK_FREQ_75_MHZ            75
@@ -135,6 +137,27 @@ enum {
 #define UNIPRO_CORE_CLK_FREQ_201_5_MHZ         202
 #define UNIPRO_CORE_CLK_FREQ_403_MHZ           403
 
+/* TX_HSG1_SYNC_LENGTH attr value */
+#define PA_TX_HSG1_SYNC_LENGTH_VAL	0x4A
+
+/*
+ * Some ufs devices may need more time to be in hibern8 before exiting.
+ * Enable this quirk to give it an additional 100us.
+ */
+#define UFS_DEVICE_QUIRK_PA_HIBER8TIME          (1 << 15)
+
+/*
+ * Some ufs device vendors need a different TSync length.
+ * Enable this quirk to give an additional TX_HS_SYNC_LENGTH.
+ */
+#define UFS_DEVICE_QUIRK_PA_TX_HSG1_SYNC_LENGTH (1 << 16)
+
+/*
+ * Some ufs device vendors need a different Deemphasis setting.
+ * Enable this quirk to tune TX Deemphasis parameters.
+ */
+#define UFS_DEVICE_QUIRK_PA_TX_DEEMPHASIS_TUNING (1 << 17)
+
 static inline void
 ufs_qcom_get_controller_revision(struct ufs_hba *hba,
 				 u8 *major, u16 *minor, u16 *step)
-- 
2.17.1


