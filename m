Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022FF728F61
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 07:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229969AbjFIFm4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 01:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjFIFmz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 01:42:55 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BF96270B;
        Thu,  8 Jun 2023 22:42:54 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3595gN9i016448;
        Fri, 9 Jun 2023 05:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=6xDwXST5JmukggFNWVIpAXN41vdJwQIThumaYJkh+Ws=;
 b=UNlvxv1uSKXXSKY9kRjf9z73t86ZPFwMrVfn4XDiIJWxtdtK+BM9YZ2uMUqImPNlqgpF
 HBOHm+xOXk52xPHYKuG8SU/XS9GJunDzo433ajC4BWcL379Vw362jv6NKz6kL5Xh5Vv3
 T+xWq++R28fx1c/iZaiM/q/enq2aYoDhcnqG6M42LWyFP72VV33zGmEte90Te0NLQn5x
 iSA5ToWTKVyyKZCxYxiP6o2PJR4rQGfBeBkhRPolSAD5Y3rZ4IdxJoPvvYvz+uOweri7
 cbUAKusrxmvSenK2jxmJ+QScT7CeBibaCTPQL7wj5U/w9lEWBUOwgas3XGMtVq1rsDdp CQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3r3uja08e0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Jun 2023 05:42:30 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3595gTPI012410
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 9 Jun 2023 05:42:29 GMT
Received: from hu-ppareek-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 8 Jun 2023 22:42:24 -0700
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
Subject: [PATCH 1/3] dt-bindings: arm-smmu: Add interconnect for qcom SMMUs
Date:   Fri, 9 Jun 2023 11:11:40 +0530
Message-ID: <20230609054141.18938-2-quic_ppareek@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230609054141.18938-1-quic_ppareek@quicinc.com>
References: <20230609054141.18938-1-quic_ppareek@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gx-BzWCa23aZDU4sT8BqnqVZm3RuNFw1
X-Proofpoint-ORIG-GUID: gx-BzWCa23aZDU4sT8BqnqVZm3RuNFw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_03,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090048
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are certain SMMUs on qcom SoCs, which need to set interconnect-
bandwidth, before accessing any MIMO mapped HW registers, and accessing
RAM during page table walk. Hence introduce the due bindings for
interconnects.

Reported-by: Eric Chanudet <echanude@redhat.com>
Signed-off-by: Parikshit Pareek <quic_ppareek@quicinc.com>
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index ba677d401e24..75e00789d8c2 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -327,6 +327,28 @@ allOf:
             - description: interface clock required to access smmu's registers
                 through the TCU's programming interface.
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              qcom,sa8775p-smmu-500
+    then:
+      properties:
+        interconnects:
+          minItems: 1
+          maxItems: 1
+
+        interconnect-names:
+          minItems: 1
+          items:
+            - const: tbu_mc
+
+        icc_bw:
+          $ref: /schemas/types.yaml#/definitions/int32
+          description:
+            An integer expressing the interconnect bandwidth(MBps) to be set.
+
   - if:
       properties:
         compatible:
-- 
2.17.1

