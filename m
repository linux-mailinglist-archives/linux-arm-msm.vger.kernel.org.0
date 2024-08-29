Return-Path: <linux-arm-msm+bounces-30009-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C33D964444
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 14:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33C59284CA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 12:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53751191484;
	Thu, 29 Aug 2024 12:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gAs8Ibjd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C9322097;
	Thu, 29 Aug 2024 12:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724934100; cv=none; b=Vj2SRrF+bkjspvLLqWKE//uXealbOnfMSQ+AdlwA7G5C6+m6+psgJOyEPAbX7jKDtd12CVvqx7EF77zA8zYrEk3hOF+3QQHNvGI8CLAhz3q3d6EKmOXCFF9vABPUarwdRoHjeBroENZdWQAWdZsJ9l9SJYIaC/hg+g+ie4rFkjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724934100; c=relaxed/simple;
	bh=ty0S3BL++BFJXjpmvq6y9P9yIxAyAFuhkEC/CaJ6i5s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P7N5FXrlQ4CaKxh/h2BBhwzGTx2/g5nZ4jcA9xF40h5ObjX1m5177Zz8nF3DlMk3hu3c/dDbhGUCBmjzP9DCGSCajxqEY4+sNdbYGa2Ebg4N46t2Fy95R+6g1PSW+ameoQUtbS/dWWNMsFgLqTvsbNwhN8K8M1g3lqtv5cndmPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gAs8Ibjd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TBejMM025817;
	Thu, 29 Aug 2024 12:21:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=V0HzpAgZ7a++jQ38biomcJKZ2aFqB0BN/LfQTOD9JSc=; b=gA
	s8IbjdtNhbCM0pyydFq8LjHljrTOIEnOShMLcI5l890ORKegMq7uhl56ABO4X20H
	9JLoW819TFea3pY7WVu9ucOG4STmh3DzTMkV7fWhDSFrC4imTz/cYq79jeLxTLnJ
	wf5qE67pOoTC/TTwceWPI5AkdE+nH3oFAtUaq+YhTonSF2utJADzCArDU3aKLUo+
	QTz2UbkZhivHA0qYAO62nw2sYV1do9mKY4z/ROevvTCBOiaV/JnCk8BTHSa3LzNy
	FOwt6S7mnGZzoJRvqCcy3xkPIxuMyQHfGvk4B7xbGEHL63F09AXODEfdrgSeP9/M
	ZrpPc4/oNyH9MpKBhnTw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41arax03tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 12:21:34 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TCLXI7008799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 12:21:33 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 05:21:29 -0700
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
Subject: [PATCH V3] scsi: ufs: qcom: update MODE_MAX cfg_bw value
Date: Thu, 29 Aug 2024 17:51:18 +0530
Message-ID: <20240829122118.1745-1-quic_mapa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: SegsddFN1HlLTp_XAsQUrEIcyvsSS_R9
X-Proofpoint-GUID: SegsddFN1HlLTp_XAsQUrEIcyvsSS_R9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_02,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=993 malwarescore=0
 impostorscore=0 priorityscore=1501 spamscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290086

The cfg_bw value for max mode is incorrect for the Qualcomm SoC.
Update it to the correct value for cfg_bw max mode.

Fixes: 03ce80a1bb86 ("scsi: ufs: qcom: Add support for scaling interconnects")
Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---

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


