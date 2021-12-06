Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DABA5469E45
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Dec 2021 16:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351210AbhLFPhe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Dec 2021 10:37:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345879AbhLFP3e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Dec 2021 10:29:34 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 439D8C08ED8E
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Dec 2021 07:18:21 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id r9-20020a7bc089000000b00332f4abf43fso86020wmh.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Dec 2021 07:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FAIIeY4U32cBPzHPwCmHWiVlLz8C0dZOTLAx5GruJd4=;
        b=PWaEj9LNUJ4/SOFcv3dadsoA9o6juv5kGYSBPLedAxMU9ZVPjOAyk4xoKgIEj2HH+A
         ilG8BhCdIwdX5WPq2qqrQgGeIu0YkQmTY5wSomu5G527fBXX2mxpdsVyB7BjMzdgNLDo
         XQjkPVHT6u6Jx0Cs/vzDT7gAkZILO2rxVIBd1vVpbA1O84FemFy40UgoMNm+0prRPfDm
         gi9TsoJNOmDF1kBMsIyIH3HYVGijAw8Vmtgv2p3fo9WVeqqpPHLcjjgtcERGiik0DZmk
         CcdJ2cahFIVkj5ZhXE6rr6dtYLR+J5dgHWjQcwQxEXWxfO0rQ8kBnLU42ubJUbXhoPtY
         qaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FAIIeY4U32cBPzHPwCmHWiVlLz8C0dZOTLAx5GruJd4=;
        b=HFSutvBXDp4ZR/iEaEQiLbM/afovIw+7toUrzC/OtLIis/8YFwkAXHlIL0fjihgULL
         qEEap7bH6uhSdUotpGSYxkn4w9l4AWdi34JPW6GRiXMkanDXMDBD6u6IiixmLjnz1+Yi
         RJoeyo6FIWcjnxmqjSBO9X8HMZ0HKzyxDFJwop0KusTEeC4TmE7Xo/jBaWv+ssiEjsoP
         stZmS1u3wPcPm0cz5oqSoLJYIjKcMJO4+KOX7P3TwWLqdK6iKjebZjj+blygH2XCkeeE
         U/VEaLCkFuSgYe1fAkTKtXpxxbfa01iYvjdHvs0sc7VMfqTOUlz/kdC4ZAxj6jK5xQb3
         97sw==
X-Gm-Message-State: AOAM531Fhge4JYs5jkDn03C3TyTpKqRLFvOIXTi1k1a5Ta2JuGrMQInt
        +qPcEM623A41Mk+EtavfVBV0JQ==
X-Google-Smtp-Source: ABdhPJzhQLU2ZIcOxTVyqCd3xvNXxtheKA72amiAwWxQlt04ThQP+GY7c3AXYGRTK1rxiFfBqn6GMA==
X-Received: by 2002:a1c:1c8:: with SMTP id 191mr39046263wmb.90.1638803899673;
        Mon, 06 Dec 2021 07:18:19 -0800 (PST)
Received: from xps7590.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id t8sm11784871wrv.30.2021.12.06.07.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:18:19 -0800 (PST)
From:   Robert Foss <robert.foss@linaro.org>
To:     robert.foss@linaro.org, todor.too@gmail.com, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org, robh+dt@kernel.org,
        angelogioacchino.delregno@somainline.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v4 2/2] media: dt-bindings: media: camss: Remove clock-lane property
Date:   Mon,  6 Dec 2021 16:18:11 +0100
Message-Id: <20211206151811.39271-3-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206151811.39271-1-robert.foss@linaro.org>
References: <20211206151811.39271-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clock-lanes property is not programmable by the hardware,
and as such it should not be exposed in the dt-binding.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/qcom,msm8916-camss.yaml    | 10 ----------
 .../bindings/media/qcom,msm8996-camss.yaml    | 20 -------------------
 .../bindings/media/qcom,sdm660-camss.yaml     | 20 -------------------
 .../bindings/media/qcom,sdm845-camss.yaml     | 17 ----------------
 4 files changed, 67 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
index 304908072d72..12ec3e1ea869 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
@@ -83,10 +83,6 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 1
-
               data-lanes:
                 description:
                   An array of physical data lanes indexes.
@@ -99,7 +95,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -114,16 +109,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
   reg:
diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
index 38be41e932f0..6aeb3d6d02d5 100644
--- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
@@ -105,10 +105,6 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 7
-
               data-lanes:
                 description:
                   An array of physical data lanes indexes.
@@ -121,7 +117,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -136,16 +131,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 7
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -160,16 +150,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 7
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@3:
@@ -184,16 +169,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 7
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
   reg:
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
index 841a1aafdd13..338ab28d5f3b 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
@@ -111,16 +111,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 7
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -135,16 +130,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 7
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -159,16 +149,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 7
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@3:
@@ -183,16 +168,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 7
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
   reg:
diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
index 9ca5dfa7f226..9404d6b9db54 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
@@ -105,15 +105,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -128,16 +124,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                items:
-                  - const: 7
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -152,15 +143,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@3:
@@ -175,15 +162,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
   reg:
-- 
2.32.0

