Return-Path: <linux-arm-msm+bounces-99893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDMoJ9kCxGm0vQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99893-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:44:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B26F3284BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:44:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6076B30E4530
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:24:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4634A3E9287;
	Wed, 25 Mar 2026 15:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QrbpWTmH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E10D2DCBF4;
	Wed, 25 Mar 2026 15:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452245; cv=none; b=gvfUZbEdvXlMmW+Am/jhiPn9/cyYowHDC+g+7sLxe2H66oyw2HhgFQR5m9WIseEMppYz9IzBhwi4BJAuvgTMeYzJmpmo5mg0EZbebaTBwYF2JQMZPNLJtIlBTGBfgGB282OagcmEyf9J5DvqGBWAUDQyKlrfdr396g+mJhulNNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452245; c=relaxed/simple;
	bh=kp64/CdcopORyUuR4cElYEPmuGbT579pRCtjBkDmaRE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=biEqJRkeQ5GzJY93aoW/4I6ibGNKm44EtVnjBhSpYs35AV4Bs1TgcQtZHpdnz3CPlsJlsqdJaKh6F9j2hrEtIlWY+5lhH8zY/OF9887WcpG4FEmSgxxhQEfU99AURYGCK7gqyv9UTOtsAlfLkM+f4oZAZYKzK/U/Y90uP985g78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QrbpWTmH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH7p93628151;
	Wed, 25 Mar 2026 15:23:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yV3XPhzlFJE
	BNurcRqkq1M+3bICkBFw8B4agorcng00=; b=QrbpWTmHsNlA57kDCIw5rxDhT7C
	hkn7Yg/vr+JwUOz+vG4v/OW+ULDxWdWnkEfjcMZ9X3Ir2XU6aOiYjYGu8xQJIkLs
	6/W5dv19o0Ua6skiRikdkjmx+OUnf2LmTkMLk8Oh09fGV9WaYVIM1M2deG7QuGGb
	4Xj9fyfr04gO8y0flvuUWy0cM6WgAzCG+6ScRnidFCpRlmnayZDbtel8QeHNP3UB
	WVEjdY1IWAqwmE40qbznRR92DsH5BMzqcw9vgvn4ld9PjyIKZCvKrsInL1LDbiYj
	9rBMiYtJ5RN+nXJ5jXBmx9EzWwVPYWZDfE/iTjuEWV4LvAakOsICNXLmICw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmps5q1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:23:51 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62PFNoqS007270;
	Wed, 25 Mar 2026 15:23:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4d474nyhm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:23:50 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62PFNo53007261;
	Wed, 25 Mar 2026 15:23:50 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 62PFNosX007260
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:23:50 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 1F3755AE; Wed, 25 Mar 2026 08:23:50 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 08/12] scsi: ufs: ufs-qcom: Fixup PAM-4 TX L0_L1_L2_L3 adaptation pattern length
Date: Wed, 25 Mar 2026 08:21:50 -0700
Message-Id: <20260325152154.1604082-9-can.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExMCBTYWx0ZWRfX90sME/Boce90
 9QhHA0Dt/yUjtwlBwjYp+GXzwWSXCH7+iCKy3phgs5c65lxmVpFM2q6TgS9JLpOJ0wQXrz+O3mw
 hYPhN8+6oKMccBF24m9jVQkcxQYDzdURsVKsBdGRdJr5cBnJQIBVIQidmC7rMMFjfvKlwXRj9/h
 fW8MwReD9pv+W4wiKMCuwfyyfyB12mWBnirmnoW9C2OFt56ORtSMV1f7c0aCyILjPcTwCyp5uKa
 za9XvL5m+upLbXL5n+Yy1j8z+buWbVZv87zdQa5/qwlPy2umqs7pghaOAoRXaANOiYAwww16PAl
 hwGX+TNW5lLtP7IDSIrJxWhBPGzvr1IwdY3FhQsLliJJG1EU44mlNDKutcrZ3bsHzXkMOiooctq
 M2eltTlqfDFFDgTfBp/dm0I04XcZoQviu3v2r2z07sRKO0FRm/iKIK29+GRNtbIf2wjjc2B3wr4
 +aksoEcOB93jm0xbvxg==
X-Proofpoint-GUID: u7Ol_4vg9_8-8PRy6rv0XJmF5Rp7YXOh
X-Proofpoint-ORIG-GUID: u7Ol_4vg9_8-8PRy6rv0XJmF5Rp7YXOh
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c3fe07 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=PY6Zn8H8AAAA:8 a=N54-gffFAAAA:8 a=EUspDBNiAAAA:8
 a=ufAJUjbdAAAA:8 a=cO0rteuSJtlgQIAbmOkA:9 a=ySS05r0LPNlNiX1MMvNp:22
 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250110
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
	TAGGED_FROM(0.00)[bounces-99893-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,acm.org:email,oss.qualcomm.com:mid,micron.com:email,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 8B26F3284BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 178 ++++++++++++++++++++++++++++++++++++
 1 file changed, 178 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index cdc769886e82..b94fe93b830e 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1069,10 +1069,188 @@ static void ufs_qcom_override_pa_tx_hsg1_sync_len(struct ufs_hba *hba)
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


