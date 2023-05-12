Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B15217010DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 23:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240350AbjELVSE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 17:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240263AbjELVSD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 17:18:03 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FB0361B5
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:17:32 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f24cfb8539so8228255e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 14:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683926250; x=1686518250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzC/S26FfX2KBobwpdwOfCvN/amobbf96cFrDJ/wC6A=;
        b=Nso9rJDJ6ec93LDQc07gjyLuWRCgV+NYsjBRmmozpwS5/Uwa4bPRu/NUffOUcOWM1E
         lggONYhXu1HbznRV4FZeh6UtFuZ/i/z+YNfFbURG332QQ9dLr/f/jH7Ya/OOvZsTjvJR
         5xduyE1vRkKQUXfnyjjnu3IVLOmPJHKly/6ip6z01OdSs6P0SCid4/gFX1ZwHgM84/jx
         iP3TRYSiU3jm+7Za3gWponlvjqal3U957jANf6Ld73JHKXWpxaNHYhmlLUN8P4k/D3Mr
         NFCe+jj8q/T0amV4xp8kerOU6WwgCgXSoMQvu/r4DuJ7bFJNoFCkos6wYHM+MOFiX0wc
         r8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683926250; x=1686518250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzC/S26FfX2KBobwpdwOfCvN/amobbf96cFrDJ/wC6A=;
        b=K7k6VlnlrLoY+RPPRBwJioqdZndspDuWx1noqmcbyRplia2Unem/V2ejtDQYh06BaS
         Cg7qUkW+216OEoHKI6uoJx1XyFORjiRcusrMWDtWEwp6Dcnzx9AoyeaClE1cRh3Lrpxl
         o9cvM/dtL6dpnipAu6qOdaPshtV1xGZAGHf9mHLcm3oMF3iwQKZnMgWuMUq9g7kE7T5g
         Ix20Al7zmFGhBc+IdpyHCxbNYolGOXqrchUKIkEn2RdS6iaUwvhUmA9iohyWLvRU43hh
         iCDjKwZb/6qP0DkYs29ADQNc0PI9EShLmKDZT4bdOk30V9mvkizyEsxoSM8cDFrJWN62
         1a6A==
X-Gm-Message-State: AC+VfDywkHJnnESykDiSsQib3/8ilir4Gin3q/2TDIlYBQ6prSdNdNJy
        UJEw4ELlFewESEcKdKZZJimJIg==
X-Google-Smtp-Source: ACHHUZ4N9TANITxQE6BSQ6d1lPsMv+zeDT9j59wfWA2uFPb0lLHvTdh5DmhMxDQAoNiPrY7RwVdHgA==
X-Received: by 2002:ac2:488c:0:b0:4f0:2ce:34ea with SMTP id x12-20020ac2488c000000b004f002ce34eamr3938380lfc.44.1683926249684;
        Fri, 12 May 2023 14:17:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w4-20020ac254a4000000b004edafe3f8dbsm1590363lfk.11.2023.05.12.14.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:17:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/10] dt-bindings: clock: qcom,lcc.yaml: describe clocks for lcc,qcom-mdm9615
Date:   Sat, 13 May 2023 00:17:18 +0300
Message-Id: <20230512211727.3445575-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Describe parent clocks used by the LCC on the MDM9615 platform. It is
the list as the one for msm8960/apq8064, with only difference being
pxo/cxo replacement.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,lcc.yaml   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
index 8c783823e93c..55985e562a34 100644
--- a/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,lcc.yaml
@@ -76,6 +76,40 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,lcc-mdm9615
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board CXO source
+            - description: PLL 4 Vote clock
+            - description: MI2S codec clock
+            - description: Mic I2S codec clock
+            - description: Mic I2S spare clock
+            - description: Speaker I2S codec clock
+            - description: Speaker I2S spare clock
+            - description: PCM codec clock
+
+        clock-names:
+          items:
+            - const: cxo
+            - const: pll4_vote
+            - const: mi2s_codec_clk
+            - const: codec_i2s_mic_codec_clk
+            - const: spare_i2s_mic_codec_clk
+            - const: codec_i2s_spkr_codec_clk
+            - const: spare_i2s_spkr_codec_clk
+            - const: pcm_codec_clk
+
+      required:
+        - clocks
+        - clock-names
+
 examples:
   - |
     clock-controller@28000000 {
-- 
2.39.2

