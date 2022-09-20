Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 935FF5BE4B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 13:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230513AbiITLlv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 07:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbiITLlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 07:41:35 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F8774365
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 04:41:24 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id s14-20020a17090a6e4e00b0020057c70943so10511563pjm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 04:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=AuOntKkRGiT94FIUgQn4R1HFHExIoQrEAqGWMSUIfV4=;
        b=fr2Q1GlVPlGRvQDMzULWiQ0GFhDfY3Tu95t0M5jKbu+tuZw7f9pZmBoDke10I7d+Mr
         u0oc+3souzsb5Ppkf9dFh15HGcpUDzqUZ+xEXAMVNMDT8JlK3uSuy9uDNL6+6tGPcjr3
         rM1EjUWKyKKWZU+9mFq74Ngya4JgX+si9SKOl3eDeTxLaYEzvkSnOaoiJUzeT8K9L0aH
         jNQKdH9MQjNbLJT7wy6Z9qmN5hMuZJhCYU7lk6F/ca6ZgBj/Le4JMIe1H49hWKxzjn2G
         qrn3USXyDxo938ixUi6RzmbBJhE0jIq26ommCjEH4EHr4jVIfpXPGpqRRwG6aJfp1ItH
         nn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=AuOntKkRGiT94FIUgQn4R1HFHExIoQrEAqGWMSUIfV4=;
        b=L8a4CR9k1d0QxBI+Ii7ZCM6rYnnf4zhIzPcTpAezyXyEgP+LOLpN10H46OHViwwLXy
         LnO+WCtfrE9Pt9PbizytRoLPkMNYBlWFa3MKEsDnFyYAwtqpg50NVODpSw/r+R/y3jCj
         3JnEQIm25lCr6DH3oOLybuoY5dw2UvJ/j93XF9AFTAWk0LjqdqW1lm6xtczyhcDb8/wY
         /Djuwsj9R0zPBOxwhFItw9dx/zrr06lGh3WonLIaJIyc7Q2eZP2fEtfobJCwvUyJbHPs
         OTI3rjQFslPX7qOkcvOTm1+c6YSG1GZ5N4RNhflfUyMINPs8zVWLCDh7XiQqVMGsiPCX
         0ALg==
X-Gm-Message-State: ACrzQf1iXYdSdo1u1wCgjN5tmSWFLRol/OHW3VNqcdfp0bhhUm2HrZdt
        +rMuxfUfMZ8j4Zi4HGk4qNjzfA==
X-Google-Smtp-Source: AMsMyM7rDm/3Y8i8mmEvcUp/R8qXPRUbULRh9iKZEXYF8HiGJztEVLze59dL8+Twi2yydESPDzQeYQ==
X-Received: by 2002:a17:902:70c3:b0:178:3ee3:4c76 with SMTP id l3-20020a17090270c300b001783ee34c76mr4473525plt.1.1663674083401;
        Tue, 20 Sep 2022 04:41:23 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c61:6535:ca5f:67d1:670d:e188])
        by smtp.gmail.com with ESMTPSA id p30-20020a63741e000000b00434e57bfc6csm1348793pgc.56.2022.09.20.04.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 04:41:22 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-crypto@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, herbert@gondor.apana.org.au,
        linux-kernel@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, thara.gopinath@gmail.com,
        robh@kernel.org, krzysztof.kozlowski@linaro.org,
        andersson@kernel.org, bhupesh.sharma@linaro.org,
        bhupesh.linux@gmail.com, davem@davemloft.net,
        Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v7 4/9] dt-bindings: qcom-qce: Add new SoC compatible strings for qcom-qce
Date:   Tue, 20 Sep 2022 17:10:46 +0530
Message-Id: <20220920114051.1116441-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220920114051.1116441-1-bhupesh.sharma@linaro.org>
References: <20220920114051.1116441-1-bhupesh.sharma@linaro.org>
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

Newer Qualcomm chips support newer versions of the qce crypto IP, so add
soc specific compatible strings for qcom-qce instead of using crypto
IP version specific ones.

Keep the old strings for backward-compatibility, but mark them as
deprecated.

Cc: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 .../devicetree/bindings/crypto/qcom-qce.yaml         | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 4e00e7925fed..aa2f676f5382 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -15,7 +15,15 @@ description:
 
 properties:
   compatible:
-    const: qcom,crypto-v5.1
+    enum:
+      - qcom,crypto-v5.1 # Deprecated. Kept only for backward compatibility
+      - qcom,ipq6018-qce
+      - qcom,ipq8074-qce
+      - qcom,msm8996-qce
+      - qcom,sdm845-qce
+      - qcom,sm8150-qce
+      - qcom,sm8250-qce
+      - qcom,sm8350-qce
 
   reg:
     maxItems: 1
@@ -70,7 +78,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-apq8084.h>
     crypto-engine@fd45a000 {
-        compatible = "qcom,crypto-v5.1";
+        compatible = "qcom,ipq6018-qce";
         reg = <0xfd45a000 0x6000>;
         clocks = <&gcc GCC_CE2_AHB_CLK>,
                  <&gcc GCC_CE2_AXI_CLK>,
-- 
2.37.1

