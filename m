Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974503DBC9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 17:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbhG3PrB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 11:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233735AbhG3Pqx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 11:46:53 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07202C0617A3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 08:46:47 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso14882323pjo.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 08:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kl6+GkZ/OKkP0xJnn1y99V9xopk73LCBvTHbkA/Bkd0=;
        b=BMKp3Z7fNd+oGrTH2hjbLyOQ4KTpld6JQO9wD9sUs0MP8uIdv0lbiHDVaSd1rIe9P0
         Jh6NwnKZVsN4zORtpKIU1/8wcm7QKWwK5uV/0u/v2Qvif4se5khYD5YniHtsv7vteMAM
         mwd8YBrjYIcqI5cmIY7uAkjuJd4yQZ5qJftWQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kl6+GkZ/OKkP0xJnn1y99V9xopk73LCBvTHbkA/Bkd0=;
        b=s3G7nX3EvKiDR2qVc9eqVmiBtCYAd8O3N+E2GhzcrjsscB069nUfY/kL3Rx5ORRt1S
         Ch3Q2jwklovRFE8U6CbR+mcXXi2MAw5ceQvqYVXLX9Wu00WMP1ZmV54ep1y50wCWgHTh
         c7MjuYqc6xeRSxm+3XkkprBTR9XPHY/jmdUZvuO4BfCbP8fH/zYEVyvAmEU+JtOeayxp
         pZyqdyOFN8+1a5hgJ40cRu3YDKzp6AH8KNSFG3r4uh4H5q7wOMOXwdlFk4K/n06oBi9r
         +37K9cDrUo+F1q+14wQsm/UHAvHSMuRWKbRI06poHX310/CW1kpBayLT/JZ3cD0XE2E8
         szlA==
X-Gm-Message-State: AOAM530MD+TuiNulix9EIkp7wN85TXEQacv5a4/MxXUvCshfqoikcGHF
        0QLyyeItelZLbcWtonhlV5quow==
X-Google-Smtp-Source: ABdhPJxVmKC0pz06PCqHIYT8Ni8XG5vasskSnhyHFguG3nqlN3vvbWQ4/R5UzFpvf3J7FH9R3lBjmA==
X-Received: by 2002:a17:903:308b:b029:12b:c7ec:998d with SMTP id u11-20020a170903308bb029012bc7ec998dmr2901646plc.78.1627660006592;
        Fri, 30 Jul 2021 08:46:46 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:3424:e0ac:5a92:d061])
        by smtp.gmail.com with ESMTPSA id u188sm3175621pfc.115.2021.07.30.08.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 08:46:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, steev@kali.org, robert.foss@linaro.org,
        Laurent.pinchart@ideasonboard.com, bjorn.andersson@linaro.org,
        daniel@ffwll.ch, airlied@linux.ie, jernej.skrabec@gmail.com,
        maarten.lankhorst@linux.intel.com, rodrigo.vivi@intel.com,
        sam@ravnborg.org, jonas@kwiboo.se, mripard@kernel.org,
        thierry.reding@gmail.com, lyude@redhat.com,
        linus.walleij@linaro.org, rajeevny@codeaurora.org,
        linux-arm-msm@vger.kernel.org, a.hajda@samsung.com,
        tzimmermann@suse.de, narmstrong@baylibre.com,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] Revert "drm/panel-simple: Add Samsung ATNA33XC20"
Date:   Fri, 30 Jul 2021 08:46:03 -0700
Message-Id: <20210730084534.v2.4.Id9f076ec5f35633f8ce931051af268a04c45c075@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730154605.2843418-1-dianders@chromium.org>
References: <20210730154605.2843418-1-dianders@chromium.org>
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
Reviewed-by: Sean Paul <seanpaul@chromium.org>
---

(no changes since v1)

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
2.32.0.554.ge1b32706d8-goog

