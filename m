Return-Path: <linux-arm-msm+bounces-113336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rTvKHlMSMWqpbAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:07:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D459568D5F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:07:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="YKGGi/f4";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113336-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113336-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 18E88307C7F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A25B741169B;
	Tue, 16 Jun 2026 09:07:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4383B42E0;
	Tue, 16 Jun 2026 09:07:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781600842; cv=none; b=Uu+AH6mWy8VnQI3SaoL0TNNM09fPq4OKgUdpl3Gxjk99OW15c/QYLhLHdx7NTi0QzVUuN7qxwhWrHmUJIdYI+/WY23Umrbk0V4HV70OaYL6/1FP697Jugf5Jf1OfvivlKy9Mi/NTWwp4Z3+Cw3dOVcu1odR1schy9aarAFc2RFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781600842; c=relaxed/simple;
	bh=qzeryRYpdLGCVYS4KABk0ntO6zNjQc2NMGaaVW2AJ5c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=b7m2yfNhCMIn7vv3AniOLKfXz6wXqzzGSQvoEio+1291WTnYue/ZUJTtYXofMYkKRDweWWkPPjAH1y+zcDQmaJC1eaCMesgAkSEuPMhPUBy4FdMnN3ao0Mqd0ZTyFtFpwAS8Izxu+cLE5pNSpVJWMKS++TwFIEtofMOgyt1bnrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKGGi/f4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G65fUU2699304;
	Tue, 16 Jun 2026 09:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Q49hmB3FmH5hqN2TomYa5f2WQRUZP4pblCY
	yLO2OOAY=; b=YKGGi/f4XCOPB00jiJkPc2F4KNGVhxaYwg+W6DvfHPd1v1rK2MP
	TP80dRpoIa8VwRfUeai1/0CTYNcNTBRxtBz7SqH4kU62EBIMbwrD/bdOnFnUi4Vc
	4D++GBoVsXvT84UsgJG3lbdInXYzrddrhyCKuUu3vk5j6H2YVBR49nsnc+X8Fv6V
	0NlS9FXK2fetZV/uL4YGOdz/73XMQ4weuEPx3bSKHPW7I4n1LGohy64OV8s5nPES
	gIEQpZ4AH1q34fK+cynWT5GC2XeQiTauAWuEFLgV7avYkOfofedwoC4jvxYRKmrI
	pmpTC6M98SfG1200LokYJ5cRf4h4XqB3iBQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu09k8xcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 09:06:56 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65G95sE7021280;
	Tue, 16 Jun 2026 09:06:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ettxpvpbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 09:06:55 +0000 (GMT)
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65G96tRO023199;
	Tue, 16 Jun 2026 09:06:55 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 65G96tIc023194
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 09:06:55 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 3E961644; Tue, 16 Jun 2026 02:06:55 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: bvanassche@acm.org, beanhuo@micron.com, peter.wang@mediatek.com,
        martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM MAILING LIST)
Subject: [PATCH] scsi: ufs: core: Avoid possible memory reclaim deadlock in TX EQTR context
Date: Tue, 16 Jun 2026 02:06:42 -0700
Message-Id: <20260616090654.421850-1-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5MCBTYWx0ZWRfX7Dur2vpheyW/
 inVrxZpw/kv8sUY068o7me6t/1g3r2PtL5rsYIPXRQUjGhXRnEJIvIlvhmxh80IuBE2HiLk4fOq
 AJz5o/8xjXWZXLkY/tRh+QxunzbyAgE=
X-Proofpoint-GUID: 2Rc9tUVEWN-SITlOHqjE6lZorYvKQYel
X-Authority-Analysis: v=2.4 cv=DoZmPm/+ c=1 sm=1 tr=0 ts=6a311230 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8
 a=GQIZyLKiKp83YMogZvcA:9 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 2Rc9tUVEWN-SITlOHqjE6lZorYvKQYel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5MCBTYWx0ZWRfXzjJ53/4VnP5K
 Mjkv4x6wFlW00f76ja7gjSr5XQXbC0lUzdJvP1aQ+esGoAdCc2ZBkeTC8fga7vWkaoq7ZYWR2V8
 fiOwiv0D6f3KCwOiNjJWjtAmuG4MhLmMvEeHZRVXRkCpOdesXXWKEp0qcbAiZ3by4eLKrlsFtVF
 rZWYnXEtpnyK5944MUixxL3mheyeSd5tEl3QaxHGaYPusdyeXFfiJazTEnqR/f4H3U2KV8icvor
 KRV2jjTl9kK2OFL80F3foIM3h1hBct8xoXLnzczDbOij1wPlixjwRD0vulezElxktkY3mpw2+2c
 /K4jkhOivEEfnIxokUTJPreF4GTqCWcEZ0udzyE/7dkNjX3JlhCRbl0fqO9nnJc2YJ482lE2J8O
 0ued2yxAe9c9jQap9fII+wV9R7pQbS+fc1AyOMFFL6uWAb5VJZfaTBGFZwRNJP/ZmuYrei8Hxb+
 2C3EVAtjck9Ere4ho5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-113336-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:beanhuo@micron.com,m:peter.wang@mediatek.com,m:martin.petersen@oracle.com,m:mani@kernel.org,m:linux-scsi@vger.kernel.org,m:can.guo@oss.qualcomm.com,m:alim.akhtar@samsung.com,m:avri.altman@wdc.com,m:James.Bottomley@HansenPartnership.com,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[can.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D459568D5F3

TX EQTR may run while devfreq gear scaling has quiesced the UFS tagset. In
that context, functions ufshcd_tx_eqtr(), __ufshcd_tx_eqtr() and
ufs_qcom_get_rx_fom() allocate memory with GFP_KERNEL. If direct reclaim
is triggered, reclaim/writeback can depend on I/O to UFS device. Because
the queue is quiesced, this can cause deadlock.

Use GFP_NOIO for TX EQTR memory allocations:
- params->eqtr_record in ufshcd_tx_eqtr()
- eqtr_data in __ufshcd_tx_eqtr()
- params in ufs_qcom_get_rx_fom()

Fixes: 03e5d38e2f98 ("scsi: ufs: core: Add support for TX Equalization")
Closes: https://sashiko.dev/#/patchset/20260615132834.2985346-1-can.guo@oss.qualcomm.com?part=2
Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-txeq.c | 4 ++--
 drivers/ufs/host/ufs-qcom.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
index 4b264adfdf49..3a2fb5329d27 100644
--- a/drivers/ufs/core/ufs-txeq.c
+++ b/drivers/ufs/core/ufs-txeq.c
@@ -1059,7 +1059,7 @@ static int __ufshcd_tx_eqtr(struct ufs_hba *hba,
 			    struct ufs_pa_layer_attr *pwr_mode)
 {
 	struct ufshcd_tx_eqtr_data *eqtr_data  __free(kfree) =
-		kzalloc(sizeof(*eqtr_data), GFP_KERNEL);
+		kzalloc(sizeof(*eqtr_data), GFP_NOIO);
 	struct tx_eqtr_iter h_iter = {};
 	struct tx_eqtr_iter d_iter = {};
 	u32 gear = pwr_mode->gear_tx;
@@ -1217,7 +1217,7 @@ static int ufshcd_tx_eqtr(struct ufs_hba *hba,
 	if (!params->eqtr_record) {
 		params->eqtr_record = devm_kzalloc(hba->dev,
 						   sizeof(*params->eqtr_record),
-						   GFP_KERNEL);
+						   GFP_NOIO);
 		if (!params->eqtr_record)
 			return -ENOMEM;
 	}
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c084ccc72523..e7f104987c6a 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2760,7 +2760,7 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
 			       struct tx_eqtr_iter *d_iter)
 {
 	struct ufshcd_tx_eq_params *params __free(kfree) =
-		kzalloc(sizeof(*params), GFP_KERNEL);
+		kzalloc(sizeof(*params), GFP_NOIO);
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	struct ufs_pa_layer_attr old_pwr_info;
 	u32 fom[PA_MAXDATALANES] = { 0 };
-- 
2.34.1


