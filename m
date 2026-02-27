Return-Path: <linux-arm-msm+bounces-94488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJJPGInDoWkVwQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:17:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B836D1BAB17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A993F318B87E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEAB044CAFD;
	Fri, 27 Feb 2026 16:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ferz0xvo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AAF44CAC0;
	Fri, 27 Feb 2026 16:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772208562; cv=none; b=l1V6grEllKVISOocX6P4XxSW8aVz/aZtqscHvHTL6Yg3RNy3OOWoBQOGCr/clZUcnHMAuhoEQm8Ritrj7U1CY3RffzQCQpy5FLgVlCHN+to8/geRrtiT8SY/ogqbhdzQ3el+yV5meTj5roOxNa3oqbR7DoBXlaySkLFUPSkxXPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772208562; c=relaxed/simple;
	bh=1R/S/0Ln1C//LuCb1H/fdWBh6u1I5gb/6L6h9rOQ/MY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C5kl3QOq1K8ErLSToTPZP870aqF7CvlPGJ279yISwEHcslrwBqmPD39ZIHd7+7Q2/z34tQGY/RACUTbivRPEUY1XMSFKHyLgOIugPRdReJVyquqORBAtifJh/eGTBvdYkGjjeEELBnkjWGdSrHvOxL+AEBA/5OKfE/ftjoTYaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ferz0xvo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61REaLwP1595575;
	Fri, 27 Feb 2026 16:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cQHNVzswjnT
	hZ4GQucwMBdtDJq30MOcJlvk/JzdLsz8=; b=Ferz0xvoVSFmQtumleaGO08pty6
	jaHpT/6gfg0wBCS3QshA+8oEmHNBmnltpbk/ai10n8RJ/dpjMkNymJQo/Sr4pwq4
	2b+GTRl946RWGElFMf5DCMyB7kyx4A4jRyhNHoE4YdCj9fsvJg9IErbcvH/Fuz80
	RhLtcKJ/fBzGVEWB1jtY1yGThG1txxlDAcGfhbQ3ekuDKUJfKgqe+7XUodDaUWXV
	E2rerspMLE6Fug0WuJHnPy7WwcN3k9/XrdLQ+INlDHRBkOqCA4tOQkNg3K2AbKrg
	T5t2ttAeKyuzMbx5U+GVso9/G+d3a5fF4DBkeeT/rY7fhFOpWTWzd9mMicA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuur3p77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:13 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RG6sgx007501;
	Fri, 27 Feb 2026 16:09:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4cjx30h62g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:12 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61RG9B5C012642;
	Fri, 27 Feb 2026 16:09:12 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 61RG9CZn012670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 16:09:12 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 33E195A0; Fri, 27 Feb 2026 08:09:12 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 08/11] scsi: ufs: ufs-qcom: Implement vops tx_eqtr_notify()
Date: Fri, 27 Feb 2026 08:08:05 -0800
Message-Id: <20260227160809.2620598-9-can.guo@oss.qualcomm.com>
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
X-Proofpoint-GUID: 0w5JdhyUrXR0I3_uKtzXR-F0Ujm-2WG0
X-Authority-Analysis: v=2.4 cv=PN8COPqC c=1 sm=1 tr=0 ts=69a1c1a9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=nGGDM5cuOJ86brUDmcsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDE0NCBTYWx0ZWRfX7kddPDDiF1JM
 rBI7i40bqV7gIDZkJyOdrJbzKxDgDDAmgb9dnX9PBv/q0xf3DOsBBjrTM0qzMTuI7YWEgzO/szz
 7V2GHMm/4wxTO6NSs7Nmx9vaJGxSPNJf8YoXpAdHbO7+gL+XZqsjMQUJzCdV3VeaRG7CkoHLr9H
 GIOrLVnCdDlLZYlNqwfn1awoHTjGiC7e5qEOXf8O3TeRLORJ5GgJDacV/1rxlR2NQuyvXHX2ak8
 HhIk1IZl1lSGgZKy1RWuMMTrHBCKPbgRmDQW0khZkciJuppNcsGBqtQnfUhbnGpgLs+iwWC0TT6
 2bLj1bubB/UJtLBfJ1XipLi3NnBJNs2zNeLv6UZTrTkTqJlubSlv9Wr3ygqy1sgcDoKR1+9Em2O
 +7ssAqOPFp2w77Rp0oM0pwhMBA1dvaptwVe5SviPA+erYgSW9X4Z6T7uV+RzVReEk6Uv3OfFjpV
 xfcgCONwhv8myYHQ3XA==
X-Proofpoint-ORIG-GUID: 0w5JdhyUrXR0I3_uKtzXR-F0Ujm-2WG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_03,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1011 lowpriorityscore=0
 adultscore=0 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602270144
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
	TAGGED_FROM(0.00)[bounces-94488-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B836D1BAB17
X-Rspamd-Action: no action

On some platforms, HW does not support triggering TX EQTR from the most
reliable high-speed gear (HS-G1). To work around the HW limitation,
implement tx_eqtr_notify() to change Power Mode to the target TX EQTR gear
prior to TX EQTR and change Power Mode back to HS-G1 (the most reliable
gear) post TX EQTR.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 64 +++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 3a9279066192..90b1496faf23 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2512,6 +2512,69 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
 }
 
+static int ufs_qcom_change_power_mode(struct ufs_hba *hba,
+				      struct ufs_pa_layer_attr *pwr_mode,
+				      bool force_pmc)
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
+	ret = ufshcd_change_power_mode(hba, pwr_mode, force_pmc);
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
+				   struct ufshcd_tx_eq_params *params,
+				   struct ufs_pa_layer_attr *pwr_mode)
+{
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+	struct ufs_pa_layer_attr pwr_mode_hs_g1 = {
+		.gear_rx = UFS_HS_G1,
+		.gear_tx = UFS_HS_G1,
+		.lane_rx = params->rx_lanes,
+		.lane_tx = params->tx_lanes,
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
+						 /*force_pmc=*/false);
+		if (ret)
+			dev_err(hba->dev, "%s: Failed to change power mode to target HS-G%u, Rate-%s: %d\n",
+				__func__, gear, UFS_HS_RATE_STRING(rate), ret);
+	} else {
+		/* PMC back to HS-G1. */
+		ret = ufs_qcom_change_power_mode(hba, &pwr_mode_hs_g1,
+						 /*force_pmc=*/false);
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
@@ -2542,6 +2605,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
+	.tx_eqtr_notify		= ufs_qcom_tx_eqtr_notify,
 };
 
 static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
-- 
2.34.1


