Return-Path: <linux-arm-msm+bounces-29771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4496C962890
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E34481F232F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 13:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DA1E178CF2;
	Wed, 28 Aug 2024 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CDi5kxjx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A177E16BE1B;
	Wed, 28 Aug 2024 13:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724851555; cv=none; b=l3hsDVFQk64IE8J+lBmGuGjrKrF++ywzbxgV039we1sRrET0m68yrho/P3jkMput2wtWX0rM7LotIYNdI+T6zDbBL4wAdBRoPFlCIsZ0nQ8nOqsMJ7/ytZVoBgkjGXrSblOy1BtcXEXZzEd5Y96B4wPcrXffYTlTQlt6VejorpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724851555; c=relaxed/simple;
	bh=7vmjyYPgajUTxOHRDLU3EIyAUmIO9fgSOVbuTpFdPeQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cRhmaRkE8fvgx+T1yIEGFMfhyydUnH87Lsm4qLNgA7RwbzZAIY2TDHxpYLmJKfrWAWC0GGzjEDcFVXtsgwGrvcIs9yfxx/xdH7x2393u4lFjqvQPPl26D3PBoBxm9WW4M7iQbTHjHYGQqCc9+hziCJRXpysjqNwNvf1kvrPYRAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CDi5kxjx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SBWsdS021420;
	Wed, 28 Aug 2024 13:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=jMopFolIudXZ46Gxtl89SWaz5SwBHrWJ8yg4XIQFGw4=; b=CD
	i5kxjxJ51yfn7rsX+/HCgyTbsCHELcVk8zcqV6zRcd2nn5/r8pN20oiqI45rYVzm
	zPmABzrMPdbEcQTNO7eBaicp1df5ruJpO1Z78THO0xhZ7iW+lMGC8WPF4JMX0ZRR
	4gDWlVgq3TdejF1Y53W3IewkKiUYnhByUv37jXHRLvtTRKiINGDiGmkShAUGDL63
	xs8oGMB5Lvo3jrFl2x9Y4PdGCccmVxIHq+oWhysGnll57226QYUdIqia5bbu6ONV
	5MW7jlVATW4b2iQ8fGVmJv7nfz4f/oa23nWiK25wiNfkXfsAOono2q/vvgRzMT0x
	KKYPcy0yTb00M4Nu3cmQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419pv09uxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 13:25:48 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SDPlWu017546
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 13:25:47 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 06:25:43 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V2] scsi: ufs: qcom: update MODE_MAX cfg_bw value
Date: Wed, 28 Aug 2024 18:55:26 +0530
Message-ID: <20240828132526.25719-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: veOwIliHAef5CjC675GRziJMnIDs_Olh
X-Proofpoint-ORIG-GUID: veOwIliHAef5CjC675GRziJMnIDs_Olh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_05,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 mlxlogscore=967 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280096

The cfg_bw value for max mode was incorrect for the Qualcomm SoC.
Update it to the correct value for cfg_bw max mode.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index c87fdc849c62..ecdfff2456e3 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -93,7 +93,7 @@ static const struct __ufs_qcom_bw_table {
 	[MODE_HS_RB][UFS_HS_G3][UFS_LANE_2] = { 1492582,	204800 },
 	[MODE_HS_RB][UFS_HS_G4][UFS_LANE_2] = { 2915200,	409600 },
 	[MODE_HS_RB][UFS_HS_G5][UFS_LANE_2] = { 5836800,	819200 },
-	[MODE_MAX][0][0]		    = { 7643136,	307200 },
+	[MODE_MAX][0][0]		    = { 7643136,	819200 },
 };
 
 static void ufs_qcom_get_default_testbus_cfg(struct ufs_qcom_host *host);
-- 
2.17.1


