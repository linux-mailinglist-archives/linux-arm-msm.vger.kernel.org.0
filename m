Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B891F6450E7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229750AbiLGBWi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:22:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiLGBWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:22:36 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEFE109D
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:22:34 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id d6so26379141lfs.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCL3T9bEBAWFKFNPkwgPngR7HtM0awS/KY1SN8cp/IM=;
        b=kLNApF10W4T1ZkkfMKkV3H9ll1opOSR8vclgred6Qvbx2Mzq34Fqn7PdH7XEPHKfte
         TUYzjVGeNaEPhAgDeU/e95AYvvYiCgDPauQqHiWMAuiaAVlKON7wj1fmmuSzy7UqAzO5
         9JOnVY2p3a9WLqZLcIsGUnioonmPC6xUzsgxZXsCELKlqnLV7VWd+Qj58eeWjkORxfgr
         dZbb4t3sFT9KqSeQdFszCviLoKPijIjF3SyrBUzdjJTgB9Q+q0lKJkvE8uf1M7iJKPoG
         CRR9MX6C68Q1QQZ1c3T+W2beKBO7nxg+GiLKtDmTe+4u1/n4rXhU1i/1GeOLwRWw2lEo
         mlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCL3T9bEBAWFKFNPkwgPngR7HtM0awS/KY1SN8cp/IM=;
        b=4eyKwvO8L9RhfAQCJK06KIK7l2rLap+gflpvrotYmT9hHfiAx85J8Azzy6J9rEFkC3
         sPxwk9l8ZbMKbXMOEwXSwwWkfYu19lAi9/gJv/oTecX1I3eEIpF453gEMSr2mqelIbQd
         UetB7HqvsOpCyKu21zv3Pp+yE1RT54h5t8oLE1PbYH4Z4t4x5FL34N/XGvUU2nlCEskd
         S/W/UNUvs6lk/08Msxpieh9zAqf/7/doa77zTWV+ay9HKOQmH7AS+0g8BlJOTc3VcP7e
         nRWGGWTuVtdBYo+EOBik7oJnaCaJIJQCkmTYio5gYLPdmaZzZbgQK5+8RCAAnVCWo1Do
         cQNA==
X-Gm-Message-State: ANoB5pke2RL5Efz+zlLp3l/AoKUIzhW7yAQdyXiVZF/CbXr+HOxEE6+c
        hVnT1n66ET6PeEpUo4gwXBpJLQ==
X-Google-Smtp-Source: AA0mqf7Nv6TBP7cqiq1SVk8fBI/MF5e5ko2zUI3pT0C9q59uDDilYIjLhrU6B6zpXHWPaowfoP6bJw==
X-Received: by 2002:a05:6512:b24:b0:4b5:5402:a300 with SMTP id w36-20020a0565120b2400b004b55402a300mr7520342lfu.167.1670376153074;
        Tue, 06 Dec 2022 17:22:33 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:22:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 01/11] dt-bindings: display/msm: *dpu.yaml: split required properties clauses
Date:   Wed,  7 Dec 2022 03:22:21 +0200
Message-Id: <20221207012231.112059-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Require only properties declared in given schema, which makes the code a
bit more readable and easy to follow.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-common.yaml        | 4 ----
 .../devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml  | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml  | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml   | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml   | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml   | 7 +++++++
 .../devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml   | 7 +++++++
 7 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
index 8ffbc30c6b7f..870158bb2aa0 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-common.yaml
@@ -40,10 +40,6 @@ properties:
       - port@0
 
 required:
-  - compatible
-  - reg
-  - reg-names
-  - clocks
   - interrupts
   - power-domains
   - operating-points-v2
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
index b02adba36e9e..479ce75bd451 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
@@ -46,6 +46,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
index a7b382f01b56..e794f0dd8ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
@@ -42,6 +42,13 @@ properties:
       - const: lut
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
index bd590a6b5b96..0dfdf8f3c5b4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
@@ -44,6 +44,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
index 924059b387b6..512d23f8d629 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
@@ -43,6 +43,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
index 5719b45f2860..d5a55e898b11 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
@@ -42,6 +42,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
index 9ff8a265c85f..687c8c170cd4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
@@ -39,6 +39,13 @@ properties:
       - const: core
       - const: vsync
 
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.35.1

