Return-Path: <linux-arm-msm+bounces-96067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KgXJ7+SrWlH4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:16:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD1230E48
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:16:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9D3D8300D4C2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 15:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E084299959;
	Sun,  8 Mar 2026 15:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FyV8HHwG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E1E2BE026;
	Sun,  8 Mar 2026 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982932; cv=none; b=fZP7FLlmiVTwBaqxEMyocZvvecumuu/7vXuxpGK9DmOkeUCiFXyGuQtKWiZBYXnndiiB/wU52CHhp2E/Srecwkt2brfLWIJDM7qim4nNtEfWGWSqPcgRfgbngMDt4Is5rqtb9QnS2zIgb3EdsALIdegrbDFT2Zg3CZKrtdO/1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982932; c=relaxed/simple;
	bh=jHAPldH/nF9aV4ZNz97ecvnGeC9QbBN+VX5PAW8jVMI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hPi5HFtGvJBs4hI1Atg7WhS8cJynz98zXZz3Rb4IG1RbSdueCGPNF2RF6fNffnReZEdB1+D+dVkyMGWcAcRTLcbQ7uTyB5DQfBZjIvlvIO2xLuuBw8KyTC/2YQy1/nh/mF6dZuf/oufIDc+0Nm6SoBV8MEK7hwTnKt5gxBqoMgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FyV8HHwG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6287a8gR255307;
	Sun, 8 Mar 2026 15:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s6wriZVUaHG
	KDAas3zJUTvhW38+doNrUUIiztyzALhE=; b=FyV8HHwGODviJm9KxWICJL9IOOM
	mLOZCTcg/DvZtLq66FBkTyhKJ0S/ZD7uzNXuhdmEKJZfmavX6xxDozyuoqckeidR
	w09GRPag40aTfJ0MnuqIK6yIK/iupQ/s0j8q2sa9+H1mRKCCw6Dauqjs7FNeY1P+
	jGwDsT1dPjxdkKQpEfgiFaTDEom6IFobbo6HaLUN3tKFTU3TqMnbM3fJELjpNVcA
	5FqIN0neQi7BbeKejmqKNfie8R19o4TJU0wFRuQ7TybUlgAyHD3l4bfeluAYpO13
	HqS515gAaiLTnulUJudjbxd+V4qI56rMWfDDMAcy0guEd/Se3byJ3cksOvQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9ahqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:17 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 628FFGcU011508;
	Sun, 8 Mar 2026 15:15:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4crd3p2vfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:16 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 628FFG8M011497;
	Sun, 8 Mar 2026 15:15:16 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 628FFG6l011495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:16 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 41A795A4; Sun,  8 Mar 2026 08:15:16 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST)
Subject: [PATCH v3 10/12] scsi: ufs: ufs-qcom: Implement vops get_rx_fom()
Date: Sun,  8 Mar 2026 08:14:07 -0700
Message-Id: <20260308151409.3779137-11-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE0MCBTYWx0ZWRfX9HxGRDp3gtRq
 xez/keqldgNxEzB51Bqd3afDbRsEMeiE8lnVkuYPojwOzObt2qiA2VWM3Xj0lHFyR0etIc+un74
 fd8X7+GT4G1N/EFI0AqJ31Cru7CvY8WAKroe0PFGJ+CadL9GKsRi8Wu3nxkGJdpsva+30pDj2As
 l6RouQBDIx3/UU/2HLpKN8v6x5ZDpqYzTyyES7tML3bntHpj5KoHslw2h+4qEdHLW+PsxE0LDUN
 BW9xWdlRBp3FdkNuX5fQ90ZC3z42fzlZIcLAORCohEMKq5pblo5mAqbxQBBDZQPvE4ncebzam5X
 FiVG6YJHBCyGH+qZLufnYAimvl2j/xNtscQ4ZeeFYKUFFjp0CXEOuX7rjm2HRg5OENuusV5Mp0j
 x7Yy75J0HyU1yXGsIt18mV6JAiLpx3Lg8Gs7YXK16fYKUWRt4kMU9+ZPNajkV/p62CiZTw818EG
 3haEsuM1UJr1qL5yiRw==
X-Proofpoint-ORIG-GUID: AgkJUziWKS5UvEC3mhDiy5mKZT05JFZ5
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69ad9285 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=78oGUcSw9AUNt71DOQwA:9
X-Proofpoint-GUID: AgkJUziWKS5UvEC3mhDiy5mKZT05JFZ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080140
X-Rspamd-Queue-Id: B7BD1230E48
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96067-lists,linux-arm-msm=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[oss.qualcomm.com:server fail,qualcomm.com:server fail,sin.lore.kernel.org:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.987];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On some platforms, host's M-PHY RX_FOM Attribute always reads 0, meaning
SW cannot rely on Figure of Merit (FOM) to identify the optimal TX
Equalization settings for device's TX Lanes. Implement the vops
ufs_qcom_get_rx_fom() such that SW can utilize the UFS Eye Opening Monitor
(EOM) to evaluate the TX Equalization settings for device's TX Lanes.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-txeq.c |   6 +-
 drivers/ufs/host/ufs-qcom.c | 313 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  42 +++++
 include/ufs/ufshcd.h        |   3 +
 include/ufs/unipro.h        |  19 +++
 5 files changed, 380 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
index c68b232b1598..561d8c7dd141 100644
--- a/drivers/ufs/core/ufs-txeq.c
+++ b/drivers/ufs/core/ufs-txeq.c
@@ -227,9 +227,8 @@ ufshcd_compose_tx_eq_setting(struct ufshcd_tx_eq_settings *settings,
  *
  * Returns 0 on success, negative error code otherwise
  */
-static int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
-				       struct ufshcd_tx_eq_params *params,
-				       u32 gear)
+int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
+				struct ufshcd_tx_eq_params *params, u32 gear)
 {
 	u32 setting;
 	int ret;
@@ -259,6 +258,7 @@ static int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(ufshcd_apply_tx_eq_settings);
 
 /**
  * ufshcd_evaluate_fom - Update TX EQ params based on FOM results
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3c45de7a0b25..3e989c683c29 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2515,6 +2515,318 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
 }
 
+static int ufs_qcom_host_eom_config(struct ufs_hba *hba, int lane, int v_step,
+				    int t_step, enum ufs_eom_eye_pos eye_pos,
+				    u32 target_test_count)
+{
+	u32 volt_step, timing_step;
+	int ret;
+
+	if (v_step > 127 || v_step < -127) {
+		dev_err(hba->dev, "Invalid EOM Voltage Step: %d\n", v_step);
+		return -ERANGE;
+	}
+
+	if (t_step > 63 || t_step < -63) {
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
+			     BIT(eye_pos) | RX_EYEMON_EXTENDED_VRANGE_BIT);
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
+	enum ufs_eom_eye_pos eye_pos;
+	int lane, v_step, t_step, ret;
+	u32 setting;
+
+	if (!err_count || !eom_coord)
+		return -EINVAL;
+
+	if (target_test_count < 8) {
+		dev_err(hba->dev, "Target test count (%u) too small for Host EOM\n",
+			target_test_count);
+		return -ERANGE;
+	}
+
+	v_step = eom_coord->v_step;
+	t_step = eom_coord->t_step;
+	eye_pos = eom_coord->eye_pos;
+
+	for (lane = 0; lane < num_lanes; lane++) {
+		ret = ufs_qcom_host_eom_config(hba, lane, v_step, t_step,
+					       eye_pos, target_test_count);
+		if (ret) {
+			dev_err(hba->dev, "Failed to config Host EOM: %d\n",
+				ret);
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
+			lane, v_step, t_step, err_count[lane]);
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
+		ret = ufs_qcom_host_eom_scan(hba, num_lanes, eom_coord, 0x3F,
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
+	    gear <= UFS_HS_G5 || !d_iter || !d_iter->is_new)
+		return 0;
+
+	if (gear < UFS_HS_G1 || gear >= UFS_HS_GEAR_MAX)
+		return -ERANGE;
+
+	if (!params)
+		return -ENOMEM;
+
+	memcpy(&old_pwr_info, &hba->pwr_info, sizeof(struct ufs_pa_layer_attr));
+
+	memcpy(params, &hba->tx_eq_params[gear - 1], sizeof(struct ufshcd_tx_eq_params));
+	for (lane = 0; lane < d_iter->num_lanes; lane++) {
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
+			__func__, gear, UFS_HS_RATE_STRING(rate), ret);
+		return ret;
+	}
+
+	ret = ufs_qcom_host_sw_rx_fom(hba, d_iter->num_lanes, fom);
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
+	for (lane = 0; lane < d_iter->num_lanes; lane++)
+		d_iter->fom[lane] = fom[lane];
+
+	return 0;
+}
+
 static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 				   enum ufs_notify_change_status status,
 				   struct ufs_pa_layer_attr *pwr_mode)
@@ -2585,6 +2897,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
+	.get_rx_fom		= ufs_qcom_get_rx_fom,
 	.tx_eqtr_notify		= ufs_qcom_tx_eqtr_notify,
 };
 
diff --git a/drivers/ufs/host/ufs-qcom.h b/drivers/ufs/host/ufs-qcom.h
index 1111ab34da01..66fb42453e5c 100644
--- a/drivers/ufs/host/ufs-qcom.h
+++ b/drivers/ufs/host/ufs-qcom.h
@@ -33,6 +33,48 @@
 #define DL_VS_CLK_CFG_MASK GENMASK(9, 0)
 #define DME_VS_CORE_CLK_CTRL_DME_HW_CGC_EN             BIT(9)
 
+#define SW_RX_FOM_EOM_COORDS		23
+#define SW_RX_FOM_EOM_COORDS_WEIGHT	(127 / SW_RX_FOM_EOM_COORDS)
+
+enum ufs_eom_eye_pos {
+	UFS_EOM_EYE_M,
+	UFS_EOM_EYE_L,
+	UFS_EOM_EYE_U,
+	UFS_EOM_EYE_MAX,
+};
+
+struct ufs_eom_coord {
+	int t_step;
+	int v_step;
+	int eye_pos;
+};
+
+static const struct ufs_eom_coord sw_rx_fom_eom_coords_g6[SW_RX_FOM_EOM_COORDS] = {
+	[0] = { -2, -15, UFS_EOM_EYE_M },
+	[1] = { 0, -15, UFS_EOM_EYE_M },
+	[2] = { 2, -15, UFS_EOM_EYE_M },
+	[3] = { -4, -10, UFS_EOM_EYE_M },
+	[4] = { -2, -10, UFS_EOM_EYE_M },
+	[5] = { 0, -10, UFS_EOM_EYE_M },
+	[6] = { 2, -10, UFS_EOM_EYE_M },
+	[7] = { 4, -10, UFS_EOM_EYE_M },
+	[8] = { -6, 0, UFS_EOM_EYE_M },
+	[9] = { -4, 0, UFS_EOM_EYE_M },
+	[10] = { -2, 0, UFS_EOM_EYE_M },
+	[11] = { 0, 0, UFS_EOM_EYE_M },
+	[12] = { 2, 0, UFS_EOM_EYE_M },
+	[13] = { 4, 0, UFS_EOM_EYE_M },
+	[14] = { 6, 0, UFS_EOM_EYE_M },
+	[15] = { -4, 10, UFS_EOM_EYE_M },
+	[16] = { -2, 10, UFS_EOM_EYE_M },
+	[17] = { 0, 10, UFS_EOM_EYE_M },
+	[18] = { 2, 10, UFS_EOM_EYE_M },
+	[19] = { 4, 10, UFS_EOM_EYE_M },
+	[20] = { -2, 15, UFS_EOM_EYE_M },
+	[21] = { 0, 15, UFS_EOM_EYE_M },
+	[22] = { 2, 15, UFS_EOM_EYE_M },
+};
+
 /* Qualcomm MCQ Configuration */
 #define UFS_QCOM_MCQCAP_QCFGPTR     224  /* 0xE0 in hex */
 #define UFS_QCOM_MCQ_CONFIG_OFFSET  (UFS_QCOM_MCQCAP_QCFGPTR * 0x200)  /* 0x1C000 */
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 6130ee9aeb03..7b248823c044 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1486,6 +1486,9 @@ extern int ufshcd_config_pwr_mode(struct ufs_hba *hba,
 				  struct ufs_pa_layer_attr *desired_pwr_mode,
 				  enum ufshcd_pmc_policy pmc_policy);
 extern int ufshcd_uic_change_pwr_mode(struct ufs_hba *hba, u8 mode);
+extern int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
+				       struct ufshcd_tx_eq_params *params,
+				       u32 gear);
 
 /* UIC command interfaces for DME primitives */
 #define DME_LOCAL	0
diff --git a/include/ufs/unipro.h b/include/ufs/unipro.h
index 50a2b6463b31..e1ed170fb226 100644
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
-- 
2.34.1


