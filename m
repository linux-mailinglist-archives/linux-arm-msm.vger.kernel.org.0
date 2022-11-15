Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3E406297EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 13:02:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbiKOMCu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 07:02:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbiKOMCr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 07:02:47 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 804D5220D3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:46 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id r12so24081570lfp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 04:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjVM0fa3Mb/OI8tYc5CRvT2v/tfQ7pvhj5fI9h8PquA=;
        b=mk1AG86TXKvX8HICv7twifZbBRi7hYsUcWlIiwjsuqYD6TcEa1Edh4+XewzvwirXJt
         ewBXn3ARW5OzyKpC6Iw/+D9bEGAvJXKS7jb0sAbj5yzBpgYwTccsDnhZWl7z9eflQh9U
         KefXnIU/MBCSVxCXzDvNzM5d4iOKcySbZTZ7qienmj745Uu3fNMerDmK5+lFbAQaL2hE
         Et/N3gJd/LMVB49eEzyAQHHWH6gmYsNf0D20jEO35IBaj3oqDs1TwD1ObuhPxYM96aSh
         sgguyjNjpEtO6wxbo17lFlzTuVnYFxsYm46CQcnAjZdvsUbms5rlFpBKzo75sV5roaTT
         PGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjVM0fa3Mb/OI8tYc5CRvT2v/tfQ7pvhj5fI9h8PquA=;
        b=PwbcUPMjP6ttZf3tvIMl5hKO+nE4ac8kseTsfmOm3jFVAAvLpWy0zDeg4FY6v8UeNJ
         R9EAp+BlHtaaeBRn6JkAUjgsAGCirSd2TkSfZ8ePU1dnWhzR1o8celNqoDQEsGlf/unz
         8BpAUzewuS/uGMEarYEi7cI4WcQ5nb8ysRQ5kYk/fgNHQYJZEj6TS/LXPBq2jP9krufI
         9M+P3CM+9EhW8VIPNyDAMqvx0UgdwRbpdsVfVfpWzHBox0otihMtHRY5djyZRELQ+I3a
         9jPtFaWDfdhXLEQTX7pflm2wGd/XEe3c2VO83hB/vKJ5RHAwRrwg0bASx0vkUeAAg0dr
         A4fg==
X-Gm-Message-State: ANoB5pn+gRa0cdkOPRZteqBp9zSW4I3HmNRKNTGUgPP0L+msJyLsDblS
        mNC2zWgYLjvO2OLfpQlWVZnqFA==
X-Google-Smtp-Source: AA0mqf5ShHeTijRuh32EOsyOz8zXrSkRLmIrBFOH1Ahx9dbmXAp9rNI68EzOTYhWlTvXJn0wLf4jLw==
X-Received: by 2002:ac2:5044:0:b0:4b0:cca8:bdb3 with SMTP id a4-20020ac25044000000b004b0cca8bdb3mr5721268lfm.539.1668513764729;
        Tue, 15 Nov 2022 04:02:44 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i13-20020ac25d2d000000b004b0b2212315sm2176233lfb.121.2022.11.15.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 04:02:44 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        quic_srivasam@quicinc.com, quic_plai@quicinc.com
Subject: [PATCH v2 01/11] ASoC: dt-bindings: qcom,apr: Add GLINK channel name for SM8450
Date:   Tue, 15 Nov 2022 13:02:25 +0100
Message-Id: <20221115120235.167812-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
References: <20221115120235.167812-1-krzysztof.kozlowski@linaro.org>
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

On SM8450 and SC8280XP with Qualcomm GPR, the GLINK channel name
(qcom,glink-channels) for ADSP is "adsp_apps".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: quic_srivasam@quicinc.com
Cc: quic_plai@quicinc.com
---
 .../devicetree/bindings/soc/qcom/qcom,apr.yaml        | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
index f47491aab3b1..0a7a34cb2497 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,apr.yaml
@@ -58,8 +58,7 @@ properties:
   qcom,glink-channels:
     $ref: /schemas/types.yaml#/definitions/string-array
     description: Channel name used for the communication
-    items:
-      - const: apr_audio_svc
+    maxItems: 1
 
   qcom,intents:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -203,7 +202,15 @@ allOf:
             - qcom,gpr
     then:
       properties:
+        qcom,glink-channels:
+          items:
+            - const: adsp_apps
         power-domains: false
+    else:
+      properties:
+        qcom,glink-channels:
+          items:
+            - const: apr_audio_svc
 
   - if:
       required:
-- 
2.34.1

