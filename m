Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCA2445E5C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 04:05:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232097AbhKEDIR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Nov 2021 23:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232107AbhKEDIP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Nov 2021 23:08:15 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25C4C061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Nov 2021 20:05:36 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id bj27so6017463qkb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Nov 2021 20:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fZeAoRaneXhhVmezN+qUzGu+KZMu777A5OLUtPhYX7Q=;
        b=TTN411gYGHkdkJEnoXv3HHeDrn4/Sh7cuo1/f4djeXUF0MbV0TQRlt5xXt6mg5u45I
         9nu5UHGjoho96iE2zePTM6WOVDDJDlmuE2qxCbUyRdzlXfFfqCyGbSdAvS18xTb/FJwU
         SFaIlmtVniR106Q1kFEHxdpqbnKfGcq7dJxfm0L6lfZJkEYfdFz5YGw8a0l2fIuFpiPM
         f0YpGxmST5HFZkyh+Ue9YG0WnwVUW7vZYSxJuXZEVA7XeSLtQGIPQK0iHxPRpBxfCkOQ
         tWwY58l5o38XSbjlnqmjA8pnIJePR9Gltxi8mZ+PbamJCb0p+5OmxXURY+J9nZXZu3ym
         vFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fZeAoRaneXhhVmezN+qUzGu+KZMu777A5OLUtPhYX7Q=;
        b=ptJ27JLsw/t2uQBpG2QW8Io5MdeZ67qxaoGq7nlFBWEW+bWL23+n/bgCbmuUfw5N/2
         /1oUwVmKohrq5szNjHJUcbr5G/9nm3S505hLtpxLZXPIY11nGJRRGTYahxpR62k9bfuy
         aprD6r+Viel/+n4Zy2+P9GaCHphthx2FZGHeqYk7g8ALZC1TlKTe9/MTKTXHPEBDBRSz
         Vk53SppJPZUu8r/pdv3hOBRaO8BVs2KUOVvAAdSdm7dAd8luOwYE/w8VHGyd3MkAbDa0
         m4dEuNv+X/G4xpdrV2eoNWVqJGFsKxoPoLMCaoJWfLIhiyVtrcYcxS4HFuUn3KtxhO/5
         w4Dg==
X-Gm-Message-State: AOAM532mknq7FZlGyg4oBSaKP/TTc4uQcdKBmMadCU6Su/aTqzQaAN0F
        x9sqXyFbhT5DO8uN1dPzfS8x7g==
X-Google-Smtp-Source: ABdhPJyyzcNXoiq2HSJ+ib0DKPgEoUlfPpeHrr1NviCipx7CpPGcswMzYObcOQCBY0FZYF7jb3XdCQ==
X-Received: by 2002:a05:620a:414e:: with SMTP id k14mr44984285qko.400.1636081536205;
        Thu, 04 Nov 2021 20:05:36 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id h66sm4710807qkc.5.2021.11.04.20.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Nov 2021 20:05:35 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        jani.nikula@intel.com, abhinavk@codeaurora.org,
        Sean Paul <seanpaul@chromium.org>,
        Rob Herring <robh@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v4 12/14] dt-bindings: msm/dp: Add bindings for HDCP registers
Date:   Thu,  4 Nov 2021 23:04:29 -0400
Message-Id: <20211105030434.2828845-13-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211105030434.2828845-1-sean@poorly.run>
References: <20211105030434.2828845-1-sean@poorly.run>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This patch adds the bindings for the MSM DisplayPort HDCP registers
which are required to write the HDCP key into the display controller as
well as the registers to enable HDCP authentication/key
exchange/encryption.

We'll use a new compatible string for this since the fields are optional.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3

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
---
 .../devicetree/bindings/display/msm/dp-controller.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index b36d74c1da7c..f6e4b102373a 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -21,12 +21,16 @@ properties:
       - qcom,sc8180x-edp
 
   reg:
+    minItems: 5
+    maxItems: 7
     items:
       - description: ahb register block
       - description: aux register block
       - description: link register block
       - description: p0 register block
       - description: p1 register block
+      - description: (Optional) Registers for HDCP device key injection
+      - description: (Optional) Registers for HDCP TrustZone interaction
 
   interrupts:
     maxItems: 1
@@ -111,7 +115,9 @@ examples:
               <0xae90200 0x200>,
               <0xae90400 0xc00>,
               <0xae91000 0x400>,
-              <0xae91400 0x400>;
+              <0xae91400 0x400>,
+              <0x0aed1000 0x174>,
+              <0x0aee1000 0x2c>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

