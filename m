Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 073936550E1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 14:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236308AbiLWNW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 08:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236336AbiLWNWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 08:22:05 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7253EAC8
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 05:22:03 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id f16so4993040ljc.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 05:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jdj4vmGyncl7sIQB4NLGtQlaGlrhat1ERXM9DJwYFsA=;
        b=Nn6vZEwmuZRIRijMjr3r1ECwBxSbFdhYvxhGPT1PKgSLpIKf1dORGzoo3OMtsLkACM
         KzpI9oKWqoAIbLoBIocnXWEk8Rk7oLDtrqkIwZSK4eDY2X39LRke6P+2JfiVJOBi6jBH
         Hn6QJQ9gbY6xqW4/TJazhvhfdEzZMD7qakEMkB7yt9ytkHQcQyw6vsx0VXyXhP9lWh8J
         GBo84yJ/OIP0RPu9eeGlD6SF4pKU96vpZfytcGGzwlsdrqcSB6DVBQxvzir3UK6G+pGh
         9CUrKDvNYqeGGbkUnCuZSj5qnYxf/fDrFrr1Aeg1I8ppTHdeSzrAyTKg8ibOjG5YATSl
         4a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jdj4vmGyncl7sIQB4NLGtQlaGlrhat1ERXM9DJwYFsA=;
        b=wfY7pAfvy9JAoH3wNmcaHYbzC9WD7ameKo/cXm5XOT2JH/L4ZvDBxiFkyIvE2ctTr8
         WqeYkY8Iq1tvLFKgfWjfhxGPTala9YRrg/JCc+LhmfCDXv3ra3CkjF9hBCCL8lERUVOB
         dY0k5cAjOF06sqoDiM2jhC9aBntq3aaOe/f8mDuZSmUiVERxvKsGWY6atEPuaoCTiu4K
         QVyg92wuqZ9cPst5NsHjp6S4chNnw6RL3GktLymBXNIPzgTqOzWwcg1BSQPGyqXZsrOV
         cFhN0yItvTFSdXJShQCpGi4zmhys+2//AFeSU2f4LpQSuUKn8TErh+NUMaBh98C/FuiG
         cpLw==
X-Gm-Message-State: AFqh2kriNSAH2pvd6wW1PR0FYuexvcy3yrgh8guxoLIPAb7ZneQyeQBv
        qjmK5eRzcx4JIwajOq2HltEz7w==
X-Google-Smtp-Source: AMrXdXt1uNGt9tJ6XLlq+A5ZvETbjua0KwGLpqYP2YWjpkpIIcp/1bXCY5y1n9W8DeR1uKleGZruPA==
X-Received: by 2002:a2e:4949:0:b0:27a:1ea8:185e with SMTP id b9-20020a2e4949000000b0027a1ea8185emr2497855ljd.7.1671801721933;
        Fri, 23 Dec 2022 05:22:01 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f3-20020a2eb5a3000000b00279e0b8bae7sm412007ljn.65.2022.12.23.05.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 05:22:01 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>,
        Ratna Deepthi Kudaravalli <quic_rkudarav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: soundwire: qcom,soundwire: correct sizes related to number of ports
Date:   Fri, 23 Dec 2022 14:21:59 +0100
Message-Id: <20221223132159.81211-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are several properties depending on number of ports.  Some of them
had maximum limit of 5 and some of 8.  SM8450 AudioReach comes with 8
ports, so fix the limits:

  sm8450-sony-xperia-nagara-pdx224.dtb: soundwire-controller@3250000: qcom,ports-word-length: 'oneOf' conditional failed, one must be fixed:
    [[255, 255, 255, 255, 255, 255, 255, 255]] is too short
    [255, 255, 255, 255, 255, 255, 255, 255] is too long

Fixes: febc50b82bc9 ("dt-bindings: soundwire: Convert text bindings to DT Schema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soundwire/qcom,soundwire.yaml  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index bcbfa71536cd..3efdc192ab01 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -80,7 +80,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 5
+    maxItems: 8
 
   qcom,ports-sinterval-low:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -124,7 +124,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 5
+    maxItems: 8
 
   qcom,ports-block-pack-mode:
     $ref: /schemas/types.yaml#/definitions/uint8-array
@@ -154,7 +154,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 5
+    maxItems: 8
     items:
       oneOf:
         - minimum: 0
@@ -171,7 +171,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 5
+    maxItems: 8
     items:
       oneOf:
         - minimum: 0
@@ -187,7 +187,7 @@ properties:
       or applicable for the respective data port.
       More info in MIPI Alliance SoundWire 1.0 Specifications.
     minItems: 3
-    maxItems: 5
+    maxItems: 8
     items:
       oneOf:
         - minimum: 0
-- 
2.34.1

