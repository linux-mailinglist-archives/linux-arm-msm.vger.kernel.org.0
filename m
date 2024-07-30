Return-Path: <linux-arm-msm+bounces-27400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A7940F88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 12:36:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B89D71F27449
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 10:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14D319E7F9;
	Tue, 30 Jul 2024 10:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cu7YWSAM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1FB19DF70;
	Tue, 30 Jul 2024 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335482; cv=none; b=XsGQhw9kAITzlCyiyTddSvvfoAAmAW2ouASyOnQsw2isBse2hryHRewO/F2tyU6YjqeU5wLJLSu7DP9xaiQwwIPvoMUXuneJqzvOw7ACWZLatv+0+5V0Dmj077cUWVQvOWooxAzJy4+qbUQ4E1hhb1WDzzeqsO5oRYVkDWoeT08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335482; c=relaxed/simple;
	bh=iJFVbRYOc1jzsjpJ08jTc7C7wyjX0vVNNK+tZsJP1m4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cDfjp//1I5Ini1zscY7BKFAdgmxuEMytL6eqIPxqLuJt6Ob12LuXgNSHMmtOLWVRgGgq4zf3CRe1WjxeWE2aIiEt9lBF0QDMSyKDYnNozF7JuLI7qlM9+SD730dXuBAJromgfr2iOT6xjib9ualWn1UnIqTf05ECvrCZt87+nyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cu7YWSAM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U0r8HB026407;
	Tue, 30 Jul 2024 10:30:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=wI3Q4nVFdXrvJugbyJuL+mmiWCTxUxemt3HF/N24QaU=; b=cu
	7YWSAM2wnb6m0/51y1xg0JULxz/Cz1tjR3Xaf/HVy9ieWKmdxleWSG4OW44m/3g4
	TmNjkNVuzFaTeIZ7UZOjZLbbkFCLUd68VUtVMcZ3df2ZJc+ys9lRaIPoCxLMjniw
	UWaF9NDZh3RZTljKmFww/KLV8mosseMPbbg1gFgu5J6LF78NeB20gBJNUdliUJve
	ar3BtaRnCjXoAbSIuv88aLj7SAp+Z3p+pjArDFVLgLOcYtiP5oPNdfgPFzI/gqWy
	KN/Y8E/k50xfvfLzj5rJYXPuHrKvxLkgTiHGyScM/pmCf1OVhlkxk5lTteoMSqVP
	23sYAYlhdKrP1RgHZsWA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mpkey4jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 10:30:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UAUv2J017631
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 10:30:57 GMT
Received: from zhenhuah-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 03:30:54 -0700
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        Zhenhua Huang
	<quic_zhenhuah@quicinc.com>
Subject: [PATCH 1/1] iommu/arm-smmu-qcom: remove runtime pm enabling for TBU driver
Date: Tue, 30 Jul 2024 18:30:43 +0800
Message-ID: <1722335443-30080-1-git-send-email-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XjEMwOAqJCLO1XM-tP_-gvA0hscz3qUh
X-Proofpoint-GUID: XjEMwOAqJCLO1XM-tP_-gvA0hscz3qUh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_11,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxlogscore=919 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300075

TBU driver has no runtime pm support now, adding pm_runtime_enable()
seems to be useless. Remove it.

Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 36c6b36ad4ff..aff2fe1fda13 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -566,7 +566,6 @@ static struct acpi_platform_list qcom_acpi_platlist[] = {
 
 static int qcom_smmu_tbu_probe(struct platform_device *pdev)
 {
-	struct device *dev = &pdev->dev;
 	int ret;
 
 	if (IS_ENABLED(CONFIG_ARM_SMMU_QCOM_DEBUG)) {
@@ -575,11 +574,6 @@ static int qcom_smmu_tbu_probe(struct platform_device *pdev)
 			return ret;
 	}
 
-	if (dev->pm_domain) {
-		pm_runtime_set_active(dev);
-		pm_runtime_enable(dev);
-	}
-
 	return 0;
 }
 
-- 
2.7.4


