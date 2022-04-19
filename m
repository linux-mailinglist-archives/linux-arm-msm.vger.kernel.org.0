Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30E1E506187
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 03:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242102AbiDSBLu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 21:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237506AbiDSBLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 21:11:49 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D21CC2E08A
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 18:09:08 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id q20so9699076wmq.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 18:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N91S+3Lx29YcpKx5EXjkYYYdKqWltK0JIghcRmIP70o=;
        b=SEKVfhyeP7WTx64Uvp5RreA9aYOrFNzAxUF9WquL++UJcQgb8aVh5OFo9QHH/gBRhD
         BSLKMXU2kWotAlPi/dEFqoMPACvuPtg24Fu7WviiQK0oga73YEsL4VvxG2At7mCKTPtt
         s9zAzMi9XwfcO8X93Pzy9PhAcO/3krkKcBb6DEiUlETLlL1KzJabBR/8526xLGd48KFZ
         1FVoqwYgUNrUxks9ikk8X2ehNuxjMX7ZDbX6P0Hj9wzjKhdAQa4HXZhSA1ukLMhmGkkX
         WwWpSNOftqGg5PhcMdTWttaePE9kndpCH4WFTaWmTBEkK7lqT7gsePko588Sci5bBCrm
         0XtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N91S+3Lx29YcpKx5EXjkYYYdKqWltK0JIghcRmIP70o=;
        b=rTynYT8U4NVpTim6V/hVA99SuIz4oy0doDsHeoRtEN11iVBKQk34gCnYFxgWKhpZu+
         tj30erqiWw2Pyj9ZS2J6FaIiOsF8Mv35d23/O8ZSpPCDh6qGC26TOgpIyr+EVeuLh1+1
         TTUirP6XQnmGNjDXupYoAEudyMTg+DHrXbM/q9EsVVvPw7HZGKda70Y7z65TbTiJS1kp
         y3a/WNrdpbWzeGjaaEfHIVJgPshhrJ0UgIlzafcacfod2MzBrvN4CPsnedTLLrWZ1Wn0
         GTQ2e13YYDiVXeI8nsNqGYTpxek4msPoMfki4NHLYPLIMg7NUFjSszrFqCR2pYvEC5Pn
         U6Nw==
X-Gm-Message-State: AOAM5327Ur6zP1uNi7ny89M0DkQoDO3ej5/EDtXq6OokRshP0FgF95kS
        vBC/xWZShG/MZd2IX2X7/zF5uA==
X-Google-Smtp-Source: ABdhPJwaq1kHZjdQL7JZbq/mlrzlLzY4xinA0CQrYNK9bi0emRtCGfpQVd1vnnFNpBgr7Z3ZPi0EHA==
X-Received: by 2002:a05:600c:4ecb:b0:392:88ed:1ef9 with SMTP id g11-20020a05600c4ecb00b0039288ed1ef9mr13401917wmq.68.1650330547425;
        Mon, 18 Apr 2022 18:09:07 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c4f4600b003918d69b334sm12030732wmq.42.2022.04.18.18.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 18:09:06 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     shawn.guo@linaro.org, jun.nie@linaro.org, benl@squareup.com,
        jwillcox@squareup.com, jgates@squareup.com, mchen@squareup.com,
        zac@squareup.com, bryan.odonoghue@linaro.org
Subject: [PATCH v1 1/4] dt-bindings: arm: qcom: Document MSM8939 SoC binding
Date:   Tue, 19 Apr 2022 02:09:00 +0100
Message-Id: <20220419010903.3109514-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
References: <20220419010903.3109514-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Document the MSM8939 and supported boards in upstream Sony "Tulip" M4 Aqua
and Square APQ8039 T2.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 129cdd246223..0e4f3a4d1a58 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -34,6 +34,7 @@ description: |
         mdm9615
         msm8226
         msm8916
+	msm8939
         msm8974
         msm8992
         msm8994
@@ -133,6 +134,12 @@ properties:
               - samsung,s3ve3g
           - const: qcom,msm8226
 
+    - items:
+          - enum:
+              - square,apq8039-t2
+              - sony,kanuti-tulip
+          - const: qcom,msm8939
+
       - items:
           - enum:
               - qcom,msm8960-cdp
-- 
2.35.1

