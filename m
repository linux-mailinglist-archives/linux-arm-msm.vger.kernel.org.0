Return-Path: <linux-arm-msm+bounces-20392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E20008CE5E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:19:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92CFC1F23745
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 13:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A381272B8;
	Fri, 24 May 2024 13:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="C8AhrXyF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A881272A0;
	Fri, 24 May 2024 13:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556744; cv=none; b=LJFogj7XtHnoOEyiqW/OP+UVdZs1yEAbctDKWAhm/JDMnKn2r54xokekMuqm8DWwsy3r4xVBjIFCLnpbJoNixNz69v+fgAWZw3qgu6naqYHH/vHo1Ws6CdjPHLCETsA3vlLPp2EJ+8Ws3invLUVNb+MFcrpAdNRX5HuOWQJ5d4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556744; c=relaxed/simple;
	bh=JTXd0owb3+tQ8/8FrxwGwly9Ho7GLFtoj9k3Ublt/xc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UDpJzUv3P0h4mirycqGse67GGXNqHyPXPdXbwhqkA639FCm4EuHnzqtwX125SCbR53YWY3kGR0huK0/QTU4OxVE56S+kVMJuqQMzAYBOVMYHMTB7ryqmbS2dSPNDAjtxzFwztTCUtCsk1+kv1m2fwt2vVR7ajprppth1gt9F67I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=C8AhrXyF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9U6Uw015829;
	Fri, 24 May 2024 13:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DuY6+z/GjfVcOE7IsQ8NQZT/GIAy/7LX4dlzaJULjg4=; b=C8AhrXyFEOpkbvUb
	ZNNCmd8KfQcsPMBFWZ4FHaA2GN4DeDh425fZ+VaPt+Dy9ytUhAV+RCuqJ9fxWy7n
	Rv2nZxvILsAulNOdoO+7Rc7ezXzI1MDd+BqxgYx3zd7xuvTpdwtEM9wdWpWjFElc
	EjDnh0sWaskB1sMEwtaOlPdFlhqXrKEv3m5fDkqjWHLlCmRCOtlATKCrh7gmtUq4
	ELPC3FxxO9OPUTJQ3QqmX1J8qIKhOV8BkAp8bdRJrduR74qVcAeupWJd5S+MZIm5
	RaGZGRtFHovztljcEGpkqGacsVuaY9yFtugoCQuQaXtGYovODt9Q8ojsb0zyidzu
	y0Tq/A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8hth4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:18:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44ODIi4i006575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:18:44 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 06:18:39 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v10 2/5] iommu/arm-smmu: refactor qcom_smmu structure to include single pointer
Date: Fri, 24 May 2024 18:47:57 +0530
Message-ID: <20240524131800.2288259-3-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240524131800.2288259-1-quic_bibekkum@quicinc.com>
References: <20240524131800.2288259-1-quic_bibekkum@quicinc.com>
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
X-Proofpoint-GUID: Au83u3LMpLlwouBBeRppsDMbj5W95VkR
X-Proofpoint-ORIG-GUID: Au83u3LMpLlwouBBeRppsDMbj5W95VkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240091

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


