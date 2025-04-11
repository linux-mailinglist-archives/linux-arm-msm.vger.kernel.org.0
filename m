Return-Path: <linux-arm-msm+bounces-54021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F3BA85CE3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:22:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE2CA1B837CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C0F29C32E;
	Fri, 11 Apr 2025 12:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zg9HIszb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14E429C32B;
	Fri, 11 Apr 2025 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373830; cv=none; b=VxEuMncBDrt6l0f2M7nHUSEmYF/p830pH4GtmfjSJ+f8Neh+N7Pp4deg6yJPR79KCJvaItAD8AsvaB2zNPwXiLhv2Dbbj1YiKZxd4oEP6q8i5uegfj7gXtRy6wMbW3rV501BHeCeH0FI+CkSwIhlpLY5NjVDrm5koeGF/LgnZxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373830; c=relaxed/simple;
	bh=PnNFaiyIiZJFpEUGCU6B2upUjQ3L9Ce3X5ferNt2g5w=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FsJ7zghlVX4BrwBf2OY7B1RTH2LvwrvrLMN+oMgU4hfS4yGmgVqPbsJBv0wUR0LnB/0uZ0itYvyKtPtL9QuH6R/gL+dQQlQEcm0sYSGSXepQZFuYmDrRtQNDNqy6yFwYsGVe6pdNFdylX1SeDGw/jIOhSP32b0xP/sSN3mNcEnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zg9HIszb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5unId000645;
	Fri, 11 Apr 2025 12:16:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JF7DXAMxM4EpXnXwSJVdes8D
	EHGSJLEYO81SLRsGS9Y=; b=Zg9HIszbEJVqfYXfbaCuX+ELaNKnweTeLKa35iM3
	rZmEBOaQY43NW1tIMrWgcLoS+eEOV2mChjCRUBnSy9cGkmxvJNnuJr/7YusSggXv
	tP0Uv9UD+V3UrGhy341bz3GAuequfeJ2pgiPvICyqJCBXQglP6dEC/cFCdkmVw5O
	NJAku51DXaJBWGV20UCOCEmhty0tVGCqobog8kT1S1dBuMSlP+v3xsfu1xNrQGLS
	RbG5sVz2qkZBTVVPBY2Hn2cVztdSDDsT0DFc4ev7KDB3icmCvB69hvtsFWVh7V9y
	By7zim6+kOv5DadqNuUdKHMJ7axgiNygKL7/jF8LHTE52Q==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd32a67-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:16:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BCGlsg026695
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:16:47 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 05:16:43 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K.
 Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
Subject: [PATCH V3 1/2] ufs: qcom: Add quirks for Samsung UFS devices
Date: Fri, 11 Apr 2025 17:46:29 +0530
Message-ID: <20250411121630.21330-2-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250411121630.21330-1-quic_mapa@quicinc.com>
References: <20250411121630.21330-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HfqIAmym3niKlWZaRtUKaJDjq6TPW0PL
X-Proofpoint-GUID: HfqIAmym3niKlWZaRtUKaJDjq6TPW0PL
X-Authority-Analysis: v=2.4 cv=NaLm13D4 c=1 sm=1 tr=0 ts=67f90830 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=bBPHcGj29vumQh2tsuEA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110078

Introduce quirks for Samsung UFS devices to adjust PA TX HSG1 sync length
and TX_HS_EQUALIZER settings on the Qualcomm UFS Host controller. This
ensures proper functionality of Samsung UFS devices with the Qualcomm
UFS Host controller.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 43 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h | 18 ++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 4c05b2dbe231..77f8ddb1f207 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -33,6 +33,10 @@
 	((((c) >> 16) & MCQ_QCFGPTR_MASK) * MCQ_QCFGPTR_UNIT)
 #define MCQ_QCFG_SIZE	0x40
 
+/* De-emphasis for gear-5 */
+#define DEEMPHASIS_3_5_dB	0x04
+#define NO_DEEMPHASIS		0x0
+
 enum {
 	TSTBUS_UAWM,
 	TSTBUS_UARM,
@@ -795,6 +799,23 @@ static int ufs_qcom_icc_update_bw(struct ufs_qcom_host *host)
 	return ufs_qcom_icc_set_bw(host, bw_table.mem_bw, bw_table.cfg_bw);
 }
 
+static void ufs_qcom_set_tx_hs_equalizer(struct ufs_hba *hba, u32 gear, u32 tx_lanes)
+{
+	u32 equalizer_val;
+	int ret, i;
+
+	/* Determine the equalizer value based on the gear */
+	equalizer_val = (gear == 5) ? DEEMPHASIS_3_5_dB : NO_DEEMPHASIS;
+
+	for (i = 0; i < tx_lanes; i++) {
+		ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(TX_HS_EQUALIZER, i),
+				     equalizer_val);
+		if (ret)
+			dev_err(hba->dev, "%s: failed equalizer lane %d\n",
+				__func__, i);
+	}
+}
+
 static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 				enum ufs_notify_change_status status,
 				const struct ufs_pa_layer_attr *dev_max_params,
@@ -846,6 +867,11 @@ static int ufs_qcom_pwr_change_notify(struct ufs_hba *hba,
 						dev_req_params->gear_tx,
 						PA_INITIAL_ADAPT);
 		}
+
+		if (hba->dev_quirks & UFS_DEVICE_QUIRK_PA_TX_DEEMPHASIS_TUNING)
+			ufs_qcom_set_tx_hs_equalizer(hba,
+					dev_req_params->gear_tx, dev_req_params->lane_tx);
+
 		break;
 	case POST_CHANGE:
 		if (ufs_qcom_cfg_timers(hba, false)) {
@@ -893,6 +919,16 @@ static int ufs_qcom_quirk_host_pa_saveconfigtime(struct ufs_hba *hba)
 			    (pa_vs_config_reg1 | (1 << 12)));
 }
 
+static void ufs_qcom_override_pa_tx_hsg1_sync_len(struct ufs_hba *hba)
+{
+	int err;
+
+	err = ufshcd_dme_peer_set(hba, UIC_ARG_MIB(PA_TX_HSG1_SYNC_LENGTH),
+				  PA_TX_HSG1_SYNC_LENGTH_VAL);
+	if (err)
+		dev_err(hba->dev, "Failed (%d) set PA_TX_HSG1_SYNC_LENGTH\n", err);
+}
+
 static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 {
 	int err = 0;
@@ -900,6 +936,9 @@ static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 	if (hba->dev_quirks & UFS_DEVICE_QUIRK_HOST_PA_SAVECONFIGTIME)
 		err = ufs_qcom_quirk_host_pa_saveconfigtime(hba);
 
+	if (hba->dev_quirks & UFS_DEVICE_QUIRK_PA_TX_HSG1_SYNC_LENGTH)
+		ufs_qcom_override_pa_tx_hsg1_sync_len(hba);
+
 	return err;
 }
 
@@ -914,6 +953,10 @@ static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
 	{ .wmanufacturerid = UFS_VENDOR_WDC,
 	  .model = UFS_ANY_MODEL,
 	  .quirk = UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE },
+	{ .wmanufacturerid = UFS_VENDOR_SAMSUNG,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_PA_TX_HSG1_SYNC_LENGTH |
+		   UFS_DEVICE_QUIRK_PA_TX_DEEMPHASIS_TUNING },
 	{}
 };
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index d0e6ec9128e7..05d4cb569c50 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -122,8 +122,11 @@ enum {
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
@@ -141,6 +144,21 @@ enum {
 #define UNIPRO_CORE_CLK_FREQ_201_5_MHZ         202
 #define UNIPRO_CORE_CLK_FREQ_403_MHZ           403
 
+/* TX_HSG1_SYNC_LENGTH attr value */
+#define PA_TX_HSG1_SYNC_LENGTH_VAL	0x4A
+
+/*
+ * Some ufs device vendors need a different TSync length.
+ * Enable this quirk to give an additional TX_HS_SYNC_LENGTH.
+ */
+#define UFS_DEVICE_QUIRK_PA_TX_HSG1_SYNC_LENGTH		BIT(16)
+
+/*
+ * Some ufs device vendors need a different Deemphasis setting.
+ * Enable this quirk to tune TX Deemphasis parameters.
+ */
+#define UFS_DEVICE_QUIRK_PA_TX_DEEMPHASIS_TUNING	BIT(17)
+
 /* ICE allocator type to share AES engines among TX stream and RX stream */
 #define ICE_ALLOCATOR_TYPE 2
 
-- 
2.17.1


