Return-Path: <linux-arm-msm+bounces-34598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F54D9A0D3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 16:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EDB961F222B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 14:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BBCD14A4E2;
	Wed, 16 Oct 2024 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gJyhIZpx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8520B20ADEA;
	Wed, 16 Oct 2024 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729090188; cv=none; b=DleBC8lmod0V+xke1Zy6MhPwOAWmJsiXJZnzc2x93F6JKM1KMY/3MXdlZr9s8uIoJuKeYw4hyX6Tpf4J+Q7Ybm0Vjd/4YZO2rgL2PHHUxooPzddiKZy0J26DcT9AnJrMka3fRBgwVRUSwr1AxcbsIITRRSbU7HMLB6Ou2RTpRPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729090188; c=relaxed/simple;
	bh=lJSe30HFEW7s3wD5KSVYwrMaFRwVVwHeZdBtCDnPE4o=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hGvNQ5X9gAtGP3WDXTnTvkHTJPWQHMr7DaFpLPjkyOCGEiOclEEKh1eY5fxvF79OqrhpnDIsxmH2mw1TdlAAKHwLeOXpv5Af1Nx3RSgX19N3cKNIrEJDdNi/zHQg5XLh1avAzCDDfcu5POMG6krhuGSAfK7ehJ1v518mWeFZYY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gJyhIZpx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GA0sFA013279;
	Wed, 16 Oct 2024 14:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KXDcddpvwlveSy8Xs2uvrS
	kEQq/4/h9QKASZAMIf+Cc=; b=gJyhIZpxA5Ui9vCBx1glHOpwqszH7HWhuZ+iHw
	h7SG2JFIop/Jh4frn0RNt6o67XUH9V5YZALDdjt7Io7eXmPUVbqrvG4snlDY015k
	lzvFQaXaIYngrA53lMh6zBjvnXOpp786pvfSlXngn2EVtoWBvkxItKiLo4U0nIdH
	MMTOqGVzs/Vpw+MIOqxz5wqo/ZE4vYt/SHkq2NmEfe234V46QIjLkeWHpJ6iS4Yk
	s0H8Q6oOcfZUCnLcrWGum6AudDZcocFfcTsWjeSTIBw0CdmdK+q0oZkk9INwelLk
	InEi5q9GIwGhEKMHmckj+Fp17k2AhweuQFU8eXrpiLwPM1cg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42abbxrxk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 14:49:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GEnWu7013349
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 14:49:32 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 07:49:30 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <hanchunchao@inspur.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 1/1] soc: qcom: socinfo: fix revision check in qcom_socinfo_probe()
Date: Wed, 16 Oct 2024 20:18:52 +0530
Message-ID: <20241016144852.2888679-1-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8IOmTUeAOCkI2boAgPDBPmVAhUzGAFqS
X-Proofpoint-GUID: 8IOmTUeAOCkI2boAgPDBPmVAhUzGAFqS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410160092

In success case, the revision holds a non-null pointer. The current
logic incorrectly returns an error for a non-null pointer, whereas
it should return an error for a null pointer.

The socinfo driver for IPQ9574 and IPQ5332 is currently broken,
resulting in the following error message
qcom-socinfo qcom-socinfo: probe with driver qcom-socinfo failed with
error -12

Add a null check for the revision to ensure it returns an error only in
failure case (null pointer).

Fixes: e694d2b5c58b ("soc: qcom: Add check devm_kasprintf() returned value")
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
 drivers/soc/qcom/socinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 3c14df7a382c..ecfd3da9d5e8 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -786,7 +786,7 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
 	qs->attr.revision = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u.%u",
 					   SOCINFO_MAJOR(le32_to_cpu(info->ver)),
 					   SOCINFO_MINOR(le32_to_cpu(info->ver)));
-	if (!qs->attr.soc_id || qs->attr.revision)
+	if (!qs->attr.soc_id || !qs->attr.revision)
 		return -ENOMEM;
 
 	if (offsetof(struct socinfo, serial_num) <= item_size) {
-- 
2.34.1


