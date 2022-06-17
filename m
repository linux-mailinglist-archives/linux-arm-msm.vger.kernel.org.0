Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C88B54F78B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 14:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382277AbiFQM3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 08:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236617AbiFQM3a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 08:29:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B980E4BFDA
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:25 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id c2so6753332lfk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M4AQh+bAvu+Zh7HRjgwZPxuz/E+WPBnd3QNkdPlKR2k=;
        b=I8RB2XA+Ew9qY+812tOI8r4eqa1ng/Uwm29/nrAScpyK5nZ8MqaicwhAYBmwVfdGuL
         YQCwGsYdNQYwVqZpiWIe7mt1zvUpb5e1Olg+sbJcgBqybtEGZK8bz4XKbDtuZP0uf4fp
         bedsdG8i+Eyi4zJiDX+/jpeVdt5VP6NLhjq0dEUQ2EfOMad2z9xnbWJI+2BCovsT7A6u
         97tsdFI5C3FbhMpV+pf8vir7XCOBTgvwN8Ccx817YWyQxcrLwXlK0EiNNwBL/pxWPEmI
         aduLg2McJhKNz3kqU9b9bMgVdM7hw77k/e7Z3vsh4xC59B0SM94xOhGuZDMTAC3uO54O
         OVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M4AQh+bAvu+Zh7HRjgwZPxuz/E+WPBnd3QNkdPlKR2k=;
        b=HV2Z/iQf4FFJXerjPRCeEV1Cp9nBPK9bbeKlRB3QtSVXjoD/+KJobvWhEzm0x3tcx/
         cT7R26NUCxgHbaHggDY/KqAaI3kLJt1ancx3h1pNib9+usTZ6JyW+IMyGFmlCCIz/w1b
         uohn5c9n7SKP11bQlLQpgg/1vaIXqFzUr7QfjBxA02WrY5h0apECi+0oAuEuiuCfBqjc
         j2NR7lACADdS9XbcZYtK9ZmhrriqFkmU+7vznNgs6rIXbBfdU1/pB00P6CANVcJ+dKS0
         ACy6f3EvswLMjsZZdJdGd39YgH6bjHxUeZtAHZOGn2uY83w/GZ9VDN8tMhOAH7EyBBoL
         F3bg==
X-Gm-Message-State: AJIora+3WQ34XaGVyDNgt7XL0qiedUSWNrlDUnodujogx2czcWoAkfb/
        dGgkw9TB9u3vKoHkUmnUN/bf+VsfvpwX3lmV
X-Google-Smtp-Source: AGRyM1sGotD83M1ervvta2Zu2ZtZMUp/8jq6fWOPWXWw6+4bAR9zPI1VH0snd9eUA7AUugCuPCurHg==
X-Received: by 2002:a05:6512:1085:b0:479:7d28:3284 with SMTP id j5-20020a056512108500b004797d283284mr5402710lfg.592.1655468964076;
        Fri, 17 Jun 2022 05:29:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b8-20020a2e8948000000b0025568a2a018sm539471ljk.129.2022.06.17.05.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:29:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 1/6] dt-bindings: clock: qcom,mmcc: fix clocks/clock-names definitions
Date:   Fri, 17 Jun 2022 15:29:17 +0300
Message-Id: <20220617122922.769562-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

