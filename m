Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7304A3D937F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 18:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230431AbhG1Qql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 12:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230434AbhG1Qqf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 12:46:35 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70E9CC06179B
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 09:46:32 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id m2-20020a17090a71c2b0290175cf22899cso5032316pjs.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3eEA42JlXQNC4PWoCIFgR+HXz7Rjp4J77j6npFrZR+4=;
        b=Ngg9a/kX+yBwppZxMsfTAwkNrCWuUc1GwnYAZSm8WCvy4KbDgu+V3Kwzhe+aFh4Zgs
         gszehOKA7U54UmQ1aCuJTSlnqKJCBvP5mQi/RYCDt0O3MmrHSaUKXcyAdZaDDTLOywaG
         mKXqA0ZOrTkck0FEWb4p/UgYx6bTwzmj7lnp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3eEA42JlXQNC4PWoCIFgR+HXz7Rjp4J77j6npFrZR+4=;
        b=B57gSykOKheWnuducj4Xj4PzHSG6SnCjJ7g4SRmEmGPlC/k4YGOnsDg/SfTA844UNK
         VCjBqCuqy591vz+E9t9XFkzp8ncYhk32iE6pmQnqWUBjVZV+S3J8lVQ66bQ+JmJ4+psE
         BvrwAAky636tfqyFEyVbq2N/iV44BXeqct/mzoVNTtzlPNWmmoxgFu6yjNknyWCs21fm
         m9BZJh9Nz/TQ385XH27306l0dOnNqBsp0j76XMwvB3TFNUEUVxjEPyPyCEtSYNL43ggZ
         wT0Ma+sNjHopYn4J368bog6bNkJFholl0UB3JH1M1/AWDGNRv2y9dBxZYIC70BcOYU81
         9Ffg==
X-Gm-Message-State: AOAM530ZRPEi8TJDtqjNORpG2DkQNqb/qtPeCwNLWyCnV9pxmv0lqsom
        BIupoz4XM1nAi6z3AhGQq3RbPw==
X-Google-Smtp-Source: ABdhPJyxS+v19XYGtTUmlI/PnvqcN5S6DoY5auTi0nO8UXRAUp+H+Ub7crNHZFqYSSrGKv1eT4Hi2Q==
X-Received: by 2002:a65:41c7:: with SMTP id b7mr670981pgq.81.1627490792046;
        Wed, 28 Jul 2021 09:46:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:9f1e:e713:1a5e:89dc])
        by smtp.gmail.com with ESMTPSA id l12sm474075pff.182.2021.07.28.09.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 09:46:31 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     tzimmermann@suse.de, linux-arm-msm@vger.kernel.org,
        a.hajda@samsung.com, sam@ravnborg.org, airlied@linux.ie,
        bjorn.andersson@linaro.org, daniel@ffwll.ch,
        devicetree@vger.kernel.org, rodrigo.vivi@intel.com,
        jonas@kwiboo.se, narmstrong@baylibre.com,
        Laurent.pinchart@ideasonboard.com, robert.foss@linaro.org,
        jernej.skrabec@gmail.com, mripard@kernel.org,
        linus.walleij@linaro.org, maarten.lankhorst@linux.intel.com,
        rajeevny@codeaurora.org, lyude@redhat.com,
        thierry.reding@gmail.com, steev@kali.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] Revert "drm/panel-simple: Add Samsung ATNA33XC20"
Date:   Wed, 28 Jul 2021 09:45:55 -0700
Message-Id: <20210728094511.4.Id9f076ec5f35633f8ce931051af268a04c45c075@changeid>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
In-Reply-To: <20210728164557.1882787-1-dianders@chromium.org>
References: <20210728164557.1882787-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This reverts commit 4bfe6c8f7c23b01719671b69fd29b87a35ccd9d6.

This panel's power sequencing really can't be handled properly by
panel-simple because of the special sequencing needed for the EL_ON3
GPIO. The only way it was sorta working in the past was by trying to
jam that signal into the "enable-gpio", but that really wasn't a good
fit. We'll add a custom panel driver for this panel to do it right.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-simple.c | 33 ----------------------------
 1 file changed, 33 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9b286bd4444f..c8694f7f8e0f 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -3621,36 +3621,6 @@ static const struct panel_desc rocktech_rk101ii01d_ct = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
-static const struct drm_display_mode samsung_atna33xc20_mode = {
-	.clock = 138770,
-	.hdisplay = 1920,
-	.hsync_start = 1920 + 48,
-	.hsync_end = 1920 + 48 + 32,
-	.htotal = 1920 + 48 + 32 + 80,
-	.vdisplay = 1080,
-	.vsync_start = 1080 + 8,
-	.vsync_end = 1080 + 8 + 8,
-	.vtotal = 1080 + 8 + 8 + 16,
-	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_NVSYNC,
-};
-
-static const struct panel_desc samsung_atna33xc20 = {
-	.modes = &samsung_atna33xc20_mode,
-	.num_modes = 1,
-	.bpc = 10,
-	.size = {
-		.width = 294,
-		.height = 165,
-	},
-	.delay = {
-		.disable_to_power_off = 200,
-		.power_to_enable = 400,
-		.hpd_absent_delay = 200,
-		.unprepare = 500,
-	},
-	.connector_type = DRM_MODE_CONNECTOR_eDP,
-};
-
 static const struct drm_display_mode samsung_lsn122dl01_c01_mode = {
 	.clock = 271560,
 	.hdisplay = 2560,
@@ -4657,9 +4627,6 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "rocktech,rk101ii01d-ct",
 		.data = &rocktech_rk101ii01d_ct,
-	}, {
-		.compatible = "samsung,atna33xc20",
-		.data = &samsung_atna33xc20,
 	}, {
 		.compatible = "samsung,lsn122dl01-c01",
 		.data = &samsung_lsn122dl01_c01,
-- 
2.32.0.432.gabb21c7263-goog

