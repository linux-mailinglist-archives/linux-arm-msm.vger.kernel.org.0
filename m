Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 785CE6478E8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 23:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbiLHWh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Dec 2022 17:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbiLHWhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Dec 2022 17:37:53 -0500
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23FEBA1BC;
        Thu,  8 Dec 2022 14:37:47 -0800 (PST)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B8LuBwj028515;
        Thu, 8 Dec 2022 22:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=/bMtS/UDtEhHd/mfnxr7WVoBZZuq/U1E8XtaKjI6vac=;
 b=V7GRqlUdKf7euyGg0Y1PZLjA3o4BdA7hXxXUXFVUKCnpSg2s6pBZSr3YwMzhv5I9m224
 BltAC72XFbX+Aok04BGDRNnDwBbWy4eYugiECLsM5CoUfp2HsyMdH8hIx/00sj0ml+S2
 kX/ygUSvMQMIjYkt4Umy/BcSlYDkJNGmc4aQW4styvA9P9gLD3y3nWOUtTRrQ2TNGL0T
 dLrfgcKLjOgYrWVQVX177UxF/xJ4tclf7a1Ytr/229bLfAa6ysMZhRw7ISO1fhAXQI6z
 zRgcyhd4LBgPC+Tt+uXa9tbEoGqM4ybLWbbaIXqElcBq3P+ZkzbdsAnA29XtD70kFLaP Sw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mbr2v82en-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Dec 2022 22:37:32 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2B8MbVj5019071
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 8 Dec 2022 22:37:31 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 8 Dec 2022 14:37:30 -0800
From:   Kuogee Hsieh <quic_khsieh@quicinc.com>
To:     <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@linux.ie>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>, <konrad.dybcio@somainline.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <devicetree@vger.kernel.org>, <airlied@gmail.com>
CC:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        <quic_abhinavk@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 2/5] dt-bindings: msm/dp: add data-lanes and link-frequencies property
Date:   Thu, 8 Dec 2022 14:36:52 -0800
Message-ID: <1670539015-11808-3-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
References: <1670539015-11808-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: skKzypwvEV99ulMMn6xpIAGzXtM3BvLF
X-Proofpoint-GUID: skKzypwvEV99ulMMn6xpIAGzXtM3BvLF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_12,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080186
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add both data-lanes and link-frequencies property into endpoint

Changes in v7:
-- split yaml out of dtsi patch
-- link-frequencies from link rate to symbol rate
-- deprecation of old data-lanes property

Changes in v8:
-- correct Bjorn mail address to kernel.org

Changes in v10:
-- add menu item to data-lanes and link-frequecnis

Changes in v11:
-- add endpoint property at port@1

Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
---
 .../bindings/display/msm/dp-controller.yaml        | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index f2515af..2a7fdef8 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -81,6 +81,7 @@ properties:
 
   data-lanes:
     $ref: /schemas/types.yaml#/definitions/uint32-array
+    deprecated: true
     minItems: 1
     maxItems: 4
     items:
@@ -96,6 +97,7 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
+
     properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
@@ -105,6 +107,29 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: Output endpoint of the controller
 
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+
+            properties:
+              remote-endpoint: true
+              data-lanes:
+                $ref: /schemas/types.yaml#/definitions/uint32-array
+                minItems: 1
+                maxItems: 4
+                items:
+                  maximum: 3
+              link-frequencies:
+                $ref: /schemas/types.yaml#/definitions/uint64-array
+                minItems: 1
+                maxItems: 4
+                items:
+                  maximum: 8100000000
+  
+  required:
+    - port@0
+    - port@1
+   
 required:
   - compatible
   - reg
@@ -193,6 +218,8 @@ examples:
                 reg = <1>;
                 endpoint {
                     remote-endpoint = <&typec>;
+                    data-lanes = <0 1>;
+                    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
                 };
             };
         };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

