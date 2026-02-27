Return-Path: <linux-arm-msm+bounces-94489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HDiF6PDoWkVwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:17:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C1D1BAB38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDFCB314999B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385DC44CF2D;
	Fri, 27 Feb 2026 16:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CNlWW7vZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65644CAF2;
	Fri, 27 Feb 2026 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208563; cv=none; b=JBGBTH3wIYN/5YKEHDl3hYBYOepHkCMSeo2buDaLW0zT+accXEwQjTMJ9IGC38EfFovpj6SR9rdOBvqQW6UEGMQZx+A0JNSI0MVuKUjfMlOU4dSf8+pk8zLhlBrET7HFynYhwjQpT04oa+4Ue4KqNoFRI3IEHlC+ZnrI5pH1XXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208563; c=relaxed/simple;
	bh=JmIDhl36AjXEc7gmljU0G3NXmSMK+m8QRKufXY3xE1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bqyb/b0qjvLLp5OMWC7xIAedzNm0hQi2PGmyfblXoEYhBHnYv6hP5UcEIKJN7SJgRVzAv1OfbytHGannKHUSegWTBcHoblebdBM/6pFjcsj9m2iw9N8nHjxrtl0uqtZY4aHz4PbA3x3N5v74ZqmFBRO7arDP1VgWHNYBTz37T7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CNlWW7vZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61REaF1Z3888243;
	Fri, 27 Feb 2026 16:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ATeeK5nCpHG
	3F2gXyHLys/xcRXsPU2FLpY/RaKCn5vg=; b=CNlWW7vZFfSD2DY6bJgyWrS+swd
	cTZZP8OT6dRkQrKMczF9J0I8QJPPGsu68AEwJ3wRO7/q+K22e6rSYVl+fEqX35v9
	xab7DPkUElGog7zMx+b+/tVwC8s5hyS3zpt8xa1yBpcf+Z/FPGHLPaSNfyE42FOj
	KOyTu7HknruOl2H/1ZrqIH8R9Qn18ToccetpSFk93l0ZrNgw8jL1WGvCfPVk3g7l
	8g2MYNqN5kkp3dI3SnJH7fTybggU68I4LMm9zQ4PH8vG8ek5ry261JcGROvfsXNi
	w2el3uXn5kMG/omkAS6C5jj04U+uIgdj6R1vZGVvXy9phQKTvpirD9kscbQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytun4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:12 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RG6sgw007501;
	Fri, 27 Feb 2026 16:09:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4cjx30h629-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:11 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61RG9B5A012642;
	Fri, 27 Feb 2026 16:09:11 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 61RG9B97012636
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:11 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 0A8C75A0; Fri, 27 Feb 2026 08:09:11 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 07/11] scsi: ufs: ufs-qcom: Fixup PAM-4 TX L0_L1_L2_L3 adaptation pattern length
Date: Fri, 27 Feb 2026 08:08:04 -0800
Message-Id: <20260227160809.2620598-8-can.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a1c1a8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=ufAJUjbdAAAA:8
 a=cO0rteuSJtlgQIAbmOkA:9 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-ORIG-GUID: tvlzM459ngCbE3dht7FqbiThveE8Pr1a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE0NCBTYWx0ZWRfX4lbKh9ls7no1
 nGKafnKiQBQTR1nAXnv3iww/VidLpAz8oUArrmOI46H5Ffoh3odQ18OZ2Y0AGXxXDRXqRfL5Unq
 tHpIt+F4gjQa8GFV895vzP78vSyrVR+a2TlUp7ExbmR1ujMuy3yYFiAn8skG6gbH/65OMNXV1qm
 sbP2nFxPsWXcDLuwm3luCihCjIoy6jzIVMA4CX7UXmKaxABUtSEqlrnPBPXy5ctQevF0YpLFDg/
 8gzpxhlPuPSPIZhFcylmTRqv735UsAGbfl4iaTTPjpY2jnn8TM3Y8uPKW9LSRSy5yKkCir+omuE
 dimnAKCl/lc7Gu4K5rJkcrFtD6l1JzB755F6ZPmbZiCyzj+Zx+fJZAHHPQQmlOTIs9bltC26D+H
 bh1yF69iyHfIusRIrjyH7096zOte2zErb6NnWqvYFlHbDqnXF6rw+UTKygcqEiu+SWpcQmjuPnl
 lCV+iq+QMW5UNgg6BlQ==
X-Proofpoint-GUID: tvlzM459ngCbE3dht7FqbiThveE8Pr1a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94489-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C9C1D1BAB38
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


