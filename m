Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0455A3F64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 21:22:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230269AbiH1TWv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 15:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbiH1TWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 15:22:35 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED20A326F1;
        Sun, 28 Aug 2022 12:22:21 -0700 (PDT)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27SJMD6e012368;
        Sun, 28 Aug 2022 19:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=+xU4ouutBgX7M78c0VVxXYsLj4bc2daOUOo9W+IhlQc=;
 b=dvRFMjPsMVMFDqMBAU8Mi/v51xtSViYcNsn1tePmbOT9fhYpWvZpYSXn1/q0SCBYiP9A
 wDtn6PnptAdAtiMtKv6J+Du2fQVL/+234w4zu5F4RjfxlX14jZKrypWl66U5q4wcymfX
 AlLdVPY8A5gnulV5gop+XTI54YdIlVcLDa2f1rQDOBHNTOibcLjfI7XidlIMX2D2RQmh
 DHZBqBBLg6RYCBb19XWC7K2XFR04Z6X+u9bx1VWq1dQ58r0lbsVKDA1xtkzu5mbmSm5h
 07JcxQzIjXYQdv9ElfQjh/V2fd0L3d+KYHnRJhyo/RQl/hdPQPg5aC9WqVpLDqLOjIr4 hQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j7cjf2m8f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 28 Aug 2022 19:22:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
        by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27SJMCsC022899
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 28 Aug 2022 19:22:12 GMT
Received: from hyd-lnxbld559.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Sun, 28 Aug 2022 12:22:07 -0700
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <krzysztof.kozlowski@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        "David Airlie" <airlied@linux.ie>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Sean Paul" <sean@poorly.run>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 5/6] dt-bindings: drm/msm/gpu: Add optional resets
Date:   Mon, 29 Aug 2022 00:51:18 +0530
Message-ID: <20220829005035.v5.5.Ieffadd08a071a233213ced4406bf84bb5922ab9a@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
References: <1661714479-28981-1-git-send-email-quic_akhilpo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0J6swn9VY3Z0R_E8rGJQC7IFGHooFG1M
X-Proofpoint-ORIG-GUID: 0J6swn9VY3Z0R_E8rGJQC7IFGHooFG1M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-28_12,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 phishscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208280080
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an optional reference to GPUCC reset which can be used to ensure cx
gdsc collapse during gpu recovery.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes in v5:
- Nit: Remove a duplicate blank line (Krzysztof)

Changes in v4:
- New patch in v4

 Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3397bc3..408ed97 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -109,6 +109,12 @@ properties:
       For GMU attached devices a phandle to the GMU device that will
       control the power for the GPU.
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: cx_collapse
 
 required:
   - compatible
-- 
2.7.4

