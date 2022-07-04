Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99375565A6A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 17:54:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbiGDPyE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 11:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234446AbiGDPyB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 11:54:01 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A46E0A3
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 08:53:54 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t24so16476560lfr.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 08:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Z+AMU7vrtO5o4KexqAVpmPzeKjXxbfUDDVj5eR8YgE=;
        b=tltxeR89R1d+E3RURTaxpdDoiJn4DSTbPHpx6diJsRiLXHVybPSAyLL//SE4l71Ypl
         6IZo0+9XJuYSg/limrLsM3a2uroEh1O69dz1ge8rEC0TTM8EZ8Pi79wJTm2kUN0HABXc
         hpt+R39HqM4q38zOUeUEuCn5KItxa+TtvM06JOT9plxulPOHPlkGR6Lvzw+eGuyO1R1S
         FviYHAJkadAtBnzHExVRtIBJwMBIF9q0Bgc7DJGSLGE/PBsMKGVb0Tw2U63pLy4/4tZl
         1XJEafUJlU3DkKpyo41Re3mG0hEwLWHPHeNLOj4x6yWm60/RgAZZyuCFlRI+4TIDkvhE
         XU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Z+AMU7vrtO5o4KexqAVpmPzeKjXxbfUDDVj5eR8YgE=;
        b=T0l9Nlljc3XvQsAn2o5vRjy03ZBftB/4rUIaFfx2eW6IEOXGR9H/n+pbtADUl3OjHp
         VcUnibZ0QDDwqgPZR5CSxRmAx4MBxjUHsi0Q9y5P3deKZeotWI7bEBkqNQEMNUJXqapb
         nqS69V2ySwXl3kth0ax5iIRpri3As86xjk3KWGMzwHJFBxhEipc9DkAWEwD9cprsN5lX
         W6Urz6x2B4GMtJUYY583UK2rWFNQagRyKLOQ9bSKseIBdm+16lrMwfuNd9VkphIkqysr
         zghKKoWOk9tHOtmFgE3t+istlg0whHq5W3QuImm7/jDRsa6qVQdyccA+yQ99THXPMhXD
         vKvQ==
X-Gm-Message-State: AJIora+Dq4dxtYVYNet3WB+peOcuYBGtgfUiT4oY6U6sZbzlFAh4qq9Q
        j4Z0tJIIaNcwJ5NSQ7ZYJ/PG9w==
X-Google-Smtp-Source: AGRyM1vdkO1x8qCRZPGAnR9xLJk/uqAcc/VAtw2Dsr/5duY6ujaitJlQpl2a4qHjOS/8nvZwKrIUvw==
X-Received: by 2002:a05:6512:3f27:b0:47f:a079:eeec with SMTP id y39-20020a0565123f2700b0047fa079eeecmr18525027lfa.46.1656950032922;
        Mon, 04 Jul 2022 08:53:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s6-20020ac25fa6000000b0047fbf4c8bdfsm5016165lfe.143.2022.07.04.08.53.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:53:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: clock: qcom,mmcc: define clocks/clock-names for MSM8996
Date:   Mon,  4 Jul 2022 18:53:49 +0300
Message-Id: <20220704155350.812319-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704155350.812319-1-dmitry.baryshkov@linaro.org>
References: <20220704155350.812319-1-dmitry.baryshkov@linaro.org>
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

Define clock/clock-names properties of the MMCC device node to be used
on MSM8996 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index d02fe6dc79b5..f1d8325be4eb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -31,11 +31,11 @@ properties:
       - qcom,mmcc-sdm660
 
   clocks:
-    minItems: 9
+    minItems: 8
     maxItems: 10
 
   clock-names:
-    minItems: 9
+    minItems: 8
     maxItems: 10
 
   '#clock-cells':
@@ -113,6 +113,35 @@ allOf:
             - const: dsi1pllbyte
             - const: hdmipll
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mmcc-msm8996
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Global PLL 0 clock
+            - description: MMSS NoC AHB clock
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
+            - const: gcc_mmss_noc_cfg_ahb_clk
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+
   - if:
       properties:
         compatible:
-- 
2.35.1

