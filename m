Return-Path: <linux-arm-msm+bounces-99895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMpBJxUIxGk+vgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:06:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00716328AC0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 17:06:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C73F347E03D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:25:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E96BF3ED5A3;
	Wed, 25 Mar 2026 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHlBm9OD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADB03E3DBF;
	Wed, 25 Mar 2026 15:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452254; cv=none; b=noVaFAb4e+GSsOX1SJTQsGpFi9nGHuKPJeIqJlHwi2WnkWx7MLgeEtkGv9HtXr16p3x2rWBApZU5LYXIV8aVE0zWfzZ6cnxpTY2AgTV7B2jXuC6787jfQ66jLrIozwv8hMFp82zR3GnNl9VW/UZ88usF3LRxTzJ1VI0zJkdReb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452254; c=relaxed/simple;
	bh=cOnbj4iWDP7pbNONmeJho4TXHYX04NBYUZXT3FhaSgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ovkXkcjQwbRXBFdJds3q/wOkWTc5y2g54B8x8Y8EwskTs6Bg2k17oLnHTtvjl47tjZv1ZI3+Ul8Th4Gccexg161wnbVJz8p2Jal1tgE87dRuopyclvsfnKn8pKV2YjcaFdrcDlK01jERgXimoVcW0AY5QolA0vqZHm7UhuahxOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHlBm9OD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH3qB1257978;
	Wed, 25 Mar 2026 15:24:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mGWxoQCKDcC
	OwWbxVNUMKilUchOqf5qA5k6NABxwwLQ=; b=IHlBm9ODPEEFh9YpjX+C7M5AIvc
	7ReiX5rH0UQrdE2qt4850tdz5dGVzC4EuT8XurDtGauG7Y1B+R4mg+ysDg2aUIuy
	fzrv6yERvtE990/8cow5IVYBCwTKxMDZ5oqnT95LU4UtG0c+Emz4v6O+40C2RNpG
	XtSOSD1e+wZfQCG5vfe63cTnAyCe+QEYQJ6Rgumz+xmEA7wFaeBmdtOD0K4ZMTI4
	PsEYnAehFfhu+vLkoxY2qaWJkYjHXgYy4ZZnenKG2RxovbHyRUR+6dfZ0RGy4EJD
	Kedu3hP7ekqDHHUe/82hp1VzwH6c7Z5XRrphI+CnO0GxqenK7Jwf/wJUdxw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dm2s569-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:24:03 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62PFGZJo029015;
	Wed, 25 Mar 2026 15:24:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 4d473nfj8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:24:02 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62PFGY0I029006;
	Wed, 25 Mar 2026 15:24:02 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 62PFO20q009125
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Mar 2026 15:24:02 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 471955AE; Wed, 25 Mar 2026 08:24:02 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 12/12] scsi: ufs: ufs-qcom: Enable TX Equalization
Date: Wed, 25 Mar 2026 08:21:54 -0700
Message-Id: <20260325152154.1604082-13-can.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExMCBTYWx0ZWRfX48X+yQDMKOba
 cuemUmEEd6Y480Sy16eqO29dj25eaxaO1R8DwPOZLs81WNkwG4b7i6ONh9YAV2DEaj7sNH6p1X2
 tqXGmtN4q56K2AIqeqALA1BgLgTfUcEVSgi0zB/BwNkcLmXV1he1QnUbYA4Ozn12jycLubghFxP
 7hQ9IRKAHEyEOta5ad+jzgITHxQ2HJ7BnF5R5jzW9SZU7l8OfBw39T9GC/ghPPYaTGfFzCL58C+
 fi5bXjnmWQje12zQTQ1u7uxi75Va7FGY5LxIeh6xJUBP+v38vYAz7Tfu3xWz2DoZDQsGc4lMRO6
 KGE56NBWY+jUx/vkE+/hA5DRwZ+3c7BrtJcqOqt3SC4hat0XrbSiGeKm7tZLbNtcWNYEfk65JxG
 WgAgYCC3awnLUN4MzrXH/eDm/rbsdjCs5EZ+AnDn5C82VMzFWNdmhm4EG7Zt0WJW3R/gs7GH7v4
 /CFjSBQLWtkAK+CvdYA==
X-Proofpoint-GUID: x-OGuCFZaEo16Zta6RKdvnxFqNjfPRGc
X-Authority-Analysis: v=2.4 cv=Fo0IPmrq c=1 sm=1 tr=0 ts=69c3fe13 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=PY6Zn8H8AAAA:8 a=N54-gffFAAAA:8 a=EUspDBNiAAAA:8
 a=rFf6Gu0_ub60KfkRFdIA:9 a=ySS05r0LPNlNiX1MMvNp:22
X-Proofpoint-ORIG-GUID: x-OGuCFZaEo16Zta6RKdvnxFqNjfPRGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250110
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99895-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[micron.com:email,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,acm.org:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 00716328AC0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable TX Equalization for hosts with HW version 0x7 and onwards.

Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 9abdeeee81f7..5a58ffef3d27 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1384,6 +1384,8 @@ static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
 
 static void ufs_qcom_set_caps(struct ufs_hba *hba)
 {
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
 	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
 	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
 	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
@@ -1391,6 +1393,9 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
 	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
 
+	if (host->hw_ver.major >= 0x7)
+		hba->caps |= UFSHCD_CAP_TX_EQUALIZATION;
+
 	ufs_qcom_set_host_caps(hba);
 }
 
-- 
2.34.1


