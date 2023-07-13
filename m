Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4D97519B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jul 2023 09:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234271AbjGMHW4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jul 2023 03:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234248AbjGMHWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jul 2023 03:22:54 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3031BEF
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 00:22:52 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3141c3a7547so510018f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jul 2023 00:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689232971; x=1691824971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmaEro9qJ+WFWPEtna9Xd9AaFut1CJeCBKXroVRKWyA=;
        b=aO3We/ZHVK3x643+13sbALV/fjoZ0JX5kLClWbUkWadlJXQExPQ+a6uyyR6q3JqDql
         3wWrH13etRYzewDyDT59hQsvyhF69kyVejN9p54LR5rYbYO7ZAQZokha7KWHbCc32TuB
         K/5eZcar7dU4+mVApUR6/AJtQm+eYfktAChRRz5QHzSCG/YjtCajurNJ1SLdLDhsdOOl
         QcZlpgWvBeZo2OYXAWk2Ng1NPow466N4W3hbo6vg/DvIbJ4mHvZ/y5YJ9eVLW/VXfPgs
         4AYkmvg8EFi6JYOnuZrtmqgc/vWxb9xX8gQd5L3nk9tw2ogNf6dU5o6YzAPwc6XU6fUP
         y17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689232971; x=1691824971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmaEro9qJ+WFWPEtna9Xd9AaFut1CJeCBKXroVRKWyA=;
        b=VDEiIrJmOV4MS0uP+DZWWidxo9xTDLxSyMEmjg6nK6xQTQGrnIs2C4XIQOzevbOPVL
         a0xSsxU1iJ3RP5o1UxYkzYhtPiWPg+ohRi9663OE4yqd+YK1o2j3Ncbci/byP2yteWf3
         uCJT+Z9+QcfBGj/cZUeoefbMdmFgd4/LDsj0u4MDtuPYQ0qQCq0/2lAWFLlRiB1YUgs7
         Ru7ikpy9sYH9S8ibAHRxZryKiiYeZoXXIlcC3n1YanZ1JF7wHdLFiGX6840RvfIpfQCz
         Yzp5PJNpCWlwA2YS7n0Ahem9K8lVKMqTlPYhyXFP15XCBw/pJAa7T1Z2KQBy47tTJRIG
         MUfA==
X-Gm-Message-State: ABy/qLb+NsNHYBh2Zp+e/KXt5DKysuU3R9L7BR/wtOw+HRYyGOeiO8LM
        VmvACOV9dRFNRsB4kKnqTu2mzA==
X-Google-Smtp-Source: APBJJlF2vgolfAUH7v2PBrJB/paT8oZd4Xut4J89geb6W/RLwFzzXXjvxfVMy7ZSSQp9ohXrAzVzYw==
X-Received: by 2002:a05:6000:1009:b0:313:f990:c631 with SMTP id a9-20020a056000100900b00313f990c631mr540269wrx.44.1689232971432;
        Thu, 13 Jul 2023 00:22:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w16-20020a5d6810000000b003144b50034esm7071384wru.110.2023.07.13.00.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 00:22:51 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v2 2/4] dt-bindings: remoteproc: qcom,sm6115-pas: correct memory-region constraints
Date:   Thu, 13 Jul 2023 09:22:40 +0200
Message-Id: <20230713072242.11268-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
References: <20230713072242.11268-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm PAS devices expect exactly one memory region, not many.  Also,
the memory-region is now defined in device specific binding, not in
qcom,pas-common.yaml, thus also require it in the same place.

Fixes: 838c558bb8bc ("dt-bindings: remoteproc: qcom: Add sm6115 pas yaml file")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index f5d1fa9f45f1..1ac5b99b2fad 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -32,7 +32,7 @@ properties:
       - const: xo
 
   memory-region:
-    minItems: 1
+    maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
   smd-edge: false
@@ -44,6 +44,7 @@ properties:
 required:
   - compatible
   - reg
+  - memory-region
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-- 
2.34.1

