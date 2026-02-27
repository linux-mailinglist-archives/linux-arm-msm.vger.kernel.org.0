Return-Path: <linux-arm-msm+bounces-94492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKsMEejDoWkVwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:18:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5457C1BAB7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:18:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD9793201228
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DED1D44CAE7;
	Fri, 27 Feb 2026 16:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oCd+I8HO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180F244D69A;
	Fri, 27 Feb 2026 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208576; cv=none; b=steBFySBOb02BlCRWGg0UflMaF5fE9DwsOxFj05p5pkn4b+VP3wBaqoOnQj2KLxZPBbCDGOv1WMhauckKeg1Kz1G9if7ODdaU/+ELlW6TWXca/MhA/DKLWF4KnSMB1sLllM0VsaYVG90jq9Twy8S4S8YneNBRiNYBx5MMQGkMWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208576; c=relaxed/simple;
	bh=tpE3agMUI3eHuoJkslEV1cBkSNP6kJoRiSdezrv7dk0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iW/FIfk6jig5pzuH5rojSf5MvoodQs0iKgUFygeBs7gaE0Hr4ON3ybBMR7SSGf5lGExDsMYX0wG9fo6BNvf11ddS0GKNXtDZFNdtpnz3cWPOlEgGgvtr4vjLn+G4yU4sZymuLnQYqTKTsOrSDzup6oO4ZzhxG8P48WPlOjhHdi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oCd+I8HO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61REa95p4010610;
	Fri, 27 Feb 2026 16:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kgsmPJgSUQK
	q4oAO4SOMSe7CJC+eYSDNrW8BDBmDfXY=; b=oCd+I8HOTidIo6yfjZPqKlGIu93
	2/Qvf7e9zAb2CNazb6kqs5di9ijd3CExJizxWpePNoH16wIp0vq6eYedt0cAZV69
	FYvhTVWBThRuWQQQ6yWRiq2BfQRvPZoD0IMlJTgL6J3pYVImoIsdlF1cJb25HqCc
	vU9gPQVFJbM6BdvjfNH/84cBXGYotNwu2xCIZK3PGle1858rcC43cDnLiQQSwlMS
	A3SdGiybXBmman6o3DbRdLJ+R10UE+5rsW2SA6XK/WSl2f33o6eTohWVGvfxuJ/H
	nhOs8JTuQevY31fVluC48DH9vdwjSG7nEqtxXFKphpxPqDmYOrl9XCoxHXA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck43ra73e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:22 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RG9LPM000317;
	Fri, 27 Feb 2026 16:09:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4ck04p8997-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:21 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61RG9LBv000311;
	Fri, 27 Feb 2026 16:09:21 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 61RG9KOg000307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:21 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id EB6315A0; Fri, 27 Feb 2026 08:09:20 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...)
Subject: [PATCH 09/11] scsi: ufs: ufs-qcom: Implement vops get_rx_fom()
Date: Fri, 27 Feb 2026 08:08:06 -0800
Message-Id: <20260227160809.2620598-10-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
References: <20260227160809.2620598-1-can.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: FhbLrS3l7CSFsLI0NxhuoHlurNeDtZz2
X-Proofpoint-GUID: FhbLrS3l7CSFsLI0NxhuoHlurNeDtZz2
X-Authority-Analysis: v=2.4 cv=DOqCIiNb c=1 sm=1 tr=0 ts=69a1c1b2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=fkgzryKj3NPQORO81ywA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE0NCBTYWx0ZWRfX2UjzzDiHKAyV
 RCTbocLDmCiVbGZ3oQIZc3TJo7ONScQyXEV5Gkret4n+WRtDx4OLnKN5Fh3ARU0KOyUxb4F4dlO
 kBndsoWTEpihiBWp/E8OPSq84tB7T2bF6/xDD+043FjznUkluq+gtLvH81qtCoxn234EB2u6x+l
 uC13s6my9bZO0egSIKmRJloIDG9/v6sngmY5ClFWpgEipOos2V5CdlbrSh3tj1DxSqEeJ2esJ9B
 Mj15ijcveWVojWwA0qU7cU7WNQPsuklNMNOfnpEB8DR9IfNfcvnq9wdWPeOzdYYU+fgC+9g92o/
 f8eFrknWBOfcv0PdydO6MKBBVsGCdAvkSFCXXEBELYU8MLYlDZtl8UzlmXVdxgM4qMI0EdBqWub
 y7Y+eNRrYp0UorqJOO/6pVf88URdkX0LedIzWdsEbrkm79Jj3MHanbFkUb5WeOYS1ka1PQNOqr+
 U+wQvo9fEY+1GVYR7uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1011 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94492-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5457C1BAB7B
X-Rspamd-Action: no action

On some platforms, host's M-PHY RX_FOM Attribute always reads 0, meaning
SW cannot rely on Figure of Merit (FOM) to identify the optimal TX
Equalization settings for device's TX Lanes. Implement the vops
ufs_qcom_get_rx_fom() such that SW can utilize the UFS Eye Opening Monitor
(EOM) to evaluate the TX Equalization settings for device's TX Lanes.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-txeq.c |   6 +-
 drivers/ufs/host/ufs-qcom.c | 309 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  42 +++++
 include/ufs/ufshcd.h        |   3 +
 include/ufs/unipro.h        |  16 ++
 5 files changed, 373 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
index 55d8d4f49146..086842658cde 100644
--- a/drivers/ufs/core/ufs-txeq.c
+++ b/drivers/ufs/core/ufs-txeq.c
@@ -200,9 +200,8 @@ ufshcd_compose_tx_eq_setting(struct ufshcd_tx_eq_settings *settings,
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
@@ -232,6 +231,7 @@ static int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(ufshcd_apply_tx_eq_settings);
 
 /**
  * ufshcd_evaluate_fom - Update TX EQ params based on FOM results
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 90b1496faf23..7115d87882b1 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2534,6 +2534,314 @@ static int ufs_qcom_change_power_mode(struct ufs_hba *hba,
 	return ret;
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
+		return -EINVAL;
+	}
+
+	if (t_step > 63 || t_step < -63) {
+		dev_err(hba->dev, "Invalid EOM Timing Step: %d\n", t_step);
+		return -EINVAL;
+	}
+
+	if (v_step < 0)
+		volt_step = BIT(6) | (u32)(-v_step);
+	else
+		volt_step = (u32)v_step;
+
+	if (t_step < 0)
+		timing_step = BIT(6) | (u32)(-t_step);
+	else
+		timing_step = (u32)t_step;
+
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB_SEL(RX_EYEMON_ENABLE,
+				UIC_ARG_MPHY_RX_GEN_SEL_INDEX(lane)),
+			     BIT(eye_pos) | BIT(6));
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
+	return ret;
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
+		dev_err(hba->dev, "%s: Target test count (%u) too small for Host EOM\n",
+			__func__, target_test_count);
+		return -EINVAL;
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
+		dev_dbg(hba->dev, "%s: Host RX Lane %d EOM, v_step %d, t_step %d, error count %u\n",
+			__func__, lane, v_step, t_step, err_count[lane]);
+	}
+
+	return ret;
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
+		dev_err(hba->dev, "%s: Failed to select NO_ADAPT before starting Host EOM: %d\n",
+			__func__, ret);
+		goto out;
+	}
+
+	for (i = 0; i < SW_RX_FOM_EOM_COORDS; i++, eom_coord++) {
+		ret = ufs_qcom_host_eom_scan(hba, num_lanes, eom_coord, 0x3F,
+					     eom_err_count);
+		if (ret) {
+			dev_err(hba->dev, "%s: Failed to run Host EOM scan: %d\n",
+				__func__, ret);
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
+	ret = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_TXHSADAPTTYPE), PA_INITIAL_ADAPT);
+	if (ret) {
+		dev_err(hba->dev, "Failed to select INITIAL ADAPT after EOM : %d\n",
+			ret);
+		goto out;
+	}
+
+	ret = ufshcd_uic_change_pwr_mode(hba, FAST_MODE << 4 | FAST_MODE);
+	if (ret)
+		dev_err(hba->dev, "Failed to change power mode after EOM: %d\n",
+			ret);
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
+	struct ufshcd_tx_eq_params *params;
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
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
+		return -EINVAL;
+
+	params = kzalloc(sizeof(struct ufshcd_tx_eq_params), GFP_KERNEL);
+	if (!params)
+		return -ENOMEM;
+
+	memcpy(params, &hba->tx_eq_params[gear - 1], sizeof(struct ufshcd_tx_eq_params));
+	for (lane = 0; lane < d_iter->num_lanes; lane++) {
+		params->device[lane].preshoot = d_iter->preshoot;
+		params->device[lane].deemphasis = d_iter->deemphasis;
+	}
+
+	/* Update Device's TX Equalization settings. */
+	ret = ufshcd_apply_tx_eq_settings(hba, params, gear);
+	if (ret) {
+		dev_err(hba->dev, "%s: Failed to apply TX EQ settings for HS-G%u: %d\n",
+			__func__, gear, ret);
+		goto out;
+	}
+
+	/* Force PMC to target HS Gear to use new TX Equalization settings. */
+	ret = ufs_qcom_change_power_mode(hba, pwr_mode, /*force_pmc=*/true);
+	if (ret) {
+		dev_err(hba->dev, "%s: Failed to change power mode to HS-G%u, Rate-%s: %d\n",
+			__func__, gear, UFS_HS_RATE_STRING(rate), ret);
+		goto out;
+	}
+
+	ret = ufs_qcom_host_sw_rx_fom(hba, d_iter->num_lanes, fom);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get Host SW FOM for Device TX Lane (PreShoot: %u, DeEmphasis: %u): %d\n",
+			d_iter->preshoot, d_iter->deemphasis, ret);
+		goto out;
+	}
+
+	for (lane = 0; lane < d_iter->num_lanes; lane++)
+		d_iter->fom[lane] = fom[lane];
+
+out:
+	kfree(params);
+	return ret;
+}
+
 static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 				   enum ufs_notify_change_status status,
 				   struct ufshcd_tx_eq_params *params,
@@ -2605,6 +2913,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
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
index 56455b137f10..47c657131db5 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -1477,6 +1477,9 @@ extern int ufshcd_config_pwr_mode(struct ufs_hba *hba,
 				  struct ufs_pa_layer_attr *desired_pwr_mode,
 				  bool force_pmc);
 extern int ufshcd_uic_change_pwr_mode(struct ufs_hba *hba, u8 mode);
+extern int ufshcd_apply_tx_eq_settings(struct ufs_hba *hba,
+				       struct ufshcd_tx_eq_params *params,
+				       u32 gear);
 
 /* UIC command interfaces for DME primitives */
 #define DME_LOCAL	0
diff --git a/include/ufs/unipro.h b/include/ufs/unipro.h
index dded830efe24..e8e567c028cd 100644
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
@@ -76,6 +78,20 @@
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
-- 
2.34.1


