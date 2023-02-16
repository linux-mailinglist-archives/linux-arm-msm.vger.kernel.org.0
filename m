Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81F5B699574
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 14:15:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjBPNPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 08:15:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbjBPNOs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 08:14:48 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD1B54559
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:42 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id d8so1869221ljq.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 05:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1676553280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0+woTIjuYDo1YujAmfEwTVLwd/ItMwPndJc54myqDM=;
        b=XMfqw7S20STlRPPMXNqwD1R1JuuBXEyevJZRLeCFld9jLyQlIZfF+xc+19yWKn5zC6
         pFfsmzxnyNucyjmlN87fHoMtPJDzouWbCADT0Dbaxr6R77bHJwbLqavLFsDqnFTqPc0d
         fPGpYlabfQZLoErjyNoIY2KBH0WMomcsmwyXheGUY+mrL1yTP032jMjlRIMA7rMhlrCb
         uALmz5h6azTtkEv/E868yN8CuF9k1fOWfrMnKWD53DFEkdftjUl/ekN04OVnl9W6+KOc
         PrFxwpwRbICWHMplTM46WRaJkcVNyrBXR6zeET5anqTSTU7c4MMSfHuOa6jme5G1jGOv
         pLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676553280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d0+woTIjuYDo1YujAmfEwTVLwd/ItMwPndJc54myqDM=;
        b=jIJdqbS9SuYAlxS3ZQfHb/KvXN+djSlnkVTZWxoTBTkUyzq9ykTF93DeZVFCf+8V/v
         J+ERfsk2IaISJeIzHEvZt/UfYI4pKJ6Zk5eaKgk1bgcPQAs3fsXA40biEYi1sSi0SzbK
         9neQFyT9LjzAtKAYrZuvwADhU1JFIi7AuSA9TMBwKcpU42SV2CpB6zGGQ/N3yg+p6hBi
         mQB3IvEIZYooXCcaVcNjuX0oCbqv8DnfTQBnxqYtloLlKDYxmUkeGTnOcZIZIDAyacYr
         xelxKdotHoc4VWJZTSKVJDAqkwuehPmgwnbgU+MBuLddmA5NY55NB4u3TfB19IWqPmDD
         Z2PQ==
X-Gm-Message-State: AO0yUKWcbkkaY/agxF6s1Y12aY78yLZCQOmyTC1SEI30feXk1+r41p68
        gP3PQMGLtgjULaU0HMFz3A7ZJQ==
X-Google-Smtp-Source: AK7set+7FJaHeqOMCUESBMdig1pW+q3tAVNvsy1SJ03Gkkl6FwR5horR9b8QomO6VXa/8/ctq9AVAg==
X-Received: by 2002:a05:651c:2115:b0:292:b368:3483 with SMTP id a21-20020a05651c211500b00292b3683483mr1824654ljq.1.1676553280422;
        Thu, 16 Feb 2023 05:14:40 -0800 (PST)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id j8-20020a2e8248000000b00293500280e5sm194345ljh.111.2023.02.16.05.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:14:39 -0800 (PST)
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
        linux-crypto@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v10 05/10] dt-bindings: qcom-qce: Add new SoC compatible strings for Qualcomm QCE IP
Date:   Thu, 16 Feb 2023 15:14:25 +0200
Message-Id: <20230216131430.3107308-6-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
References: <20230216131430.3107308-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce a generic IP family compatible 'qcom,qce' and its two derivatives
based on SoC names rather than on IP versions. Having a generic compatible
is only partially sufficient, the QCE IP version can be discovered in
runtime, however there are two known groups of QCE IP versions, which
require different DT properties, these two groups are populated with SoC
based compatibles known at the moment.

Keep the old compatibles 'qcom,crypto-v5.1' and 'qcom,crypto-v5.4' for
backward compatibility of DTB ABI, but mark them as deprecated.

The change is based on the original one written by Bhupesh Sharma, adding
a generic family compatible is suggested by Neil Armstrong.

Cc: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/crypto/qcom-qce.yaml  | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 4e00e7925fed..84f57f44bb71 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -15,7 +15,32 @@ description:
 
 properties:
   compatible:
-    const: qcom,crypto-v5.1
+    oneOf:
+      - const: qcom,crypto-v5.1
+        deprecated: true
+        description: Kept only for ABI backward compatibility
+
+      - const: qcom,crypto-v5.4
+        deprecated: true
+        description: Kept only for ABI backward compatibility
+
+      - items:
+          - enum:
+              - qcom,ipq6018-qce
+              - qcom,ipq8074-qce
+              - qcom,msm8996-qce
+              - qcom,sdm845-qce
+          - const: qcom,ipq4019-qce
+          - const: qcom,qce
+
+      - items:
+          - enum:
+              - qcom,sm8250-qce
+              - qcom,sm8350-qce
+              - qcom,sm8450-qce
+              - qcom,sm8550-qce
+          - const: qcom,sm8150-qce
+          - const: qcom,qce
 
   reg:
     maxItems: 1
@@ -70,7 +95,7 @@ examples:
   - |
     #include <dt-bindings/clock/qcom,gcc-apq8084.h>
     crypto-engine@fd45a000 {
-        compatible = "qcom,crypto-v5.1";
+        compatible = "qcom,ipq6018-qce", "qcom,ipq4019-qce", "qcom,qce";
         reg = <0xfd45a000 0x6000>;
         clocks = <&gcc GCC_CE2_AHB_CLK>,
                  <&gcc GCC_CE2_AXI_CLK>,
-- 
2.33.0

