Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5ABB409B82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Sep 2021 19:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344891AbhIMSAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 14:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344413AbhIMSAD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 14:00:03 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFDDC061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:47 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id 22so11534243qkg.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 10:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oWizuF2Gkg5WBWYuRN/ca9SeolKOfaapBj8fX/su7TA=;
        b=dYQ2DyVTpbIDha8CUhN+J+mw7txqI2DY1SQsqYWAcWyvwWWv/DKHdaAhKYZP9DQyzD
         YeQmUswjqmC8H0LV5txitjG6S6HXVuB0/8oiEuN6G926IDGjxdOlXo/Z3wimhyP/aaXO
         KyIi3QH09HLDqrTIBlDdF2TrVHW4ykvrh43nwF21P4Mm6H1/388ACLg5MjvttsBWSG05
         BwzcEG5kuUBb6zxIntbNIJskW2xRyDc3u3juGpSd2KdazkUlMdTnbMf5qrNd79ZW1pPG
         RJL0cEJSgEsXRxo0C5pwv7rYOSth3equVxcxKuIZlgAizB5OQ2rKgGuugri+l1yQg1H/
         cEbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oWizuF2Gkg5WBWYuRN/ca9SeolKOfaapBj8fX/su7TA=;
        b=X+0O7Mw9rJFcqQ6OsUjFmEFAkAJwbRf0W9ZWGOVsHcj2eVgNqD1HM9V+aC06NmI7kI
         E0m3x8JP/0IYnsuOqlvCmtGIo46qv7udN7Q/PI/iHhydEfe3kibzdKCLzZv9mdugD5rt
         2SPsek9Bd2feEndbzYCtkSK4dVnC7nMzSTrrIlEDlyjLimL8g3rtkiducsNdR0fK0Ku3
         MyaoqZPlaeBTZ0vn3dJKzZhblESaHsIZe84bUwTEg3o6EglSWX4iX35ZBP0HoVxblLTd
         g0rrup+VaJXuaqhJqGxxm7VbeyerWnP4CpMtkmUuws7G2qos9C8zfwEtxQwzgdkrCnHC
         G77w==
X-Gm-Message-State: AOAM532I8kAuC3+TYgJomcZmIQc7eb3xBZoQkrGBEeupykFfpa6BrQj/
        cjzplb13cVB+hHxc+CBjP5gcNA==
X-Google-Smtp-Source: ABdhPJzdUETObMuE5TjeYa4MFhxpwmHubpDdN2EJsguHGyIC3/AVj+jNYU8iSEFntmDBjJb1to1k4Q==
X-Received: by 2002:a05:620a:13cb:: with SMTP id g11mr855201qkl.332.1631555926278;
        Mon, 13 Sep 2021 10:58:46 -0700 (PDT)
Received: from localhost ([167.100.64.199])
        by smtp.gmail.com with ESMTPSA id d13sm4515415qtm.32.2021.09.13.10.58.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 10:58:46 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 12/14] dt-bindings: msm/dp: Add bindings for HDCP registers
Date:   Mon, 13 Sep 2021 13:57:43 -0400
Message-Id: <20210913175747.47456-13-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210913175747.47456-1-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run>
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

Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 .../bindings/display/msm/dp-controller.yaml           | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 64d8d9e5e47a..984301442653 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -21,6 +21,11 @@ properties:
   reg:
     maxItems: 1
 
+  reg-names:
+    const: dp_controller
+    const: hdcp_key
+    const: hdcp_tz
+
   interrupts:
     maxItems: 1
 
@@ -99,8 +104,10 @@ examples:
     #include <dt-bindings/power/qcom-rpmpd.h>
 
     displayport-controller@ae90000 {
-        compatible = "qcom,sc7180-dp";
-        reg = <0xae90000 0x1400>;
+        reg = <0 0x0ae90000 0 0x1400>,
+              <0 0x0aed1000 0 0x174>,
+              <0 0x0aee1000 0 0x2c>;
+        reg-names = "dp_controller", "hdcp_key", "hdcp_tz";
         interrupt-parent = <&mdss>;
         interrupts = <12>;
         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
-- 
Sean Paul, Software Engineer, Google / Chromium OS

