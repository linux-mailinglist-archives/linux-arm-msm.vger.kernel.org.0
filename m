Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 534275EDF79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbiI1PAc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234665AbiI1PAK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:00:10 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA752ED77
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:03 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id a2so20772298lfb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=qM++dOOdxNq2arb6uMckrS2brFOjaJGV3RM2kNir3B8=;
        b=kO4OdXiaoIFCxO3qD8o2DHgPuB6DOnejXQhxA0lKvO4OTLdTS9lpVMnhl8qU9FUbrK
         q3ofJjqcy+1+F8stypHzRnFvrzJn6YDjlgQ2jpD/+UuINqPqYAJUkvVbXhP63u26z81f
         Gi1Uh3yh7DOlVz88Mb58kbeCjCYqF6hCoeH5o8tPosPW2qg2KMHgvpIuOyeLQnOjA0gX
         rU4cHTOCi8+7gtT7s74cWb1A7mBah+JMW82Aeb7SCoHd0Wu1sSlg6Wf9XflMeq0oKbW5
         yuV/UXFGuTVak7p6h+JJoJVmagTtFG20s8lUJE/j+t+IXxhJbGMDxYfxy01fdXtr0BwH
         z5cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=qM++dOOdxNq2arb6uMckrS2brFOjaJGV3RM2kNir3B8=;
        b=0kXeL2t30HcEjrbhfXVbleapDabnF6IdcB8lrEPbf1v0J1Y6c5RnJTlswPoSZWEMdA
         ul2EwOJm+xHmSvUqjLnZEeDYb/nR8mg3CMCdEDXXGcoXWbmjm4v5kN2dnAzdpiRcdSfk
         bhZ7CATR59lQqfmDc+mk5GezpI8otpua7rGPwl3uEu4+28e/+he9t3Ym6fA0NpewGpzW
         cYROR2zMrpgHLjjrs4aVyUzCqe8UuVRtPZRbBgOTIgeRIUFbxcnHeHhrJ6Zqg4MGVW1+
         xrFReFWbhLpfAcw+t0r78PX59eDRXxPI4pBvN9SyfnC4NsgeOZXf/MpeLcFZrB3GHa0K
         jhLg==
X-Gm-Message-State: ACrzQf0tAT/m++/k7dNAp8E7rFCZAU14E5z/5UdGmfjkK7x/yMxCfxQa
        GJlIg1VC7brvi+QYY5wscDI1uA==
X-Google-Smtp-Source: AMsMyM5dvqccT2NsgQuQ02tsXZBfzXh7YPjCAI+YQBt0m87zrJfxxKh4u4SnBtrkt2BRBlPDpDkrBg==
X-Received: by 2002:a05:6512:cd:b0:49f:ba50:ec6 with SMTP id c13-20020a05651200cd00b0049fba500ec6mr12861483lfp.654.1664377201324;
        Wed, 28 Sep 2022 08:00:01 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id be36-20020a056512252400b00492c017de43sm494996lfb.127.2022.09.28.08.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:00:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 02/11] dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8974
Date:   Wed, 28 Sep 2022 17:59:49 +0300
Message-Id: <20220928145958.376288-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
References: <20220928145958.376288-1-dmitry.baryshkov@linaro.org>
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

Define clock/clock-names properties of the MMCC device node to be used
on MSM8974 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 03faab5b6a41..78473475c68d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -99,6 +99,44 @@ allOf:
             - const: dsi2pllbyte
             - const: hdmipll
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-msm8974
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: MMSS GPLL0 voted clock
+            - description: GPLL0 voted clock
+            - description: GPLL1 voted clock
+            - description: GFX3D clock source
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+            - description: eDP phy PLL link clock
+            - description: eDP phy PLL vco clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: mmss_gpll0_vote
+            - const: gpll0_vote
+            - const: gpll1_vote
+            - const: gfx3d_clk_src
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+            - const: edp_link_clk
+            - const: edp_vco_div
+
   - if:
       properties:
         compatible:
-- 
2.35.1

