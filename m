Return-Path: <linux-arm-msm+bounces-22538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AED906323
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 06:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A875D1C21D68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 04:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71342132106;
	Thu, 13 Jun 2024 04:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="baDAHnUV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975DC3CF74;
	Thu, 13 Jun 2024 04:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718254037; cv=none; b=UYmtFw6y0wzgkuHwaHX+TFdBgLzB7wffDr0c5iosDd8i5+eAe1+ycNiE18tkFvcNnmeVvZ0k2t21V+SbI6l4QwabFtJPLGO5vZbF0dUsySYtweJ001DobzXRU8W3sn/tjTEhTa6HAQWTIDBOpIzdCtEVtUNJCDWmcYsGouXtpCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718254037; c=relaxed/simple;
	bh=+UMlre/jILmPi2MBsSzppHR9F2E+8mwySeNePP8et2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=FefHyuJVRttY6ATNUS+Or3BP/R5e/36jHsBzHs/LZ5e8zzg6ed/QA0mhyyExrSXjSt3dDXOB+CyVZNjvtn/NpUwOVcSIdwa9GyKTUSgsNYKI0FeH0+kv91OS7aeMFBIMdLQtu2hEmrULZjdOW0CRdWPZPA9ALSQYSguN4l3cfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=baDAHnUV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CKn7Sj028125;
	Thu, 13 Jun 2024 04:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ik54hdy3eBlrM2wrP1J9ym
	szxZU4S3qs30TYbwtuuAs=; b=baDAHnUVHqB/FMtCn1ooRXVtGK6nno9e4o9Tvg
	mtM9okKPByV9IHi8U0J2ixi7/yS0MHpPysVBJ0h31BXW54/NrglhlUBuSc1tyvTX
	O5EOVnK8uIKvUIQpExqsWnBvJ4t246W//SCVg2wlsS09trS2nNmplEYhY0GgXP/U
	olnE7ksWQJ7X3pS23/HlbbPbEWRXNct+BMFfhbASMFuLEFgsBkCw9RCboDzC80E9
	qFlqRuCDjM/jNpCYVoOstbLBRGbaV91qKXh0T+qV0JFC4e+whWYTUUtWhgbymE4Z
	NemAsofD92FVHjseWe4gKA9UoEDV7a7H8jGlcgwzX8hlL/Cw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq83wj5ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 04:47:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45D4l9iE019830
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 04:47:09 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 12 Jun
 2024 21:47:09 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Wed, 12 Jun 2024 21:46:59 -0700
Subject: [PATCH] scsi: ufs: qcom: add missing MODULE_DESCRIPTION() macro
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-md-drivers-ufs-host-v1-1-df35924685b8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMJ5amYC/x3MwQqDMAyA4VeRnBeo3RybrzJ2iDa1gVklURHEd
 1+343f4/wOMVdigrQ5Q3sRkygX1pYI+UR4YJRSDd/7m7rXHMWBQ2VgN12iYJluQHuSIQnN9Rge
 lnJWj7P/r613ckTF2SrlPv9dH8rrjSLawwnl+Ab3yIYeEAAAA
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rTYAFI87eMfRd-5RPJNBNsxEYMhOsfCD
X-Proofpoint-ORIG-GUID: rTYAFI87eMfRd-5RPJNBNsxEYMhOsfCD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_12,2024-06-13_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406130031

With ARCH=arm64, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/ufs/host/ufs-qcom.o

Add the missing invocation of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index cca190d1c577..72f95e2779ce 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1883,4 +1883,5 @@ static struct platform_driver ufs_qcom_pltform = {
 };
 module_platform_driver(ufs_qcom_pltform);
 
+MODULE_DESCRIPTION("QCOM specific hooks to UFS controller platform driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240612-md-drivers-ufs-host-a8a0aad539f0


