Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6EBE6FFDEE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 02:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239636AbjELAch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 20:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239618AbjELAcf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 20:32:35 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1DD59ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:34 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f24d4900bbso6906018e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851552; x=1686443552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzC/S26FfX2KBobwpdwOfCvN/amobbf96cFrDJ/wC6A=;
        b=fkMyWui9qjhtPN3UucqAj0YDgghgrr7ix+K6WBtwGUceg+JTjgwZf0kFsEUDhQTmB+
         slvZ0dv8xZEOhDXZvZggMIDjv7ECm7yozeC17rIBrcTeFcZX/taGr122d3qJNVcsYEli
         oWnvmn/tgmko30sV5mlCWFfp7Nqi7wvm7SSBHaGUlSfL2YZGDyZSsDK8LIrYY2r0aI+v
         y1NEZr9Cdfu35HCjOBEHoyAO8Tfx/q6L0PwOqsza8z7NV4hpvxNo3XZofrm83nHQOgT7
         uTMgvMOaKUCyJxC9DtBLEQ7x9v3NmoWJ6Ak0a0VNCysLFdSscxEnEne6RRI9Nhm7/Kim
         /AZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851552; x=1686443552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RzC/S26FfX2KBobwpdwOfCvN/amobbf96cFrDJ/wC6A=;
        b=ZWJ9mAfABtmB0KG62iZ7KoG1/zHbPFfLdG4CqyS4t3h26Duvkpzpxab/Cl2ke5TzQi
         CPcBekyGqp/vkL5Ly3SvrDMI2Ki3aAB86BHtzpzA4oFJOF+JogbMKBvG8C3VhkuwbwPr
         fyfMudNNLBg/Kbz8KA1ix1CUZRuWrU54ocavx2QvcWiy1DJN3VTxHe0hm4NrzMuJj8kg
         dHgi1NfVMYE/hxKKxz+m0s1DiOC9CIfPYtC4+BntNJa8fGf+GDLGXQij8dNki5+hsXVs
         RO20q6rSu8ISLnxI+eCGAUOUCuUNN6KN3DY+kus4mpL+8g8HORKtfJGkH1y0hY0sB2Lt
         Z5IA==
X-Gm-Message-State: AC+VfDwqXWBDUSx0yUmJJ68Qko3EDHDAah8Acve0aKKoBuEibGvjkXyZ
        rQawLuwqi+DTQqR/95iMh5dWCg==
X-Google-Smtp-Source: ACHHUZ6s7Y0KFS2o3h0R8qGGin1sTFHn0NyW1jVuQeQQDAHY9SEThMUg+YfbmkchsoShgGIEG3R20g==
X-Received: by 2002:ac2:4a75:0:b0:4f1:444e:6c5a with SMTP id q21-20020ac24a75000000b004f1444e6c5amr3023901lfp.8.1683851552416;
        Thu, 11 May 2023 17:32:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:32 -0700 (PDT)
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
Subject: [PATCH v2 01/10] dt-bindings: clock: qcom,lcc.yaml: describe clocks for lcc,qcom-mdm9615
Date:   Fri, 12 May 2023 03:32:21 +0300
Message-Id: <20230512003230.3043284-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
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

