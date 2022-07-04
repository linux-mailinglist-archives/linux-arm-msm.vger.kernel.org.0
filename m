Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08068565A68
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 17:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234575AbiGDPyD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 11:54:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234296AbiGDPx5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 11:53:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7DABE087
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 08:53:53 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id z13so16396808lfj.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 08:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M4AQh+bAvu+Zh7HRjgwZPxuz/E+WPBnd3QNkdPlKR2k=;
        b=KyTndNvVK3W45qGN4qZ+EbTVzFVPyK3JlCtuujhqs/hDkVgCnDe5vS/6bT7274rQ71
         FdAqpvyDTL9VCG57cAUEF3VnFhRzosrHfBgN/p5UU4mm9N5Bguvvke8LpzQD6ZYmmn5v
         N7aWkqo5Lo4HUfBOXPQvl2Zwdw/DKL2XnPG3aQZzc5bPCdA/4+XfuNNjKFTZg0rwSTzc
         3YGWL3w66EzQdVjs95+4hnrLqEPwL6lbI2i6+HrFq2N2bmKHRMiAv2Zs0VKCII5TSruW
         uW4+qdda2VDxcpmAJ8iEx53IIpMhVV196Djndi8XjLAnyltpXODYX2kyy5JqjrgQnvE9
         4lgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M4AQh+bAvu+Zh7HRjgwZPxuz/E+WPBnd3QNkdPlKR2k=;
        b=EJWOwKEE5XlFky/DHy7ZMYy7HirqCiB7bMT/4JmVEww0HFJmidTuAZJk2cSlKphVY/
         4YxugW7CBiFEKJzzMPo+wG1XnFtvoql8OZvaipisCvG+2Qju1UiZv1Buau2hz2cX7Ump
         ln/6FhC3ZVtrPPHK4T65RKZnD7XzcKjW/L+7AC3OOrOxW5rYWM/jso7NG4UjGWCPImnP
         mAKjUbB7S9UF3f+RIlredibdwj7apcIKS9CQ1V9dYiGuC6u89w8zJJwJGXHYwk1X803d
         zgS/Md69OtVMkidLvm0Ghc+uuL02zHWWgRMjoY3xC4c8DPF2AytM29h7VotePEsibiEW
         4h6w==
X-Gm-Message-State: AJIora8r3pOg6tYuDVpyIdBk3p1uf+7DuL5p3bzPs9zEIQ8aQF7JpEjY
        w0sqCV6giKczlQJ22P0uguU7iA==
X-Google-Smtp-Source: AGRyM1vfBimAkT/g1Bg54+/S33Ss2ZECLv0HS54Mw/JTDZ4f4AS6qH23DLaOJzVYHt57SDvy+odwaA==
X-Received: by 2002:ac2:47fb:0:b0:47f:79a1:5c01 with SMTP id b27-20020ac247fb000000b0047f79a15c01mr18985361lfp.561.1656950032009;
        Mon, 04 Jul 2022 08:53:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s6-20020ac25fa6000000b0047fbf4c8bdfsm5016165lfe.143.2022.07.04.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:53:51 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: qcom,mmcc: fix clocks/clock-names definitions
Date:   Mon,  4 Jul 2022 18:53:48 +0300
Message-Id: <20220704155350.812319-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704155350.812319-1-dmitry.baryshkov@linaro.org>
References: <20220704155350.812319-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rather than defining (incorrect) global clocks and clock-names lists,
define them per platform using conditionals. Also, while we are at it,
mark these properties as required for all platforms for which DT files
contained clocks/clock-names for the MMCC nodes from the beginning (in
addition to existing MSM8998 this adds MSM8994, SDM630 and SDM660).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 133 ++++++++++++++----
 1 file changed, 109 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 32e87014bb55..d02fe6dc79b5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -31,30 +31,12 @@ properties:
       - qcom,mmcc-sdm660
 
   clocks:
-    items:
-      - description: Board XO source
-      - description: Board sleep source
-      - description: Global PLL 0 clock
-      - description: DSI phy instance 0 dsi clock
-      - description: DSI phy instance 0 byte clock
-      - description: DSI phy instance 1 dsi clock
-      - description: DSI phy instance 1 byte clock
-      - description: HDMI phy PLL clock
-      - description: DisplayPort phy PLL vco clock
-      - description: DisplayPort phy PLL link clock
+    minItems: 9
+    maxItems: 10
 
   clock-names:
-    items:
-      - const: xo
-      - const: sleep
-      - const: gpll0
-      - const: dsi0dsi
-      - const: dsi0byte
-      - const: dsi1dsi
-      - const: dsi1byte
-      - const: hdmipll
-      - const: dpvco
-      - const: dplink
+    minItems: 9
+    maxItems: 10
 
   '#clock-cells':
     const: 1
@@ -89,13 +71,116 @@ if:
   properties:
     compatible:
       contains:
-        const: qcom,mmcc-msm8998
-
+        enum:
+          - qcom,mmcc-msm8994
+          - qcom,mmcc-msm8998
+          - qcom,mmcc-sdm630
+          - qcom,mmcc-sdm660
 then:
   required:
     - clocks
     - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mmcc-msm8994
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Global PLL 0 clock
+            - description: MMSS NoC AHB clock
+            - description: GFX3D clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: gpll0
+            - const: mmssnoc_ahb
+            - const: oxili_gfx3d_clk_src
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mmcc-msm8998
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Global PLL 0 clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+            - description: DisplayPort phy PLL link clock
+            - description: DisplayPort phy PLL vco clock
+            - description: Test clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: gpll0
+            - const: dsi0dsi
+            - const: dsi0byte
+            - const: dsi1dsi
+            - const: dsi1byte
+            - const: hdmipll
+            - const: dplink
+            - const: dpvco
+            - const: core_bi_pll_test_se
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-sdm630
+              - qcom,mmcc-sdm660
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board sleep source
+            - description: Global PLL 0 clock
+            - description: Global PLL 0 DIV clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: DisplayPort phy PLL link clock
+            - description: DisplayPort phy PLL vco clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: sleep_clk
+            - const: gpll0
+            - const: gpll0_div
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: dp_link_2x_clk_divsel_five
+            - const: dp_vco_divided_clk_src_mux
+
 examples:
   # Example for MMCC for MSM8960:
   - |
-- 
2.35.1

