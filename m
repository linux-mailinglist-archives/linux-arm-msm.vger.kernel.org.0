Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D7935B458E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 11:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbiIJJP5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 05:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbiIJJPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 05:15:12 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996BF1EADF
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:54 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bt10so6748339lfb.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=IE9iYaf4ljXjTzH90yeiguLHiQ95amY6yCG9ecN7egM=;
        b=mGm4MLh3f/e5mggqAL1D1Kyqh5doHaIDBFrQtK8sqNRJPkcfwS2iFvOA5guvHH+dgV
         EBzMZdNvPu7ErIJLMwzcNb955UGATfLJrVGLqOowWM/I8QI+6Fg6rxyUWVKW4MTcOSLc
         QZCHAusEkyjCj6XzOmr0R2AbY5Q4N6CZJd+Z6uZSxjLivkBc5XZzYAIimtvQatqnoRR4
         Lp6gVu1Vuqudc8kwQUWaZDNkMNtMbDOtv3om/Z0mP3ly0pXjJum/zNUD808pavcy2Erg
         AFyF4+xt52W2F/07B5I4UvnlVmDiy5O1fIUNNHiVo85K01H0dJ7j+Q7CpjyjW32Zz5+/
         kLSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IE9iYaf4ljXjTzH90yeiguLHiQ95amY6yCG9ecN7egM=;
        b=dghAVpomDKi6tFIMILaceRfvan9ANIFudXjRsbfmFgl8Xc5A3gwc3hT1bxIWajSB+S
         yyYrIPZyMeQiB7GnlWlF47ZD9OruQInQOerVQGYw7IwvNoUaVxFNkcS+CxHZuqGAnvCs
         eV4k3uhxB4rDfRXulgIBgl0rey9zo+MPVkFKusLqlzZ59mqDr4SX8y/s5zkNqyvEc60x
         KnsL/Rnjfg5qyZNrm5OR2NM3yTokF2zVThRU5FoQxYQ+AKc1ZEPaKCo7c349vErIceEv
         giNfGedkF/hMYgOcywixJmcy/+zE0tnRjP9FcMN6MUXXuEQmfqizxPWsm4PJmhb4aUCE
         tpHg==
X-Gm-Message-State: ACgBeo1dCLTIxEPThlvdavR0vWdkFpkaxvpqtORXKb1hWa3kpsotJ0eu
        2dH3w/gGuBbey0RlCSHkxCM9bg==
X-Google-Smtp-Source: AA6agR44h4+WA2C462fMoiaHwZtPDvoMp6F4veeqc9MlUjgS9Rk8dYhpQ54H9gDph02QLVvtTYkaAg==
X-Received: by 2002:a05:6512:3281:b0:496:f9b5:eb55 with SMTP id p1-20020a056512328100b00496f9b5eb55mr5786203lfe.279.1662801294072;
        Sat, 10 Sep 2022 02:14:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 02:14:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Banajit Goswami <bgoswami@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 14/15] ASoC: dt-bindings: qcom,q6apm-dai: adjust indentation in example
Date:   Sat, 10 Sep 2022 11:14:27 +0200
Message-Id: <20220910091428.50418-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
References: <20220910091428.50418-1-krzysztof.kozlowski@linaro.org>
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

Cleanup the example DTS by fixing indentation to 4-spaces and adding
blank lines for readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch
---
 .../devicetree/bindings/sound/qcom,q6apm-dai.yaml   | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
index 844d72b30969..24f7bf2bfd95 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-dai.yaml
@@ -33,13 +33,14 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+
         service@1 {
-          compatible = "qcom,q6apm";
-          reg = <1>;
+            compatible = "qcom,q6apm";
+            reg = <1>;
 
-          dais {
-            compatible = "qcom,q6apm-dais";
-            iommus = <&apps_smmu 0x1801 0x0>;
-          };
+            dais {
+                compatible = "qcom,q6apm-dais";
+                iommus = <&apps_smmu 0x1801 0x0>;
+            };
         };
     };
-- 
2.34.1

