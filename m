Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1C646B4044
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 14:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjCJNXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 08:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230184AbjCJNWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 08:22:33 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 041BCFFBC5
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:22:13 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id da10so20409646edb.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=goKtutnQ2PFd8NfCZ2pE04cCvKUKzYAaQ26RIq4NWcQ=;
        b=RER2Rx5gJ5R+wduk0rXzfE5ryA2rbohjb7XXb5g/kkl2V2gOITdv2x91WBUBe7GyZu
         gzQbl+KyFVnkjtsfyt9c8aTcZ18c1l+o5RLpBbGD68Ni62VRCbISEs5sNNCcsi+36g4f
         2vVyUQ1J6lHFysa2mx7T/qGJ+l0ANCp4QCkyc0QDHgTG5l7m32OikC7JGiDQLVYgfyCH
         XjJe4M3wPRViScfkziAQb7/3RSrIi3jjT8TWv2XSG1eOnKcUU5ncO7NE6gh93BC8K+lC
         CFJiG/yjDHOOGiz9uglm9l8ev1HtlL2Y2sK6FaFJcbDq30igz/dR79IR18o3dXzc3Ke9
         /7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goKtutnQ2PFd8NfCZ2pE04cCvKUKzYAaQ26RIq4NWcQ=;
        b=HnOmseghLoxnTxKUxNSEbHzwtKorImtMtIep0N6ylf/0aqyZpU3eYWi55X/ITICiNa
         gwVZRQM5TEDOmUMRAJ8CfpdjJ/E1Lo12S4qZuebQwrCpa/GPIq2wfDUtk0eY/oDIkjEo
         PZFj6jjcBQe0Ht8IigIi5kWUUNAJxemtiwD8+73GtPxadWwKbaYwDFR+oWIxSm0J+/AJ
         thgZxVWSR5hWfVhyzxY7vONYeYbUXWnqMQzQy+yALgsyZyRzYNuMHcbKtSOR/srC1FVt
         Qu72kNKvQfR9KoSxVZCzOKvgtCbtD8ioMhyYaR7VCNJwI6TXOhSw+3dZzYtU40SLuf6+
         a9uA==
X-Gm-Message-State: AO0yUKXCI1/AXpK37JX87zw+vhxntBd18u0D3AGvBUzNBsXowBIZbCCs
        4DSJdwv0+d5ChM0/d+0HT0REsQ==
X-Google-Smtp-Source: AK7set/7m+fKbY/1jI+CUKTq8FToiMZNX8tVAOxvsseLOOiw8ysUD1u+jkKI1OdVBofqe2vcOObR+g==
X-Received: by 2002:a17:906:1ed1:b0:8e9:6f9f:7c2d with SMTP id m17-20020a1709061ed100b008e96f9f7c2dmr1874600ejj.35.1678454531631;
        Fri, 10 Mar 2023 05:22:11 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 7/9] ASoC: dt-bindings: qcom,lpass-va-macro: Add SM8550 VA macro
Date:   Fri, 10 Mar 2023 14:21:59 +0100
Message-Id: <20230310132201.322148-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the VA macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Depends on:
https://lore.kernel.org/r/20221118071849.25506-2-srinivas.kandagatla@linaro.org
---
 .../bindings/sound/qcom,lpass-va-macro.yaml    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
index 528b677a439c..4a56108c444b 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-va-macro
       - qcom,sm8250-lpass-va-macro
       - qcom,sm8450-lpass-va-macro
+      - qcom,sm8550-lpass-va-macro
       - qcom,sc8280xp-lpass-va-macro
 
   reg:
@@ -110,6 +111,23 @@ allOf:
             - const: dcodec
             - const: npl
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8550-lpass-va-macro
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

