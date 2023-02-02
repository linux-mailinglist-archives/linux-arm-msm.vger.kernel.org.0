Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 609B9687F34
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 14:51:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbjBBNvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 08:51:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbjBBNvF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 08:51:05 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A57B8BDF0
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 05:50:52 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id mf7so6111602ejc.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 05:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1P4BmKVoM4WJy6aig5rieOVj5RerisqiQF5OT6iCjY=;
        b=hRpVImmxZniqQkapnMCar5U5wkC9eGWxPUNDNVF1Y3GCcmiRMgd9piM6lcpAw/UWg2
         udNyfpZjNr/JqOER0rvTii8XIRVV9cwYo/3ElVxdblJMmQDh0gXWBlCottEjOhQDJZUK
         +7fAlqZ68kvwBrPQbMff6Y6sk58i8PVKcdMJW3XFfu+9TyM/P4Guc/O5SA52+xe6rGK2
         QEqdtNubtAQEqQ2WcgDSKbQLNimfyxi28mpbqe/JmEhURRT6A7/u7qQNAlBz8bBLmqHM
         +cLmzzujFeFN/L9kV76RVzWmV2u0hMNjwsFcXU4qr8TZZB+egCkTU3OXZwHqzEcK9Wr2
         eCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1P4BmKVoM4WJy6aig5rieOVj5RerisqiQF5OT6iCjY=;
        b=zBkObvRel3/pfLvDYzDCqVsOXfNjLnTX9BqpYQW2HnwyNufhSdB31K7aGDtHCMLtdh
         i/0FEiIS80GNEguoqpyCG7ml1twHLMl1mDfa4mzScaht82hatPvr7mYFZLAv/2cHEjsn
         RNqSoMint0Smow6Oi3t+pI/JU2IN3GKBsX131H0fDSjk/n0PeAlgp7YwiyPYL2Z4+O2p
         jz7cfjAStOUc8kKZUt5Kas4fVyWiTdNz66gILK4ogUwFRhNPxlRNcpTP+/m1ewLvyNLc
         AY6KUUZpo29/EWwzqjR19MkIG244n2RFOJRAf8iX068tNsNWyejESeXf0yI90z6geGY0
         Dcww==
X-Gm-Message-State: AO0yUKUkBoYuRe9JNM6WR+MUNGEFxGXLdeg3s/VkpQdSgz2/DaXRf4kq
        R9HjIreFCJL4+ZIAFeVU6cPQzg==
X-Google-Smtp-Source: AK7set+g5jTvG/NOdtCPrjOchy0lRQ+8KjTwLoFtd7CPYNPM01Ga3Xp369rZiq4CsTirrTr2nqkI8Q==
X-Received: by 2002:a17:907:2ad2:b0:889:3d10:ae93 with SMTP id fm18-20020a1709072ad200b008893d10ae93mr5738774ejc.6.1675345850913;
        Thu, 02 Feb 2023 05:50:50 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id r23-20020aa7c157000000b0049e1f167956sm7596332edp.9.2023.02.02.05.50.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 05:50:50 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Jordan Crouse <jorcrous@amazon.com>
Subject: [PATCH v8 6/9] dt-bindings: qcom-qce: Add new SoC compatible strings for qcom-qce
Date:   Thu,  2 Feb 2023 15:50:33 +0200
Message-Id: <20230202135036.2635376-7-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
References: <20230202135036.2635376-1-vladimir.zapolskiy@linaro.org>
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

From: Bhupesh Sharma <bhupesh.sharma@linaro.org>

Newer Qualcomm chips support newer versions of the qce crypto IP, so add
soc specific compatible strings for qcom-qce instead of using crypto
IP version specific ones.

Keep the old strings for backward-compatibility, but mark them as
deprecated.

Cc: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Jordan Crouse <jorcrous@amazon.com>
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/crypto/qcom-qce.yaml  | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index a159089e8a6a..4e0b63b85267 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -15,7 +15,22 @@ description:
 
 properties:
   compatible:
-    const: qcom,crypto-v5.1
+    oneOf:
+      - const: qcom,crypto-v5.1
+        deprecated: true
+        description: Kept only for ABI backward compatibility
+      - items:
+          - enum:
+              - qcom,ipq4019-qce
+              - qcom,ipq6018-qce
+              - qcom,ipq8074-qce
+              - qcom,msm8996-qce
+              - qcom,sdm845-qce
+              - qcom,sm8150-qce
+              - qcom,sm8250-qce
+              - qcom,sm8350-qce
+              - qcom,sm8450-qce
+              - qcom,sm8550-qce
 
   reg:
     maxItems: 1
@@ -68,7 +83,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-apq8084.h>
     crypto-engine@fd45a000 {
-        compatible = "qcom,crypto-v5.1";
+        compatible = "qcom,ipq6018-qce";
         reg = <0xfd45a000 0x6000>;
         clocks = <&gcc GCC_CE2_AHB_CLK>,
                  <&gcc GCC_CE2_AXI_CLK>,
-- 
2.33.0

