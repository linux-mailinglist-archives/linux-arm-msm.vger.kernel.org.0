Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F416AFC56
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 02:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbjCHB1h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 20:27:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbjCHB13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 20:27:29 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92AB7A8E99
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 17:27:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id i28so19571911lfv.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 17:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678238841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxX6ytF5vV2haMBbbATopMPJpuCTfp4xoThhVoED6NY=;
        b=XsPWrb7qwg36X8gOAdk5nbSCwjCLoldidAMWJ8y6YOntnYTAx8awHSyBiIeUJoo6Sb
         rknI5p+z/5gt0IQN7jAAbyvxJIY+CP8C0bsCNNzknae7wL4UqfBg4NhpQgfkEf/qZsZu
         UYyQGYjNieH0S+hnanQ4kb6j7zzZKLn9g2kzLs4mRUbuYc0ffkb7B4FG69sTw6HrG52k
         Ak6JmelRWqMFCEPTbpOaqEvkznXfQkNqb8WWjFMgR8ZCKw86xETdSOKHibTa2YK408VD
         Txex4E2BoQnXG5cVsPI5qzuDJHaiLAeSaBvfA/57h2k/VXmTlWUpU+bo+60PUayitN9+
         EJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678238841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxX6ytF5vV2haMBbbATopMPJpuCTfp4xoThhVoED6NY=;
        b=6Ee7ypP3eedPR6ydFaoECZ5q0JX+6G4rHyELYNazkGX0tqLi7JZJvnLessWv3L0kFz
         z+GrfF+i67jq1OTshfVgLnz7IRwiAp5FhzrM8nLiQ8lJnLrgjQiyNzuosLlf8rF2RgrT
         LcG0y7ZwmEMLC3q72nNDVvMRWlvVY/7S62d+rCDU/gRncCL7zpNo2G5RXWdJCAhInjiv
         YCv3kCxRQcQCj7MlB70nbB9cd41URCsxK8jfAvdRdoRBAWRj2nzG3/TVegqRt0DXd0in
         Z3r4EuMm34Wi1mUNG4+gIqDk1rELCmR62Z61L8xpTp1meI0yjcUyxzW7t+z/I8+JzuhK
         mXvA==
X-Gm-Message-State: AO0yUKWCygV7nN1h+Ny08fat6lkvglXPjQf455jedPg17/KIdafyW+zO
        SOAWCepdsDBz/86x7TfR5cmWZA==
X-Google-Smtp-Source: AK7set8nRqG/zwqw3xWTMNg4s7YVV/J+U18SMn5hQzgi1tYo0aIKS7l4ZMSSx7D1QVf79vJsvzNbrA==
X-Received: by 2002:ac2:5ec4:0:b0:4db:964:51b5 with SMTP id d4-20020ac25ec4000000b004db096451b5mr4774505lfq.41.1678238840930;
        Tue, 07 Mar 2023 17:27:20 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o24-20020a056512051800b004a2c447598fsm2182944lfb.159.2023.03.07.17.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 17:27:20 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 08 Mar 2023 02:27:00 +0100
Subject: [PATCH 3/8] dt-bindings: cpufreq: cpufreq-qcom-hw: Add QCM2290
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-topic-cpufreq_bindings-v1-3-3368473ec52d@linaro.org>
References: <20230308-topic-cpufreq_bindings-v1-0-3368473ec52d@linaro.org>
In-Reply-To: <20230308-topic-cpufreq_bindings-v1-0-3368473ec52d@linaro.org>
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678238834; l=1444;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9z2kHs8CdaeUIwacH8QH3r7HmNxGQcozLnq7wS2qkKI=;
 b=oP67/Bvk4tJn5AV4vlOb6nR8o+XJy2Y2Uei5CEApKAObX7B/p8XJaTToI+9OxaJCl7bBj1tLNhRf
 V3BPavRbDEzZ0vy9jV/Peg+qnmtueF4/9qf9zwcUls8ane8t+flb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the OSM CPUFREQ_HW present on QCM2290, featuring just one
lonely frequency domain.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/cpufreq/cpufreq-qcom-hw.yaml          | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 6f97e2effaca..dc4e497b15ac 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -21,6 +21,7 @@ properties:
       - description: v1 of CPUFREQ HW
         items:
           - enum:
+              - qcom,qcm2290-cpufreq-hw
               - qcom,sc7180-cpufreq-hw
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
@@ -92,6 +93,29 @@ required:
 additionalProperties: false
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-cpufreq-hw
+    then:
+      properties:
+        reg:
+          minItems: 1
+          maxItems: 1
+
+        reg-names:
+          minItems: 1
+          maxItems: 1
+
+        interrupts:
+          minItems: 1
+          maxItems: 1
+
+        interrupt-names:
+          minItems: 1
+
   - if:
       properties:
         compatible:

-- 
2.39.2

