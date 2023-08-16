Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE61877ED78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 00:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbjHPWzx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Aug 2023 18:55:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347054AbjHPWzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Aug 2023 18:55:42 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B552698
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Aug 2023 15:55:40 -0700 (PDT)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37GMqJRD013073;
        Wed, 16 Aug 2023 22:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=dVUzAjm1YTME2b6hY0E6fQaPmvurh2dNPp4Vd8sQc7c=;
 b=Xn/W1j7FJsnc7WMVnZ4TbHrR/tYWFfDSmjgFPqCiADR3tokC62EQIO/Ryfx8D4lFdC2K
 Feu7Y+f7jr62VhlvXLi53kDZW9NKU++ygbu6nOZd8sG1tq6O3uMciU+qjCsK8ZtOBGBm
 gkmwERLOpPLzsoOiyYacVflCVwtXDWpYEic5Qa5TG5q2ckBpnJ+NV1NOUMmFpSrYEx1r
 ChDxsJAIpi530MRz1V5fm7FYE8y9gCCQd9clFpFnX0Ut86QNkKJWOtZQnni66lx+Ecm8
 KsSfzdh7fPz43hNN08EoY2TlbTLgwB9LF4KT2lqh/d4tFo0Nwtqy+ebriEcEKAv9itly 2w== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sh2a3gpvk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Aug 2023 22:55:14 +0000
Received: from pps.filterd (NASANPPMTA03.qualcomm.com [127.0.0.1])
        by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 37GMr7VX027860;
        Wed, 16 Aug 2023 22:55:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 3sguas73ky-1;
        Wed, 16 Aug 2023 22:55:13 +0000
Received: from NASANPPMTA03.qualcomm.com (NASANPPMTA03.qualcomm.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37GMr7Wa027855;
        Wed, 16 Aug 2023 22:55:13 GMT
Received: from car-linux12.qualcomm.com (car-linux12.qualcomm.com [10.62.46.54])
        by NASANPPMTA03.qualcomm.com (PPS) with ESMTP id 37GMtDFp030462;
        Wed, 16 Aug 2023 22:55:13 +0000
Received: by car-linux12.qualcomm.com (Postfix, from userid 2366307)
        id 52998232B9; Wed, 16 Aug 2023 15:55:13 -0700 (PDT)
From:   Aravind Vijayakumar <quic_aprasann@quicinc.com>
To:     will@kernel.org, joro@8bytes.org
Cc:     robin.murphy@arm.com, dmitry.baryshkov@linaro.org,
        quic_bjorande@quicinc.com, konrad.dybcio@linaro.org,
        quic_eberman@quicinc.com, robdclark@chromium.org,
        quic_psodagud@quicinc.com, quic_rvishwak@quicinc.com,
        quic_saipraka@quicinc.com, quic_molvera@quicinc.com,
        marijn.suijten@somainline.org, mani@kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Aravind Vijayakumar <quic_aprasann@quicinc.com>
Subject: [PATCH] iommu/arm-smmu-qcom: NULL pointer check for driver data
Date:   Wed, 16 Aug 2023 15:55:09 -0700
Message-Id: <20230816225509.11070-1-quic_aprasann@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QiuLwRKVDeVH3UOJyTe-jdj-s9805Ync
X-Proofpoint-ORIG-GUID: QiuLwRKVDeVH3UOJyTe-jdj-s9805Ync
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-16_20,2023-08-15_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308160203
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The driver_data is NULL when qcom_adreno_smmu_init_context()
is called before the dev_set_drvdata() from the client driver
and is resulting in kernel crash.

So add a null pointer check to handle the scenario
where the client driver for the GPU SMMU device would
be setting the driver data after the smmu client device
probe is done and not necessarily before that. The function
qcom_adreno_smmu_init_context() assumes that the client
driver always set the driver data using dev_set_drvdata()
before the smmu client device probe, but this assumption
is not always true.

Signed-off-by: Aravind Vijayakumar <quic_aprasann@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c71afda79d64..5323f82264ca 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -231,6 +231,9 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	 */
 
 	priv = dev_get_drvdata(dev);
+	if (!priv)
+		return 0;
+
 	priv->cookie = smmu_domain;
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
-- 
2.40.1

