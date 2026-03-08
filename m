Return-Path: <linux-arm-msm+bounces-96064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJFTBhGTrWlH4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:17:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D1230E7D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04F82304AD91
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 15:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E41B29E10F;
	Sun,  8 Mar 2026 15:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kr0aXtcb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF9523EA85;
	Sun,  8 Mar 2026 15:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982919; cv=none; b=sfc8CZrqgd6TNrWc+M3ntTfcMdauCCUHfnwJQNEHBFrcRVxHAa5jj4R+h7f0uj5I8bYKDCvNRjtCrTs4UPZ82gJEk4z0uTjcMx/g0i6/KlZ68yn0Iepy7nERlgH/6UTAu7YaMCPB2HU8FvoEZq4HhhvrxBtCzBRCQRn9y1Kiaa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982919; c=relaxed/simple;
	bh=erzZCgHdRXlIljk2JiSxNlI8VUn0wAGH38z4/O9EZEc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p/0gn/sSTSJVHIZUspBGIFVM1jZC3KWl3sDMn9ik5bljPWCzLUg7enVLG1L5x+HEjR0d8OC2Rr5BIBWIoF57NiB0bbfx5BnnYc5sZGiRuPZEwvLfZrrS1JkHwlo5V55k75SVhhmedGSuqgqk95Vmn6q3fQC6ZHmBrvXfc30lCF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kr0aXtcb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6285t6sH2908366;
	Sun, 8 Mar 2026 15:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CW99qUXyQ1P
	sCAYZ5gxARFwMaJTTJKvYbe1YFCzzMDA=; b=kr0aXtcbajbRLz3WacQRtkOEo9K
	yPzkr+a4ELzFTai4QIBjV27c61Vu4AqABtGKBfzEGvx7HILG1NMU3tWQCpDcBncp
	awZjjdhYuxsbUYOCYtkcqUAFDEz3Mo2BWRHXZmToFHVU8Il3X2Nalnk0KB9TWbsM
	BagQUSGEBDIVRay1XX3oRUzTUiAkN0oHCU5HR6gD6dXzRF/OIQZhHF7/JysMPg+B
	b443Ao7kE1bGk94r1anT8iJtOy07VxG7um7bGQvtURKv8cqAyDpqJ6OJoBOnWTNX
	vaV/K9kF+/JpraODdJoPEVMFOSktTJLKX9Uy9SJq51Oz2meiU69srh5S7+A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crb14tu8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:09 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 628FF8G7011432;
	Sun, 8 Mar 2026 15:15:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4crd3p2vee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:08 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 628FF7Nv011426;
	Sun, 8 Mar 2026 15:15:07 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 628FF7Pv011420
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:07 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 82EE55A4; Sun,  8 Mar 2026 08:15:07 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 09/12] scsi: ufs: ufs-qcom: Implement vops tx_eqtr_notify()
Date: Sun,  8 Mar 2026 08:14:06 -0700
Message-Id: <20260308151409.3779137-10-can.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=IYSKmGqa c=1 sm=1 tr=0 ts=69ad927d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=nGGDM5cuOJ86brUDmcsA:9
X-Proofpoint-GUID: 84-Ysy8WKBvvJHdYT4DtFJGTLGC5hlZF
X-Proofpoint-ORIG-GUID: 84-Ysy8WKBvvJHdYT4DtFJGTLGC5hlZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE0MCBTYWx0ZWRfXz5uqE7xGk0d3
 Zr7axoAiNyhGD+4EVEX4uwDuCtXOsNJFHyxZLHteCN9juDswvrUIiTiCcaqon5Z4r97aPDGnh4D
 GM9LBeOpCC3+coAgkGJPKah1FSmMhfCqpa+ODszFowTMedkn8CIzw0m679568CsmdkYWFpmstBc
 7Bi4xExzsiPUNRFVC4bmtBU65UwC4VNNPKiZBsZqJ6wUdiwDTDmM1Pb6C8xiIhKCTuQr4dlVc9N
 76zAqLSIk/DUrhp96uwUH+NMi9Xa/KUVS29mTDQXtXKOdoWOZbetvoyIsT/B0MpseHaJnSDF5pm
 y3NkTwvPoUHvOkvVoStGJxdqzJtVxtHP11yGhwfVj9iF9YdPM7Vzu6ycDKRFUMJP+fybZHQea6M
 uJgqg16c6dZx203zgxLo/mSDGH712fwW+FqYrdxxGwx7f3+9MhyKRiU8JFaom7W6aB+dc03xtfE
 3UT8A3xgBlfHdrxte5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080140
X-Rspamd-Queue-Id: B54D1230E7D
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
	TAGGED_FROM(0.00)[bounces-96064-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.987];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
 drivers/ufs/host/ufs-qcom.c | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index eb57b06f95b5..3c45de7a0b25 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2515,6 +2515,46 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
 }
 
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
+		ret = ufshcd_change_power_mode(hba, pwr_mode,
+					       UFSHCD_PMC_POLICY_DONT_FORCE);
+		if (ret)
+			dev_err(hba->dev, "%s: Failed to PMC to target HS-G%u, Rate-%s: %d\n",
+				__func__, gear, UFS_HS_RATE_STRING(rate), ret);
+	} else {
+		/* PMC back to HS-G1. */
+		ret = ufshcd_change_power_mode(hba, &pwr_mode_hs_g1,
+					       UFSHCD_PMC_POLICY_DONT_FORCE);
+		if (ret)
+			dev_err(hba->dev, "%s: Failed to PMC to HS-G1, Rate-%s: %d\n",
+				__func__, UFS_HS_RATE_STRING(rate), ret);
+	}
+
+	return ret;
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -2545,6 +2585,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
+	.tx_eqtr_notify		= ufs_qcom_tx_eqtr_notify,
 };
 
 static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
-- 
2.34.1


