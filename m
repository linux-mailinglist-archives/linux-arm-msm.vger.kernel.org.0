Return-Path: <linux-arm-msm+bounces-30030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336C796451A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B25AB21596
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78F8D1AC897;
	Thu, 29 Aug 2024 12:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i/2sXLKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5F215E5C0;
	Thu, 29 Aug 2024 12:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724935204; cv=none; b=UQS5DS0jOD33PKaGmMrXQ73dn+PmUT3L5PupCnnHL6YNfhmKQwHh3T+HiH6+HlsHKEsgv3GGPgNE3TVTysWNVNM93Znm/4o6zkwLX6LimGnX2Cw0r/6MIL7A777cDD6R2/EQnd3X9LbGQtggKqISc+kQQBmvbqJy6VWLNIkcNU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724935204; c=relaxed/simple;
	bh=4ASecXjpzEeqXWcN2TAefrcEok5bTtUtvjCbrTFEKzc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V+oojHDEirJbQ/U5MPQXM4BUPVf6UJZfY6nMM+IQTXSjWhDmpFwNuEoZmyajY79LhrcaYUT4gcApMzlIkkwcWdyjeyYOHA+jJOeztEgARfm2POws5kv8DftYgbYaKWbNJbshfEB04X8HxK7QhLQL8wH0mp/3DJwQXN7hHypCqpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i/2sXLKK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47T8HlDC031817;
	Thu, 29 Aug 2024 12:39:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=cxzpA+TRMCRty/jmiGez4Pv/kVmGV92FhineHDUaZgk=; b=i/
	2sXLKKYbJhJiUOCTmzl+IrGYFRajK7oaxCxodvrJ58VuOxZ2h5r5YubB0zBCy50y
	Wui/1SESr4Pd3ADWhMk+mVt4NB+lrIq3fzmDAHJeVIomt35WT0EQbEjl4LJ8RHdK
	IfZddBLza9fs379ZmBHiT7XKEjf5gUKFeCYwDcO0ynn0VJ9IrdpN4dvB3Tj/hdQL
	ve2EC4dbxmG3TaEg6TieJcwaS6Y067WXnk10O9PV0uG+LOZZFbN52DM3lmjzdGRq
	zC/j2+1w/+tiaHaCYDIfFW3M5ELltFsQphgNuNT4ozmo/iBzLVD4b616ERlpRMVB
	u0MRUcEj3I7en4d+x4Yg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419puw594n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 12:39:58 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TCduCs027201
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 12:39:56 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 05:39:52 -0700
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
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH V4] scsi: ufs: qcom: update MODE_MAX cfg_bw value
Date: Thu, 29 Aug 2024 18:09:38 +0530
Message-ID: <20240829123938.31115-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: V9Zjhcb5ngcbS3oXp97Lh_9Po_Rru5GN
X-Proofpoint-GUID: V9Zjhcb5ngcbS3oXp97Lh_9Po_Rru5GN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=967 suspectscore=0
 adultscore=0 spamscore=0 impostorscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408290087

The cfg_bw value for max mode is incorrect for the Qualcomm SoC.
Update it to the correct value for cfg_bw max mode.

Fixes: 03ce80a1bb86 ("scsi: ufs: qcom: Add support for scaling interconnects")
Cc: stable@vger.kernel.org
Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
Changes from v3:
- Cced stable@vger.kernel.org.

Changes from v2:
- Addressed Mani comment, added fixes tag.

Changes from v1:
- Updated commit message.
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


