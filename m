Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0543FE3AB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 22:20:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245531AbhIAUVf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 16:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245289AbhIAUVd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 16:21:33 -0400
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767CEC06129D
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Sep 2021 13:20:33 -0700 (PDT)
Received: by mail-pg1-x52f.google.com with SMTP id t1so666853pgv.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Sep 2021 13:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mYEjr3BHJmNyg4msjLT0qnp85uO+qqwgC2AGDj+zncU=;
        b=P60U51/qwPpUhHQsv0zUtH/PcrqGxO2R/9X18RBIKx5Mtz5wO2Ft8u+F35d4wIrgmR
         ejO8A10syiidLpMv4yTRfNq3nniUL7WdMvcHzJVJWdx8BANawPxj+M/umDj+LKlGMZ56
         9+ikXKepWNHpoUvQ0Su8q+D1yBWvBmQKGMhbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mYEjr3BHJmNyg4msjLT0qnp85uO+qqwgC2AGDj+zncU=;
        b=ZK/3DCzh4zhmbp/Km7okyHt09ke7mmLFsmqqBCn191vn1mbklIYT5gE4GFxS8HdKG1
         faL3NgmILZkwhmN4Xr9YXkCDYAzt5mgOaUH2/A6QLJ2N7EFnDRdnOV47MX50Z+EnlsWt
         YmwoQRFrbPZeCMMrP6bK7eIx8G1hoAIDS0nhmvssx2SBM4j+gWGbjzNSoANRam8ZpQod
         LFd7fZSaFEJz8EdUJjqngXNfKB4xDfTMnEOFUJrrs+OpuUNuQ1KlBz3t7X8f0aMSpCk6
         vEVIKEwNW6J9B7eSTJ7y7rYb08REEaHflvE+dFSfCpZVYitvJfFjSBljNf062PmaIUn5
         K/xw==
X-Gm-Message-State: AOAM533I5m9zoXbMjR4jPkI1XJ0ybKt7dQLFhTLRdF58GypKgpQAg4BT
        tqtDjl9TiC2O+Ecm/IfPAp1oDw==
X-Google-Smtp-Source: ABdhPJxJiYLYOc7eJ+XctS407tdB4smvFn42i+/F5T3WjgMJknBb9J0mJz722Ej4uS/thX6D85z3+w==
X-Received: by 2002:a63:c10b:: with SMTP id w11mr811439pgf.228.1630527633041;
        Wed, 01 Sep 2021 13:20:33 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:958b:b561:a735:e774])
        by smtp.gmail.com with ESMTPSA id x15sm321178pfq.31.2021.09.01.13.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Sep 2021 13:20:32 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        Steev Klimaszewski <steev@kali.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/16] drm/panel-simple: Reorder logicpd_type_28 / mitsubishi_aa070mc01
Date:   Wed,  1 Sep 2021 13:19:22 -0700
Message-Id: <20210901131531.v3.4.Ib2bdeceb8ce45d36c09f5d1ae62a2263276a0605@changeid>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
In-Reply-To: <20210901201934.1084250-1-dianders@chromium.org>
References: <20210901201934.1084250-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The "logicpd_type_28" panel data was splitting up the
mitsubishi_aa070mc01 panel data. Reorganize it so that the panel descs
and modes are kept together.

This is a no-op code-cleanup change, found by code inspection.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- ("Reorder logicpd_type_28...") patch new for v3.

 drivers/gpu/drm/panel/panel-simple.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 0e4f3cac0fef..4ec310a650cd 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3158,19 +3158,6 @@ static const struct panel_desc logictechno_lttd800480070_l6wh_rt = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
-static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
-	.clock = 30400,
-	.hdisplay = 800,
-	.hsync_start = 800 + 0,
-	.hsync_end = 800 + 1,
-	.htotal = 800 + 0 + 1 + 160,
-	.vdisplay = 480,
-	.vsync_start = 480 + 0,
-	.vsync_end = 480 + 48 + 1,
-	.vtotal = 480 + 48 + 1 + 0,
-	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
-
 static const struct drm_display_mode logicpd_type_28_mode = {
 	.clock = 9107,
 	.hdisplay = 480,
@@ -3205,6 +3192,19 @@ static const struct panel_desc logicpd_type_28 = {
 	.connector_type = DRM_MODE_CONNECTOR_DPI,
 };
 
+static const struct drm_display_mode mitsubishi_aa070mc01_mode = {
+	.clock = 30400,
+	.hdisplay = 800,
+	.hsync_start = 800 + 0,
+	.hsync_end = 800 + 1,
+	.htotal = 800 + 0 + 1 + 160,
+	.vdisplay = 480,
+	.vsync_start = 480 + 0,
+	.vsync_end = 480 + 48 + 1,
+	.vtotal = 480 + 48 + 1 + 0,
+	.flags = DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+};
+
 static const struct panel_desc mitsubishi_aa070mc01 = {
 	.modes = &mitsubishi_aa070mc01_mode,
 	.num_modes = 1,
-- 
2.33.0.259.gc128427fd7-goog

