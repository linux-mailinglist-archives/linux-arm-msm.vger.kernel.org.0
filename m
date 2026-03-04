Return-Path: <linux-arm-msm+bounces-95336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kASnFPo5qGkTqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:56:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7B0200CD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:56:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19354304B96A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5F53A4502;
	Wed,  4 Mar 2026 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UqSNHikc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995BE31813A;
	Wed,  4 Mar 2026 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632471; cv=none; b=fZFQiKop1Qj0yOotZPONrK9649lj73SaZgtOvQzhGoDdA1zvaP0jAWCKKF9TuPKS8Y3pWfj16fK7NJUOkoFkLABWFCkMNGARkvIIWZIfhi302iLb5y+H7ajgy57hvRg3jn/X+mG8mg/HlNL3Nfm5UWobQBui3NYRX2ZK+SFH9EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632471; c=relaxed/simple;
	bh=JmIDhl36AjXEc7gmljU0G3NXmSMK+m8QRKufXY3xE1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gNVEZLZN7Q44KnXxG9+zmy8bC62w3S83lRPjVRYycROyBYUzLFEHjNfAfqqMIYoFJt1kRMprSBzloPyVxK0HurLkrIddCH/un5cGFDgjxaH/cHM6/w4EErLNpEJXjiYv57zeZ5XOTQd6FQRc/MaH9pa2dIkSG53xfzP1js9ZuKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UqSNHikc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624BfNMX152707;
	Wed, 4 Mar 2026 13:54:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ATeeK5nCpHG
	3F2gXyHLys/xcRXsPU2FLpY/RaKCn5vg=; b=UqSNHikcCPjdh2ARCXp+hv2b6RT
	/gZ0OjhUVefGAXO4zXkvNXlr5ARNupIBB53HWx3Rpn4rt3ZhfOGg58jJkzhxpvSS
	0S5EbEe028zg79WHlGkNvkqsOaiXCK7fVhjVYjN1xwsYVNsXlciG8uQbHkjV9wAw
	QsmOE7pboXzkcl6vtMfuBISLAKbi9ThX/oXzou+DKZqc01wb89ZjvNGnXAEt6Oji
	65GJCaTatnjFsWKlx8TpudvAZAd4O5WUuvrX1V2sRV1m1H7ZYz764OXPU5hz50Yb
	2g/nfVlynlbWpWhUuy2rVmmFeTZu/gKdyYsKlE5QWvTfZWRffIpYSDLjSYA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp3tvktr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:20 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 624DsKFt013156;
	Wed, 4 Mar 2026 13:54:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4cpjdf26qd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:20 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 624DsJNU013151;
	Wed, 4 Mar 2026 13:54:19 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 624DsJoY013150
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:19 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id B38A95A7; Wed,  4 Mar 2026 05:54:19 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 07/11] scsi: ufs: ufs-qcom: Fixup PAM-4 TX L0_L1_L2_L3 adaptation pattern length
Date: Wed,  4 Mar 2026 05:53:09 -0800
Message-Id: <20260304135313.413688-8-can.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExMSBTYWx0ZWRfXyWIRHBqTgdPq
 MyAJWiuIu+Pd++98Oj7lf6XIIVhnpWu5pEZJaufCh/pBD7Kgd8aBn7JMfG6Z2v+jTPtIinPVnwl
 00PS3J1RONSMKpI761ChgGToy5pMAW50JUmtQEnJBSusHFOmSAh+uUlZx79yCAdlJeZOJRC+aUi
 b73DvpGf/AVTqBE0UqFp7UucxwIemIkcblMWPtsrqHforkxIq/6SsGKCTs4pzwaesc/t9KQslZp
 FY4htv2vni+2Lek04hYM3DSWzKDePj5eE1HIWc31b6piCLFhHO7dQmcCswNKsDjN1XTFaZsZWde
 /7tqrp98gy5wEhcKZ9IG75lIN/84tFf3QEz8ynF60XjU+Zsze99owJWsDic/SOj38Ymr2nf79WT
 qQ/7J8BOK8rzYp3DFSRk3fzv7Xaq+IdSxxAKLGF8eD7ZMyb+SkMmw0c2/Ost1muRUZzWHjNJFl8
 GWjb0+zFM8xAjwNs7VA==
X-Authority-Analysis: v=2.4 cv=VYv6/Vp9 c=1 sm=1 tr=0 ts=69a8398c cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=ufAJUjbdAAAA:8
 a=cO0rteuSJtlgQIAbmOkA:9 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-GUID: S8It-MxDhXdmYI83Kt5wkbLzz-wjy4Ww
X-Proofpoint-ORIG-GUID: S8It-MxDhXdmYI83Kt5wkbLzz-wjy4Ww
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040111
X-Rspamd-Queue-Id: 5B7B0200CD2
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
	TAGGED_FROM(0.00)[bounces-95336-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
 drivers/ufs/host/ufs-qcom.c | 175 ++++++++++++++++++++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 5eb12a999eb1..3a9279066192 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1079,10 +1079,185 @@ static void ufs_qcom_override_pa_tx_hsg1_sync_len(struct ufs_hba *hba)
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
+static inline u32 ufs_qcom_double_t_adapt_l0l1l2l3(u32 old_adapt)
+{
+	u32 adapt_length = old_adapt & 0x7F;
+	u32 new_adapt;
+
+	/* Adapt range == COARSE */
+	if (old_adapt & 0x80) {
+		new_adapt = (adapt_length + 1) | 0x80;
+	} else {
+		if (adapt_length < 64)
+			new_adapt = (adapt_length << 1) + 1;
+		else
+			new_adapt = 0x88;
+	}
+
+	return new_adapt;
+}
+
+static inline void ufs_qcom_limit_max_gear(struct ufs_hba *hba,
+					   enum ufs_hs_gear_tag gear)
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
+	dev_warn(hba->dev, "Limited max gear of both sides to HS-G%d\n", gear);
+}
+
+static void ufs_qcom_fixup_tx_adapt_l0l1l2l3(struct ufs_hba *hba)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_pa_layer_attr *pwr_info = &hba->max_pwr_info.info;
+	struct ufs_host_params *host_params = &host->host_params;
+	u32 adapt_l0l1l2l3, new_adapt, actual_adapt;
+	bool limit_speed = false;
+	int err;
+
+	if (host->hw_ver.major != 0x7 || host->hw_ver.minor > 0x1 ||
+	    host_params->hs_tx_gear <= UFS_HS_G5 ||
+	    pwr_info->gear_tx <= UFS_HS_G5)
+		return;
+
+	err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTINITIALL0L1L2L3), &adapt_l0l1l2l3);
+	if (err)
+		goto out;
+
+	if (adapt_l0l1l2l3 > ADAPT_L0L1L2L3_LENGTH_MAX) {
+		dev_err(hba->dev, "PA_PeerRxHsG6AdaptInitialL0L1L2L3 value (0x%x) exceeds MAX.\n",
+			adapt_l0l1l2l3);
+		err = -EINVAL;
+		goto out;
+	}
+
+	new_adapt = ufs_qcom_double_t_adapt_l0l1l2l3(adapt_l0l1l2l3);
+	dev_dbg(hba->dev, "Original PA_PeerRxHsG6AdaptInitialL0L1L2L3 value = 0x%x, new value = 0x%x\n",
+		adapt_l0l1l2l3, new_adapt);
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
+			dev_warn(hba->dev, "Failed to update host PA_PeerRxHsG6AdaptInitialL0L1L2L3 to new value 0x%x, actual value = 0x%x\n",
+				 new_adapt, actual_adapt);
+		}
+	} else {
+		limit_speed = true;
+		dev_warn(hba->dev, "New PA_PeerRxHsG6AdaptInitialL0L1L2L3 value (0x%x) is too large!\n",
+			 new_adapt);
+	}
+
+	err = ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PEERRXHSG6ADAPTREFRESHL0L1L2L3), &adapt_l0l1l2l3);
+	if (err)
+		goto out;
+
+	if (adapt_l0l1l2l3 > ADAPT_L0L1L2L3_LENGTH_MAX) {
+		dev_err(hba->dev, "PA_PeerRxHsG6AdaptRefreshL0L1L2L3 value (0x%x) exceeds MAX.\n",
+			adapt_l0l1l2l3);
+		err = -EINVAL;
+		goto out;
+	}
+
+	new_adapt = ufs_qcom_double_t_adapt_l0l1l2l3(adapt_l0l1l2l3);
+	dev_dbg(hba->dev, "Original PA_PeerRxHsG6AdaptRefreshL0L1L2L3 value = 0x%x, new value = 0x%x\n",
+		adapt_l0l1l2l3, new_adapt);
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
+			dev_warn(hba->dev, "Failed to update host PA_PeerRxHsG6AdaptRefreshL0L1L2L3 to new value 0x%x, actual value = 0x%x\n",
+				 new_adapt, actual_adapt);
+		}
+	} else {
+		limit_speed = true;
+		dev_warn(hba->dev, "New PA_PeerRxHsG6AdaptRefreshL0L1L2L3 value (0x%x) is too large!\n",
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


