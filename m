Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD526728F70
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 07:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229796AbjFIFx3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 01:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjFIFx1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 01:53:27 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EA3E30D1;
        Thu,  8 Jun 2023 22:53:26 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3594WSIb029465;
        Fri, 9 Jun 2023 05:53:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=Sa241Jhc0rB20AIxBgrwQotffKxAIKzXI/CdDmbz5MY=;
 b=BROYdUlsLF6FwXfEkJpuWovySZaU3VyRaMUnhXuBR5LHwy6vvG5pqxDLW+pkMw7a2IEY
 6+OLdT2wfhcho5EZbh0drp5VyvM5MsoGwSUvlXokraYKoCPQLAiGXL6iVKKbaQA98n7q
 WspV+1EU2MJwZ/BLQbZ0JFXLjgEgvBnyh6nbn8KGy/mYeeQSkE8JJl0go+IsJzlBKslx
 yoX+wT0JuH5ual7npA+XyK2BV5JX8zeoXdcNjGlbw4Xqk7fX+yc9Bs371b7enQHrLIDr
 JKwTJ9qon8JZOzvQNN6iAJetGkmum+HyU27FpofLHAVaxRPwibMcPh8wqv20Kap05D9P vQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3uja08wa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Jun 2023 05:53:10 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3595r9Xt010946
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 9 Jun 2023 05:53:09 GMT
Received: from hu-ppareek-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 8 Jun 2023 22:52:48 -0700
From:   Parikshit Pareek <quic_ppareek@quicinc.com>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel" <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC:     Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>,
        "linux-kernel @ vger . kernel . org Prasanna Kumar" 
        <quic_kprasan@quicinc.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>,
        Parikshit Pareek <quic_ppareek@quicinc.com>
Subject: [PATCH 3/3] iommu/arm-smmu-qcom: Add support for the interconnect
Date:   Fri, 9 Jun 2023 11:22:25 +0530
Message-ID: <20230609055225.20717-1-quic_ppareek@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230609054141.18938-1-quic_ppareek@quicinc.com>
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 53Kv0YAoHXBldbEtHdhUviorfcHk1GPp
X-Proofpoint-ORIG-GUID: 53Kv0YAoHXBldbEtHdhUviorfcHk1GPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_03,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090050
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce support to detect the interconnect, and set its bandwidth.
For certain targets, we need to set the bandwidth of interconnect,
connecting smmu to memory. This is accessed during memory mapped IO
access to smmu registers, and during page tables walks.

Reported-by: Eric Chanudet <echanude@redhat.com>
Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c71afda79d64..6961d564869b 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -8,6 +8,7 @@
 #include <linux/delay.h>
 #include <linux/of_device.h>
 #include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/interconnect.h>
 
 #include "arm-smmu.h"
 #include "arm-smmu-qcom.h"
@@ -549,6 +550,8 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 {
 	const struct device_node *np = smmu->dev->of_node;
 	const struct of_device_id *match;
+	struct icc_path *icc_path;
+	int ret, icc_bw;
 
 #ifdef CONFIG_ACPI
 	if (np == NULL) {
@@ -558,6 +561,19 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
 	}
 #endif
 
+	icc_path = devm_of_icc_get(smmu->dev, "tbu_mc");
+	if (IS_ERR(icc_path))
+		return (struct arm_smmu_device *)icc_path;
+
+	ret = of_property_read_u32(np, "icc_bw", &icc_bw);
+
+	/*if interconnect exists, check for the  bandwidth value*/
+	if (icc_path && !ret) {
+		ret = icc_set_bw(icc_path, 0, MBps_to_icc(icc_bw));
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	match = of_match_node(qcom_smmu_impl_of_match, np);
 	if (match)
 		return qcom_smmu_create(smmu, match->data);
-- 
2.17.1

