Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF56451660
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 22:20:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347026AbhKOVXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 16:23:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243584AbhKOUe7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 15:34:59 -0500
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1286EC04318E
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 12:21:54 -0800 (PST)
Received: by mail-qk1-x736.google.com with SMTP id o63so4945278qkb.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 12:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5o8M4nFYDYsXR2dAp4MjnyBhftAYPugH5C5KzkFvDAY=;
        b=eXQOHRDYDbMhSygSwb1AraY3AWGEdei454ZaQccAceVCTSwuCDYUxKcBnznvL11mUB
         IG6Gsp8ElDGMw0JjWSt7gr4NXS3o/1RgahiPVqOkhjZVeEFAvIZ+PYRUnkFeHU5kurwd
         X/rlEdoZ6TlsCMlNbNDQG43iQbZMF56osDjJbUjMwMid6EH4vTC6QkDMuWCjXjv1p7+V
         7Y6RKuaUq6sy1EnkmPls9Bmwh1gBQJNqmxmcCA/U8YjdnxAkpgmfVJWg1h7sQjwGexsw
         XzSfmYr981gGtmPXkhn2cBQTd6riVWT78of7aqQAqXiEtrrVKg0Nbb+wWy61gDFyvOJm
         OixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5o8M4nFYDYsXR2dAp4MjnyBhftAYPugH5C5KzkFvDAY=;
        b=KjMEqB/svdesLPh1LxzlMC7fISvUO+aMupCTC7ShHFZclpkB/+3Ck7TT7iWEf/XIDC
         JB3B9sRqoNJyDJSHhz1bbEnv9sv/LIHTywhpqOF8ew+QgtslfW/9a6ywvjtc/I5gDeu1
         /zDd06yg8yFxtSFpgC+zTcTYR8/mWUnKEckN1fI5zpYc3vkzS7nt4+X8TbnwSCEbTPPL
         1Q0kysFt9mOZHKwcbL8py6xBkhYDH1D8+AI5BKDkO/sSh5GqHwNlwD5c6QWtYCxb0ow+
         GWFfuMgkFFmESSdFwTPpxZiFdbBkYneIqsnyE5pZk0n/UCY0Nm+o9RwE33X83CC2dzoD
         PU4w==
X-Gm-Message-State: AOAM532dLH1WQSwgjv8KXh/i5RTyyLM2GEZ7Kgi1ZcRYFORViF9dfoaZ
        uxNpbSdaDuQF9husAfi02nVUPg==
X-Google-Smtp-Source: ABdhPJzv1kubhtztfKiDVpyMZPRNywUjLC7v4bCYsxPDUvwntv2nGtkJYzSCWj+8Kn6sZWmwu60FDg==
X-Received: by 2002:a05:620a:4712:: with SMTP id bs18mr1540805qkb.246.1637007713882;
        Mon, 15 Nov 2021 12:21:53 -0800 (PST)
Received: from localhost (29.46.245.35.bc.googleusercontent.com. [35.245.46.29])
        by smtp.gmail.com with ESMTPSA id t11sm6851413qkp.56.2021.11.15.12.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 12:21:53 -0800 (PST)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     bjorn.andersson@linaro.org, swboyd@chromium.org,
        jani.nikula@intel.com, abhinavk@codeaurora.org,
        seanpaul@chromium.org, robh@kernel.org, robh+dt@kernel.org,
        khsieh@codeaurora.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v4.5 12/14] dt-bindings: msm/dp: Add bindings for HDCP registers
Date:   Mon, 15 Nov 2021 20:21:48 +0000
Message-Id: <20211115202153.117244-1-sean@poorly.run>
X-Mailer: git-send-email 2.34.0.rc1.387.gb447b232ab-goog
In-Reply-To: <YY7lb9k2UArZf7I/@robh.at.kernel.org>
References: <YY7lb9k2UArZf7I/@robh.at.kernel.org>
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
Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-13-sean@poorly.run #v4

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
---
 .../devicetree/bindings/display/msm/dp-controller.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index b36d74c1da7c..aff7d45ba6ed 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -21,12 +21,15 @@ properties:
       - qcom,sc8180x-edp
 
   reg:
+    minItems: 5
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
@@ -111,7 +114,9 @@ examples:
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
Sean Paul, Software Engineer, Google / Chromium OS

