Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 196A865ED60
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 14:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbjAENlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 08:41:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbjAENlj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 08:41:39 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4272733D45
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 05:41:37 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id g13so55047432lfv.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 05:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQ7X5RC/xt3ztwEpoWTfHOaHTrslfeBfNNQN9mrWDrY=;
        b=BUENKSe6EOHsnHRXqgMXEiaeLcUF8+hRbMqq/8KbXJ1zK2HKcUJsp/2P6VRhN/L9pm
         mMJvBCGw5D2/he4NVHh4ha5qY5wQTUZMZgZt5LQB+o7vk4uEiWXz5Z51KktQPtC0ItbU
         qvK534xjtxxHmQubtWZnHwRuvJcF7xV1wmR/eDJ0/jpyb5nzu1EdtNySerazgaZ0WhBh
         gNG79kipD+FvP4q+3mNt3IgaVKp8vVJfrngjDthQ0c5NeqME7o0SG0gg34ivvmt4AsUV
         LvWJPhbQrnbNVKpUKzMo0zXlLLOnj2Gi8H9uvm+rZqueFUAsFu3PCW3q4oMBK/eeSyul
         aATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQ7X5RC/xt3ztwEpoWTfHOaHTrslfeBfNNQN9mrWDrY=;
        b=f+AZUpwfbRkL7Ae1q+sbFR+iZp6C5IZ5vix/yQvMvB2+gxbs5oEIuGPPNJIs9UFYYa
         yt/06JuKbGX2kUzdUk7N1caM6QTzgtVBszxR7tOuYRtfDyDAzE/4VCGghbL7o0e/CVSo
         +bWjjJD5MngUYXoExYZvZ/9PZBmdK2QBvK3/6f+sfozHSzYqGytfylmBlmoIJZZ4b1VZ
         JSk1QHogGBDuKavNwvXTIWGrV2wMgTo0R22HN7RtSu6ik0ibXRO8Efl5SViQnpZQ5bPI
         DcnDhkKIlGA+XRj3G7e31DLIECQVYjChVN6/KcW0BrImQHid07XcoiQoznoNOCJcH4Za
         qmrQ==
X-Gm-Message-State: AFqh2kqKFNKfPJxiFoBk3AApeo5W9O60FdvlZojLCvYszbiJaI+gutRV
        gc0dakgV4rOW3l+r7N1RnOU/5fiOC6IjD0x5
X-Google-Smtp-Source: AMrXdXtKwoNfZpnEcWQpgFeIdcrYRCNNgRMvE8E/54uTkIvb3tWgt4IXZcOgK4JASLudWiGPh+IWjw==
X-Received: by 2002:a05:6512:3f1e:b0:4c0:91d0:e7ab with SMTP id y30-20020a0565123f1e00b004c091d0e7abmr15810791lfa.28.1672926096379;
        Thu, 05 Jan 2023 05:41:36 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm5461315lfb.12.2023.01.05.05.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:41:36 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH v2 03/12] dt-bindings: clock: qcom,mmcc: define clocks/clock-names for APQ8084
Date:   Thu,  5 Jan 2023 15:41:24 +0200
Message-Id: <20230105134133.1550618-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
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

Define clock/clock-names properties of the MMCC device node to be used
on APQ8084 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 44 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index e6d17426e903..c7a3cca5b126 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -32,11 +32,11 @@ properties:
 
   clocks:
     minItems: 8
-    maxItems: 10
+    maxItems: 13
 
   clock-names:
     minItems: 8
-    maxItems: 10
+    maxItems: 13
 
   '#clock-cells':
     const: 1
@@ -137,6 +137,46 @@ allOf:
             - const: edp_link_clk
             - const: edp_vco_div
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-apq8084
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board sleep source
+            - description: MMSS GPLL0 voted clock
+            - description: GPLL0 clock
+            - description: GPLL0 voted clock
+            - description: GPLL1 clock
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
+            - const: sleep_clk
+            - const: mmss_gpll0_vote
+            - const: gpll0
+            - const: gpll0_vote
+            - const: gpll1
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
2.39.0

