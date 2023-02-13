Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB1B695231
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Feb 2023 21:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjBMUuD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Feb 2023 15:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjBMUuC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Feb 2023 15:50:02 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D501F5D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 12:50:01 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id rp23so34958535ejb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 12:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B9e4S6OWedBx8L422WXZzIY6pxRaBgRtincFc9juEdA=;
        b=opyp3Yca3V7VCj/PJsd8/v+xJ7fQYRGUIgB96ZT5voZjCrxnt411MeugF8TLCZZz4S
         mLJaB6DAvTgT5Gr9LDkpSm3BYEJkrYDikisYI/RzqoICaT3zwHm6gEmDRSsRGLxSm13O
         4rblPoMOMge+q5h5ykKNSkljrdwVjeMxMNuapURXMnvLp3jJtAf5xK63fPlB2KhVhSK5
         2CefGEsGzv08CcijvGkZ/aFJ4WP5LthlWkU2ik9+xAE/bqj40ISp8czbNNkf8FBNaWms
         yw/uJg50dH5lmmrJhAqwVOWLsFfS1JXPN7Jv815nZbLwrABnLcQGOyuyfQHMifLSDUsA
         +V+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9e4S6OWedBx8L422WXZzIY6pxRaBgRtincFc9juEdA=;
        b=jocEArXaEF7+pjPv/ytGcMfo1bGCBuzCw41y5kLga4S9wVkETi/nLDkzKid6An7YwY
         +R0m5tuxgN6ojaPIBCjhLiFXauPStyzf34wP7zQipXTvPjoJNMNtNIcEWWE5iL0JxdTp
         aOrH0mDZuJBRylDzYrbLjW7R/BlpSflgJV92rbm+PCRTljBMSGGZeADPZZ+5cfn3qm8s
         xBZ/rokDLphrI97nzFXXOJEnyJokLFaM38ONAofNuLYZLMwjYzKj/N8wr1LonYv8WaoJ
         f7WnxBNAHKfm/qg/aDqddIemFc7efT58nfPDG7M7agf01AYGhnDrRkTgDiHEWB/jCRB8
         2/3g==
X-Gm-Message-State: AO0yUKWxBlevUgH+KDFdezg069CAJ+lA6AzWqKXtoZHtbD80p7MHvZJy
        eapcHmZWjZMCECZsJ3POn/Zr2k22Z0osYAjN
X-Google-Smtp-Source: AK7set8I9mPWZqAW6PO/bSEyNhmEpy6iSrh4BJ9XjINXWT6EWKK8dFk64FglXqsNwtUa0cPbDzT8qA==
X-Received: by 2002:a17:906:cb85:b0:8aa:11dc:ac6 with SMTP id mf5-20020a170906cb8500b008aa11dc0ac6mr195931ejb.57.1676321399462;
        Mon, 13 Feb 2023 12:49:59 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id f21-20020a170906739500b008a94f69a1e7sm7303123ejl.163.2023.02.13.12.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Feb 2023 12:49:59 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: power: supply: pm8941-coincell: Add PM8998 compatible
Date:   Mon, 13 Feb 2023 21:49:48 +0100
Message-Id: <20230213204950.2100538-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

Add a specific compatible for the coincell charger present on PM8998.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../bindings/power/supply/qcom,pm8941-coincell.yaml       | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml
index 0450f4dd4e51..b7b58aed3f3c 100644
--- a/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pm8941-coincell.yaml
@@ -16,7 +16,13 @@ maintainers:
 
 properties:
   compatible:
-    const: qcom,pm8941-coincell
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm8998-coincell
+          - const: qcom,pm8941-coincell
+
+      - const: qcom,pm8941-coincell
 
   reg:
     maxItems: 1
-- 
2.39.1

