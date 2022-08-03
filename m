Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3AA588E77
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Aug 2022 16:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238349AbiHCOV5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Aug 2022 10:21:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238262AbiHCOV5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Aug 2022 10:21:57 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 401B015FE2;
        Wed,  3 Aug 2022 07:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659536513; x=1691072513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=OZM0/3tV85lyfRy01xmRnIhU0V1wSw4Owfzk33t8ZmM=;
  b=ooYP9LyrDASgT5rwDPR7SO+juqe1TCrfoig0vo1W/MWF9BwINs9dMYjk
   Um4yYFalGd2cUmoV9h4OHh0aawMc6mRF5HHMYKXFKazhyUBxMF0r+rru7
   XBqpP/5x3gfy4CbUlWXRn0P9NedYHwmJCPig+zTEmTvv3BiTH1sLwJXdD
   4=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 03 Aug 2022 07:21:53 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2022 07:21:52 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 07:21:52 -0700
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 3 Aug 2022 07:21:46 -0700
From:   Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To:     <linux-remoteproc@vger.kernel.org>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <robh+dt@kernel.org>,
        <quic_plai@quicinc.com>, <bgoswami@quicinc.com>, <perex@perex.cz>,
        <tiwai@suse.com>, <srinivas.kandagatla@linaro.org>,
        <quic_rohkumar@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <swboyd@chromium.org>,
        <judyhsiao@chromium.org>, <devicetree@vger.kernel.org>
CC:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Subject: [PATCH 2/8] dt-bindings: remoteproc: qcom: adsp: Add compatible name for SC7280
Date:   Wed, 3 Aug 2022 19:51:14 +0530
Message-ID: <1659536480-5176-3-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1659536480-5176-1-git-send-email-quic_srivasam@quicinc.com>
References: <1659536480-5176-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add compatible name and update max reg items for SC7280 base platforms.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
---
 .../devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml
index 9f11332..147996f 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,lpass-adsp-pil.yaml
@@ -17,11 +17,12 @@ properties:
   compatible:
     enum:
       - qcom,sdm845-adsp-pil
+      - qcom,sc7280-adsp-pil
 
   reg:
-    maxItems: 1
+    maxItems: 2
     description:
-      The base address and size of the qdsp6ss register
+      The base address and size of the qdsp6ss register and mcc register
 
   interrupts:
     items:
-- 
2.7.4

