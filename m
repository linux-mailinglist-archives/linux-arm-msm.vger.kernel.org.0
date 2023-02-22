Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E201F69F3EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Feb 2023 13:05:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbjBVMFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Feb 2023 07:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231903AbjBVMEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Feb 2023 07:04:49 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9D33A087
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 04:04:17 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id j3so3555295wms.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Feb 2023 04:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUvAJiwYybcfxuPaO1uSIiPaY9bXRmDYQO0thKgpZNw=;
        b=r3T1NGS2xbgCm1P579P6abmtW9ZORmagwa/lyH0wLO+fViT/fTu7ZYS+6l+zNm7N28
         1jazpD2SIs0/z0WJwfoJ5CVjwwwaESL6Ex4PIHwkrc/N3wFtBdjx+c7f4ywJlRtztVKE
         +z9dGs/BHWICaGg06Hr4aLzk0A7W1ASqTYslkqboTIsqhG/uadz3rEpdH689UUPIBha8
         MKodD+masFX8wvlUywb1ljAueQP9o1kNzDcslQN6X8iS1chslk7l5wo/HyuGvmZ0I4zV
         57PIMhROoYQYJP1JuD11BrjuP+Qt7rzMutmbuTRVQRXnP75UOc5tQuq7is0jcFK2ImkA
         UqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUvAJiwYybcfxuPaO1uSIiPaY9bXRmDYQO0thKgpZNw=;
        b=wivKg0FI6h4t+elEvymfv/czQPUjhAKwsmS4RAQzFTqYyXTCgDCzMHSaP1/XgHsGtB
         KR1KuRaTbxIu+6v0zMDyPGTRmZjVtSRQtrh+QARYGxUDCSrfRrEDtqUXNUpzQ1Rbm2ek
         0Z6ooRs4NRZVmabDDTsuOj8S9E4X4hxB7+38+pEFewtaK4OjvssZ/H/0F5CUrm0y5A2X
         6A7DNhO1fHkJHBA9YzY/1cnV3d9afgHt6FXWVB5J8sI4QzZZivKLVV2ymEhWT0/QDl4I
         nMUJwF5wotMmPCsuB5TYarVONdhw5A3lDqTVolmu5zpCbzgedGN2j9govA8TnMjGeEPA
         1bUA==
X-Gm-Message-State: AO0yUKUOm/Y/9e6giyLulbJMm/tgPoMXZ7KutFCmQ0QML2CDnVCysz9e
        MKAO6ZCfttY1/MyMkiGlHOGNXw==
X-Google-Smtp-Source: AK7set8lHwgBNjGciTX3AiGd/RkanWr9Qiqp500enTF0BXeBJss7YK98J6g8DRq/hGSMzFMj807NOw==
X-Received: by 2002:a05:600c:2ac8:b0:3df:eedf:f378 with SMTP id t8-20020a05600c2ac800b003dfeedff378mr5637451wme.24.1677067455884;
        Wed, 22 Feb 2023 04:04:15 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o27-20020a05600c511b00b003e21dcccf9fsm8447722wms.16.2023.02.22.04.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 04:04:15 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        djakov@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, benl@squareup.com,
        shawn.guo@linaro.org, fabien.parent@linaro.org, leo.yan@linaro.org,
        dmitry.baryshkov@linaro.org, stephan@gerhold.net,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/5] dt-bindings: vendor-prefixes: Add Square
Date:   Wed, 22 Feb 2023 12:04:07 +0000
Message-Id: <20230222120411.55197-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230222120411.55197-1-bryan.odonoghue@linaro.org>
References: <20230222120411.55197-1-bryan.odonoghue@linaro.org>
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

Add vendor prefix for Square (https://squareup.com).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ed64e06ecca49..90b746d237d26 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1251,6 +1251,8 @@ patternProperties:
     description: SpinalHDL
   "^sprd,.*":
     description: Spreadtrum Communications Inc.
+  "^square,.*":
+    description: Square
   "^ssi,.*":
     description: SSI Computer Corp
   "^sst,.*":
-- 
2.39.1

