Return-Path: <linux-arm-msm+bounces-99892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AOKHGcIxGk+vgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:08:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E56B3328B36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47E093350A5D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E41DA3D523E;
	Wed, 25 Mar 2026 15:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HQkdSByL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879553C3453;
	Wed, 25 Mar 2026 15:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452243; cv=none; b=G2JmjQet0VsKTP103VioQLlHi56eqn0wQa20B6p6Q+saPDK4SS6pyAMH3D5X78Pq74mbacuThd6ttXDE0eAJjjFM5adkg05Myygpd2pSFGjGMj4Gfo61oFgKJi2qRIG6YjHxUzy9KvFGMjccPvDMcTGbxjMkdNd+xPHMp2MZVfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452243; c=relaxed/simple;
	bh=CRyuHEJ33YGYk2ZOjDFEdGXUULitSW69EVffwQ3d+5k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lw0oQchFafkQqtZ/3Fn+FpzSY9iwDK0ScCWlS/loVTclpmq2UGO8SIdleeBjDAtUbw8lneBTYTA8LVlygynA6BhJm39pOTj/lfSwecld1nS6ZrO1aXZByYb8I4RkFk+J5otq/sq6CKM9GpuIuQzAqcH9VLz1NQsOoNLoWAeio1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HQkdSByL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH9QJ2432212;
	Wed, 25 Mar 2026 15:23:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dSoR7UMa5c4
	biRnIY4+DAT0Udq9wS7pO2nM5nYtLrW0=; b=HQkdSByL00rNNBsmS/vdDi72gKf
	eKrpyS138DsPQ1c77/IlDOgFKeMUQ5eTU6gbr71B0H9r/AyzOE+4FRjAsQRJMmxs
	rLt4P/zpM2MHEhW6H2z32mwti3X0q2Fom/hFoHJaeEE/TVbN9d2W+VE0/7vQ4yPl
	Kq36WT2DRvu1yA0gXUqvF/jkFu5N6wDbPoZchwyl2qGQajGhS2n55M1eLp9GIehf
	DskYWzRsZnazzqM+jwiViHOoNkAyMF7BzwzIde4djqOzJmSy5gwfID+JUebC/2yT
	7N8MhtSXJ8XvJjjzjLeSwxMr73o7U7qC0ucdrNIBPm+QjJgcvwZioAI104w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mje1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:23:52 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62PFNp8V007284;
	Wed, 25 Mar 2026 15:23:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 4d474nyhm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:23:51 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62PFNgOA007115;
	Wed, 25 Mar 2026 15:23:51 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 62PFNp2C007277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:23:51 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 363135AE; Wed, 25 Mar 2026 08:23:51 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 09/12] scsi: ufs: ufs-qcom: Implement vops tx_eqtr_notify()
Date: Wed, 25 Mar 2026 08:21:51 -0700
Message-Id: <20260325152154.1604082-10-can.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExMCBTYWx0ZWRfXwtx0/yx3bSfF
 UWR9DrHxMH1BDsCWTz16ZibCOUmqwn0Z/oJ72jdB+A6I/M5+0z3FovOMRgyVkuWElLysxk8eD8v
 Ep378tPTYS1ypeCjwTqW6IystRB/XCxc9Mn800FRAEgXhEnxDv/y47HSEDYmEghFqSrfTfCe84R
 9lT1o95iNSuzubLkyai+yJ8mmiIOzeeDkpQ523j33wTD94Z+UHVFwHxD7Sdj8ZjOQqej6vFqN5R
 /jgbprsNfeIPdpRlxhASSQUK9DZrXvqnpysO9RIDXenJi3P07MKrHo7tZmGc5U18cjxzL81Ox+o
 tORfOrr0UROg8H/pJGOjwTqJWPZ+GHZa6GJ8brKqSB0Zv6k5YztexUCwV0xQhLpeWECB5/mpYX/
 fSG2e0/ygmgPXIm4j9+LH5k1C0H+VcOGm3fkoWCaKddmOzSRwjNoh6WbWNUp1GN2I8cmRSbeSax
 pNWL0xT3Kuqmf11Xotg==
X-Proofpoint-GUID: hKXRKdZvddfCmBCL3J7552yVDozJ-eOi
X-Proofpoint-ORIG-GUID: hKXRKdZvddfCmBCL3J7552yVDozJ-eOi
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c3fe08 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=PY6Zn8H8AAAA:8 a=N54-gffFAAAA:8 a=EUspDBNiAAAA:8
 a=nGGDM5cuOJ86brUDmcsA:9 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250110
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
	TAGGED_FROM(0.00)[bounces-99892-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,micron.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,acm.org:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: E56B3328B36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On some platforms, HW does not support triggering TX EQTR from the most
reliable High-Speed (HS) Gear (HS Gear1), but only allows to trigger TX
EQTR for the target HS Gear from the same HS Gear. To work around the HW
limitation, implement vops tx_eqtr_notify() to change Power Mode to the
target TX EQTR HS Gear prior to TX EQTR procedure and change Power Mode
back to HS Gear1 (the most reliable gear) post TX EQTR procedure.

Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 41 +++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index b94fe93b830e..eac5e95e740b 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2505,6 +2505,46 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
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
+				__func__, gear, ufs_hs_rate_to_str(rate), ret);
+	} else {
+		/* PMC back to HS-G1. */
+		ret = ufshcd_change_power_mode(hba, &pwr_mode_hs_g1,
+					       UFSHCD_PMC_POLICY_DONT_FORCE);
+		if (ret)
+			dev_err(hba->dev, "%s: Failed to PMC to HS-G1, Rate-%s: %d\n",
+				__func__, ufs_hs_rate_to_str(rate), ret);
+	}
+
+	return ret;
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -2535,6 +2575,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.get_outstanding_cqs	= ufs_qcom_get_outstanding_cqs,
 	.config_esi		= ufs_qcom_config_esi,
 	.freq_to_gear_speed	= ufs_qcom_freq_to_gear_speed,
+	.tx_eqtr_notify		= ufs_qcom_tx_eqtr_notify,
 };
 
 static const struct ufs_hba_variant_ops ufs_hba_qcom_sa8255p_vops = {
-- 
2.34.1


