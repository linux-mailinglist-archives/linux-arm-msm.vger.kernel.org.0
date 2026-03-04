Return-Path: <linux-arm-msm+bounces-95337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CeYOd45qGkTqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:55:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 922B8200CBC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 26D9E3051486
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A32773A8727;
	Wed,  4 Mar 2026 13:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vf4Je2eO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B7A3A5E6A;
	Wed,  4 Mar 2026 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632473; cv=none; b=Sah7yjNXffAnjqqSXaUxBP3V6lwd+i9GjDd1raTPoiC8q77FC1Y5wHsBl5YP+VsuA9xsMG5dZOE3kFYMqFfqXgexEAmsWMmexCTt/To+3CO1ODSJ6X7FecYNn3Rpc5IvlheIvY5u8wwPQGOfgYBVR9KfIazPGpKZZPFxPBI86A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632473; c=relaxed/simple;
	bh=12L8gcxgzG49GtB1Pa5JW2+8cnGqRZbtHPM8o9jey0Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fYtk56KxBorx7JJV0TxfmRCHdgfjYrCZbJGxldkk8NcEM7pTUO0HrS52cwIiSY8O8Wl3Y4XmbY6E5T72q8B4Obcu8L8Ys4yQp3x8wtUPbVteNCjM5mlwUq2VyZubBSbc13Zdg8uZVRV0ot5nTuM3eSSgaXvPJu+WI+o/98nlIH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vf4Je2eO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624BvbVF2306785;
	Wed, 4 Mar 2026 13:54:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GS/L3pi5rxK
	ggMtHhUfWN8A0HwXFJcLdGfkrfgBGFNc=; b=Vf4Je2eO78IRrxHQ5bfJd0Yyt6L
	DvD1zPZJBzWMHbXNbNinbfWivxbwGChSj8O580ucJvqGEYhwYJMe1I/nOq8VGNhI
	7j+U11Qh4DiPAcsPnXpSrsaW17mHAMulBsRvJQ4nGozuQ6LbFd+e/DqFEFA9fopF
	aJaltVNCp9aplF2ZEKVdoVWuCEYSo6RpnfB+sk9qovY4l3L/lKNxyRwvXgHCu35T
	JOjLkazNkUokTAXpW11eNCEwx95T1bdGGGLR2Qg4CG3kE3kmxCmPAi3YQaDgPY90
	qbiAUWhRwoq7o+DgAN6QlsnRnMl2IXVegRtsjmEMTMUMr4ZiC7vUkstMUGg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8tb1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:21 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 624DsL1O020490;
	Wed, 4 Mar 2026 13:54:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cpf4wmm34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:21 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 624DsLMn020484;
	Wed, 4 Mar 2026 13:54:21 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 624DsKNH020483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:21 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id D23015A7; Wed,  4 Mar 2026 05:54:20 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 08/11] scsi: ufs: ufs-qcom: Implement vops tx_eqtr_notify()
Date: Wed,  4 Mar 2026 05:53:10 -0800
Message-Id: <20260304135313.413688-9-can.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a8398d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=Pc85pxiuzs78KXOHt8AA:9
X-Proofpoint-ORIG-GUID: h-giC0E2E_9Mz-0S2Zyxn4eljSW8guKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExMiBTYWx0ZWRfX7CgC//l+bKP2
 lmfs20m0uFnbn1hTs13RNF3O6/6Te63GoTIPgUTT3z1i2hYu7aHUnlHqrR6Duwx0pVb/Fr95x3u
 sQSl1V/zLwgwt2lAIaUkwT4UM7qDm9EAyDksbUe39Zfi0105bow2bV0+XUCSccZysMoNSxv3TLI
 plyDVgOlPpvYvwkDVkz2uB5NXAqjDFc+JpXnlERrClTVWXj8z/97pWXM9W4osk7u9vP8ZYseTQf
 302Xv7bqFnVdj4PCQg8+OzrlmPmErOwXl4+An2ylDpWXeDKGcpMb4UWcRq4r7IqfBWeZOekeNL/
 8SBneBuxBFUUqeBgU0P7uildPLGG9oCVo2Nd/9j/U3+XNQc78Ei6tfT+l9F6kIjz4FxjrfxUX++
 DBUkzUjO1b590X033eVot0ZeUpa4VGompabdEQI2YiUp1uVMqefqOiA01cFWitT1dlxAxSiAOQ3
 6VNyKwIaOGZnJID2JyQ==
X-Proofpoint-GUID: h-giC0E2E_9Mz-0S2Zyxn4eljSW8guKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040112
X-Rspamd-Queue-Id: 922B8200CBC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95337-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

On some platforms, HW does not support triggering TX EQTR from the most
reliable High-Speed (HS) Gear (HS Gear1), but only allows to trigger TX
EQTR for the target HS Gear from the same HS Gear. To work around the HW
limitation, implement vops tx_eqtr_notify() to change Power Mode to the
target TX EQTR HS Gear prior to TX EQTR procedure and change Power Mode
back to HS Gear1 (the most reliable gear) post TX EQTR procedure.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 63 +++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3a9279066192..1e074058f23d 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2512,6 +2512,68 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
 }
 
+static int ufs_qcom_change_power_mode(struct ufs_hba *hba,
+				      struct ufs_pa_layer_attr *pwr_mode,
+				      enum ufshcd_pmc_policy pmc_policy)
+{
+	int ret;
+
+	ret = ufs_qcom_pwr_change_notify(hba, PRE_CHANGE, pwr_mode);
+	if (ret) {
+		dev_err(hba->dev, "Power change notify (PRE_CHANGE) failed: %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = ufshcd_change_power_mode(hba, pwr_mode, pmc_policy);
+	if (ret)
+		return ret;
+
+	ufs_qcom_pwr_change_notify(hba, POST_CHANGE, pwr_mode);
+
+	return ret;
+}
+
+static int ufs_qcom_tx_eqtr_notify(struct ufs_hba *hba,
+				   enum ufs_notify_change_status status,
+				   struct ufs_pa_layer_attr *pwr_mode)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_pa_layer_attr pwr_mode_hs_g1 = {
+		.gear_rx = UFS_HS_G1,
+		.gear_tx = UFS_HS_G1,
+		.lane_rx = pwr_mode->lane_rx,
+		.lane_tx = pwr_mode->lane_tx,
+		.pwr_rx = FAST_MODE,
+		.pwr_tx = FAST_MODE,
+		.hs_rate = pwr_mode->hs_rate,
+	};
+	u32 gear = pwr_mode->gear_tx;
+	u32 rate = pwr_mode->hs_rate;
+	int ret;
+
+	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1)
+		return 0;
+
+	if (status == PRE_CHANGE) {
+		/* PMC to target HS Gear. */
+		ret = ufs_qcom_change_power_mode(hba, pwr_mode,
+						 UFSHCD_PMC_POLICY_DONT_FORCE);
+		if (ret)
+			dev_err(hba->dev, "%s: Failed to change power mode to target HS-G%u, Rate-%s: %d\n",
+				__func__, gear, UFS_HS_RATE_STRING(rate), ret);
+	} else {
+		/* PMC back to HS-G1. */
+		ret = ufs_qcom_change_power_mode(hba, &pwr_mode_hs_g1,
+						 UFSHCD_PMC_POLICY_DONT_FORCE);
+		if (ret)
+			dev_err(hba->dev, "%s: Failed to change power mode to HS-G1, Rate-%s: %d\n",
+				__func__, UFS_HS_RATE_STRING(rate), ret);
+	}
+
+	return ret;
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -2542,6 +2604,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
+	.tx_eqtr_notify		= ufs_qcom_tx_eqtr_notify,
 };
 
 static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
-- 
2.34.1


