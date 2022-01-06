Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 326AA486E1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 00:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343575AbiAFXxm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 18:53:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343574AbiAFXxg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 18:53:36 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8675CC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 15:53:35 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id i22so7789595wrb.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 15:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NN+qWCSZGy/v8XPK3GfGhOOy6vI+oH7th5UvnDASdeQ=;
        b=MyowuYeOH+dlLfDjZE5uaUcBxPTnfRBRICJOh5t/czuU+VLaZClLX0ohrlh4pzeWeS
         cfrAchsJsVrx5ujwif5l1fEgePWTePxsL5hlB6fG6TL+wi0CcaKkRtXhcIUcLbdmTSRM
         F02fFy4+EQ027mMrz1sRvilM7Y5WXRbP+xzEcFfTJFoNHvJz0REH3Xjn/PwX2FJNIm/6
         F0uhHpt267opCx4VdDiiLXiYZMaozT/dGF+MBUuU+46ePm4In6nvE8qLUV/VIviMz7X0
         3yEzDMfliA2rQpFgfRsD5OEolORWBBPJS0lc5pDykLL77J5JxNeaZCe7jorZ9Z6aw9Qz
         71bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NN+qWCSZGy/v8XPK3GfGhOOy6vI+oH7th5UvnDASdeQ=;
        b=5iuqDRtd0ai+KV8QpgczFY/Asj5xw0XT0uZh1xU3vwBueV4E+J0I43XkcvF28BgDl2
         sejIAIGHkeulKTQVcuNQ5lTQ73Ltg5x2quuCngy0Y/Mor+ljSb9pLeFhKABk+W7fxtrp
         WSvbJ0MH+V2AHOymfHDT3ZI8C84Y32ij2ddVyz8/48Q1yzWlGt6oIPkaPmIglx8UHhHt
         VE8xVjKdW/tUo9k1yvMJJZgmCLQnTwcgep+/Zs+DzL0lfJjPknkV0zrUru+FffWbuSIi
         PQ32sJiWV/975Sq8SnnjbyURwdKypZ/yFfHXxVpMM6B2FP8Lf0+flj9oyr0tZt4E9Epe
         et/Q==
X-Gm-Message-State: AOAM532gVEyfnK4Yih0ZARkzHQenXQiC59LMphmiBOwvgU7AEzXJL4uH
        tY8YVkl9SmHXNobu6VP9EIadXUu7RnD0uQ==
X-Google-Smtp-Source: ABdhPJxo7KxNxf9vEXrXR73eO9AbU/jeJeEHVVTtG45Z4QKqPgIYmCvY4Fbjp+8dKbnYqnw/KWhsmg==
X-Received: by 2002:a5d:65c9:: with SMTP id e9mr3555246wrw.661.1641513213897;
        Thu, 06 Jan 2022 15:53:33 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a71sm335893wme.39.2022.01.06.15.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 15:53:33 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        mchehab@kernel.org, hverkuil@xs4all.nl, robert.foss@linaro.org
Cc:     jonathan@marek.ca, andrey.konovalov@linaro.org,
        todor.too@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
        jgrahsl@snap.com, hfink@snap.com, vladimir.zapolskiy@linaro.org,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
        devicetree@vger.kernel.org, robh@kernel.org
Subject: [PATCH 2/7] media: dt-bindings: media: camss: Add vdda supply declarations sm8250
Date:   Thu,  6 Jan 2022 23:55:35 +0000
Message-Id: <20220106235540.1567839-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
References: <20220106235540.1567839-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add in missing vdda-phy-supply and vdda-pll-supply declarations. The
sm8250 USB, PCIe, UFS, DSI and CSI PHYs use a common set of vdda rails.
Define the CSI vdda regulators in the same way the qmp PHY does.

Cc: devicetree@vger.kernel.org
Cc: robh@kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,sm8250-camss.yaml           | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
index af877d61b607d..07a2af12f37df 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
@@ -265,6 +265,14 @@ properties:
       - const: vfe_lite0
       - const: vfe_lite1
 
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
+
 required:
   - clock-names
   - clocks
@@ -277,6 +285,8 @@ required:
   - power-domains
   - reg
   - reg-names
+  - vdda-phy-supply
+  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -316,6 +326,9 @@ examples:
                         "vfe_lite0",
                         "vfe_lite1";
 
+            vdda-phy-supply = <&vreg_l5a_0p88>;
+            vdda-pll-supply = <&vreg_l9a_1p2>;
+
             interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
                          <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.33.0

