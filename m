Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 339D85B458D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 11:15:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229761AbiIJJP4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Sep 2022 05:15:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiIJJPM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Sep 2022 05:15:12 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FCA72558F
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:53 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f14so5740139lfg.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Sep 2022 02:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
        b=RTrok220LM/b9Uk07c9RLsnqCOU6qZiUKKpYirj3esRthzT/dRh6M1tnOkAmYszt/5
         tBAj5b/x0emE8K6hqwk8VCcmxDdeG5nJfGGW6HgHUc3qq4FkvwAbGY5CzH0uw6r6U3Pg
         s17rwctZD+1HSp+zle7Yu6oQ1wOnWZqVNOAKOgwsAdr4adCq/kYPS07nPuJbvGSZsn1s
         SyrVzxDFbLXwlZDLZXeAu5gP7qI0t0AbDB4n/StHpfczrZb91kFGgz/W5fNte11s8c47
         dzChcLArJPeKcloinTdTyd4T3e2Y4aJmZ1LxKc9c8IihrxVJ++CmBcitQKaxDCTDg0M8
         elUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=aK4G1Qq6cdDpbzIBmLo9qbHlkXgmVXTFgbxmWme4nqM=;
        b=xRXhlqzqXBQLHMQc2OGknNODeQAZWtI98ztKhzWCtlSkyPjPwFu03ApjawlulWs4j0
         j3N96yNNx8We3AwTpeLPf3hnsNiGCPo9S/2biJeuoyf6dpc6g9F5jHwDyKPg1nySZcNJ
         I6dnnD/B5UGN68YieHUSD1/9OQaPp343eVJHIqILRFZleMMxtJvvmcuTMoxf/ZdeXcMx
         ZbMl6IRjQ/FM8SdcoYnwljaL/yjKHaHel4TYK9KPfUmA4Z7wa7836enYL7WIhunSuXN2
         HqHWiKEbT0dCyzal80vs7EbMMdmdcFmOmMpHTFlRiw+cr7NKrmFRJOqcPnAuvk2pOn4Y
         v+jw==
X-Gm-Message-State: ACgBeo3jcySLvnFY6KWnBg1zI2gzIvQnxxoN+hGbXVeVvGnOtsaO1TMI
        ElfAUTYhz2KdzbE2DcfiKBIogQ==
X-Google-Smtp-Source: AA6agR42Ti+UFet+yPHWp/NC9BjFyAg2Iqnk5J3QWrDLMxCGYye3JpY/bZ52d4m3k49P4vYgqeNkyA==
X-Received: by 2002:a05:6512:3d02:b0:498:f4d4:e246 with SMTP id d2-20020a0565123d0200b00498f4d4e246mr3335630lfv.115.1662801292990;
        Sat, 10 Sep 2022 02:14:52 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x22-20020a19e016000000b0048b26d4bb64sm201552lfg.40.2022.09.10.02.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Sep 2022 02:14:52 -0700 (PDT)
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
Subject: [PATCH v4 13/15] ASoC: dt-bindings: qcom,q6dsp-lpass-clocks: cleanup example
Date:   Sat, 10 Sep 2022 11:14:26 +0200
Message-Id: <20220910091428.50418-14-krzysztof.kozlowski@linaro.org>
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

