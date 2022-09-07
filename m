Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1555B019E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 12:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiIGKRi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 06:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiIGKRL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 06:17:11 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DE535D124
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 03:16:20 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id w8so21620299lft.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 03:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Tn2FE4uhx3qd+o+7Fk9TdVeJts1VUhiNI+L2cf12iKs=;
        b=wmrxO8LMD+MTnqYrEWS8VoI8pGCdL92Hp+n3t0Z0BQpJ3QzEK7Gut2SM5hUwsYxqkT
         Ut8wyoI1y+83zVBJbote2nDxz1zm8g5uFQ27seyEpurRfGghwg9feePY4XUZmm/eGzeP
         tWU+7OrftmbVC9O9vlRIc9KEgfuwmTfSrojB89i0AIKc6iRU9LSjKn0tpCUKki/Qgsp6
         zRvqfWygycZPc81nbZw3sHpGj8y8HlCquVXKx5+JbhmmbQaHJiIN7XKwIjNCeRSySGIR
         spjhhozeJTwT2eJ5UloQ5yY5SE+QsLpHU/B8PS4yMfm/PLlnooUeUQNSZlnBSPceOrnt
         AJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Tn2FE4uhx3qd+o+7Fk9TdVeJts1VUhiNI+L2cf12iKs=;
        b=SVmNd6aeKtyyHXkYLWipWzoLtneMt974/DfyLLj/i25p5vwEN01gWqJt+C2Pg1GTfi
         KjlqWHWn+YhWp5JJUv7nNRItPa7KlHMvYMmsf5x/h9IX9wmH2a4umiRBSSdjOJl44j6b
         i0aUF6FOp8BhLhC+IFTA8A1n4D4bJ/Dnfoyw6BK/Bz+zvzy8WDt5SflIQZR5pwoAPX/U
         TJe+0FUUAhRqA8+qS9GwXb0Xw8OcCD5vzCC9kEgJ1nOQAycwcWl4PM4Nb6Q4rq/LSutB
         JvxGHjuRaPsAzQFYuRGbPtLCLk4qTAoZLeKr0bScGwdE6rLNiICaJcibQMzrXJPii7ue
         jO6A==
X-Gm-Message-State: ACgBeo0WoafxVqrMKRlwRiqhcuqTgK5EELZg+HoysTdhraUDzq4hKBQH
        oADvTMnibUiN26MGaXraFx1Z0A==
X-Google-Smtp-Source: AA6agR7C4ChseY66F7QZIfa9vAhumII2zndyeu9DBWtPdLZ1Bzuwapq/6WLgTNqkWa6T94uUHDrJdQ==
X-Received: by 2002:a05:6512:3f94:b0:496:5e1b:a1c5 with SMTP id x20-20020a0565123f9400b004965e1ba1c5mr905346lfa.483.1662545779790;
        Wed, 07 Sep 2022 03:16:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 03:16:19 -0700 (PDT)
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
Subject: [PATCH v2 11/14] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: cleanup example
Date:   Wed,  7 Sep 2022 12:15:53 +0200
Message-Id: <20220907101556.37394-12-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
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
 .../sound/qcom,q6dsp-lpass-ports.yaml         | 48 +++++++++++--------
 1 file changed, 27 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 5e666d9fb388..e53fc0960a14 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -153,24 +153,29 @@ examples:
     #include <dt-bindings/soc/qcom,apr.h>
     #include <dt-bindings/sound/qcom,q6afe.h>
     apr {
+        compatible = "qcom,apr-v2";
         #address-cells = <1>;
         #size-cells = <0>;
-        apr-service@4 {
+        qcom,domain = <APR_DOMAIN_ADSP>;
+
+        service@4 {
+            compatible = "qcom,q6afe";
             reg = <APR_SVC_AFE>;
+            qcom,protection-domain = "avs/audio", "msm/adsp/audio_pd";
 
             dais {
-              compatible = "qcom,q6afe-dais";
-              #address-cells = <1>;
-              #size-cells = <0>;
-              #sound-dai-cells = <1>;
-
-              dai@22 {
-                reg = <QUATERNARY_MI2S_RX>;
-                qcom,sd-lines = <0 1 2 3>;
-              };
+                compatible = "qcom,q6afe-dais";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #sound-dai-cells = <1>;
+
+                dai@22 {
+                    reg = <QUATERNARY_MI2S_RX>;
+                    qcom,sd-lines = <0 1 2 3>;
+                };
             };
         };
-      };
+    };
   - |
     #include <dt-bindings/soc/qcom,gpr.h>
     gpr {
@@ -178,20 +183,21 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
         qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+
         service@1 {
             compatible = "qcom,q6apm";
             reg = <GPR_APM_MODULE_IID>;
 
             dais {
-              compatible = "qcom,q6apm-lpass-dais";
-              #address-cells = <1>;
-              #size-cells = <0>;
-              #sound-dai-cells = <1>;
-
-              dai@22 {
-                reg = <QUATERNARY_MI2S_RX>;
-                qcom,sd-lines = <0 1 2 3>;
-              };
+                compatible = "qcom,q6apm-lpass-dais";
+                #address-cells = <1>;
+                #size-cells = <0>;
+                #sound-dai-cells = <1>;
+
+                dai@22 {
+                    reg = <QUATERNARY_MI2S_RX>;
+                    qcom,sd-lines = <0 1 2 3>;
+                };
             };
         };
-      };
+    };
-- 
2.34.1

