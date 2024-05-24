Return-Path: <linux-arm-msm+bounces-20391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3EE8CE5E7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 15:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA68B1F23444
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 May 2024 13:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED8938663E;
	Fri, 24 May 2024 13:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JErcqfYY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EC28625B;
	Fri, 24 May 2024 13:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556740; cv=none; b=Ri1qaVyMNRIxcWSwAYYIsaWCZwUEeu3aubBizT4WzBbCdM60n43+9CTo0vWXJdBIsgUX21HUIvU5skT2Mu8Ot4Xc/eIJ16TQkmffx15I4trkYESU/TcmT94RZPk4tcsI01ZvlywaWK3LdpwAL+sIkV4FjayV07eBQ0GfxjXd4ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556740; c=relaxed/simple;
	bh=G/xQhtJfSJVECUMN+T0d9iXwDkBME4Om+sO3P5KPeSA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZfNS16SnL5rDGogg+o7eVhQapacML9Qqy6spdcPJsfSuEDf6VgWnz8tNDQzkJsPERevjy0tOdy1EkIi4RyzpkwhOSfyghzQVNih8Ak39bAF+J7OY0Gl0ZwEULpQfBIkrN1bOQx+V6yBFH6TjnbJkUl4ihab6Du2pdLUR6i675T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JErcqfYY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44O9Z9e3031640;
	Fri, 24 May 2024 13:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gBNF1d6gH6Rd1O/2/9XvTuf3ps3jKwjpwvy2Zcx8tZ4=; b=JErcqfYYkGlYnfhJ
	JeuHdEK7jIlbx77kyalPzkNQhVMbaDmx93o99amNMCbijg3l/JUJq/+nBOmdV1Nn
	h2yPqwQ9FcrsDc+00tHkUKfxO4CQ9KTSL85dTrGuRq54j36EL1Ec1QjheJcs2/FE
	qnqFQhOoXwNGRswMDlmHteFQlwFEtq7En0cfsnlrMnCPovEFdzDPlqo0OffnL8FW
	3+6QyXaftv/GzE17U2EXVOke51SaisW/0qt5pmuj4lZpaOrirknC8qozKfXAlhcF
	WQKIyfAVZyYUdxWqqfmAKAnhagA7UuRO5AndxXdzThR0+be7i4IxHdctIUUixBfG
	yeqDhg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa8j2j10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:18:38 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44ODIap6004800
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 May 2024 13:18:36 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 06:18:32 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>,
        <konrad.dybcio@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Bibek Kumar Patro" <quic_bibekkum@quicinc.com>
Subject: [PATCH v10 1/5] iommu/arm-smmu: re-enable context caching in smmu reset operation
Date: Fri, 24 May 2024 18:47:56 +0530
Message-ID: <20240524131800.2288259-2-quic_bibekkum@quicinc.com>
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
X-Proofpoint-ORIG-GUID: xKiW5XSfRH53DPWriV61wUnBTpGWW2My
X-Proofpoint-GUID: xKiW5XSfRH53DPWriV61wUnBTpGWW2My
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_04,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405240091

Default MMU-500 reset operation disables context caching in
prefetch buffer. It is however expected for context banks using
the ACTLR register to retain their prefetch value during reset
and runtime suspend.

Replace default MMU-500 reset operation with Qualcomm specific reset
operation which envelope the default reset operation and re-enables
context caching in prefetch buffer for Qualcomm SoCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 36 ++++++++++++++++++++--
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 25f034677f56..76db4c8d1a9b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -14,6 +14,16 @@

 #define QCOM_DUMMY_VAL	-1

+/*
+ * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
+ * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
+ * buffer). The remaining bits are implementation defined and vary across
+ * SoCs.
+ */
+
+#define CPRE			(1 << 1)
+#define CMTLB			(1 << 0)
+
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
 	return container_of(smmu, struct qcom_smmu, smmu);
@@ -379,11 +389,31 @@ static int qcom_smmu_def_domain_type(struct device *dev)
 	return match ? IOMMU_DOMAIN_IDENTITY : 0;
 }

+static int qcom_smmu500_reset(struct arm_smmu_device *smmu)
+{
+	int ret;
+	u32 val;
+	int i;
+
+	ret = arm_mmu500_reset(smmu);
+	if (ret)
+		return ret;
+
+	/* arm_mmu500_reset() disables CPRE which is re-enabled here */
+	for (i = 0; i < smmu->num_context_banks; ++i) {
+		val = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_ACTLR);
+		val |= CPRE;
+		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_ACTLR, val);
+	}
+
+	return 0;
+}
+
 static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 {
 	int ret;

-	arm_mmu500_reset(smmu);
+	qcom_smmu500_reset(smmu);

 	/*
 	 * To address performance degradation in non-real time clients,
@@ -410,7 +440,7 @@ static const struct arm_smmu_impl qcom_smmu_500_impl = {
 	.init_context = qcom_smmu_init_context,
 	.cfg_probe = qcom_smmu_cfg_probe,
 	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = arm_mmu500_reset,
+	.reset = qcom_smmu500_reset,
 	.write_s2cr = qcom_smmu_write_s2cr,
 	.tlb_sync = qcom_smmu_tlb_sync,
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
@@ -443,7 +473,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.init_context = qcom_adreno_smmu_init_context,
 	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = arm_mmu500_reset,
+	.reset = qcom_smmu500_reset,
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
--
2.34.1


