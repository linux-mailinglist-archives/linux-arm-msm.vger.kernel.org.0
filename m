Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1008E5B3851
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 14:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231753AbiIIMyd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 08:54:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231451AbiIIMyS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 08:54:18 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0F910C9BC
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 05:54:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id f11so2508108lfa.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 05:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JVmh6rRJJh9fFbvfhhGsQ4CvxM0Mj/AolpCm/GBTJoc=;
        b=wOfgpHvifdpE4+bzN3l34seJRMNWvZhRIbBGmUwvWaUvhWKCASEoKuwIOG6o+8ZZoh
         77phVf/VfC7+kvLNg3XnaV5fIbQ5U4AVFxYyTwbFnMQPh6fDYxHeFcq3Ne6Z7uLWPS4g
         mMnqmZGmG4qZIbja65BVyblXatYAxhupEkqUxchXnznlzMrAnftCz4eDFPeiXOJvVHi0
         zWyYnkq5N05hDQ4k2N5ca9h6FX+8KuXROzzMzF5q3AV2tDgew76buO+dGFI14OG7g9p+
         kwXk0eMiDsrNDZVFGJ5/X/Pyl4XPjlyXEcIAG0QM+T5O/xrENHcQjmOD/R7vf9ooGl0l
         RWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JVmh6rRJJh9fFbvfhhGsQ4CvxM0Mj/AolpCm/GBTJoc=;
        b=lB30gYodhg/JYh3U75m1akS0ZT+qGCi8NHDO74SN364ZUc/DT9Ac2sAReq60pDmUlO
         8snqcLrqQmVpNbsuq5BtyQxW3d9HsJLNz+ffV1B/fdatwHwyexnTBBgCiwrEDOLuisiO
         NLaF5OLp6W1Mr5wCZBYWcCavGyBctcLQ2uOoBqxPbte6dFgh3HY2hDaj9LEibppaqNqq
         pMOOpPhqn36a/suAlfe9r+gHk/aHEBSyB0PpNomiujvhgv1CqCip5veJdLgvubHig6IX
         xnpLMHhii9z/EbDrAxypbewrxgau3SpvBMn/mnKAv6XC08uWAvpVcDf5i9kyLa5Zizmf
         OwGw==
X-Gm-Message-State: ACgBeo1ZoGohZzAjR2VVE7inyoLA4duFcCAufXL+FtzRZzg0Qz+Oba0l
        t0QR7EstOLLi/ForT7RZZmVH6g==
X-Google-Smtp-Source: AA6agR4JumIvJUyDuU0nv/yxtZRsqeAU42EMRkWqEi4H2x2NXWWNqJp78Wbm5zFZ7l/I8O3YC+XiAQ==
X-Received: by 2002:a05:6512:3e4:b0:497:a649:6627 with SMTP id n4-20020a05651203e400b00497a6496627mr4780121lfq.326.1662728053556;
        Fri, 09 Sep 2022 05:54:13 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g10-20020a2eb0ca000000b00263630ab29dsm64750ljl.118.2022.09.09.05.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 05:54:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        David Heidelberg <david@ixit.cz>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/7] dt-bindings: misc: qcom,fastrpc: correct example for GLINK edge
Date:   Fri,  9 Sep 2022 14:54:00 +0200
Message-Id: <20220909125403.803158-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
References: <20220909125403.803158-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The parent of FastRPC node is GLINK edge, so the properties should be
matching GLINK, not SMD.  Correct the example and extend it based on
SM8350.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/misc/qcom,fastrpc.yaml      | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 1ed0ce0f3cbe..439b3f4a801b 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -112,19 +112,28 @@ examples:
 
         fastrpc {
             compatible = "qcom,fastrpc";
-            label = "adsp";
-            qcom,smd-channels = "fastrpcsmd-apps-dsp";
+            qcom,glink-channels = "fastrpcglink-apps-dsp";
+            label = "sdsp";
+            qcom,non-secure-domain;
             #address-cells = <1>;
             #size-cells = <0>;
 
             compute-cb@1 {
                 compatible = "qcom,fastrpc-compute-cb";
                 reg = <1>;
+                iommus = <&apps_smmu 0x0541 0x0>;
             };
 
             compute-cb@2 {
                 compatible = "qcom,fastrpc-compute-cb";
                 reg = <2>;
+                iommus = <&apps_smmu 0x0542 0x0>;
+            };
+
+            compute-cb@3 {
+                compatible = "qcom,fastrpc-compute-cb";
+                reg = <3>;
+                iommus = <&apps_smmu 0x0543 0x0>;
             };
         };
     };
-- 
2.34.1

