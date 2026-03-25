Return-Path: <linux-arm-msm+bounces-99896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SC9RHm0FxGnOvQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:55:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7369328822
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:55:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1151347F9E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB6B3EDAC3;
	Wed, 25 Mar 2026 15:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hdEKC8Jx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE673E4C68;
	Wed, 25 Mar 2026 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452256; cv=none; b=CL/dBglY/GyLB9OMZBfh6+1ZOfZ/OKs1eErnQO6n2RsMtEx9XK8zsOCFinPVbIn6u6QAbiLIk630hbq7WGTK552ETQgL9VfAVhCZIS6qvX303dL3vjMTKK1SCgFM7Cd8BKr73ZPzHvOWldJByTxeUUnQrHW9WmdaWyaowlS4Weg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452256; c=relaxed/simple;
	bh=Aum+LA5ozwk25nK8q7/MxOwKqcibWklzGpnKgGIddF0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HdKUE/ujvT9u/3DRwFdncDv2MPYtgEghVtM3x6XbpYBI+Qi1XGqE8RUaWEU/3cdwC/PenQUxukLzECijUTz2ib2gBod1YT4iEVnh2v5kfmNdypkxiqeaaW+Um1HdmtGErSfSiK6cLQGxf13ZWvubPCMAnpUAAvI9Wt0L912wxlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hdEKC8Jx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHC4q585507;
	Wed, 25 Mar 2026 15:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DVGWLaETnQ3
	mxmGqXcXByh+aGi2LeY/sQ0rlGiTc2mI=; b=hdEKC8JxB6xhdeLyaodYs94jvQa
	T6wZN/XmWYuzDiRCvv69Z2A0Rmxx18PLcMryqT2XL4lzN8xE/BxE9p9ruqGB+twP
	0BV5sBsMXNf9TMvTezhyyAGJ/HsK8sEuZFpnaxUDVjgRuwYRBosVMx3+TbJDCfsi
	J04XvuC3ZEkEeGSHcnxhCXnASepmCLQhWIKp+Wn6/+XESnmm0I6QGP6IDWmmaHTt
	032WMYWf+jUbOpvZ09ZZ4wnI2qhrRBiRVVHPk03MCWGx0VHsZn7+75PuQYwCo2ah
	Ts9J5j+Jfp1oWBxvkBmojaetXvhkIE0loBg0pHoJSmaJLlXGDbE5SkjqHNg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d46tp2p5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:24:01 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62PFK5GR003486;
	Wed, 25 Mar 2026 15:24:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4d3uva5du7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:24:00 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62PFO082010298;
	Wed, 25 Mar 2026 15:24:00 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 62PFNxoB010297
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:24:00 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id EAB595AE; Wed, 25 Mar 2026 08:23:59 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST)
Subject: [PATCH v5 10/12] scsi: ufs: ufs-qcom: Implement vops get_rx_fom()
Date: Wed, 25 Mar 2026 08:21:52 -0700
Message-Id: <20260325152154.1604082-11-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325152154.1604082-1-can.guo@oss.qualcomm.com>
References: <20260325152154.1604082-1-can.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: e3t6FhxsrVQfthJusCLOg9x81KMt_SIQ
X-Authority-Analysis: v=2.4 cv=F4lat6hN c=1 sm=1 tr=0 ts=69c3fe11 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=PY6Zn8H8AAAA:8 a=N54-gffFAAAA:8 a=EUspDBNiAAAA:8
 a=ufAJUjbdAAAA:8 a=0jTDRcRvCRSkytgvJv4A:9 a=ySS05r0LPNlNiX1MMvNp:22
 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-GUID: e3t6FhxsrVQfthJusCLOg9x81KMt_SIQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExMCBTYWx0ZWRfX7G9Vv6iMF1Qe
 YoNkSqohRm0wE6zo26u9QYxFO/8Pqdo5AeECFFf4hc9rAoYthS4lMJU9q1Synm7nCZiACFeUTfY
 oNfJR+FithH2SQEA78CauCd2RFETxanSJTTrANVdMMiPgclOfTjJTQHDpIVJPL+CIIPG8EspAUx
 gNCPEn9/bKl+AhUwgpkUyQDGOaniNkqNgI0lhNjbJ4vmYhpyt5VeMqQIQQ9HtUaJTOwLG3OfyGf
 rIW23PnnScd7UdtxRhX76sx3cLrQDVgot6YMybV7VDOObhIjJbE4awQlvIoidMwTwPR8d74fnLU
 /rX18Z30bvkI9PpCXlHv6NBo3WZvYzJ6DJnGsPJHg3qFPo+cmkx413/o6nQqvNbREVH4zjUrM/w
 gccSauYn1rLydWjuUvKcZUZziuJfS7NlwDEfmiyR497SJb/CdE9OLmXlAeq+ofv/Ceg7+DdiLEQ
 A5AU/uAjT5csvFiO4+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250110
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99896-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[acm.org:email,micron.com:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C7369328822
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On some platforms, host's M-PHY RX_FOM Attribute always reads 0, meaning
SW cannot rely on Figure of Merit (FOM) to identify the optimal TX
Equalization settings for device's TX Lanes. Implement the vops
ufs_qcom_get_rx_fom() such that SW can utilize the UFS Eye Opening Monitor
(EOM) to evaluate the TX Equalization settings for device's TX Lanes.

Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-txeq.c |   6 +-
 drivers/ufs/host/ufs-qcom.c | 312 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  40 +++++
 include/ufs/ufshcd.h        |   3 +
 include/ufs/unipro.h        |  25 +++
 5 files changed, 383 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
index 3a879c644faa..b2dc89124353 100644
--- a/drivers/ufs/core/ufs-txeq.c
+++ b/drivers/ufs/core/ufs-txeq.c
@@ -232,9 +232,8 @@ ufshcd_compose_tx_eq_setting(struct ufshcd_tx_eq_settings *settings,
  *
  * Returns 0 on success, negative error code otherwise
  */
-static int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
-				       struct ufshcd_tx_eq_params *params,
-				       u32 gear)
+int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
+				struct ufshcd_tx_eq_params *params, u32 gear)
 {
 	struct ufs_pa_layer_attr *pwr_info = &hba->max_pwr_info.info;
 	u32 setting;
@@ -263,6 +262,7 @@ static int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ufshcd_apply_tx_eq_settings);
 
 /**
  * ufshcd_evaluate_tx_eqtr_fom - Evaluate TX EQTR FOM results
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index eac5e95e740b..a0314cb55c7f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2505,6 +2505,317 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
 }
 
+static int ufs_qcom_host_eom_config(struct ufs_hba *hba, int lane,
+				    const struct ufs_eom_coord *eom_coord,
+				    u32 target_test_count)
+{
+	enum ufs_eom_eye_mask eye_mask = eom_coord->eye_mask;
+	int v_step = eom_coord->v_step;
+	int t_step = eom_coord->t_step;
+	u32 volt_step, timing_step;
+	int ret;
+
+	if (abs(v_step) > UFS_QCOM_EOM_VOLTAGE_STEPS_MAX) {
+		dev_err(hba->dev, "Invalid EOM Voltage Step: %d\n", v_step);
+		return -ERANGE;
+	}
+
+	if (abs(t_step) > UFS_QCOM_EOM_TIMING_STEPS_MAX) {
+		dev_err(hba->dev, "Invalid EOM Timing Step: %d\n", t_step);
+		return -ERANGE;
+	}
+
+	if (v_step < 0)
+		volt_step = RX_EYEMON_NEGATIVE_STEP_BIT | (u32)(-v_step);
+	else
+		volt_step = (u32)v_step;
+
+	if (t_step < 0)
+		timing_step = RX_EYEMON_NEGATIVE_STEP_BIT | (u32)(-t_step);
+	else
+		timing_step = (u32)t_step;
+
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ENABLE,
+				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
+			     BIT(eye_mask) | RX_EYEMON_EXTENDED_VRANGE_BIT);
+	if (ret) {
+		dev_err(hba->dev, "Failed to enable Host EOM on Lane %d: %d\n",
+			lane, ret);
+		return ret;
+	}
+
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_TIMING_STEPS,
+				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
+			     timing_step);
+	if (ret) {
+		dev_err(hba->dev, "Failed to set Host EOM timing step on Lane %d: %d\n",
+			lane, ret);
+		return ret;
+	}
+
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_VOLTAGE_STEPS,
+				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
+			     volt_step);
+	if (ret) {
+		dev_err(hba->dev, "Failed to set Host EOM voltage step on Lane %d: %d\n",
+			lane, ret);
+		return ret;
+	}
+
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_TARGET_TEST_COUNT,
+				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
+			     target_test_count);
+	if (ret)
+		dev_err(hba->dev, "Failed to set Host EOM target test count on Lane %d: %d\n",
+			lane, ret);
+
+	return ret;
+}
+
+static int ufs_qcom_host_eom_may_stop(struct ufs_hba *hba, int lane,
+				      u32 target_test_count, u32 *err_count)
+{
+	u32 start, tested_count, error_count;
+	int ret;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(RX_EYEMON_START,
+				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
+			     &start);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get Host EOM start status on Lane %d: %d\n",
+			lane, ret);
+		return ret;
+	}
+
+	if (start & 0x1)
+		return -EAGAIN;
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(RX_EYEMON_TESTED_COUNT,
+				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
+			     &tested_count);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get Host EOM tested count on Lane %d: %d\n",
+			lane, ret);
+		return ret;
+	}
+
+	ret = ufshcd_dme_get(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ERROR_COUNT,
+				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
+			     &error_count);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get Host EOM error count on Lane %d: %d\n",
+			lane, ret);
+		return ret;
+	}
+
+	/* EOM can stop */
+	if ((tested_count >= target_test_count - 3) || error_count > 0) {
+		*err_count = error_count;
+
+		/* Disable EOM */
+		ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ENABLE,
+					UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
+				     0x0);
+		if (ret) {
+			dev_err(hba->dev, "Failed to disable Host EOM on Lane %d: %d\n",
+				lane, ret);
+			return ret;
+		}
+	} else {
+		return -EAGAIN;
+	}
+
+	return 0;
+}
+
+static int ufs_qcom_host_eom_scan(struct ufs_hba *hba, int num_lanes,
+				  const struct ufs_eom_coord *eom_coord,
+				  u32 target_test_count, u32 *err_count)
+{
+	bool eom_stopped[PA_MAXDATALANES] = { 0 };
+	int lane, ret;
+	u32 setting;
+
+	if (!err_count || !eom_coord)
+		return -EINVAL;
+
+	if (target_test_count < UFS_QCOM_EOM_TARGET_TEST_COUNT_MIN) {
+		dev_err(hba->dev, "Target test count (%u) too small for Host EOM\n",
+			target_test_count);
+		return -ERANGE;
+	}
+
+	for (lane = 0; lane < num_lanes; lane++) {
+		ret = ufs_qcom_host_eom_config(hba, lane, eom_coord,
+					       target_test_count);
+		if (ret) {
+			dev_err(hba->dev, "Failed to config Host RX EOM: %d\n", ret);
+			return ret;
+		}
+	}
+
+	/*
+	 * Trigger a PACP_PWR_req to kick start EOM, but not to really change
+	 * the Power Mode.
+	 */
+	ret = ufshcd_uic_change_pwr_mode(hba, FAST_MODE << 4 | FAST_MODE);
+	if (ret) {
+		dev_err(hba->dev, "Failed to change power mode to kick start Host EOM: %d\n",
+			ret);
+		return ret;
+	}
+
+more_burst:
+	/* Create burst on Host RX Lane. */
+	ufshcd_dme_peer_get(hba, UIC_ARG_MIB(PA_LOCALVERINFO), &setting);
+
+	for (lane = 0; lane < num_lanes; lane++) {
+		if (eom_stopped[lane])
+			continue;
+
+		ret = ufs_qcom_host_eom_may_stop(hba, lane, target_test_count,
+						 &err_count[lane]);
+		if (!ret) {
+			eom_stopped[lane] = true;
+		} else if (ret == -EAGAIN) {
+			/* Need more burst to excercise EOM */
+			goto more_burst;
+		} else {
+			dev_err(hba->dev, "Failed to stop Host EOM: %d\n", ret);
+			return ret;
+		}
+
+		dev_dbg(hba->dev, "Host RX Lane %d EOM, v_step %d, t_step %d, error count %u\n",
+			lane, eom_coord->v_step, eom_coord->t_step,
+			err_count[lane]);
+	}
+
+	return 0;
+}
+
+static int ufs_qcom_host_sw_rx_fom(struct ufs_hba *hba, int num_lanes, u32 *fom)
+{
+	const struct ufs_eom_coord *eom_coord = sw_rx_fom_eom_coords_g6;
+	u32 eom_err_count[PA_MAXDATALANES] = { 0 };
+	u32 curr_ahit;
+	int lane, i, ret;
+
+	if (!fom)
+		return -EINVAL;
+
+	/* Stop the auto hibernate idle timer */
+	curr_ahit = ufshcd_readl(hba, REG_AUTO_HIBERNATE_IDLE_TIMER);
+	if (curr_ahit)
+		ufshcd_writel(hba, 0, REG_AUTO_HIBERNATE_IDLE_TIMER);
+
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXHSADAPTTYPE), PA_NO_ADAPT);
+	if (ret) {
+		dev_err(hba->dev, "Failed to select NO_ADAPT before starting Host EOM: %d\n", ret);
+		goto out;
+	}
+
+	for (i = 0; i < SW_RX_FOM_EOM_COORDS; i++, eom_coord++) {
+		ret = ufs_qcom_host_eom_scan(hba, num_lanes, eom_coord,
+					     UFS_QCOM_EOM_TARGET_TEST_COUNT_G6,
+					     eom_err_count);
+		if (ret) {
+			dev_err(hba->dev, "Failed to run Host EOM scan: %d\n", ret);
+			break;
+		}
+
+		for (lane = 0; lane < num_lanes; lane++) {
+			/* Bad coordinates have no weights */
+			if (eom_err_count[lane])
+				continue;
+			fom[lane] += SW_RX_FOM_EOM_COORDS_WEIGHT;
+		}
+	}
+
+out:
+	/* Restore the auto hibernate idle timer */
+	if (curr_ahit)
+		ufshcd_writel(hba, curr_ahit, REG_AUTO_HIBERNATE_IDLE_TIMER);
+
+	return ret;
+}
+
+static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
+			       struct ufs_pa_layer_attr *pwr_mode,
+			       struct tx_eqtr_iter *h_iter,
+			       struct tx_eqtr_iter *d_iter)
+{
+	struct ufshcd_tx_eq_params *params __free(kfree) =
+		kzalloc(sizeof(*params), GFP_KERNEL);
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_pa_layer_attr old_pwr_info;
+	u32 fom[PA_MAXDATALANES] = { 0 };
+	u32 gear = pwr_mode->gear_tx;
+	u32 rate = pwr_mode->hs_rate;
+	int lane, ret;
+
+	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1 ||
+	    gear <= UFS_HS_G5 || !d_iter || !d_iter->is_updated)
+		return 0;
+
+	if (gear < UFS_HS_G1 || gear > UFS_HS_GEAR_MAX)
+		return -ERANGE;
+
+	if (!params)
+		return -ENOMEM;
+
+	memcpy(&old_pwr_info, &hba->pwr_info, sizeof(struct ufs_pa_layer_attr));
+
+	memcpy(params, &hba->tx_eq_params[gear - 1], sizeof(struct ufshcd_tx_eq_params));
+	for (lane = 0; lane < pwr_mode->lane_rx; lane++) {
+		params->device[lane].preshoot = d_iter->preshoot;
+		params->device[lane].deemphasis = d_iter->deemphasis;
+	}
+
+	/* Use TX EQTR settings as Device's TX Equalization settings. */
+	ret = ufshcd_apply_tx_eq_settings(hba, params, gear);
+	if (ret) {
+		dev_err(hba->dev, "%s: Failed to apply TX EQ settings for HS-G%u: %d\n",
+			__func__, gear, ret);
+		return ret;
+	}
+
+	/* Force PMC to target HS Gear to use new TX Equalization settings. */
+	ret = ufshcd_change_power_mode(hba, pwr_mode, UFSHCD_PMC_POLICY_FORCE);
+	if (ret) {
+		dev_err(hba->dev, "%s: Failed to change power mode to HS-G%u, Rate-%s: %d\n",
+			__func__, gear, ufs_hs_rate_to_str(rate), ret);
+		return ret;
+	}
+
+	ret = ufs_qcom_host_sw_rx_fom(hba, pwr_mode->lane_rx, fom);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get SW FOM of TX (PreShoot: %u, DeEmphasis: %u): %d\n",
+			d_iter->preshoot, d_iter->deemphasis, ret);
+		return ret;
+	}
+
+	/* Restore Device's TX Equalization settings. */
+	ret = ufshcd_apply_tx_eq_settings(hba, &hba->tx_eq_params[gear - 1], gear);
+	if (ret) {
+		dev_err(hba->dev, "%s: Failed to apply TX EQ settings for HS-G%u: %d\n",
+			__func__, gear, ret);
+		return ret;
+	}
+
+	/* Restore Power Mode. */
+	ret = ufshcd_change_power_mode(hba, &old_pwr_info, UFSHCD_PMC_POLICY_FORCE);
+	if (ret) {
+		dev_err(hba->dev, "%s: Failed to retore power mode to HS-G%u: %d\n",
+			__func__, old_pwr_info.gear_tx, ret);
+		return ret;
+	}
+
+	for (lane = 0; lane < pwr_mode->lane_rx; lane++)
+		d_iter->fom[lane] = fom[lane];
+
+	return 0;
+}
+
 static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 				   enum ufs_notify_change_status status,
 				   struct ufs_pa_layer_attr *pwr_mode)
@@ -2575,6 +2886,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
+	.get_rx_fom		= ufs_qcom_get_rx_fom,
 	.tx_eqtr_notify		= ufs_qcom_tx_eqtr_notify,
 };
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 1111ab34da01..7183d6b2c8bb 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -33,6 +33,46 @@
 #define DL_VS_CLK_CFG_MASK GENMASK(9, 0)
 #define DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN             BIT(9)
 
+#define UFS_QCOM_EOM_VOLTAGE_STEPS_MAX		127
+#define UFS_QCOM_EOM_TIMING_STEPS_MAX		63
+#define UFS_QCOM_EOM_TARGET_TEST_COUNT_MIN	8
+#define UFS_QCOM_EOM_TARGET_TEST_COUNT_G6	0x3F
+
+#define SW_RX_FOM_EOM_COORDS		23
+#define SW_RX_FOM_EOM_COORDS_WEIGHT	(127 / SW_RX_FOM_EOM_COORDS)
+
+struct ufs_eom_coord {
+	int t_step;
+	int v_step;
+	u8 eye_mask;
+};
+
+static const struct ufs_eom_coord sw_rx_fom_eom_coords_g6[SW_RX_FOM_EOM_COORDS] = {
+	[0] = { -2, -15, UFS_EOM_EYE_MASK_M },
+	[1] = { 0, -15, UFS_EOM_EYE_MASK_M },
+	[2] = { 2, -15, UFS_EOM_EYE_MASK_M },
+	[3] = { -4, -10, UFS_EOM_EYE_MASK_M },
+	[4] = { -2, -10, UFS_EOM_EYE_MASK_M },
+	[5] = { 0, -10, UFS_EOM_EYE_MASK_M },
+	[6] = { 2, -10, UFS_EOM_EYE_MASK_M },
+	[7] = { 4, -10, UFS_EOM_EYE_MASK_M },
+	[8] = { -6, 0, UFS_EOM_EYE_MASK_M },
+	[9] = { -4, 0, UFS_EOM_EYE_MASK_M },
+	[10] = { -2, 0, UFS_EOM_EYE_MASK_M },
+	[11] = { 0, 0, UFS_EOM_EYE_MASK_M },
+	[12] = { 2, 0, UFS_EOM_EYE_MASK_M },
+	[13] = { 4, 0, UFS_EOM_EYE_MASK_M },
+	[14] = { 6, 0, UFS_EOM_EYE_MASK_M },
+	[15] = { -4, 10, UFS_EOM_EYE_MASK_M },
+	[16] = { -2, 10, UFS_EOM_EYE_MASK_M },
+	[17] = { 0, 10, UFS_EOM_EYE_MASK_M },
+	[18] = { 2, 10, UFS_EOM_EYE_MASK_M },
+	[19] = { 4, 10, UFS_EOM_EYE_MASK_M },
+	[20] = { -2, 15, UFS_EOM_EYE_MASK_M },
+	[21] = { 0, 15, UFS_EOM_EYE_MASK_M },
+	[22] = { 2, 15, UFS_EOM_EYE_MASK_M },
+};
+
 /* Qualcomm MCQ Configuration */
 #define UFS_QCOM_MCQCAP_QCFGPTR     224  /* 0xE0 in hex */
 #define UFS_QCOM_MCQ_CONFIG_OFFSET  (UFS_QCOM_MCQCAP_QCFGPTR * 0x200)  /* 0x1C000 */
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index bc9e48e89db4..be15b6247303 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1515,6 +1515,9 @@ extern int ufshcd_config_pwr_mode(struct ufs_hba *hba,
 				  struct ufs_pa_layer_attr *desired_pwr_mode,
 				  enum ufshcd_pmc_policy pmc_policy);
 extern int ufshcd_uic_change_pwr_mode(struct ufs_hba *hba, u8 mode);
+extern int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
+				       struct ufshcd_tx_eq_params *params,
+				       u32 gear);
 
 /* UIC command interfaces for DME primitives */
 #define DME_LOCAL	0
diff --git a/include/ufs/unipro.h b/include/ufs/unipro.h
index 4aa592130b4e..f849a2a101ae 100644
--- a/include/ufs/unipro.h
+++ b/include/ufs/unipro.h
@@ -32,6 +32,8 @@
 #define TX_LCC_SEQUENCER			0x0032
 #define TX_MIN_ACTIVATETIME			0x0033
 #define TX_PWM_G6_G7_SYNC_LENGTH		0x0034
+#define TX_HS_DEEMPHASIS_SETTING		0x0037
+#define TX_HS_PRESHOOT_SETTING			0x003B
 #define TX_REFCLKFREQ				0x00EB
 #define TX_CFGCLKFREQVAL			0x00EC
 #define	CFGEXTRATTR				0x00F0
@@ -76,10 +78,27 @@
 #define RX_REFCLKFREQ				0x00EB
 #define	RX_CFGCLKFREQVAL			0x00EC
 #define CFGWIDEINLN				0x00F0
+#define RX_EYEMON_CAP				0x00F1
+#define RX_EYEMON_TIMING_MAX_STEPS_CAP		0x00F2
+#define RX_EYEMON_TIMING_MAX_OFFSET_CAP		0x00F3
+#define RX_EYEMON_VOLTAGE_MAX_STEPS_CAP		0x00F4
+#define RX_EYEMON_VOLTAGE_MAX_OFFSET_CAP	0x00F5
+#define RX_EYEMON_ENABLE			0x00F6
+#define RX_EYEMON_TIMING_STEPS			0x00F7
+#define RX_EYEMON_VOLTAGE_STEPS			0x00F8
+#define RX_EYEMON_TARGET_TEST_COUNT		0x00F9
+#define RX_EYEMON_TESTED_COUNT			0x00FA
+#define RX_EYEMON_ERROR_COUNT			0x00FB
+#define RX_EYEMON_START				0x00FC
+#define RX_EYEMON_EXTENDED_ERROR_COUNT		0x00FD
+
 #define ENARXDIRECTCFG4				0x00F2
 #define ENARXDIRECTCFG3				0x00F3
 #define ENARXDIRECTCFG2				0x00F4
 
+#define RX_EYEMON_NEGATIVE_STEP_BIT		BIT(6)
+#define RX_EYEMON_EXTENDED_VRANGE_BIT		BIT(6)
+
 #define is_mphy_tx_attr(attr)			(attr < RX_MODE)
 #define RX_ADV_FINE_GRAN_STEP(x)		((((x) & 0x3) << 1) | 0x1)
 #define SYNC_LEN_FINE(x)			((x) & 0x3F)
@@ -297,6 +316,12 @@ enum ufs_tx_hs_deemphasis {
 	UFS_TX_HS_DEEMPHASIS_DB_7P6,
 };
 
+enum ufs_eom_eye_mask {
+	UFS_EOM_EYE_MASK_M,
+	UFS_EOM_EYE_MASK_L,
+	UFS_EOM_EYE_MASK_U,
+};
+
 #define DL_FC0ProtectionTimeOutVal_Default	8191
 #define DL_TC0ReplayTimeOutVal_Default		65535
 #define DL_AFC0ReqTimeOutVal_Default		32767
-- 
2.34.1


