Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28CDE7A151E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Sep 2023 07:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbjIOFH3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Sep 2023 01:07:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbjIOFH2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Sep 2023 01:07:28 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A181F270C;
        Thu, 14 Sep 2023 22:07:23 -0700 (PDT)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F4usHC029735;
        Fri, 15 Sep 2023 05:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=WlWxeBGk1AZB5svk4apl9RpDukO0GMEXmzRUEdj9hG4=;
 b=GlvR776JndBFdqTzT+RnNmimPJAKBYePvixjvGHVud6MCK5VhEvkq02c3M4VD3Ip1aj7
 qGPGuEytbxE9fLt1JwPV8a6UDTBBuVe9ir7u5+DsMlnHk2lFSrWiUgGlMY1QtTIIRKxB
 a4SriTUBvaDGeqsBmgzH5AXYOpMox6axavak7wqBpD3UnsbeZUwYCH0rnf6DqjEKDrxv
 IMFu7FMvcC/6r1w5tWO0VTx8zp4sLeitkN/T65AAcM3cqRBp3393/6ipuwws+aZ5Ix2Z
 CQcfgp94v3mLRlkz5GyfoOPpgXhf7NSk2a+XgwPNufPueTPQu3jmm6MbRmRlO1nF+EeQ kw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g2xg2ur-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 05:07:17 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38F57Hwq001587
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 15 Sep 2023 05:07:17 GMT
Received: from hu-gkohli-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 14 Sep 2023 22:07:10 -0700
From:   Gaurav Kohli <quic_gkohli@quicinc.com>
To:     <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <kernel@quicinc.com>,
        <devicetree@vger.kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>
Subject: [PATCH] arm64: dts: qcom: msm8916: Fix iommu local address range
Date:   Fri, 15 Sep 2023 10:36:11 +0530
Message-ID: <20230915050611.30451-1-quic_gkohli@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aUvO9nc6d1-imqhOrmAIEeDHaL9QSBrh
X-Proofpoint-ORIG-GUID: aUvO9nc6d1-imqhOrmAIEeDHaL9QSBrh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_04,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 phishscore=0 impostorscore=0 adultscore=0 mlxlogscore=666 bulkscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150045
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the apps iommu local address space range as per data sheet.

Fixes: 327c0f5f2510 ("arm64: dts: qcom: msm8916: Sort nodes")
Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 33fb65d73104..3c934363368c 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1813,7 +1813,7 @@
 			#size-cells = <1>;
 			#iommu-cells = <1>;
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
-			ranges = <0 0x01e20000 0x40000>;
+			ranges = <0 0x01e20000 0x20000>;
 			reg = <0x01ef0000 0x3000>;
 			clocks = <&gcc GCC_SMMU_CFG_CLK>,
 				 <&gcc GCC_APSS_TCU_CLK>;
-- 
2.17.1

