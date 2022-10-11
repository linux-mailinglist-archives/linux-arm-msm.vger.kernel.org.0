Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26C015FB9AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 19:30:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230360AbiJKRan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 13:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiJKRaC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 13:30:02 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 456D97823D
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:27 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id a5so3907538qkl.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 10:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj5+7eQfxMdL7duF8qh7nKoEEyO5I9qnu4u5ZaGPGxU=;
        b=R9oEroNEWyia/YydBdZiS8/a81RLi5cqglbaphtZMKYq+QohWoqDdHNYKROw6haXaI
         WO350SMhkvVQRCDnQnXNiuIBq+seHmN/NXZ2Oe+Uq09lqpcWVigVkLBIUw3cwKK63SA1
         jB4fF3Wkg6/7vMGe/uul+yhj1cB+IQnd+N1snCpBxIm82gRHQLFkFRj/yZe3XOdCarFk
         xmHdFKj7VzP0aSwhz3bx2knA/4Ga/B1ojAPsRs8DRIVkgbZDVSbneVrCKisbTqFRJyCP
         ZLWDqK70k68RW4CB4w1ezWxo1HN/hd/EVvYVkTFsxSXmM/566S+cM4ynEyYdrN/8pdon
         NSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj5+7eQfxMdL7duF8qh7nKoEEyO5I9qnu4u5ZaGPGxU=;
        b=twu9+WR2W7+hrgBvwh0G1ndzfMk9nkJf/NCjfUQgt31DtezO99nI9znAh6UNfOCbSy
         FSe2Kzum2LU680od7slXsFpjiLNvw4pLZmYI/jP75q7fuXk3/IAx72sYn8Mz7NZCK3T9
         AESADTXY7BOAON2rB87aXc4pWOges0H5J6bjqPD/El3XmuBHmnsPpdJWjGV6sefemLGa
         yEm7snu0w9KiaXbj/y0HK9y1yFDC9UqMqEqE4HhQ4URMFFdOxTp7hWO9wwHkBtwVT9wq
         7tXLLDldD0mwis0IXSnyHNd85GBe1unUTsJm8ai3WfrbQyJXX1LdKf5lw6805ZvgogdT
         mwfg==
X-Gm-Message-State: ACrzQf16GRMa1JEcvuAdSdDfqDaVh8W4C4/H5EmB4lzsj/TCQMF+9bkH
        EL295Udq0ITkqd2aNLEX88wiog==
X-Google-Smtp-Source: AMsMyM74zvZRNI5Hqq3NMqLfW9HMu043EYDHElwdX95toU9C04PBNim+eIXBRAQvnEiO70y9a0Mn3A==
X-Received: by 2002:a05:620a:1391:b0:6e2:9d83:f2af with SMTP id k17-20020a05620a139100b006e29d83f2afmr16551273qki.537.1665509218678;
        Tue, 11 Oct 2022 10:26:58 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id i14-20020a05620a248e00b006bba46e5eeasm14289087qkn.37.2022.10.11.10.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 10:26:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 34/34] dt-bindings: pinctrl: qcom: adjust description
Date:   Tue, 11 Oct 2022 13:23:58 -0400
Message-Id: <20221011172358.69043-35-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
References: <20221011172358.69043-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop "binding" from description, because the field should describe the
hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml    | 5 ++---
 .../devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml    | 5 ++---
 .../devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml    | 5 ++---
 .../devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml     | 5 ++---
 .../devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml      | 5 ++---
 5 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
index bf84649593ef..6f9b92afb621 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,ipq6018-pinctrl.yaml
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. IPQ6018 TLMM block
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  IPQ6018 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm IPQ6018 SoC.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
index 23868cdf4e03..3874908ff7de 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8226-pinctrl.yaml
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. MSM8226 TLMM block
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  MSM8226 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm MSM8226 SoC.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
index 19d16cc9d749..5c6a0d057787 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,msm8953-pinctrl.yaml
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. MSM8953 TLMM block
 maintainers:
   - Bjorn Andersson <bjorn.andersson@linaro.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  MSM8953 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm MSM8953 SoC.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
index bdb896e5682f..5f87f15dcd1a 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sc7280-pinctrl.yaml
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. SC7280 TLMM block
 maintainers:
   - Bjorn Andersson <andersson@kernel.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SC7280 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SC7280 SoC.
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
index 2d7097edfb40..00116a045f6e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdx55-pinctrl.yaml
@@ -9,9 +9,8 @@ title: Qualcomm Technologies, Inc. SDX55 TLMM block
 maintainers:
   - Vinod Koul <vkoul@kernel.org>
 
-description: |
-  This binding describes the Top Level Mode Multiplexer block found in the
-  SDX55 platform.
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm SDX55 SoC.
 
 properties:
   compatible:
-- 
2.34.1

