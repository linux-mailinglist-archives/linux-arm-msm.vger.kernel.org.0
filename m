Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D13E955AD72
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jun 2022 01:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbiFYXZa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Jun 2022 19:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233686AbiFYXZ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Jun 2022 19:25:26 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CAC12636
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:25 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id bn8so6830719ljb.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jun 2022 16:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sEhrVNP4ho0a6wzg1hnkprZhy63vathkG01hxy93+fM=;
        b=r+tBaIp3OCvknjpU5NF+TwgdnsAdEC+S/LB7683mI9TdRtWb4hAhq0rlfgzriG4m2G
         QKIaPDgn9EgR4PmMQxJuuYFMYn8NbR1xvHstmWCCE+L1KnOnh15tgt7QxvZXnGsPYQY3
         Rs42BNwARr//kfVoWUf9EdQaQuLuq6GC/vJTNJIP2LY9v+BHlz+YO6dpRmvsjUfiGm6E
         h3lFuC0VYlPbbEv3HExuJBRCPKuq8AYR3A7gcO1FZ9fWWtOSLG4LXmvWwjZhW3YZ/7n1
         HZYZQwCPq9rcLP8etglqfiXk4panH+J+tHhQ6iSrxHWgZCn5r17i5ytLXkxlFxOpc7le
         T8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sEhrVNP4ho0a6wzg1hnkprZhy63vathkG01hxy93+fM=;
        b=PVrPVuBI7TX8Roc8sU99CvKFrMyQeQzPyZeUj0QQoGgMt/V2LnyIiTSlDZHtaPJsDa
         DOOL9E/tDNnM4FBh5Hct7Ojv8r+DNu27LdXBb7RMbwMKBwxWy1Z/VkCdHN5ec3BVyODp
         2XhL9vpbabAAi142pi26MITRr0wyY9xLSk05FMmU1qb/hG0tG2ZpIxfaVIwih/FjP27S
         dsi3DRpu6dV5g79JRnho/twNzejkzZ1Qs924U2UK9E2Xo6CmajGHUQzK84ytVElgev+D
         11am4UwnsGWjLliwGizbNoDNc7jsnVvsmO+xXCwDEiVNd171ptn6E+e/VOEvxflrHPDz
         56YA==
X-Gm-Message-State: AJIora8YL0VRm2+HzFwfzLMFx5dycV82Ffuz365LoVb1qsNz/INXA0RP
        8WwbfGS/tcuNtVk3qAW1gWAlfEZBdHL/aHQo
X-Google-Smtp-Source: AGRyM1scWr55DMLw7LMTumP/EB6qyNN54qt7LcCEaF2EEiEPYp2TeJ0HLcQV5tAbVY71hlW4fobTXg==
X-Received: by 2002:a2e:bf14:0:b0:255:b789:576b with SMTP id c20-20020a2ebf14000000b00255b789576bmr3141976ljr.47.1656199523688;
        Sat, 25 Jun 2022 16:25:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s8-20020a056512202800b0047f750ecd8csm1093694lfs.67.2022.06.25.16.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jun 2022 16:25:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 08/11] dt-bindings: display/msm: add mdp-opp-table to dpu-sdm845
Date:   Sun, 26 Jun 2022 02:25:10 +0300
Message-Id: <20220625232513.522599-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
References: <20220625232513.522599-1-dmitry.baryshkov@linaro.org>
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

On SDM845 platforms DPU device tree node contains child object
mdp-opp-table providing OPP table for the DPU. Add it to the list of
properties to let sdm845.dtsi to validate.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml      | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index 0dc16326bf8e..cc95adcf8f11 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -50,6 +50,10 @@ properties:
     maxItems: 1
 
   operating-points-v2: true
+
+  mdp-opp-table:
+    $ref: /schemas/opp/opp-v2.yaml#
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description: |
@@ -116,11 +120,12 @@ examples:
                           <0x0aeb0000 0x2008>;
                     reg-names = "mdp", "vbif";
 
-                    clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                    clocks = <&gcc GCC_DISP_AXI_CLK>,
+                             <&dispcc DISP_CC_MDSS_AHB_CLK>,
                              <&dispcc DISP_CC_MDSS_AXI_CLK>,
                              <&dispcc DISP_CC_MDSS_MDP_CLK>,
                              <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
-                    clock-names = "iface", "bus", "core", "vsync";
+                    clock-names = "gcc-bus", "iface", "bus", "core", "vsync";
 
                     interrupt-parent = <&mdss>;
                     interrupts = <0>;
-- 
2.35.1

