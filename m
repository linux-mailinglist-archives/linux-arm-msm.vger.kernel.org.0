Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 681E23F7E69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 00:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232848AbhHYWZe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Aug 2021 18:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbhHYWZc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Aug 2021 18:25:32 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F334C0613C1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 15:24:46 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id s20so1605996oiw.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Aug 2021 15:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vXLLp5GIbOEgi1J75PRebsAuxo8nGrsWkSS0/ujVn1w=;
        b=lmAfSC2C4y4sGEBFjrDXuzJzhQOQyubDGp7PohABf7xAjOKBnEoY1LXs7EQtQ936LU
         K4gVPvR7wk3xiaRIbCF9TNFaSH7LOzwH37FtYfcNAEp5MbCcGtyJUQSoVXedi+y/xZQw
         EhIxcTEPMdcR6wYGjR/dhpUTZ/pC3+nkgIxwYRQNoOf45s17kbktLkIq0w24s0yYsJPv
         ZvusE/wXq7V0Y/ZGMOEUg94DN8e3Z+veiqQTJ2BHfGwHasOmkBiP0YZoOE9V7hCZhW5I
         DdMy8zGVug/mo3IfMj+L6vQi5eB9pGKvB+1ogeSDYXLSlytC03HEcr+UPZ4OvPOgNrMt
         DFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vXLLp5GIbOEgi1J75PRebsAuxo8nGrsWkSS0/ujVn1w=;
        b=SCBn5QQJyDUNGl0f+7gf4iXADsJ+EUnXa9Kr7ASRc5d24M6imYzuPHHJa7gm7J5kxn
         4rP8myuoq1MScHQpRVQaMVArnpPVT3wGRJ2ygk25Mcw464Qc6DTYrCPJGPbFovZ3YhIQ
         8Mg4M8ONdcq4Q/J26LM4fBxv8CaH85oEp3eAN9nmT/UiWQiniea/SqWXvP1xEECmMig5
         Nz6mNn3S1zaQDQ4LJFm7hHh2Wp52UlY5ETzS2KCQeu/R/DFOjQDidcj/fbeUvpiT8vEi
         Pt76YK8DNA3zGvSew8TmlEb/BZffpnjdkqrrBU/al9LY4/bRudRLFLd/l5pMImIYaDG0
         Rvww==
X-Gm-Message-State: AOAM530x/x/Jc9KInhMyVGZFGCPKWA2yxwIqDurtETDXSUACr313AB63
        7uGYY3iSvXNYttzszgH2GcauvA==
X-Google-Smtp-Source: ABdhPJwHRIt2gKLaM2qqqQhcQoev7y64yQvWWdsdrlXDJ/LIM9saCuxmamvlXDwtDy92YqCOvp+XPg==
X-Received: by 2002:a05:6808:1886:: with SMTP id bi6mr218519oib.138.1629930285445;
        Wed, 25 Aug 2021 15:24:45 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u19sm263721oiv.28.2021.08.25.15.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 15:24:44 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/5] dt-bindings: msm/dp: Change reg definition
Date:   Wed, 25 Aug 2021 15:25:53 -0700
Message-Id: <20210825222557.1499104-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
References: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

reg was defined as one region covering the entire DP block, but the
memory map is actually split in 4 regions and obviously the size of
these regions differs between platforms.

Switch the reg to require that all four regions are specified instead.
It is expected that the implementation will handle existing DTBs, even
though the schema defines the new layout.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Include the p1 region (although unused by the implementation for now)

 .../bindings/display/msm/dp-controller.yaml         | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 64d8d9e5e47a..f915dc080cbc 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,7 +19,12 @@ properties:
       - qcom,sc7180-dp
 
   reg:
-    maxItems: 1
+    items:
+      - description: ahb register block
+      - description: aux register block
+      - description: link register block
+      - description: p0 register block
+      - description: p1 register block
 
   interrupts:
     maxItems: 1
@@ -100,7 +105,11 @@ examples:
 
     displayport-controller@ae90000 {
         compatible = "qcom,sc7180-dp";
-        reg = <0xae90000 0x1400>;
+        reg = <0xae90000 0x200>,
+              <0xae90200 0x200>,
+              <0xae90400 0xc00>,
+              <0xae91000 0x400>,
+              <0xae91400 0x400>;
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
2.29.2

