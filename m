Return-Path: <linux-arm-msm+bounces-5496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C8F0819860
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 07:03:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 320B21F26BA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Dec 2023 06:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA53101CC;
	Wed, 20 Dec 2023 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RRdjsfGw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6316134B7;
	Wed, 20 Dec 2023 06:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BK47Oe8016643;
	Wed, 20 Dec 2023 06:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=eoSOgLHAo5PU3AY5/6NY
	TjXTGHyxG/Npqvsyfy7LU60=; b=RRdjsfGwF/ESO4MBjbCVHrmdosVhRPfripen
	/WLEuPvdKnlB040cr1n750itQEBEQglsrTd+uEXeoCFygsSJgVMaTlWDwdmWqAPo
	S/cY/AgbI/HpIByAM+ynK92yYSSb0Z/3CaUKmsiJZOPsDHtKJ8POVMQE7yBwWBJI
	c+3CYjvRPtyxkIMsRn40NGfkhN8W58pFAr6F4QPtHyJesCZ1Irk8viZsMgKR82lC
	ubGlvScfmXdNMCG7I/O/SAl5m7faNi5bvcspNcpRRZU20qqRRvuCJiPFTwQ3eiHv
	mCdoQuzIZ3pQH3POfZOkWaKbzQJf1ry1Y13fpS2vIR8DdxtAGg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v37vxtmqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 06:02:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BK62mHG023301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 06:02:48 GMT
Received: from hu-c-gdjako-lv.qualcomm.com (10.49.16.6) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 19 Dec 2023 22:02:47 -0800
From: Georgi Djakov <quic_c_gdjako@quicinc.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>
CC: <devicetree@vger.kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_cgoldswo@quicinc.com>,
        <quic_sukadev@quicinc.com>, <quic_pdaly@quicinc.com>,
        <quic_sudaraja@quicinc.com>, <djakov@kernel.org>
Subject: [PATCH v3 4/9] iommu/arm-smmu: Allow using a threaded handler for context interrupts
Date: Tue, 19 Dec 2023 22:02:31 -0800
Message-ID: <20231220060236.18600-5-quic_c_gdjako@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231220060236.18600-1-quic_c_gdjako@quicinc.com>
References: <20231220060236.18600-1-quic_c_gdjako@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bcG8l1si0NAW3U4uxFm5P-cMyTddr-fJ
X-Proofpoint-GUID: bcG8l1si0NAW3U4uxFm5P-cMyTddr-fJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=983
 suspectscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312200038

Threaded IRQ handlers run in a less critical context compared to normal
IRQs, so they can perform more complex and time-consuming operations
without causing significant delays in other parts of the kernel.
During a context fault, it might be needed to do more processing and
gather debug information from TBUs in the handler. These operations may
sleep, so add an option to use a threaded IRQ handler in these cases.

Signed-off-by: Georgi Djakov <quic_c_gdjako@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 12 ++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 68b6bc5e7c71..82436a454c5e 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -806,8 +806,16 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 	else
 		context_fault = arm_smmu_context_fault;
 
-	ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
-			       "arm-smmu-context-fault", smmu_domain);
+	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
+		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
+						context_fault,
+						IRQF_ONESHOT | IRQF_SHARED,
+						"arm-smmu-context-fault",
+						smmu_domain);
+	else
+		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
+				       "arm-smmu-context-fault", smmu_domain);
+
 	if (ret < 0) {
 		dev_err(smmu->dev, "failed to request context IRQ %d (%u)\n",
 			cfg->irptndx, irq);
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 17f704920190..54cb9dfcec76 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -438,6 +438,7 @@ struct arm_smmu_impl {
 	int (*def_domain_type)(struct device *dev);
 	irqreturn_t (*global_fault)(int irq, void *dev);
 	irqreturn_t (*context_fault)(int irq, void *dev);
+	bool context_fault_needs_threaded_irq;
 	int (*alloc_context_bank)(struct arm_smmu_domain *smmu_domain,
 				  struct arm_smmu_device *smmu,
 				  struct device *dev, int start);

