Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 153CE6C9D25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 10:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232793AbjC0IGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 04:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232749AbjC0IGc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 04:06:32 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 821F449C4
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:06:31 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y4so32316741edo.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679904390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UUp4ngzJiF6qfcN7UPDBFASGOZPeVqu/C7g0vbL0LJA=;
        b=wLSueBVpXjyMaDwQPzr4dLeOIPMasQNmGaI6jO2YpyhzzZDlX/mBC06donWSsJPnK1
         05qqAeXx1iPsPP565uvbyT1aLeGaBfS1J5iLxR+u8yYU4gu23Cp0YOwMEOeKE5/o5rga
         gk0wasJVjb4DXrBFNQEGz2pEEMAN0RPxDmhcNkA3kpx4dSIH2YH1xnWFj7gm21yQQ6F8
         GWxbB1P8a0Vtt2mDAWRJbBa83OQ2IjBe8uyZlIXKpDc6qn19PEFH0VgjmtZbA6dL34HG
         M5Jazvsu6JLEeLBrhV7YZ7nj/cHQBVJW24NAzYGmMpiHn+DEXcpaiYoR4A6BrddWTpOR
         kDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUp4ngzJiF6qfcN7UPDBFASGOZPeVqu/C7g0vbL0LJA=;
        b=nCgzz9PM4oA4LJwpaLPHpXuD6K+m+2akccfIf9xhIPoE3cIhxH2gs6UsCBYi/N8sUf
         DFlugNpqyS5Eh6aFEUy9gw6TvwbBdk5RArGzznsWwc0ZL75C7y/a8b4uir/02DmxvBuj
         iw6pNyipUXJcle/ZyiTcSqQQM2C9JIRJcQS+UcXXtOS5wHwxce+Lcdshjh+NegfQDkFI
         EOdBxIQ/ASJx6P/JxjBu7ug77XE80DkIodD8u0lEI7dfQ51s6vtUcnVVoP/zbxLcMwnC
         FyNXUlnadPlU8xh5HGz31zr0vCEraFzScxw4D+7oeal6B4+KaXkisuKYnNmWAPWSmUR8
         rK9A==
X-Gm-Message-State: AAQBX9c4ysWt/vXwrAXb13JMYR6sqQb7Yqr1s97ot7T6mHg7G1TroqU8
        FesflzexKyQwk7tNguw7C2wLQ+kuXyOANLpTj6M=
X-Google-Smtp-Source: AKy350YmxQycvedhDUQESRT8HII2aoJAmIwAacZuZJu/2+3+/DU9DYIPevaQCM/9o5v2REj+3Yad3A==
X-Received: by 2002:a05:6402:5146:b0:502:1cae:8b11 with SMTP id n6-20020a056402514600b005021cae8b11mr12905714edd.23.1679904390019;
        Mon, 27 Mar 2023 01:06:30 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:198e:c1a5:309b:d678])
        by smtp.gmail.com with ESMTPSA id f3-20020a50d543000000b00501d51c23fbsm9764527edj.6.2023.03.27.01.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 01:06:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Subject: [RESEND PATCH 2/2] regulator: dt-bindings: qcom,rpmh: Combine PM6150L and PM8150L if-then
Date:   Mon, 27 Mar 2023 10:06:26 +0200
Message-Id: <20230327080626.24200-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230327080626.24200-1-krzysztof.kozlowski@linaro.org>
References: <20230327080626.24200-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The supplies for PM6150L and PM8150L are the same, so they can be part
of one if-then block, for smaller code.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Cc: Danila Tikhonov <danila@jiaxyga.com>
---
 .../regulator/qcom,rpmh-regulator.yaml         | 18 +-----------------
 1 file changed, 1 insertion(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 74e3acf92d21..dd52cc9f1846 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -144,6 +144,7 @@ allOf:
         compatible:
           enum:
             - qcom,pm6150l-rpmh-regulators
+            - qcom,pm8150l-rpmh-regulators
     then:
       properties:
         vdd-bob-supply:
@@ -244,23 +245,6 @@ allOf:
       patternProperties:
         "^vdd-s([1-9]|10)-supply$": true
 
-  - if:
-      properties:
-        compatible:
-          enum:
-            - qcom,pm8150l-rpmh-regulators
-    then:
-      properties:
-        vdd-bob-supply:
-          description: BOB regulator parent supply phandle.
-        vdd-l1-l8-supply: true
-        vdd-l2-l3-supply: true
-        vdd-l4-l5-l6-supply: true
-        vdd-l7-l11-supply: true
-        vdd-l9-l10-supply: true
-      patternProperties:
-        "^vdd-s[1-8]-supply$": true
-
   - if:
       properties:
         compatible:
-- 
2.34.1

