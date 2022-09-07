Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 747745B01A6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 12:17:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbiIGKRq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 06:17:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbiIGKRM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 06:17:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21E0665663
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 03:16:23 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id w8so21620425lft.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 03:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
        b=iJEBGiJqXXiegmiXuqo2B6OiveypNmJ9RC1K3vIBsRvmE5sWUR8BpA0SyfLrwY8XtT
         QklZYpDoETo0BsCpJuIJ83vTg7OzPgcoQXi4jAXQRJxO07vuAYkPfF3XS1njodL4+mvp
         842sAvQdgqH8HdJmV4n/Z1Lrv2b8dWHZ3jysdK4yTeHMSDG5FXdBTp+kx+DaAjJsYfwf
         I1jEXiL2UUa3M2EV1x0oTL5WKZgZPgav1VWcASoDkG4d+MQVlqQB2UoZz9J1rUfdT63r
         0ny2ca7CvEJU24ggz9S3ZMqGJshAJJFvKw3TST+pse8d+R1gjIhC69IBSqHg7IMHgrdr
         4D9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
        b=PXLNA+VMAeAAR0o5rLkdA8VqQEiasxj6keVHlGFMpmcXoHNakiWlOLE4ipWJScG/H5
         zZ8CHlzW/bB+JV9FzNIcRo2Qy3VtWYly3U7GuRjFAFL56+m41frYz8n1od0hqKzjB9f5
         2abiRRIz67r4Q+DuNbDrZbDDfig42YMwgdfIPp/eH3HzBYJQPwwcNUx0MjLdzo8MNeg0
         FLYBj6fNRCtVRVOdWQ3BwNun65IIr960Agp4fTffJqPKe87+iKhhu0OgOLCzuuU6KvaL
         j2WILoAcRNNke4u1cHZT6GhznS9PuDm5/yS/wFHZQVNdpfALbIm3YjEUjLhGM0PaL+nY
         QMVg==
X-Gm-Message-State: ACgBeo2WcFyUR4ST9IfiolGp2fIxO5CbYgz+Id0T5ZxCNKVt7XwUs1pt
        4LCLz2JpTTve6V5KtOwWVt6P7g==
X-Google-Smtp-Source: AA6agR4Zn1G3W5prvOClIzFDIxdFRH12bnmFLoC3HL6Q2qsxBu/1/06d7WEYmFZRjXArrk4N9g/y6A==
X-Received: by 2002:a19:7b0e:0:b0:494:6a97:fec2 with SMTP id w14-20020a197b0e000000b004946a97fec2mr867822lfc.87.1662545781307;
        Wed, 07 Sep 2022 03:16:21 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 03:16:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 12/14] ASoC: dt-bindings: qcom,q6dsp-lpass-clocks: cleanup example
Date:   Wed,  7 Sep 2022 12:15:54 +0200
Message-Id: <20220907101556.37394-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cleanup the example DTS by adding APR and service compatibles, adding
typical properties, using proper device node names for services and
fixing indentation to 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

---

Changes since v1:
1. Add few more properties.
2. Adjust indentation (better).
---
 .../sound/qcom,q6dsp-lpass-clocks.yaml        | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
index 604861d84ffa..fd567d20417d 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-clocks.yaml
@@ -38,17 +38,22 @@ examples:
     #include <dt-bindings/soc/qcom,apr.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     apr {
+        compatible = "qcom,apr-v2";
+        qcom,domain = <APR_DOMAIN_ADSP>;
         #address-cells = <1>;
         #size-cells = <0>;
-        apr-service@4 {
+
+        service@4 {
+            compatible = "qcom,q6afe";
             reg = <APR_SVC_AFE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 
             clock-controller {
-              compatible = "qcom,q6afe-clocks";
-              #clock-cells = <2>;
+                compatible = "qcom,q6afe-clocks";
+                #clock-cells = <2>;
             };
         };
-      };
+    };
 
   - |
     #include <dt-bindings/soc/qcom,gpr.h>
@@ -57,13 +62,14 @@ examples:
         qcom,domain = <GPR_DOMAIN_ID_ADSP>;
         #address-cells = <1>;
         #size-cells = <0>;
+
         service@2 {
             reg = <GPR_PRM_MODULE_IID>;
             compatible = "qcom,q6prm";
 
             clock-controller {
-              compatible = "qcom,q6prm-lpass-clocks";
-              #clock-cells = <2>;
+                compatible = "qcom,q6prm-lpass-clocks";
+                #clock-cells = <2>;
             };
         };
-      };
+    };
-- 
2.34.1

