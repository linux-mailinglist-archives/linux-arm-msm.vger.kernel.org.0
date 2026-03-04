Return-Path: <linux-arm-msm+bounces-95340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBcCBIE6qGkTqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:58:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F790200D82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:58:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4D8703047AC0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:55:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2473B3C1C;
	Wed,  4 Mar 2026 13:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BQ5Otc6Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5533A4514;
	Wed,  4 Mar 2026 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632487; cv=none; b=GdT9BbDdbuQXxc48KeUJwQIHrFPwI7EL0n8B1srIJ4M8LPzniUXmOnWx+wwpwp4L/U4lQtTuw3nPtTY48Cnnq8roUlwcYRimwypxq9OnY9zA951TzFyziPA6iIt87bcxUTAu2o/DMuvZVvL39K2jE7UEcTJspEC8IRdM99qUcyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632487; c=relaxed/simple;
	bh=pzpfmiyjGuQnxrZh/scpiCBr+7FG+Oc6j/Ged3jdtyk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lID5+1KDAGkv86kqosChpt13kYc/a/GDNdkL6SLFeaKCbTnCrA94usap8hQvlvIBJVuUvDVNE+SvwqSTfLNlm1d3kRgnXgBcQvq9/mY/+I0BAO1TAYLRG8tNxSM0rEkmiS/+6+uwb1cDWRmMZB0lg2AghnKjw7w6UHKTrBl2u4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BQ5Otc6Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624DGCiN2277038;
	Wed, 4 Mar 2026 13:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sa7OzHBbOIs
	E0aJwkckVem0Bd57Ga0aE/VYsuGil4NM=; b=BQ5Otc6Q6ryMRUlIyJg7CskXAlT
	rHZXS4xkHhtqcd1VqlCRCDAeS/GVziSuAuIcpK0t4nMjRthZYdbP0kyKLNrw3LoF
	12PYMUwkHq+S7b2TKipwiR0LW9p0UavqfTMnaxAVrBFPk9akx2NDoTYe05Xr3XlG
	aM3XenzPtg+uRsRRIRt0R/5CF3/D1m1MiyPRwBMHLCBQ8GBwFkQ3RRL7MLl75JMr
	6ZEr7J6rfVg4bM58Bv0ZMO/C217llj2UKpxzJ/QAES4V4qidZuBUo0o3C1bCRgOX
	O2DkaUMZS1QdfNewt9fSVGP3CHyJC4YVXj84Kp+5g/EsHoCQn0EkH29+AiA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4mt17n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:31 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 624DsUGU031824;
	Wed, 4 Mar 2026 13:54:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 4cpa2mqf87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:30 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 624DsUo9031816;
	Wed, 4 Mar 2026 13:54:30 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTPS id 624DsTOl031808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:30 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id A34B25A7; Wed,  4 Mar 2026 05:54:29 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...)
Subject: [PATCH v2 09/11] scsi: ufs: ufs-qcom: Implement vops get_rx_fom()
Date: Wed,  4 Mar 2026 05:53:11 -0800
Message-Id: <20260304135313.413688-10-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
References: <20260304135313.413688-1-can.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YA_-ifWyTY5ztb3HRrWI7ZwJD06FTozJ
X-Proofpoint-GUID: YA_-ifWyTY5ztb3HRrWI7ZwJD06FTozJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExMSBTYWx0ZWRfX7UIPsPggW/tJ
 y3i9VM8MstCSKtn8MHt3vh+LGtmvNsQyzmXsJFBf6qv4TZtWwhmKH4cnbuBJObiu95XS8XaDq0j
 UnR/9qINhFNyzM/LwOpl5jW1fMOfo5uqaixsDIi7/eNY5mTYC+X5nquhzp/+ttcFyuERsnpHwEy
 waREoo+SbAcCqYOVKFqAnpUirsU9KyUB/E2E6U1Culu1GKiOyc0HpAoPI9dZykuZmBmnx4BwPZw
 d2KXmj+fEAMI41zHZKYMO/GJFnJFneDJbRldtIsermQfrQtwqNMVzYiWAQkhC98tBAskHc6XafY
 CQdkw5nUQ2okyP9BEfKeIkUV0XJQyc9+fAl8JAKrRtkANRDY0+U+FHleLWRG3nXhbKwRlUgo1Jb
 Y8BguKJfn2y6F49MueJP8BwiOGSRS122RneY/my4Ax2QHPxXhW169c0Zo/PnVJMr/piUJ23VbAn
 BSlRHLcer4G9xKZQgnA==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a83997 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=2IgMz4VFwGHL2qIcOowA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040111
X-Rspamd-Queue-Id: 0F790200D82
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95340-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
 drivers/ufs/host/ufs-qcom.c | 315 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  42 +++++
 include/ufs/ufshcd.h        |   3 +
 include/ufs/unipro.h        |  16 ++
 5 files changed, 379 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
index 2cd2d5156607..02c1a8479910 100644
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
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(ufshcd_apply_tx_eq_settings);
 
 /**
  * ufshcd_evaluate_fom - Update TX EQ params based on FOM results
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 1e074058f23d..b8fa4670ddd6 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2534,6 +2534,320 @@ static int ufs_qcom_change_power_mode(struct ufs_hba *hba,
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
+		return -EINVAL;
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
+	ret = ufs_qcom_change_power_mode(hba, pwr_mode, UFSHCD_PMC_POLICY_FORCE);
+	if (ret) {
+		dev_err(hba->dev, "%s: Failed to change power mode to HS-G%u, Rate-%s: %d\n",
+			__func__, gear, UFS_HS_RATE_STRING(rate), ret);
+		return ret;
+	}
+
+	ret = ufs_qcom_host_sw_rx_fom(hba, d_iter->num_lanes, fom);
+	if (ret) {
+		dev_err(hba->dev, "Failed to get Host SW FOM for Device TX Lane (PreShoot: %u, DeEmphasis: %u): %d\n",
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
+	ret = ufs_qcom_change_power_mode(hba, &old_pwr_info, UFSHCD_PMC_POLICY_FORCE);
+	if (ret) {
+		dev_err(hba->dev, "%s: Failed to retore power mode to HS-G%u: %d\n",
+			__func__, old_pwr_info.gear_tx, ret);
+		return ret;
+	}
+
+	for (lane = 0; lane < d_iter->num_lanes; lane++)
+		d_iter->fom[lane] = fom[lane];
+
+	return ret;
+}
+
 static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
 				   enum ufs_notify_change_status status,
 				   struct ufs_pa_layer_attr *pwr_mode)
@@ -2604,6 +2918,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
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
index c6f215bb5ed3..35f4f5fba700 100644
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


