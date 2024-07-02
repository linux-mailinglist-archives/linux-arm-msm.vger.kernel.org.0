Return-Path: <linux-arm-msm+bounces-24866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5873B923906
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 11:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C6955B20FB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 09:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E932C150994;
	Tue,  2 Jul 2024 09:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mgg7Ohk4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ED51A28B;
	Tue,  2 Jul 2024 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719910897; cv=none; b=kDd+oAb9YYLg0vGg8qg+ctqpGqRhQ7p/iKslZKpcwDSTE3dDGTCyeIJ97q8DEgO4oPCI7ipEs1EQoe7xnHOiKTD6hQQjkNL9nve1P3LQpCSr1vYpGUpPHeo4vk03QZZ5OqGqirqUZzuX7U60ZDU8pgIC4R4roXOGpRv14ehWcI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719910897; c=relaxed/simple;
	bh=Rd4xCULvn7tBPs6tRqk6DKQQ1lIw/zsToCnMWg5EzFk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XnSs8M7OlGtFIB/fWzFMA6RkqKZ9nOZZygSX4HHmhtOuOdVGvZWQiICRQ+TP7mw6ZIJnZBXMnl+K6jLy/WTaDw8symv0PnBrpZgD+I6RlA034jGKIlYHldZ7cwt79b+h4lBakaRPClt4I/124jEAn0NdLUf3EyoGziIxvS8nmfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mgg7Ohk4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4628IBsv019780;
	Tue, 2 Jul 2024 09:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=5oUp9HjdbzqCJbBpnTEAe9i/3eQI4P1aO4PcqDLsfHQ=; b=mg
	g7Ohk4FykRA9sFn5VMDyAP7+gl3Mi2Kfp3u2MWacueKW5sEPB0KHNXE5ZUNlCdhW
	im1cl/KIUZnf1XCWv9aa4kQz17N0nrNwK+YSXdlkzPuppY+78rxVeGmYqj4skWN6
	48VB2hZWL4YfteJaA1efY3OLHwZnFh0GnGyeG+8wxxTyin/AM0WSIl44H66ZzeUh
	tbyhVaBsFhRJW6kUNAL/8lLdXLEh7KpmB40aSJfnE2eS01l0rqhJtag3XdMmvBHQ
	dEKlSoF4lOl8R6/QN8dY520j/J2nBQpQEfqPLy446gNVqAn0ngkjteAq4/A9I9Nv
	f305vylTFGuhZ94Aoq7g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40297rq2xm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 09:01:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46291LcC020780
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 09:01:21 GMT
Received: from zhenhuah-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 02:01:18 -0700
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <iommu@lists.linux.dev>
CC: Zhenhua Huang <quic_zhenhuah@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] iommu/arm-smmu-qcom: record reason for deferring probe
Date: Tue, 2 Jul 2024 17:01:10 +0800
Message-ID: <1719910870-25079-1-git-send-email-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vSwIDrJRaZdgNOUJQK7AzlQXacZMoxPy
X-Proofpoint-GUID: vSwIDrJRaZdgNOUJQK7AzlQXacZMoxPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_05,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=849
 lowpriorityscore=0 clxscore=1011 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020068

To avoid deferring probe smmu driver silently, record reason for it.
It can be checked through ../debugfs/devices_deferred as well:
/sys/kernel/debug# cat devices_deferred
15000000.iommu  arm-smmu: qcom_scm not ready

Signed-off-by: Zhenhua Huang <quic_zhenhuah@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 25f034677f56..971c6a2e592b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -469,7 +469,8 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 
 	/* Check to make sure qcom_scm has finished probing */
 	if (!qcom_scm_is_available())
-		return ERR_PTR(-EPROBE_DEFER);
+		return ERR_PTR(dev_err_probe(smmu->dev, -EPROBE_DEFER,
+			"qcom_scm not ready\n"));
 
 	qsmmu = devm_krealloc(smmu->dev, smmu, sizeof(*qsmmu), GFP_KERNEL);
 	if (!qsmmu)
-- 
2.7.4


