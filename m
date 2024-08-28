Return-Path: <linux-arm-msm+bounces-29763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C4C962686
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 14:05:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2215C1C21BDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 12:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD7916CD2D;
	Wed, 28 Aug 2024 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hCKjF6c6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1D91741D9;
	Wed, 28 Aug 2024 12:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724846731; cv=none; b=bN/d+/MhHNlkwMt7wry2mXRNiE7lpg256KV9eOb8bbT1CE2SbA0u2cAAS0zw/5UPYcKLryin+peG+y9CdGK2hHINgk0DCdvm4G+D7qXEzCxqAZuVNo8eewFjgLr0xLKlDg3zHEStFgK47x428N9EW3TiiBhAEb1C6lfIaUNFqaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724846731; c=relaxed/simple;
	bh=BaT3iaSJXXASWEl08SLZbXFraf8I366PIMZsfsZHgwA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ObjyGduFkjB3a3f1jxlwaYgasWluVpl8KeYhaxsSd8bfIsqUFl+oo3WUw8qGSJedySCsTygpkkMjjfJ5ZeCPgAPKG3jcsom6oWQXuEzPAaVUvhzcB5Xv+5PX8il4EyeYmRl5BqdpVQMGfCN0OUkYrmTXlssuhfB4Ieb9sesAIeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hCKjF6c6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47SAiQGH027071;
	Wed, 28 Aug 2024 12:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=lXv+dcwcMOIeN6Jc0UwzU99Y91QFlu80cTPJu+UmDgA=; b=hC
	KjF6c6Cnyozw7thc9cymnNvrXQK9f/dLy8eDr3WKcJd5FFY9c73jCcMzFDkmbyxk
	encdP12FSeQmqU/bQOuSuKHWlpPHv548KO8BjjHCHaogibLwYhhPTD0iOGjSvhcR
	M6cXqBQPDut75C9Mmsf44tvRBYJ+U/7PXP+4eYDeNui9Bcp9Oia1rEShuYmWGNkp
	STizNgktEe7dy5wZoYectJ57f6L0EhRCqoWFUqUuwn1y/SLu/qA/+zdJ9/9PlIJ0
	izN9dTeKxCekB/Acq7biPtuSeP0vbTGRSkK4PLSWlP1hsZn2yaLJRcjyhdwlXPRY
	m8xGhK2+lzZMMWXXP/Lw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puthpmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 12:05:26 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47SC5Gft003919
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Aug 2024 12:05:16 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 28 Aug 2024 05:05:12 -0700
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
Subject: [PATCH] scsi: ufs: qcom: update MODE_MAX cfg_bw value
Date: Wed, 28 Aug 2024 17:35:02 +0530
Message-ID: <20240828120502.1439-1-quic_mapa@quicinc.com>
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
X-Proofpoint-GUID: 5R3F6uT6_KGIps1aEc2erzESIMPKDAe_
X-Proofpoint-ORIG-GUID: 5R3F6uT6_KGIps1aEc2erzESIMPKDAe_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_04,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=923 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408280088

update cfg_bw value for MODE_MAX for Qualcomm SoC.

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


