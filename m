Return-Path: <linux-arm-msm+bounces-113881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iayUBW1JNmqh9AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 10:03:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD256A8887
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 10:03:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fr8KcA6v;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113881-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113881-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BC0C23008D1F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 08:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9D922579E;
	Sat, 20 Jun 2026 08:03:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A41A3166;
	Sat, 20 Jun 2026 08:03:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781942631; cv=none; b=hujs/Hlnie+VY8PahGGqe8XqR604C2LdOku4UvoSK/8O/TGBwwAETcZ4l9gIPWS+pxJHvjQImoabtuuECDJVVl7hM2PbUKQBWs+dtuTWS89KrSg2Ko//NQLMENeojeCXUDJmo3jFCQBxVC0iz++DlgChuh24n0g/Cll4ArC9370=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781942631; c=relaxed/simple;
	bh=V2EXxXoDMG5deaJlqQb1USo0Et0IF2rWIjZfGUxuMM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uJZ6vAuZU5854goPE6jRXFA4N2p79oit2wAICzRoDM4NspU9GwzwS64BLtW9WspU0WQmxL8O/tYxxkpoQ1qX7qtsS7K7TDIA5hwF6LvTBMtpXotlJ5JtQC/HyuwK7IfxuwZel6WZtPTVElcWOLtnD8rKq8DCFlqxpIvUbxLMdfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fr8KcA6v; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65K3L3eC2618784;
	Sat, 20 Jun 2026 08:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uQ+HE2A31kE
	yF82FwAhJXLBEykdUxlLdjJ8+6OcyraU=; b=fr8KcA6v198wZFiHwYgEfvCS3Ns
	lb2JrarWCi/iq235k4QbmDxjOWNDYgwPMxgy1UnBRuR9rLfuTsEDG3eviFgGKvze
	0P/8/YxYGjMGXj5WM6ENx5ta597By7xlgX2WH7/4pHmQLZ9syzpDOPD2r17YhlUb
	dTTf6lRzTqFhlyZbOqlauR84YIcc1m9lfrrXOkG7HqNvdzynF/v15NVnPIruLobP
	KlM4xl9MjGaNmE8tBsLcF0176IYpe8oP6q/dnQwv5LmagBu44ZrQ/2j4Gb6t9Sa0
	i4IfHUApQDqmAzXPmc5N800Q11z9WqDzQtxwPu/Xhgz1SuNRWPyNkqXADbg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5gkrw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 08:03:30 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65K83TgG012531;
	Sat, 20 Jun 2026 08:03:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ewkxh95x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 08:03:29 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65K83Seu012525;
	Sat, 20 Jun 2026 08:03:28 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 65K83SlA012524
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 08:03:28 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 9F9CD64C; Sat, 20 Jun 2026 01:03:28 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] scsi: ufs: ufs-qcom: Restore TX Equalization settings on FOM failure
Date: Sat, 20 Jun 2026 01:03:20 -0700
Message-Id: <20260620080322.3765210-2-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260620080322.3765210-1-can.guo@oss.qualcomm.com>
References: <20260620080322.3765210-1-can.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDA3NyBTYWx0ZWRfX5PXHeolm2A/I
 DhD1WnZeAbpNZwHft2bZK0JPOuh9LN/9KtI4FZGXj9YQ89jg9vcJxO6sIObC+vowqqGDg4TbyLN
 Z5meBz2cdFpiKWnVGiyucRDKAGK4FclCJSx6eVnyxBzscQQxirmc4tI/ki7+EUKAYxjuz5gjJIk
 Fc5NmCX4vboijiuporOIhJObZO0Qx8MFfivhMPBMLuJ3h+MevuLIrvoxef819q5JY1qWrM3PtFU
 inTBDa4Coj3JPXpRUignEI/yBw570KKfHrqvo0V6a4yco0HenVclULTKH8Ja1F23r0BOTJauHe0
 vkEk5/9mospDXeSuwNjm5V9X5n/B84fxAev3dIzvP0F999zvartxIkFSqjIRbKUUrPcCY2GkKa0
 l62JAcRvOoFLt08Q0l4p4HaC+hSlYzXynFzgzB+bgWlcBnSif0PqtrL4Bhj8Yupa8ZALOHrVObs
 kb3OzqZjPSlidFBvxbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDA3NyBTYWx0ZWRfX/QzfdxwUELCy
 QcTSJLkb8+UkO1fXa8ZK2iqnTtG6kxDxbZY0bELQt30qF3j2sDYxVYWnBOGrSsK42RGtbN4U+U4
 1FcioEzPHnvRvCyd+o8W9Zvox03uOjs=
X-Proofpoint-ORIG-GUID: C5FKg2mC_3BzZtv-EAcjRXaQmJHTYBxE
X-Proofpoint-GUID: C5FKg2mC_3BzZtv-EAcjRXaQmJHTYBxE
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a364952 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=eGa5Le0WxWYHDMwdXPYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-20_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606200077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113881-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:beanhuo@micron.com,m:peter.wang@mediatek.com,m:martin.petersen@oracle.com,m:mani@kernel.org,m:linux-scsi@vger.kernel.org,m:can.guo@oss.qualcomm.com,m:James.Bottomley@HansenPartnership.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDD256A8887

ufs_qcom_get_rx_fom() applies temporary device TX Equalization values
before forcing HS mode and running the EOM-based SW FOM scan.

When one of these steps fails, the function can bypass the shared
cleanup path and leave temporary TX Equalization settings programmed.

Route those failures through the cleanup label so the original TX EQ
settings are restored and link recovery runs before exit.

This path also reuses ret for cleanup, so it may overwrite the original
error. Keep that on purpose: if cleanup succeeds, the caller can proceed
with the FOM result for the current iteration.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c084ccc72523..7d7c001435bf 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2791,7 +2791,7 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
 	if (ret) {
 		dev_err(hba->dev, "%s: Failed to apply TX EQ settings for HS-G%u: %d\n",
 			__func__, gear, ret);
-		return ret;
+		goto link_recover_and_restore;
 	}
 
 	/* Force PMC to target HS Gear to use new TX Equalization settings. */
@@ -2799,16 +2799,15 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
 	if (ret) {
 		dev_err(hba->dev, "%s: Failed to change power mode to HS-G%u, Rate-%s: %d\n",
 			__func__, gear, ufs_hs_rate_to_str(rate), ret);
-		return ret;
+		goto link_recover_and_restore;
 	}
 
 	ret = ufs_qcom_host_sw_rx_fom(hba, pwr_mode->lane_rx, fom);
-	if (ret) {
+	if (ret)
 		dev_err(hba->dev, "Failed to get SW FOM of TX (PreShoot: %u, DeEmphasis: %u): %d\n",
 			d_iter->preshoot, d_iter->deemphasis, ret);
-		return ret;
-	}
 
+link_recover_and_restore:
 	/* Restore Device's TX Equalization settings. */
 	ret = ufshcd_apply_tx_eq_settings(hba, &hba->tx_eq_params[gear - 1], gear);
 	if (ret) {
-- 
2.34.1


