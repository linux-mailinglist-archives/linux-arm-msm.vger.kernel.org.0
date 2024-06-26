Return-Path: <linux-arm-msm+bounces-24292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 296B5918439
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 16:32:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8B29286F72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 14:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2485718755F;
	Wed, 26 Jun 2024 14:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d+LEm2eB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8306D186E2E;
	Wed, 26 Jun 2024 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719412269; cv=none; b=PH6TpHKkLNnE1KxOcXBYW3ugUUcTlnjNahJ8cvPkoV9MoyVn721t9fES2WD2htglgq1mpnIbNIEh5JoOJQISJPNkUEHcfYo8+g8TO+EUP6vs/xNrbPuKqF5vD4nPsLUOrKFzp4AcpG8Cn7UWEjlFvR+MCXtga21cJPZjO7E3u6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719412269; c=relaxed/simple;
	bh=JTXd0owb3+tQ8/8FrxwGwly9Ho7GLFtoj9k3Ublt/xc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OgC05n0KCSBKjh8gj23BC/aOcafDpGTqc4uBldzMPcW58DjCxhiS5GeVUIcpc8r15WmZZ7kUcC+nhb+C7r6Xqjt60Qv58lLuQVNlpD7qF/Ieq8QyeYs47vgev6gV5iUGRtKGDx79snEyF+NXJ7sWywzPdLYilzeSSeVdsBV+hBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d+LEm2eB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfJXZ029729;
	Wed, 26 Jun 2024 14:30:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuY6+z/GjfVcOE7IsQ8NQZT/GIAy/7LX4dlzaJULjg4=; b=d+LEm2eB6pjpW6gv
	WEb0EWthi0euwThkabukkZsW4EI2FDDESn8IUoXGjAM4MH0Y8dG6eh05BSjzC+Wx
	uvVBm+uenHzlNka1LE503WUPb3fwknGmPqvw+gZA5BrvihHw9cKcPveSPlx9te6K
	7DXU0x6WG6qmwDVuHLRRrJq8bEAKEvPZyRuDvlZGiwAf9mzFirGxgPo21nFYPRW1
	xHS2SvoBOSxWcUIICbxl0P39TjYORW+FD6pbQW0hAJsSX0LtfWq94alvXEcClBnZ
	vD976HnaqucmQsyCbpIaPuK7RW0yywlJz4+9S96MFHgiHt84uZFTvVA4wgxtNCX4
	Je0vnw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400c469ft5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:30:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QEUpe5021302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 14:30:51 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Jun 2024 07:30:46 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v12 2/6] iommu/arm-smmu: refactor qcom_smmu structure to include single pointer
Date: Wed, 26 Jun 2024 20:00:16 +0530
Message-ID: <20240626143020.3682243-3-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626143020.3682243-1-quic_bibekkum@quicinc.com>
References: <20240626143020.3682243-1-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jxq4AW70pxU9QXzDkdHxsgIqAJxaSjZE
X-Proofpoint-GUID: jxq4AW70pxU9QXzDkdHxsgIqAJxaSjZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260107

qcom_smmu_match_data is static and constant so refactor qcom_smmu
to store single pointer to qcom_smmu_match_data instead of
replicating multiple child members of the same and handle the further
dereferences in the places that want them.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c | 2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c       | 2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
index 552199cbd9e2..885af324916b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom-debug.c
@@ -73,7 +73,7 @@ void qcom_smmu_tlb_sync_debug(struct arm_smmu_device *smmu)
 	if (__ratelimit(&rs)) {
 		dev_err(smmu->dev, "TLB sync timed out -- SMMU may be deadlocked\n");

-		cfg = qsmmu->cfg;
+		cfg = qsmmu->data->cfg;
 		if (!cfg)
 			return;

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 76db4c8d1a9b..573c4c9886f1 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -506,7 +506,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 		return ERR_PTR(-ENOMEM);

 	qsmmu->smmu.impl = impl;
-	qsmmu->cfg = data->cfg;
+	qsmmu->data = data;

 	return &qsmmu->smmu;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 9bb3ae7d62da..addc07623c0b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -8,7 +8,7 @@

 struct qcom_smmu {
 	struct arm_smmu_device smmu;
-	const struct qcom_smmu_config *cfg;
+	const struct qcom_smmu_match_data *data;
 	bool bypass_quirk;
 	u8 bypass_cbndx;
 	u32 stall_enabled;
--
2.34.1


