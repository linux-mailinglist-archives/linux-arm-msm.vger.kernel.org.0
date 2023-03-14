Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E607A6B939B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 13:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjCNMUw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 08:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232141AbjCNMT3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 08:19:29 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02353A1015
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:15:41 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x17so3600202lfu.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678796064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P1pYiyEYMVUL7yAvgwa0bBv+0t1+WV+M8Z/f6qqjH0=;
        b=Wj48vVXbGkSyiDgbqj/+GLMCeSmwtEdP9xLi1GDEjC0foSiirrqPTM8MmurLYFDOa1
         8V9y12UczeF8AqE4scC7rXbILCZ5Ag5/dA7USPab4qedLSSF4eq28dm0Ug0Cv3xxtULe
         heYmPh4yyncyXr5h4fAv9RZQlzbyN1XxBxKQyKVLju0NytI5lZw6ITEUP2Xr71RctWPM
         hJ2iC9BhILPgpOfdgBuywNPkpSY1MmfbhioRZ4wdnlOXN65nC1adDrwvi+Stj7l0ETFL
         1pBh0Ys+H5w2eM6x9TW4L4vBGRkzUyJQXtfhUR+iItTz+GLWhcrQwOlZtXxYg9y3Si1H
         eWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678796064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P1pYiyEYMVUL7yAvgwa0bBv+0t1+WV+M8Z/f6qqjH0=;
        b=3fdEwHf1JDaeR56QC7eUPRe+obj9v6o0S0fupDcfVIiVr7LLIbnaJyUnzroBR1sx1W
         Jdl6V37ZoIm3mUJ4ZiA7n1uZw/Uo7g3wvZfVq9SJMBP95/CeZsMd+GJTOoYbWHz07UwB
         iwvvoinw8ZUVhpBJW61IJucrJojKXGGMD5x4WphbZFgKbuwDDtS1xvpnoJsWNkHsjUqB
         1Gyagrwe5HeuRFxOedCw6n4UgCcRHcZV8yqrdwTEuDEHDkY/YlSGu0WGMtKHPyZVr7vC
         Bp/Mto3W21tYEnc57p+CyIPiFevBf5rcnnswLgd8mQIwnXVeFSUaSJ8gC4OB5ZUzNTH2
         uwog==
X-Gm-Message-State: AO0yUKWX56My6QiPU2Xh5rSTpWZl9Y6NkcAUwei8Ud20cHN2G/XmQhMm
        jYq3Ks8QtokH2Ef/Ne7mZvazNw==
X-Google-Smtp-Source: AK7set+I8lQgNzPkz4L9M7HgnX9W/1AiS8lb8kOzmpsng+dz3rICh2GeR0Q7ovbC8CBNyaTNzhVZ5g==
X-Received: by 2002:ac2:5596:0:b0:4e8:49fa:ec1d with SMTP id v22-20020ac25596000000b004e849faec1dmr755500lfg.66.1678796064168;
        Tue, 14 Mar 2023 05:14:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id s4-20020a19ad44000000b004dda87ecae3sm379058lfd.246.2023.03.14.05.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 05:14:23 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 14 Mar 2023 13:13:47 +0100
Subject: [PATCH v4 09/10] dt-bindings: display/msm: dsi-controller-main:
 Add SM6115
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v4-9-54b4898189cb@linaro.org>
References: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v4-0-54b4898189cb@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678796043; l=2294;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=SrFjrl3hjjd6jTZmTfeOIcB1iG8ZWHw//K7P30Y1IYE=;
 b=ilkdJdfqSf8IuJJOZxOWUoZY9G+1PFVahC6fWUEls2j/8BN3zw1uAzrxxAWELiTwTmpCpmmv3vqv
 FMBevoo8DD5DaJ+8WB/H2V5y+tC3QOcMI0Y1Qbqetx0EcahBejA4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for the DSI on SM6115.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   |  2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml      | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 94f4cdf88c95..d534451c8f7f 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -25,6 +25,7 @@ properties:
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
               - qcom,sm8150-dsi-ctrl
               - qcom,sm8250-dsi-ctrl
               - qcom,sm8350-dsi-ctrl
@@ -351,6 +352,7 @@ allOf:
           contains:
             enum:
               - qcom,sdm845-dsi-ctrl
+              - qcom,sm6115-dsi-ctrl
     then:
       properties:
         clocks:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
index 2491cb100b33..b9f83088f370 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
@@ -40,7 +40,13 @@ patternProperties:
     type: object
     properties:
       compatible:
-        const: qcom,dsi-ctrl-6g-qcm2290
+        oneOf:
+          - items:
+              - const: qcom,sm6115-dsi-ctrl
+              - const: qcom,mdss-dsi-ctrl
+          - description: Old binding, please don't use
+            deprecated: true
+            const: qcom,dsi-ctrl-6g-qcm2290
 
   "^phy@[0-9a-f]+$":
     type: object
@@ -114,7 +120,7 @@ examples:
         };
 
         dsi@5e94000 {
-            compatible = "qcom,dsi-ctrl-6g-qcm2290";
+            compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
             reg = <0x05e94000 0x400>;
             reg-names = "dsi_ctrl";
 

-- 
2.39.2

