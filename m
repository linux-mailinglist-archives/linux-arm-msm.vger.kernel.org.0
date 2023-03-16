Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9D836BCA03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 09:52:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230367AbjCPIwu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 04:52:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjCPIw2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 04:52:28 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC1E763FB
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:51:29 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a32so862159ljq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 01:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678956685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+jIZB+lOj7L713dwYSMYXhpa9ZO/qMAXKk3i/Uz2ak=;
        b=zb1fzDW2I5O1rNUfE2gydP1wBIaJYKdQEHvmzxxvjF5Nh3CyuFTHZSoGyCFgfyV4hV
         eeU2n4lcwk5Ny30ZeRRz1+FNgYNcue+nmYUaOfob6DhXDE9pwXtIX0zraKeP0+pOb/uQ
         n3loVcBvmgngySunL9GLc2/H4MaNMk3s/f+Xk+IRpcsqSYSNvZsg/OGE6AzwQahKnpl+
         YAITLco3BpajTgiXjg4upMJ+RajTyAPszyoA9/VDPvGEUdAIMRlY2UOnEEx9a024nxxZ
         HjV3wJd+Q38TBGkMESLrRYwOfim2mSKibmFm9/yVq/Z2Wf4itp5u8+IfRnaiS60t4CtZ
         T4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678956685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U+jIZB+lOj7L713dwYSMYXhpa9ZO/qMAXKk3i/Uz2ak=;
        b=wS4MUyO8tGTzjQJePLvoGhbNvZgqeFqEv4I0gNOTDCzZe+GTEinlFiW+daPekz4U/M
         roOeXTautu3iE2/JsV0WPOA++JFiqCPOLz5YiPXbw/ggBCAg40ZRdRMKKIxuEEOfSG2K
         n00nba/1Gnjl6L+Exj+gJ7vQixmpacsiIPX/i6dAQD+L6eLE/d/cRyNfaydp5AroUo1W
         B6Ph05Efj2RkNYnjLQVDJlAREEXk6R59pcMktl40BZ6kB5uZjgMAP6eXkrAkOC2f5EPb
         a+zKJim8Rx0Szfdf+txiJSJWpHQiHdh5wP/cCQwJFISEOYfaFSPQciEYElr6TvcrRpDl
         yxfQ==
X-Gm-Message-State: AO0yUKVkvmRnMEHLT6OGNNPstyf7cfsVr0I3fsZu2V5CsvtbZvghLOX9
        e+cLCu5LyitF6APexjS/tLc5kMmN+6ZtaOy0TlY=
X-Google-Smtp-Source: AK7set/fAtr/UAAosa5LPWjja2gKST4qxaY/VlSBcaAgWWxIHbWAn7vrd+KTN5PJ3kCa2TJqtk1l2Q==
X-Received: by 2002:a05:651c:505:b0:295:b0ed:ee8 with SMTP id o5-20020a05651c050500b00295b0ed0ee8mr2513288ljp.46.1678956684963;
        Thu, 16 Mar 2023 01:51:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id o11-20020a2e730b000000b002991baef49bsm251566ljc.12.2023.03.16.01.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 01:51:24 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Thu, 16 Mar 2023 09:51:15 +0100
Subject: [PATCH v5 09/10] dt-bindings: display/msm: dsi-controller-main:
 Add SM6115
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v5-9-9d4235b77f4f@linaro.org>
References: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v5-0-9d4235b77f4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678956668; l=2355;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=TH3q3Ed2aw6dX9xtVNq6VpDwcDDpJoS9emOd9LF1Zus=;
 b=7bputgfOyj/s6G7stHLz2GE2CCEIxcZYAH2PFB9jcjNmqnGD2xL5pDyWBfoKsaOMYa6o9id207J3
 BFTZno1ODpsNzWNG2uGZG/bzlWAV/D+XAokYcUu/tD4sFlzKLecO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a compatible for the DSI on SM6115.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml   |  2 ++
 .../devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml      | 10 ++++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ecc89011bec4..c8884a84e73d 100644
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
@@ -350,6 +351,7 @@ allOf:
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

