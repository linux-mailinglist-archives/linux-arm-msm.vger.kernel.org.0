Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 982716550EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 14:22:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiLWNWn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Dec 2022 08:22:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236345AbiLWNWT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Dec 2022 08:22:19 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ADBB15FC4
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 05:22:17 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id y4so4993819ljc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Dec 2022 05:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7/q22FrN3HFOcnCXH0fL3Djanl//sYGrslXRP+s/CI=;
        b=x8jjmdwhOzggrd3mz1yXQ2VWko1pRNySvMlR/g5LlRn6TlkJ0u+xlWibaSZj6y+jJK
         ES4c2jGqyDCWPaT2cXsbU8QY7RISTReSCc10Akr8eREY0sOQ09WmjA2Qnl9hzaM1tKCI
         +M+cGw7mTokxEi0vtgOsbaw5XXB9EFp26BZ2y3f3l0F2VGguV0XfKeyoN3q/EFDeE9lL
         rIAD2AhE3me2tQPLZTmdHHIZ6N/5edLv0dwQAZ48t4KxXlHzZmL4SGgJX0G6RBKzgHeW
         F9lDocOkUnYha01/EJw4NhUJeCEG+nB5lOpa7YjhWve9auO9LWhPmNWS3SHs9+LUML1+
         LrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p7/q22FrN3HFOcnCXH0fL3Djanl//sYGrslXRP+s/CI=;
        b=zfx5f1peXYFeVoX/DzKulVF2aax34/Um4qm7gBxZbI9pFoc4F2aXeEAn873/CzBU9A
         dWl9zs4rnJAjg57Gbs0Vy757qbZ1jf/lzUREw82SHdxfFC8yeec7xLW0rDICo32SZNUu
         6EQxjMlnBKKa359CJqLUotXiYWiiZE2K3wmlTtaJdwF5gX/mDCy0gPyN9Wz7GyNUMX98
         tcJs0qbSerZ3fhF6zoLeEBhHBJIDg672O6TpeEdtMlQuEAXFmdAzj7TEpLDulD7eAVFG
         G7Ek0+B/hIugAo7Fq1IGFW+GawF81XTSb/NVU/Joo5h3feSFdun9HuLlKVVG4AlyxQgc
         3BTA==
X-Gm-Message-State: AFqh2koMduaFhFK5J1RBkvvo09xjiUx+yN5o8PVpPGXIODVjx3gWGHiM
        NBqTxXGr1lonmi9Jh8YooOr5mw==
X-Google-Smtp-Source: AMrXdXv9Nz9LOGBxaFJ6sbG6TBSL0LlmWFwVBgCDMqgQ/ga5qsNe/Fyp8TiMdLbdb93FrUKQuAmrhg==
X-Received: by 2002:a2e:8792:0:b0:279:e6fd:877c with SMTP id n18-20020a2e8792000000b00279e6fd877cmr2438966lji.53.1671801735442;
        Fri, 23 Dec 2022 05:22:15 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l4-20020a2ea304000000b00279f3c58278sm425163lje.51.2022.12.23.05.22.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Dec 2022 05:22:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: remoteproc: qcom,glink-edge: add GPR node
Date:   Fri, 23 Dec 2022 14:22:13 +0100
Message-Id: <20221223132213.81273-1-krzysztof.kozlowski@linaro.org>
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

The existing SM8450 DTS (and newer platforms) come with a "gpr" child node,
not "apr":

  sm8450-sony-xperia-nagara-pdx224.dtb: remoteproc@30000000: glink-edge: Unevaluated properties are not allowed ('gpr' was unexpected)
    From schema: Documentation/devicetree/bindings/remoteproc/qcom,sm8350-pas.yaml

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/remoteproc/qcom,glink-edge.yaml  | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
index 25c27464ef25..8e133ab55ff3 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,glink-edge.yaml
@@ -22,7 +22,7 @@ properties:
     required:
       - qcom,glink-channels
     description:
-      Qualcomm APR/GPR (Asynchronous/Generic Packet Router)
+      Qualcomm APR (Asynchronous Packet Router)
 
   fastrpc:
     $ref: /schemas/misc/qcom,fastrpc.yaml#
@@ -31,6 +31,13 @@ properties:
     description:
       Qualcomm FastRPC
 
+  gpr:
+    $ref: /schemas/soc/qcom/qcom,apr.yaml#
+    required:
+      - qcom,glink-channels
+    description:
+      Qualcomm GPR (Generic Packet Router)
+
   interrupts:
     maxItems: 1
 
@@ -52,6 +59,21 @@ required:
   - mboxes
   - qcom,remote-pid
 
+allOf:
+  - if:
+      required:
+        - apr
+    then:
+      properties:
+        gpr: false
+
+  - if:
+      required:
+        - gpr
+    then:
+      properties:
+        apr: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

