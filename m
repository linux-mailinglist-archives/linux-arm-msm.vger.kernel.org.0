Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF7406C866B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 20:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231974AbjCXT4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 15:56:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232008AbjCXT4i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 15:56:38 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8029220D3D
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 12:56:27 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-544f7c176easo52367297b3.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 12:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679687787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ8XMXUhDPNrl814nUboxXrW9LkyTici68uktBtSFp8=;
        b=P2zFpErnEFQsp7uPKvsd3TV5DcP5rEYW4cUIR/DZg2F7Bjo6Fuo7TB81xa4HUve9mN
         f83wkGhGCLXt8pH/1NA9mpjGLxNwwWWLuHuVctnuEOdYIwAA+YedxbsIijurA1cI4QmS
         6AA07fYrVRdkiyJ5UKRqq7ba8hcI44Krtm/Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679687787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ8XMXUhDPNrl814nUboxXrW9LkyTici68uktBtSFp8=;
        b=AUAB4+XAqExXMfNhna7Gc+YM1GAk6tnkj3/kGjiCOTGwdC+P1XjpMDiwmY8md1/8EX
         GmtXJNFtEEGtzLwTTOR352jrgsP7eF+Q9BOgTbmAk4GeJ6vyhjvskINsyHca61eyzECp
         TKfBYDxQICHV19eE7/xjKd79BqqrbqX+Nd/oce2srrYJ+HtvJzzoWcrljwL3f2RgtCPD
         Qn/ne1nQopIkZ9EBNO3fF50P+7pW9W5sgalya+DqD4/8IDWvZ6g1qlB+I94ynQTpV4+B
         rDkrANnVnTtnieGVUw9XjDZ4wvaMIyrgerID0gIf3KevlfjoRclYZP4pW4S1Xi4BjUtg
         Ydmw==
X-Gm-Message-State: AAQBX9eJCMGfp0s1f6twQuyTC+LUmuhL70JBVJ2MIp9d2RiWZOEVMCpE
        81sZuaM7+uNdFW3jh4wMVP/UxQ==
X-Google-Smtp-Source: AKy350btG7JZAXhOS+MiHIcxvyNWthfjiPWQRq04uR4hey+5zvIW3E5kjhsx4yNIl9eMj7A92K+cIQ==
X-Received: by 2002:a0d:e80d:0:b0:541:a219:2b61 with SMTP id r13-20020a0de80d000000b00541a2192b61mr3298134ywe.35.1679687787185;
        Fri, 24 Mar 2023 12:56:27 -0700 (PDT)
Received: from localhost ([2620:0:1035:15:5509:ec45:2b32:b39f])
        by smtp.gmail.com with UTF8SMTPSA id o19-20020a81ef13000000b00545a0818500sm579522ywm.144.2023.03.24.12.56.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 12:56:26 -0700 (PDT)
From:   Mark Yacoub <markyacoub@chromium.org>
X-Google-Original-From: Mark Yacoub <markyacoub@google.com>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc:     seanpaul@chromium.org, suraj.kandpal@intel.com,
        dianders@chromium.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Rob Herring <robh@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Mark Yacoub <markyacoub@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 08/10] dt-bindings: msm/dp: Add bindings for HDCP registers
Date:   Fri, 24 Mar 2023 15:55:52 -0400
Message-Id: <20230324195555.3921170-9-markyacoub@google.com>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230324195555.3921170-1-markyacoub@google.com>
References: <20230324195555.3921170-1-markyacoub@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

Add the bindings for the MSM DisplayPort HDCP registers
which are required to write the HDCP key into the display controller as
well as the registers to enable HDCP authentication/key
exchange/encryption.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>

---
Changes in v2:
-Drop register range names (Stephen)
-Fix yaml errors (Rob)
Changes in v3:
-Add new compatible string for dp-hdcp
-Add descriptions to reg
-Add minItems/maxItems to reg
-Make reg depend on the new hdcp compatible string
Changes in v4:
-Rebase on Bjorn's multi-dp patchset
Changes in v4.5:
-Remove maxItems from reg (Rob)
-Remove leading zeros in example (Rob)
Changes in v5:
-None
Changes in v6:
-Rebased: modify minItems instead of adding it as new line.
Changes in v7:
-Revert the change to minItems
-Added the maxItems to Reg

 .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 774ccb5184b88..c47ade3a4ae17 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,8 @@ properties:
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: (Optional) Registers for HDCP device key injection
+      - description: (Optional) Registers for HDCP TrustZone interaction
 
   interrupts:
     maxItems: 1
@@ -158,6 +160,7 @@ allOf:
         aux-bus: false
         reg:
           minItems: 5
+          maxItems: 7
       required:
         - "#sound-dai-cells"
 
@@ -175,7 +178,9 @@ examples:
               <0xae90200 0x200>,
               <0xae90400 0xc00>,
               <0xae91000 0x400>,
-              <0xae91400 0x400>;
+              <0xae91400 0x400>,
+              <0xaed1000 0x174>,
+              <0xaee1000 0x2c>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
2.40.0.348.gf938b09366-goog

