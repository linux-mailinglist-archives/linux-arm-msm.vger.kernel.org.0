Return-Path: <linux-arm-msm+bounces-32093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DE597D7F0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 17:59:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF8931F24090
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Sep 2024 15:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045A017DE16;
	Fri, 20 Sep 2024 15:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XD35uhoy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B42561FCF;
	Fri, 20 Sep 2024 15:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847977; cv=none; b=Bc4s15JwS32LxMo3Sea+/lNSvsZQ2lX1MIEcRa7G3wXZn0VkWB6dQIHn6OnwFHdfoqcE+UBleeeGEo0mTfhiI/btyz2IwET/2vDjTTWu2qWdW10yjSTlsVpWlCosqVQ+nS+rLYQ94PrVUspoZZ6VOecgjCenkafNoM6Tzm/lx6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847977; c=relaxed/simple;
	bh=+dQ4gFEXMYvpBW3zZel9F+W3kW5UTQuhM1w5QKPt/RM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tOF/4L9wAMH6B+aqufgl19Jv7A/+f95uiiXcaar2Z///jSd8X1suWRVWhrIcumUsef8H8dpffVW7sa+Rf9mw2jR7OA9RjGbYoGkat/3xEQy94s5Zx8xlADwuErinJODsSwpkIHoG9z7Sqnird8IJG75nwxsNCj2/Hm3srF/iyak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XD35uhoy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48K8OgmP007810;
	Fri, 20 Sep 2024 15:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vOnI2NZ1hyA6gdnw6KJkUQLPoFuXV7NXF0G6EDDR/Vs=; b=XD35uhoyPwqB7Fcm
	Z0D6SwtCat5Ob7xHjmz+tP/pRVGQH/A7O6r3nED7GdIYNsBDci8Qa/DsXRrm8jtS
	abXQw0Eiy/a6IoAxnqyJDhh9qMPvgOfpX/NU2NMY8Q4y1fobiX4FlFC2Yz7pDQWA
	zxj1GCMBQC5PYne7h3oWeuN4127sEAls2sKJ4B1lZBkxCxZqkTncXoTUUcbabqHh
	8cP7PptgHz2OxyOzKYfyUEmgNmLZ2myHNSnrTbzC/EIHaa4euF1Zwz3BTBaiHI+L
	oZaQO/0J4572cl/1DmkzliUS1PATaE3qG4hYYzstgAyP83bY9wmocdE7hOgyFJGt
	CpnkJQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4k11x0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 15:59:16 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48KFxFrk003171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Sep 2024 15:59:15 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 08:59:10 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_bibekkum@quicinc.com>
Subject: [PATCH v15 2/5] iommu/arm-smmu: refactor qcom_smmu structure to include single pointer
Date: Fri, 20 Sep 2024 21:28:10 +0530
Message-ID: <20240920155813.3434021-3-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240920155813.3434021-1-quic_bibekkum@quicinc.com>
References: <20240920155813.3434021-1-quic_bibekkum@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ldr8Jt3ZdMz31alltj73CfSbni2ekjdg
X-Proofpoint-GUID: ldr8Jt3ZdMz31alltj73CfSbni2ekjdg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409200117

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
index 548783f3f8e8..d03b2239baad 100644
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
index 0cb10b354802..6e0a2a43e45a 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -534,7 +534,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 		return ERR_PTR(-ENOMEM);

 	qsmmu->smmu.impl = impl;
-	qsmmu->cfg = data->cfg;
+	qsmmu->data = data;

 	return &qsmmu->smmu;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 3c134d1a6277..b55cd3e3ae48 100644
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


