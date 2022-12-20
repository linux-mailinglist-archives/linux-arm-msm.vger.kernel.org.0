Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2664365207F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 13:37:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233681AbiLTMg5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 07:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233576AbiLTMgr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 07:36:47 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129DF1659C
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:47 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id f18so11602684wrj.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EavGT4Puc+h0aZwFuDS/6S+WtpAyzJabS4DGaf73BZA=;
        b=vgdU3XWqu/RW55vCO1V8u3uh4aqfe3fEWyt0nWEWzNKlcuRmo3+H1wIoA0a/5atI0X
         Ejs6K/19fjsIzBWlQe8/MxNQTEBfydeKnapHyWTB6MXU4Omt4Zz60GMGt7ppDSR1rovj
         ntTMkDsJA6wiZnSqMJTSgF1vtrHD7zHtJFic5vw4FRkjY9VdCg9KvBYZBAVOV2+eQVT7
         RdhDsHwZitdjwPySCQ8qAct7j8hUhzBZVvNbVTQlRP+oB0HCMvDtUv6NWtcGyfUmeaym
         Ch7od+XnAy5J4nM83XUuRIhSjXj6wPXtWRE+poaHo9x3/SXO9aPod2AVuT6d7XekaARL
         1srA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EavGT4Puc+h0aZwFuDS/6S+WtpAyzJabS4DGaf73BZA=;
        b=t4+KP+WbacyVt8aAOneTpQe/0J4OhIzKChhOAHoPsvxKNuXBBkrKS72/YhktdUhrkn
         a0cOsZly8axyuOaLOGgsRYAEC0hvnZSVFHMiegZd8zsjM00PxDQKWo4qFqOsIHxHgPKn
         Fdx1r1zkKNH1dR6/K2qkMQCONIAbXjQqya043BtSF/8G18dHRtHWhI95vQBZlolPuBvB
         Hmz4hR2owzFeBWV+qM8Xeiq4YJaTKdsy1qsSVkSah8Hz4rii87lqlALvpZd8NMgCTfMa
         O6WLadQzyzhh2h9j3HtWoXNAvH1oz0qQzU6LpfigahDPAj7zkGBVx+8ZwqMNRnXWDPDu
         vO9A==
X-Gm-Message-State: AFqh2kqjE+v2NP0pVHRqCV2lfn0A4GkEFHCz8O9rXVcjr13SttCPaETR
        2Wqxv9O3hI3VGFkUJ40Dp571aiNavB4Gx2iGNhU=
X-Google-Smtp-Source: AMrXdXsDDzoMbqCmHInHOLoltwk/aIaW47vjVs1GGTqe7ReSVl+1Q8AG6gLhjJymA7qTamaL/6j8gg==
X-Received: by 2002:adf:cc83:0:b0:242:8d5:c6ee with SMTP id p3-20020adfcc83000000b0024208d5c6eemr1458540wrj.15.1671539806390;
        Tue, 20 Dec 2022 04:36:46 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 04:36:46 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v5 08/21] dt-bindings: msm: dsi-controller-main: Add vdd* descriptions back in
Date:   Tue, 20 Dec 2022 12:36:21 +0000
Message-Id: <20221220123634.382970-9-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
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

When converting from .txt to .yaml we didn't include descriptions for the
existing regulator supplies.

- vdd
- vdda
- vddio

Add those descriptions into the yaml now as they were prior to the
conversion. In the .txt description we marked these regulators as required,
however, that requirement appears to have been in error.

Taking the example of sc7180-trogdor-wormdingler.dtsi. The avdd and avee
come from GPIO controlled external regulators, not the SoC and in this case
there's no need for vddio to power an I/O bus. Similarly the regulators for
the LCD are controlled by the panel driver not by the dsi-ctrl driver.

It would be possible to connect a different type of panel to the DSI bus
here in which case we may or may not want to make use of vdd, vdda or
vddio.

This is also the case for older chipsets like apq8064, msm8916 etc the vdd*
regulators in the dsi-ctrl block are helpers not dependencies.

Add the description of vdd, vdda and vddio back in for the existing
upstream dts where vdd, vdda or vddio are already declared but, don't
declare those regulators required - they are not SoC requirements.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4116b3010219a..785cc51838f07 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -143,6 +143,18 @@ properties:
       - port@0
       - port@1
 
+  vdd-supply:
+    description:
+      VDD regulator
+
+  vddio-supply:
+    description:
+      VDD-IO regulator
+
+  vdda-supply:
+    description:
+      VDDA regulator
+
 required:
   - compatible
   - reg
-- 
2.38.1

