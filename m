Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5C8C5B25B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 20:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbiIHSZY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 14:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbiIHSZU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 14:25:20 -0400
Received: from mx.kernkonzept.com (serv1.kernkonzept.com [IPv6:2a01:4f8:1c1c:b490::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D3EF5A2ED;
        Thu,  8 Sep 2022 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kernkonzept.com; s=mx1; h=Content-Transfer-Encoding:MIME-Version:References
        :In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=HySvzKRlrbsyWfKOvvMkyCrlXhMS/1H92OjLfJ53SIk=; b=Ucuo3B6vXUj31S5yrirXr3SUjw
        aFkbzxPKbpXO2bQ8xDGhm9AToz9Y9b/BIY5uaz7/6C3Bhm7gnqVNu8INSFo4/pATU2l9shV9T8G8N
        WRY4E+Jeq72KcxcXCCkhgidY5VN7PV++hXcRyU6Ca/TZ3FFBAIVTIix+mUt+dF16+kLIlEZpch9Nb
        wIFLq5gjU0+soAlgZEP99mZiaW7hBuknS+6enc0nghQcKpTf4bR6H7g8MEANaz8aE7bE+Kxs94meU
        Ha6zIvHpSun2H7VQ4BoQzjHKpzt/7GGqqJUfOa7AEk6FdCB37q5mzrRjJu4Eb2v7fS02Jac7zVgUT
        BQBVxScg==;
Received: from [10.22.3.24] (helo=kernkonzept.com)
        by mx.kernkonzept.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim 4.94.2)
        id 1oWMD7-004g9E-LM; Thu, 08 Sep 2022 20:25:09 +0200
From:   Stephan Gerhold <stephan.gerhold@kernkonzept.com>
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Stephan Gerhold <stephan.gerhold@kernkonzept.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 6/7] dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8953
Date:   Thu,  8 Sep 2022 20:24:32 +0200
Message-Id: <20220908182433.466908-7-stephan.gerhold@kernkonzept.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
References: <20220908182433.466908-1-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the compatible for MSS as found on the MSM8953 platform.

The situation is similar to the existing bindings for MSM8974: there is
an additional "mss" power domain that must be voted for while starting
up the remote processor. The difference is that on MSM8974 the power
domain is represented as a regulator (firmware expects specific voltage)
while on MSM8953 it is represented as power domain (firmware expects
performance state instead of voltage).

Handle this difference by adding the "mss" power domain as optional
third item, and then restrict it (and make it required) only when using
the MSM8953 compatible.

Co-developed-by: Sireesh Kodali <sireeshkodali1@gmail.com>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v4: Drop obvious comment, add Krzysztof's Reviewed-by
Changes in v3: Combine series with Sireesh's patches for MSM8953
---
 .../remoteproc/qcom,msm8916-mss-pil.yaml      | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
index 250bf4afab10..6e6e69ad9cd7 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,msm8916-mss-pil.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,msm8909-mss-pil
           - qcom,msm8916-mss-pil
+          - qcom,msm8953-mss-pil
           - qcom,msm8974-mss-pil
 
       - const: qcom,q6v5-pil
@@ -69,11 +70,16 @@ properties:
     items:
       - description: CX proxy power domain (control handed over after startup)
       - description: MX proxy power domain (control handed over after startup)
+      - description: MSS proxy power domain (control handed over after startup)
+                     (only valid for qcom,msm8953-mss-pil)
+    minItems: 2
 
   power-domain-names:
     items:
       - const: cx
       - const: mx
+      - const: mss # only valid for qcom,msm8953-mss-pil
+    minItems: 2
 
   pll-supply:
     description: PLL proxy supply (control handed over after startup)
@@ -186,6 +192,26 @@ required:
   - smd-edge
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          const: qcom,msm8953-mss-pil
+    then:
+      properties:
+        power-domains:
+          minItems: 3
+        power-domain-names:
+          minItems: 3
+      required:
+        - power-domains
+        - power-domain-names
+    else:
+      properties:
+        power-domains:
+          maxItems: 2
+        power-domain-names:
+          maxItems: 2
+
   - if:
       properties:
         compatible:
-- 
2.30.2

