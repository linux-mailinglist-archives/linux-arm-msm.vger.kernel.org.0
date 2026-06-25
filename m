Return-Path: <linux-arm-msm+bounces-114526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PjI3AxYcPWqZxAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:16:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 255EC6C578D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 14:16:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lMmuEy+x;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114526-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114526-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EA0CC301DEA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 12:13:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 852B23E022C;
	Thu, 25 Jun 2026 12:13:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD2F3DE45A;
	Thu, 25 Jun 2026 12:13:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782389612; cv=none; b=D/mZdna25lgeTHsLPIt9f9Vy+pd8fb1brB69tTxUvlHxvxgMtZ31ipLq+voxUI0NdnrFktqa4XynihOdvEpKHesekgsaLXLDDrkKv/PqgeWm8mNnB4N2prJkS/4G32JaPiB1yb+OfzgOLFyQ8tQm2i/j25+KZZZO+pwMTRSfuy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782389612; c=relaxed/simple;
	bh=V2EXxXoDMG5deaJlqQb1USo0Et0IF2rWIjZfGUxuMM0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lOIeL2b4GPsJNLJ7IGDZzxTJHR+F3hWKD3YdvpDuSKZUKwEUSSpEF8lrev6oOTEpI8wLmh29vqDTqLhMQ3TZyGIOQmdNUxoGh69uw7/XDCZaqcNJyEEBol7HiA9CVvRNbH4XWmdF4hWu+8r3gMvKqCd+7pJe/JuyNXZRrnuetpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lMmuEy+x; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9jw6B2047057;
	Thu, 25 Jun 2026 12:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uQ+HE2A31kE
	yF82FwAhJXLBEykdUxlLdjJ8+6OcyraU=; b=lMmuEy+xn6cwLwT7KooOiJjZIRv
	WODw9smnMcCAXYAZB29I4zn+QGcyPVSfrlpmWZeKTRU4XCTvsfPOCP/VfVK3fdCA
	RlB+WkxDflAOWcg9kn7rZ4SL7DIexa1PNx1PD75oJ8Yfb0LV+wfIpibnT3/0AoIK
	DNhSYuiFsLs75xp6MwjzMprSllLEXMKGDRXzbOEJFB2sKuDxG75wM+lqOyYbZYNy
	7FvkHZvU8ssJ1fgDnpbQJY3FQmzieGDBtatIvlKafvhxmKQHnLQ3slOTjfBbNpZb
	g0n5xRb/OIMCs9Gg5NBxj0ncuNd7aLuT4M5Nq6Kakeqmo23BPSwknfS+FhA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uyqhys6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:13:10 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PC4xeV007355;
	Thu, 25 Jun 2026 12:13:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4eyu45d9qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:13:08 +0000 (GMT)
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65PCD8qu021881;
	Thu, 25 Jun 2026 12:13:08 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 65PCD8YH021876
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 12:13:08 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 3565764E; Thu, 25 Jun 2026 05:13:08 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] scsi: ufs: ufs-qcom: Restore TX Equalization settings on FOM failure
Date: Thu, 25 Jun 2026 05:13:03 -0700
Message-Id: <20260625121306.1655467-2-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625121306.1655467-1-can.guo@oss.qualcomm.com>
References: <20260625121306.1655467-1-can.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: Aaa5nxxiPfU9f8fFc6FQ0zEj0XbGXEA1
X-Proofpoint-ORIG-GUID: Aaa5nxxiPfU9f8fFc6FQ0zEj0XbGXEA1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfX6t9VC5ayp0zl
 MB2u4yvjFWxp4VXiAJrw5qdL4Zur3Jtx9iYmD/0O57ZT3ZSzpNzSVZtI+SIS9W6dAbDovjnoFV5
 DRYWpUj/H9GnuQbiu8MfpruJgGexJ6s=
X-Authority-Analysis: v=2.4 cv=EsLiaycA c=1 sm=1 tr=0 ts=6a3d1b56 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=eGa5Le0WxWYHDMwdXPYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEwNSBTYWx0ZWRfXyA2NoaU9LB1X
 LJnKJwniZhc//foDk1tZm/cqut40tcN8Ytl0OSPxmzhDyaZ1pmpzFhxB3i92JGaIQpma42Ci3lU
 w88E/lBPo+vUsuA4vq7+4lWXDPJOw8AdP+sr1K/nkqbaTmV8Tl00DEUcvOfexXsnJRhjNvCnjr9
 Q73XbetpM/GlrT1I3qCRM+8xG4i8HlMXc/HFGTy/z4ezJ9ZlBuIbGOO0GbGJBQU9JkOVD+riAY9
 2wBaaeISWj5/dGUf6Xx/JACaLeRjx2cogUrvuTH4nkCVXqqxafd38YPTz785ZN8o33ayIFpCUa4
 gDcnfnbAjTq7WKwHkLPbAvfYveBDQf8cCypUm8KFe2n95fT+KZLl72F0enZY0t0SfkAokQwSzx/
 cuAF5DFtHpeCwbaOalr1eHDhJmXeSCIEpMO+o+DNJlzU4r4vnhsgbmMs5bDHY8UC9YVqkGJnavT
 Q+S/egqZneV8ASP5zew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250105
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114526-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 255EC6C578D

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


