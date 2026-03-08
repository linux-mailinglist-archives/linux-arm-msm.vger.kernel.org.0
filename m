Return-Path: <linux-arm-msm+bounces-96063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EILPFgKTrWlH4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:17:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6B1230E66
	for <lists+linux-arm-msm@lfdr.de>; Sun, 08 Mar 2026 16:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC39F3046EBE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Mar 2026 15:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C78526CE2C;
	Sun,  8 Mar 2026 15:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ji2ngwPs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8EE26056C;
	Sun,  8 Mar 2026 15:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772982918; cv=none; b=EcwiUwcf3+M46rt3cz88ecm2N2X20j/JiBS6ZPS8aNY7Cqyr4NTQUENqR9ssMkmym1cD+zbOEsN68v23MoVxErTcYZUnoZM3w2vFxa40Bp+iUR25nCs9shDGEGXgJz4b9iTyy25Y/ngF6Ycm4LmGwu9JSDwz53XOi/VA1/918NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772982918; c=relaxed/simple;
	bh=6U1ByCKD0RiIPAsh2xWbwFNVuLnQSeRg/n/1ImYGAPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HkejzrAUQXf2SnqvZe8LFwjrWG8F+uBWmgXka6yOmVfIytrp7tb79vmnhT4/W52xo2J2kee6hF/fNEJpXEw9e+o374t9XBty6Yrwn8+SGn2sWPuO76wZptKrE7/ML6rtc4uUEmUcNHDXRCkK+5fWa62hCzp2m/oLAIpHpjtTwEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ji2ngwPs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628CKc2l1741546;
	Sun, 8 Mar 2026 15:15:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=A7acaMLlZXp
	3ba/EbwhQt7QTT1yPPYCXBLizvNPc1Io=; b=Ji2ngwPs6OAiGsqTYDSkGbqYlPJ
	pAbSgkLDLTh/GKQH57KyB2RbecPmSflX6nY2aLr0IHSZ7Ef+W4BK4OJKTzBP39Cn
	Obc925jswVPZEiIiXWJ8Mad9RPKZVMguwCbXJ6k8y+0RnPlurFmvHKY7zC7SI33y
	13pMZB9ipRZ7u94dKzwLW38E61rjHtVLL4OWIh3IlUuxEHl4gdzHI7RPBiJY9ICd
	/H2aEgb9TvdNFejBdB9ST1c1qonwShzjC3ChQuqLEOBHKgKOPoo/6xgUNIHYsQX+
	89dsJjkW1v+w0IEXqmiFZx23xNNdGPzQIOQPfJqFORlfXAujAz85e6jkrig==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxtrma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:07 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 628FF6tc021205;
	Sun, 8 Mar 2026 15:15:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4crd45jvf8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:06 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 628FF6wu021189;
	Sun, 8 Mar 2026 15:15:06 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 628FF6DV021186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 08 Mar 2026 15:15:06 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 5B3FF5A4; Sun,  8 Mar 2026 08:15:06 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 08/12] scsi: ufs: ufs-qcom: Fixup PAM-4 TX L0_L1_L2_L3 adaptation pattern length
Date: Sun,  8 Mar 2026 08:14:05 -0700
Message-Id: <20260308151409.3779137-9-can.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDE0MCBTYWx0ZWRfX5YyXS9Pl27yy
 2UHLV9iTwqSJ0wZxn1uuaAgK2G5iqQiSZxhNclH87+2nhIzkSrSm8ar9UPLiBciYAwl5bfCl73c
 2l5Zzw8RoWFcrJT7792e8TBkL3iBlIzfv+aGd6PuJvJg1RslYfv4I1ekapdIWxUfDkL0zOWHl9U
 5TWLbowQpAU98VNer8MwPJB5Yjum4T3CyeQ3VGRs1eKPzY3Yc2+xfKN+t5s61hGW7Ck70hoxvDD
 S3e1Tbb7dMEbHMcxMBpeq+vD5TF842nrNVCLezF+NfgsHjlC8rPSbt269lBsnWRTtVMSdqpFEZl
 0TEHkKR8dLHrH0Rkg5XUf6cERyyVlA7UJ2v6QA6D5eH/iD4LAPy8aPbxeMoJMV0yC1dp4TQ+Vr5
 uQNPUY+Wd5kgNjH21CnSh2ouem644we5yW/9/eWWsChKYgL80g8v7mVIA5M6KYQW/MUUpOx5/nR
 QQEtcbxf1pUzAtF0GGg==
X-Proofpoint-ORIG-GUID: 62XxsYAv0hKgDeuDHcw2CG0Zdkv4RJjH
X-Proofpoint-GUID: 62XxsYAv0hKgDeuDHcw2CG0Zdkv4RJjH
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ad927b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=ufAJUjbdAAAA:8
 a=cO0rteuSJtlgQIAbmOkA:9 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603080140
X-Rspamd-Queue-Id: DD6B1230E66
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
	TAGGED_FROM(0.00)[bounces-96063-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.988];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

If HS-G6 Power Mode change handshake is successful and outbound data Lanes
are expected to transmit ADAPT, M-TX Lanes shall be configured as

if (Adapt Type == REFRESH)
  TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 = PA_PeerRxHsG6AdaptRefreshL0L1L2L3.
else if (Adapt Type == INITIAL)
  TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 = PA_PeerRxHsG6AdaptInitialL0L1L2L3.

On some platforms, the ADAPT_L0_L1_L2_L3 duration on Host TX Lanes is only
a half of theoretical ADAPT_L0_L1_L2_L3 duration TADAPT_L0_L1_L2_L3 (in
PAM-4 UI) calculated from TX_HS_ADAPT_LENGTH_L0_L1_L2_L3.

For such platforms, the workaround is to double the ADAPT_L0_L1_L2_L3
duration by uplifting TX_HS_ADAPT_LENGTH_L0_L1_L2_L3. UniPro initializes
TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 during HS-G6 Power Mode change handshake,
it would be too late for SW to update TX_HS_ADAPT_LENGTH_L0_L1_L2_L3 post
HS-G6 Power Mode change. Update PA_PeerRxHsG6AdaptRefreshL0L1L2L3 and
PA_PeerRxHsG6AdaptInitialL0L1L2L3 post Link Startup and before HS-G6
Power Mode change, so that the UniPro would use the updated value during
HS-G6 Power Mode change handshake.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 178 ++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 5eb12a999eb1..eb57b06f95b5 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1079,10 +1079,188 @@ static void ufs_qcom_override_pa_tx_hsg1_sync_len(struct ufs_hba *hba)
 		dev_err(hba->dev, "Failed (%d) set PA_TX_HSG1_SYNC_LENGTH\n", err);
 }
 
+/**
+ * ufs_qcom_double_t_adapt_l0l1l2l3 - Create a new adapt that doubles the
+ * adaptation duration TADAPT_L0_L1_L2_L3 derived from the old adapt.
+ *
+ * @old_adapt: Original ADAPT_L0_L1_L2_L3 capability
+ *
+ * ADAPT_length_L0_L1_L2_L3 formula from M-PHY spec:
+ * if (ADAPT_range_L0_L1_L2_L3 == COARSE) {
+ *   ADAPT_length_L0_L1_L2_L3 = [0, 12]
+ *   ADAPT_L0_L1_L2_L3 = 215 x 2^ADAPT_length_L0_L1_L2_L3
+ * } else if (ADAPT_range_L0_L1_L2_L3 == FINE) {
+ *   ADAPT_length_L0_L1_L2_L3 = [0, 127]
+ *   TADAPT_L0_L1_L2_L3 = 215 x (ADAPT_length_L0_L1_L2_L3 + 1)
+ * }
+ *
+ * To double the adaptation duration TADAPT_L0_L1_L2_L3:
+ * 1. If adapt range is COARSE (1'b1), new adapt = old adapt + 1.
+ * 2. If adapt range is FINE (1'b0):
+ *   a) If old adapt length is < 64, (new adapt + 1) = 2 * (old adapt + 1).
+ *   b) If old adapt length is >= 64, set new adapt to 0x88 using COARSE
+ *      range, because new adapt get from equation in a) shall exceed 127.
+ *
+ * Examples:
+ * ADAPT_range_L0_L1_L2_L3 | ADAPT_length_L0_L1_L2_L3 | TADAPT_L0_L1_L2_L3 (PAM-4 UI)
+ *		0			3			131072
+ *		0			7			262144
+ *		0			63			2097152
+ *		0			64			2129920
+ *		0			127			4194304
+ *		1			8			8388608
+ *		1			9			16777216
+ *		1			10			33554432
+ *		1			11			67108864
+ *		1			12			134217728
+ *
+ * Return: new adapt.
+ */
+static u32 ufs_qcom_double_t_adapt_l0l1l2l3(u32 old_adapt)
+{
+	u32 adapt_length = old_adapt & ADAPT_LENGTH_MASK;
+	u32 new_adapt;
+
+	if (IS_ADAPT_RANGE_COARSE(old_adapt)) {
+		new_adapt = (adapt_length + 1) | ADAPT_RANGE_BIT;
+	} else {
+		if (adapt_length < 64)
+			new_adapt = (adapt_length << 1) + 1;
+		else
+			/*
+			 * 0x88 is the very coarse Adapt value which is two
+			 * times of the largest fine Adapt value (0x7F)
+			 */
+			new_adapt = 0x88;
+	}
+
+	return new_adapt;
+}
+
+static void ufs_qcom_limit_max_gear(struct ufs_hba *hba,
+				    enum ufs_hs_gear_tag gear)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_pa_layer_attr *pwr_info = &hba->max_pwr_info.info;
+	struct ufs_host_params *host_params = &host->host_params;
+
+	host_params->hs_tx_gear = gear;
+	host_params->hs_rx_gear = gear;
+	pwr_info->gear_tx = gear;
+	pwr_info->gear_rx = gear;
+
+	dev_warn(hba->dev, "Limited max gear of host and device to HS-G%d\n", gear);
+}
+
+static void ufs_qcom_fixup_tx_adapt_l0l1l2l3(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_pa_layer_attr *pwr_info = &hba->max_pwr_info.info;
+	struct ufs_host_params *host_params = &host->host_params;
+	u32 old_adapt, new_adapt, actual_adapt;
+	bool limit_speed = false;
+	int err;
+
+	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1 ||
+	    host_params->hs_tx_gear <= UFS_HS_G5 ||
+	    pwr_info->gear_tx <= UFS_HS_G5)
+		return;
+
+	err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTINITIALL0L1L2L3), &old_adapt);
+	if (err)
+		goto out;
+
+	if (old_adapt > ADAPT_L0L1L2L3_LENGTH_MAX) {
+		dev_err(hba->dev, "PA_PeerRxHsG6AdaptInitialL0L1L2L3 value (0x%x) exceeds MAX\n",
+			old_adapt);
+		err = -ERANGE;
+		goto out;
+	}
+
+	new_adapt = ufs_qcom_double_t_adapt_l0l1l2l3(old_adapt);
+	dev_dbg(hba->dev, "Original PA_PeerRxHsG6AdaptInitialL0L1L2L3 = 0x%x, new value = 0x%x\n",
+		old_adapt, new_adapt);
+
+	/*
+	 * 0x8C is the max possible value allowed by UniPro v3.0 spec, some HWs
+	 * can accept 0x8D but some cannot.
+	 */
+	if (new_adapt <= ADAPT_L0L1L2L3_LENGTH_MAX ||
+	    (new_adapt == ADAPT_L0L1L2L3_LENGTH_MAX + 1 && host->hw_ver.minor == 0x1)) {
+		err = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTINITIALL0L1L2L3),
+				     new_adapt);
+		if (err)
+			goto out;
+
+		err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTINITIALL0L1L2L3),
+				     &actual_adapt);
+		if (err)
+			goto out;
+
+		if (actual_adapt != new_adapt) {
+			limit_speed = true;
+			dev_warn(hba->dev, "PA_PeerRxHsG6AdaptInitialL0L1L2L3 0x%x, expect 0x%x\n",
+				 actual_adapt, new_adapt);
+		}
+	} else {
+		limit_speed = true;
+		dev_warn(hba->dev, "New PA_PeerRxHsG6AdaptInitialL0L1L2L3 (0x%x) is too large!\n",
+			 new_adapt);
+	}
+
+	err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTREFRESHL0L1L2L3), &old_adapt);
+	if (err)
+		goto out;
+
+	if (old_adapt > ADAPT_L0L1L2L3_LENGTH_MAX) {
+		dev_err(hba->dev, "PA_PeerRxHsG6AdaptRefreshL0L1L2L3 value (0x%x) exceeds MAX\n",
+			old_adapt);
+		err = -ERANGE;
+		goto out;
+	}
+
+	new_adapt = ufs_qcom_double_t_adapt_l0l1l2l3(old_adapt);
+	dev_dbg(hba->dev, "Original PA_PeerRxHsG6AdaptRefreshL0L1L2L3 = 0x%x, new value = 0x%x\n",
+		old_adapt, new_adapt);
+
+	/*
+	 * 0x8C is the max possible value allowed by UniPro v3.0 spec, some HWs
+	 * can accept 0x8D but some cannot.
+	 */
+	if (new_adapt <= ADAPT_L0L1L2L3_LENGTH_MAX ||
+	    (new_adapt == ADAPT_L0L1L2L3_LENGTH_MAX + 1 && host->hw_ver.minor == 0x1)) {
+		err = ufshcd_dme_set(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTREFRESHL0L1L2L3),
+				     new_adapt);
+		if (err)
+			goto out;
+
+		err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTREFRESHL0L1L2L3),
+				     &actual_adapt);
+		if (err)
+			goto out;
+
+		if (actual_adapt != new_adapt) {
+			limit_speed = true;
+			dev_warn(hba->dev, "PA_PeerRxHsG6AdaptRefreshL0L1L2L3 0x%x, expect 0x%x\n",
+				 new_adapt, actual_adapt);
+		}
+	} else {
+		limit_speed = true;
+		dev_warn(hba->dev, "New PA_PeerRxHsG6AdaptRefreshL0L1L2L3 (0x%x) is too large!\n",
+			 new_adapt);
+	}
+
+out:
+	if (limit_speed || err)
+		ufs_qcom_limit_max_gear(hba, UFS_HS_G5);
+}
+
 static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 {
 	int err = 0;
 
+	ufs_qcom_fixup_tx_adapt_l0l1l2l3(hba);
+
 	if (hba->dev_quirks & UFS_DEVICE_QUIRK_HOST_PA_SAVECONFIGTIME)
 		err = ufs_qcom_quirk_host_pa_saveconfigtime(hba);
 
-- 
2.34.1


