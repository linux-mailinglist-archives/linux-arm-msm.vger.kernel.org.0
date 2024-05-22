Return-Path: <linux-arm-msm+bounces-20178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E350D8CBBA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 09:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 08A3E1C206A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 07:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47D1D2B9C2;
	Wed, 22 May 2024 07:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nDDlW6Ws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B4D17758;
	Wed, 22 May 2024 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716361332; cv=none; b=qX1nRjXUxAmNa9giB52ZGjeS++aCru3/LzIfVeWGTRrKCaZceqL+HwktDttvVydhBKw3RO8P7JBtw0qJnLEwed6tr2TqEUCJYwAUYAnGW6nkRjkHl3+virrR28kc6RsEVNMOlGBz+ViSTJRizk/y54yFkKAuwGPOG9QnIZtWmaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716361332; c=relaxed/simple;
	bh=1UfZkb4B2JrKG4crbIuSVRNoZKf1gDZK+5FboRIfZ+o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ldlsxv0hwJkriSqERMLLpBwlHA2bOOoOzzoL9RqGxNdic27js1Gxad11CQFTL1zGos7HvFoHfPjimA3scf6dE1D0HVsctNTDJEGi2PNQi2CX9Nbn1s9AAiuR9pSzrr4x3HfsqH59AqmxJ1FfDVv/AO8Lb58qJJyDzZrERb04QNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nDDlW6Ws; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LJIwQT028232;
	Wed, 22 May 2024 07:01:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=qRTPNRgzLNaqp1abE7ty
	bw26shArfVhyaTLRSm7ms2c=; b=nDDlW6Wstt+A9qTzA04c6OEeiYi8xI0b/JZC
	2aA1BeYxF0HQEL6gtXeXMjnZBoDfnrOVb/qDBmESu2vLy4d1sC1pa4GGzHnzoo5O
	VlAU5walmtF2klYgMBOGZA/tVeRGqpzF9O+Xuln7CB0M89QImlAXAWhpxgdx9q8p
	ApHI5lAG/rYmHAEhhbgaxO5W6apS5O0wJH4/fNFpKM52i3UMWf/5g9doTwFmoIsQ
	LD8hJxo8Bpl3aGWK2Q3qMk13/mxmBLAX+QwKm8ZlAHZ2zn3UNlLy4R4CLNgz/jkV
	qyXJvfEDDgxQE15WSG8x/pbjEGv+50s3shxb+xcuCG2t41FVqA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3tgsgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 07:01:56 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44M71tJB009742
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2024 07:01:55 GMT
Received: from stor-berry.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 00:01:54 -0700
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
To: <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <beanhuo@micron.com>, <adrian.hunter@intel.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley"
	<jejb@linux.ibm.com>,
        "open list:ARM/QUALCOMM SUPPORT"
	<linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/2] scsi: ufs: qcom: Update the UIC Command Timeout
Date: Wed, 22 May 2024 00:01:28 -0700
Message-ID: <8e5593feaac75660ff132d67ee5d9130e628fefb.1716359578.git.quic_nguyenb@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1716359578.git.quic_nguyenb@quicinc.com>
References: <cover.1716359578.git.quic_nguyenb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: VVfVq3LnP2y92wbQrY89XTQZH3k5garw
X-Proofpoint-ORIG-GUID: VVfVq3LnP2y92wbQrY89XTQZH3k5garw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-22_03,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405220050

Change the UIC command timeout to 2 seconds.
This extra time is to allow the uart occasionally print long
debug messages and logging from different modules during
product development. With the default hardcoded 500ms timeout,
the uart printing with interrupt disabled may cause the UIC command
interrupt get starved, resulting in a UIC command timeout and
eventually a watchdog timeout.
When a product development completes, the vendors may
select a different UIC command timeout as desired.

Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 79f8cb3..4649e0f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -49,6 +49,7 @@ enum {
 
 #define QCOM_UFS_MAX_GEAR 4
 #define QCOM_UFS_MAX_LANE 2
+#define QCOM_UIC_CMD_TIMEOUT_MS 2000
 
 enum {
 	MODE_MIN,
@@ -1111,6 +1112,8 @@ static int ufs_qcom_init(struct ufs_hba *hba)
 		dev_warn(dev, "%s: failed to configure the testbus %d\n",
 				__func__, err);
 
+	hba->uic_cmd_timeout = QCOM_UIC_CMD_TIMEOUT_MS;
+
 	return 0;
 
 out_variant_clear:
-- 
2.7.4


