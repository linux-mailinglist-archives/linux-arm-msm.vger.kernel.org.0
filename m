Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571DC5619EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234703AbiF3MJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234702AbiF3MJA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:09:00 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 091C1220E5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:57 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so1520497wmb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tkO7+eWy2ajU0U0Nw4Lp72hNN32+JTLNsyjuRV2jhBU=;
        b=sK0CAukDTWACoQtJfMyFzJ3PG/JOH8MqpXMYQA/NMqS86Ozt6beCfW1ean69vMDTvY
         QrbAxJeq1oyQxXSwPABP7oL8PC9MeyrLHeCjkwWSjpgy6KdjVMxdAtaqsxsCSN4Uu+hT
         Ss/3czz6km3T2Erk4XxuX7WajyqSDY8FAFaPRAde5utsskpye+gmtb/5g3K+satVmjER
         HubKyT5l6SomqJmaet0ez70gvmJuoW3hJyVaRRsrulfPVR0OIW9NXsquZ6nklkF52eFT
         9IHDVJRfKySd+w+nW+YxBAXl8imBpVgyCB83i9jn4fM18rmXJjgN4bfraI5J2b48UJ3Q
         gaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkO7+eWy2ajU0U0Nw4Lp72hNN32+JTLNsyjuRV2jhBU=;
        b=umN28H2ATJc8MkYXF+MEvMJ/NRClgR/+Sz7s7q39j0bCCekWrJZDGdu5EJgTO/B9is
         4J0pAxSJrYbDpaz3hYUnoiv5e/vkuYyZUPrSoPGVnREOn6fyA8AmPFCfD3/eVn1hskNq
         EivcRm6sBy0TJ2ohMEfLDNL3sdYtb0CqR81Di4iPUlYItbXGRRLZPEu88Pt0qstNuqG8
         qF7n2h3s+rhUMnCpF2WAIJIsKEZ+d0j3+WlBuuZUIJNMH0mPNp4I4/Lq1e/WkC2j7hR3
         lZuyrLpbRCvoy0ZZE1lz99QzjN5hmpOGOt/4E1kU3RZ8R+Zuuphcnub7+mBazaVGua4o
         pk4A==
X-Gm-Message-State: AJIora9Iaa+MPm36sQmtSoHIHf9VD+Fu8YlL1tTO0GLHff9mN92cOBaL
        S8AX1ms6D+KZGCvEdNPTuXCA5w==
X-Google-Smtp-Source: AGRyM1uGKVKbziLy2t2BlcrLr0mk26fcsPQY7sqpIVNX4XJVkw9hpX1thprzgTd3GKF6NI4k0lSu+w==
X-Received: by 2002:a1c:7c16:0:b0:3a0:4c5f:ce13 with SMTP id x22-20020a1c7c16000000b003a04c5fce13mr9624027wmc.73.1656590935626;
        Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 6/7] dt-bindings: msm: dsi: Add missing clocks to 28nm DSI PHY YAML
Date:   Thu, 30 Jun 2022 13:08:44 +0100
Message-Id: <20220630120845.3356144-7-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
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

Add in missing clock and clock-names declarations to the 28nm DSI PHY.
When converting from .txt to .yaml we missed these.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-phy-28nm.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
index 3d8540a06fe22..9ecd513d93661 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
@@ -19,6 +19,21 @@ properties:
       - qcom,dsi-phy-28nm-lp
       - qcom,dsi-phy-28nm-8960
 
+  clocks:
+    minItems: 1
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: iface
+        description: AHB clock
+      - const: iface_clk
+        description: AHB clock
+      - const: ref
+        description: Block reference clock
+    minItems: 1
+    maxItems: 2
+
   reg:
     items:
       - description: dsi pll register set
@@ -36,6 +51,8 @@ properties:
 
 required:
   - compatible
+  - clocks
+  - clock-names
   - reg
   - reg-names
   - vddio-supply
-- 
2.36.1

