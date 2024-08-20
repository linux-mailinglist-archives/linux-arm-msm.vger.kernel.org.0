Return-Path: <linux-arm-msm+bounces-29121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCE995872E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 14:39:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56BBA1C21C5C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44247190670;
	Tue, 20 Aug 2024 12:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gVebB3Cn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8219007E;
	Tue, 20 Aug 2024 12:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157509; cv=none; b=WsA+H0YgpMTSXgguhpBnyKB+LMgvFTk0h6sEtXi18JKEG33LJVg9fXhlsxFgfy6ATsG4uX9yqqEprtJI5FRZ+8Femes11b49haQK6eN19ulLUK9EMNTt4un1W+5bslV6PLPybjT6P5xXx0sNQ+7FDv6qsyHmznuwXqPZ/N46jgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157509; c=relaxed/simple;
	bh=yq5vmNvOoxHD5KgFRVHIoc4XHRLckGWvKu7zky8Sc5Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HfOnspsYXQxkZ6G+ui5XkYM689lBewS8zOOP1XtLrePQXEAP6IDwwvK9zVLzQqPTQv8uuVDa5rBnG/XGiEms5nnO2Xh5HZF3sgJlE5l9Rs9gQtzkIKQFWMcUkgYwOZxMdmCUH51p/N1hV7myxbB1MZQW6sFlJ3beDeIXcjB9zGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gVebB3Cn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K74LT4013010;
	Tue, 20 Aug 2024 12:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OYanVHP+mje5F+slEgAAMkAX
	c3QuLqojo9RJvPUz4Y4=; b=gVebB3CnlP58EQp1iu+F0cu1Lt5n/KBNzQfcBsBg
	kFiwE8lzF8dHLI/D3Im7C7R8A8PlzfkBd9Ltsp9YDiDJzzUz4Ht5sE/n0ROPxm4+
	Kus/uC58d9TvkT8Ek7zCbajdVkvXlv3RlyLhz7jN/yhEFSTaXwpl98UIaqgPKqUA
	TIe97GJ0z1o7AQjY8D/xwLPLDpna9vB7VkJ+4XMwwYveOcuMlsguAc75+tuHE6RM
	lfn29vu8NQvEklqfKcJUdBs2ND7enh+NQl397baUoqjX/zaVb5iNrjDMGGj62GuH
	gQR9eHPt/a3D28DuuqKnvS54BnSSB4AlJhLLIyOiJXUNsw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pe5h01t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 12:38:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KCcLOo021617
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 12:38:21 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 05:38:18 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>
Subject: [PATCH 3/3] scsi: ufs: ufs-qcom: Apply DELAY_AFTER_LPM quirk for Toshiba devices
Date: Tue, 20 Aug 2024 18:07:56 +0530
Message-ID: <20240820123756.24590-4-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240820123756.24590-1-quic_mapa@quicinc.com>
References: <20240820123756.24590-1-quic_mapa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: hBLP2YELCf9qf1HoESIUXVsiJ3FsadY0
X-Proofpoint-GUID: hBLP2YELCf9qf1HoESIUXVsiJ3FsadY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=761 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200093

Toshiba UFS devices require delay after VCC power rail is turned-off
in QCOM platforms. Hence add Toshiba vendor ID and DELAY_AFTER_LPM
quirk for Toshiba UFS devices in QCOM platforms.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 6d2622e79d3f..61f8c3f22ab9 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -842,6 +842,9 @@ static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
 	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
 	  .model = UFS_ANY_MODEL,
 	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
+	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM },
 	{}
 };
 
-- 
2.17.1


