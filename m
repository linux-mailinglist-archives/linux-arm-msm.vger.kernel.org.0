Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98F126B4047
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 14:23:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjCJNXC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 08:23:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230290AbjCJNWe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 08:22:34 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1588DFAD48
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:22:13 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id ec29so20342395edb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 05:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678454532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xZM2NPsZ49ia+Dqe6wkMeZpgWpRvBEKr1bmuDVGwMmU=;
        b=JlQDMdsrzCaAUa+EGwPt5baDL9e2sGUjcXtUdJmMtd7LdVysOe++LpLVZR62ZYEocf
         GGVu0LPvWKnC66Cv9zwZp3AKNIEU1IsV+efkj4Zdhpi1Qn705w49uz4Qt4ogxN68cuty
         0btX2P47p6t+EP6BHBkWAX6XjqGKRBGaLunRWDvwsqanUk9dOf8jvcK9ViDIqNgwdom1
         k4NSndhZRy4ftXOedg/VJHgTL8ZCB6pJHn7t6u1DrjNOUZWGxzBqnHKGkXTE5Fh27rvy
         b55y67Vv7B4MpMRYC+WHN+xQMbxaIMYtq4vueu0BPH6BTVqC6/qOMmKfnBkrNYJvSt06
         0T8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678454532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xZM2NPsZ49ia+Dqe6wkMeZpgWpRvBEKr1bmuDVGwMmU=;
        b=D9DKSU3ZAW5fNlLYg5JjK3qdGRpRCfd63Fzrzj4z/2KIhgryDrWSsMxlZvs0Eco/rV
         s8blFcFUyZWuu6xrleYQj+pK3MfA8jIOCC3il++0IGKlK7Mv+l2H17LRuKOnIzQFmUHc
         DNU3DwHdWUqCCghOj3E8Hky4q6ZUaq2GivGfHbpbI/kCh2qGwHnIMm+/QM4Z1fLjnJit
         cG1P7dsRmzqYFQb+wg4/qMJPHQfoqzzH1bSiAxCU0VRtHLELjrADv8YWyiHZ1AE8W6hN
         SNY08ocxc5FXogx/MQ7bB6K11URciz+XVmuuvJ4q1W8sBT6zpdPQ/7QjsI9MCEpm5q3n
         iIog==
X-Gm-Message-State: AO0yUKU0utxR8UIWu04ktpiM7owMUXlPhLnqkvTDsGERrd3McNrO/LOa
        fuvvKwxIMI9S9wiVm0pXzAx/YQ==
X-Google-Smtp-Source: AK7set8fTAqNDHmQ2vbdeXcsnUybj+MQE1TaFOBt/wDYcsvEaTyVp4p/mNTUNlPd4pLUH6uptZ5WVw==
X-Received: by 2002:a17:906:30d3:b0:878:7291:d558 with SMTP id b19-20020a17090630d300b008787291d558mr23731297ejb.34.1678454532716;
        Fri, 10 Mar 2023 05:22:12 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:45c4:46be:ec71:4a51])
        by smtp.gmail.com with ESMTPSA id zc4-20020a170906988400b008b17879ec95sm959124ejb.22.2023.03.10.05.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 05:22:12 -0800 (PST)
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
Subject: [PATCH 8/9] ASoC: dt-bindings: qcom,lpass-wsa-macro: Add SM8550 WSA macro
Date:   Fri, 10 Mar 2023 14:22:00 +0100
Message-Id: <20230310132201.322148-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
References: <20230310132201.322148-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the WSA macro codec on Qualcomm SM8550, which comes without NPL clock
exposed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/qcom,lpass-wsa-macro.yaml  | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
index 66cbb1f5e31a..eea7609d1b33 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-wsa-macro.yaml
@@ -15,6 +15,7 @@ properties:
       - qcom,sc7280-lpass-wsa-macro
       - qcom,sm8250-lpass-wsa-macro
       - qcom,sm8450-lpass-wsa-macro
+      - qcom,sm8550-lpass-wsa-macro
       - qcom,sc8280xp-lpass-wsa-macro
 
   reg:
@@ -27,11 +28,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-names:
-    minItems: 5
+    minItems: 4
     maxItems: 6
 
   clock-output-names:
@@ -62,6 +63,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 5
           maxItems: 5
         clock-names:
           items:
@@ -89,6 +91,23 @@ allOf:
             - const: va
             - const: fsgen
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8550-lpass-wsa-macro
+    then:
+      properties:
+        clocks:
+          minItems: 4
+          maxItems: 4
+        clock-names:
+          items:
+            - const: mclk
+            - const: macro
+            - const: dcodec
+            - const: fsgen
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1

