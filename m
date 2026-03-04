Return-Path: <linux-arm-msm+bounces-95339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HHpLgk6qGkTqgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:56:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 86291200CEE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0C79E305D6B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6C43A8747;
	Wed,  4 Mar 2026 13:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xbzb4BhV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4455372EF3;
	Wed,  4 Mar 2026 13:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772632486; cv=none; b=ZhFJp0bYnPXLZizBNjozzWwD4YQd/M/PTmX9g6ItcGO9lN4kD2uDRNJIZOo0nJic5jJTCXUR4U5pHvVCYoQGJDtUb9F0H5Z6gCbF8LIYY+PkighK39HzR9onYZKudV04G1E5gk5jGM7dsPrPhBcr0iSJOxtZNgWxGZ4SoYc7pVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772632486; c=relaxed/simple;
	bh=JRGFTf79ClODTZ/nXNk5BzmYlFMeGnRnTTk6pXWQTlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s56UZ1y3r2tub2ITxoV/PieW6qm/nxGxpdAQEHGxTLDeUF5o5/q08T1ZYIJqDBvhZ0pjScHY+jiQPTnPpZCCuRopZqhoVGCciKoQhkkO++9szKOoxW+yMfzLo1RfuZuhN5Gu6udzwAkRjlQDkAj9qvs0H5voamqft5Ybw9n3qg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xbzb4BhV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624CNpev3114139;
	Wed, 4 Mar 2026 13:54:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cWkfVnI4uEC
	njLobwNAdnwEGx6KRH8vnwO6yscSALXs=; b=Xbzb4BhVDUAN4+Gog6nWDLzEGSf
	GKDcxwOHfJRUlJyeu80Dw2luopoeYAHFlbqRNScDDI6Uncmf6f6MhTlesdGDcavY
	V4aHqphtpoIIJz93uya4mCRcM6RJ/8DVMCKFDnMLh7jovkWCCF4PlRkrEb32p/R0
	opgrBRKLGVo2ab0IdA9rwhnlVaZvi4l7GHCEyde1+i90P5T5jYjWqWy4+jsRPCJQ
	YMSJJpEqmJn3iu9Ua+H3otSrL4wAIxf5RKLfzenPDbn2YCU4+EtszSP6RNjnvsik
	fC1VBEY+DzV1dddeQBqi2zzK/HSeby2oSgTqAyXwT1MPkSpVfD6tgbeTMyg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2bbnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:33 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 624DsWMR020563;
	Wed, 4 Mar 2026 13:54:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cpf4wmm44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:32 +0000
Received: from NALASPPMTA01.qualcomm.com (NALASPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 624DsWgP020558;
	Wed, 4 Mar 2026 13:54:32 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 624DsWdC020556
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 13:54:32 +0000
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 247075A7; Wed,  4 Mar 2026 05:54:32 -0800 (PST)
From: Can Guo <can.guo@oss.qualcomm.com>
To: avri.altman@wdc.com, bvanassche@acm.org, beanhuo@micron.com,
        martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-arm-msm@vger.kernel.org (open list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 11/11] scsi: ufs: ufs-qcom: Enable TX Equalization
Date: Wed,  4 Mar 2026 05:53:13 -0800
Message-Id: <20260304135313.413688-12-can.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a83999 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=ENi0XzU5rTanaItzT-wA:9
X-Proofpoint-ORIG-GUID: FFvow9c4tjWJFnZNEI5YwDvlJ3xa8YZm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExMiBTYWx0ZWRfXxG1bNCdPtiRn
 6/SFAHBloCeHXoBtG0+Vm1yfGxaNf1ZLRZIlDUdfKUilTuTwxxHgvEB7cxfAO5zebQ0/1ae27CJ
 zhhE4SU7O7Ex4cwSc2LIaPxQmgEsrfNN7UIwwFYbeQ8WrSgsj7WO28mPBIFMUADpcMACUXIgt4a
 lfBogL+35ksoYMVrlzoHYl3D84aN5p9GfdAGkbvGH0OJ4zECMnFvHPeMxlFOnlVUcCccX2KG6UL
 I3SyoTI66Jb/B4brDjINyd7h2zds2OEymOmExAx6sreHF02ZdrxcrFqD/SOVWOjG0DQAtJEif/p
 koVgTQDJYGBafTgcHhDsPTzVx+PbtTVwBE4q7Q8JQA1qGfbc3Oa6nybLS4g2DrXLQnB/x8Wo078
 XQxeBLfhKAd4uzsqF4my4NknSDNggKM3C+pid91Pxmf4wrX7jjxJcgkWfkyW/OhdCxnIRQiQ9oO
 WyWra7NliqgNxhO72zg==
X-Proofpoint-GUID: FFvow9c4tjWJFnZNEI5YwDvlJ3xa8YZm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040112
X-Rspamd-Queue-Id: 86291200CEE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95339-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Enable TX Equalization for hosts with HW version 0x7 and onwards.

Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 89bea823a08b..3dee1d5f9e6f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1391,6 +1391,8 @@ static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
 
 static void ufs_qcom_set_caps(struct ufs_hba *hba)
 {
+	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
+
 	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
 	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
 	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
@@ -1398,6 +1400,9 @@ static void ufs_qcom_set_caps(struct ufs_hba *hba)
 	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
 	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
 
+	if (host->hw_ver.major >= 0x7)
+		hba->caps |= UFSHCD_CAP_TX_EQUALIZATION;
+
 	ufs_qcom_set_host_caps(hba);
 }
 
-- 
2.34.1


