Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ADB640B927
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 22:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbhINUYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 16:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234059AbhINUYE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 16:24:04 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1BCC0617AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:36 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id f129so382752pgc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SbkNd1f+XymmLQZxu6dv4yw2I0ZGx0PXZjCpH/YskzY=;
        b=C76eWOOWZdZu78MXStEfzsfhVb5cN/UDIHSrPo4LvCf0sZg9pQ4rlZxGyzLasXBDeX
         KRoierZw/+Iz9TQ/hLj4QdZJLinIa69QCPTUbWQSUx0/VMgxfdyw0NX4SdwCQNKh2IYl
         UiAyw4rtX9v8z6xT+71ljtdWrO9w6dqakgOqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SbkNd1f+XymmLQZxu6dv4yw2I0ZGx0PXZjCpH/YskzY=;
        b=El2zoHl7YRmMgH0Tea+ShixZFcd6xuI0WulJnGjgicyLsxgxR89A2ScWQZ8Q+WfwEr
         vxCXqfpIHtl/b0iR4E/fQ2eeTDi3IjhJRWS54t3QiE11yBr+4jKMWnUgZ2GDvAoDD//T
         6/XWhokvw9Q8o65SzGBcO2Mi/cQxFE8E5hpjiuJTzw0sq0KtXePsI9fMkSkR6ezwbGPR
         eC1+DJArYlPbNj4RHOJ+3L0aJT7RY6itCDJeCql/uDB2xGZJ41CpYFmj5wMaVRYWw5SD
         lXvK07YXSdO1js56jWHFFFAqPRd1Pcl52mjkGATLw0romiwnulpvAgx/04mfEZzjXbgd
         FCKQ==
X-Gm-Message-State: AOAM531XBTZcQj6sOrrPa2poevi+40Raq1BA/ofzBqio4nkpGDe3WHaG
        h8b6MDdp71hZ0jOvg4K4/AGpTQ==
X-Google-Smtp-Source: ABdhPJzGfT9Hv5Is/g5kCUfIVMMc3F4nLifKxWjim9jX4524134jIL5QK9ZcTa+RC/oVu+v7cLddvA==
X-Received: by 2002:a63:a80c:: with SMTP id o12mr17041076pgf.422.1631650956083;
        Tue, 14 Sep 2021 13:22:36 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f38f:9d0f:3eba:f8c4])
        by smtp.gmail.com with ESMTPSA id 141sm12185393pgg.16.2021.09.14.13.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:22:35 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     devicetree@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maxime Ripard <mripard@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/15] drm/panel-edp: Split the delay structure out
Date:   Tue, 14 Sep 2021 13:21:57 -0700
Message-Id: <20210914132020.v5.10.I24f3646dd09954958645cc05c538909f169bf362@changeid>
X-Mailer: git-send-email 2.33.0.309.g3052b89438-goog
In-Reply-To: <20210914202202.1702601-1-dianders@chromium.org>
References: <20210914202202.1702601-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the case where we can read an EDID for a panel the only part of the
panel description that can't be found directly from the EDID is the
description of the delays. Let's break the delay structure out so that
we can specify just the delays for panels that are detected by EDID.

This is simple code motion. No functional change is intended.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---

(no changes since v4)

Changes in v4:
- panel-simple-edp => panel-edp

Changes in v3:
- Split the delay structure out patch just on eDP now.

 drivers/gpu/drm/panel/panel-edp.c | 159 +++++++++++++++---------------
 1 file changed, 82 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index b698594ba43b..26f4ae7921e5 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -40,6 +40,87 @@
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 
+/**
+ * struct panel_delay - Describes delays for a simple panel.
+ */
+struct panel_delay {
+	/**
+	 * @prepare: Time for the panel to become ready.
+	 *
+	 * The time (in milliseconds) that it takes for the panel to
+	 * become ready and start receiving video data
+	 */
+	unsigned int prepare;
+
+	/**
+	 * @hpd_absent_delay: Time to wait if HPD isn't hooked up.
+	 *
+	 * Add this to the prepare delay if we know Hot Plug Detect
+	 * isn't used.
+	 */
+	unsigned int hpd_absent_delay;
+
+	/**
+	 * @prepare_to_enable: Time between prepare and enable.
+	 *
+	 * The minimum time, in milliseconds, that needs to have passed
+	 * between when prepare finished and enable may begin. If at
+	 * enable time less time has passed since prepare finished,
+	 * the driver waits for the remaining time.
+	 *
+	 * If a fixed enable delay is also specified, we'll start
+	 * counting before delaying for the fixed delay.
+	 *
+	 * If a fixed prepare delay is also specified, we won't start
+	 * counting until after the fixed delay. We can't overlap this
+	 * fixed delay with the min time because the fixed delay
+	 * doesn't happen at the end of the function if a HPD GPIO was
+	 * specified.
+	 *
+	 * In other words:
+	 *   prepare()
+	 *     ...
+	 *     // do fixed prepare delay
+	 *     // wait for HPD GPIO if applicable
+	 *     // start counting for prepare_to_enable
+	 *
+	 *   enable()
+	 *     // do fixed enable delay
+	 *     // enforce prepare_to_enable min time
+	 */
+	unsigned int prepare_to_enable;
+
+	/**
+	 * @enable: Time for the panel to display a valid frame.
+	 *
+	 * The time (in milliseconds) that it takes for the panel to
+	 * display the first valid frame after starting to receive
+	 * video data.
+	 */
+	unsigned int enable;
+
+	/**
+	 * @disable: Time for the panel to turn the display off.
+	 *
+	 * The time (in milliseconds) that it takes for the panel to
+	 * turn the display off (no content is visible).
+	 */
+	unsigned int disable;
+
+	/**
+	 * @unprepare: Time to power down completely.
+	 *
+	 * The time (in milliseconds) that it takes for the panel
+	 * to power itself down completely.
+	 *
+	 * This time is used to prevent a future "prepare" from
+	 * starting until at least this many milliseconds has passed.
+	 * If at prepare time less time has passed since unprepare
+	 * finished, the driver waits for the remaining time.
+	 */
+	unsigned int unprepare;
+};
+
 /**
  * struct panel_desc - Describes a simple panel.
  */
@@ -84,83 +165,7 @@ struct panel_desc {
 	} size;
 
 	/** @delay: Structure containing various delay values for this panel. */
-	struct {
-		/**
-		 * @delay.prepare: Time for the panel to become ready.
-		 *
-		 * The time (in milliseconds) that it takes for the panel to
-		 * become ready and start receiving video data
-		 */
-		unsigned int prepare;
-
-		/**
-		 * @delay.hpd_absent_delay: Time to wait if HPD isn't hooked up.
-		 *
-		 * Add this to the prepare delay if we know Hot Plug Detect
-		 * isn't used.
-		 */
-		unsigned int hpd_absent_delay;
-
-		/**
-		 * @delay.prepare_to_enable: Time between prepare and enable.
-		 *
-		 * The minimum time, in milliseconds, that needs to have passed
-		 * between when prepare finished and enable may begin. If at
-		 * enable time less time has passed since prepare finished,
-		 * the driver waits for the remaining time.
-		 *
-		 * If a fixed enable delay is also specified, we'll start
-		 * counting before delaying for the fixed delay.
-		 *
-		 * If a fixed prepare delay is also specified, we won't start
-		 * counting until after the fixed delay. We can't overlap this
-		 * fixed delay with the min time because the fixed delay
-		 * doesn't happen at the end of the function if a HPD GPIO was
-		 * specified.
-		 *
-		 * In other words:
-		 *   prepare()
-		 *     ...
-		 *     // do fixed prepare delay
-		 *     // wait for HPD GPIO if applicable
-		 *     // start counting for prepare_to_enable
-		 *
-		 *   enable()
-		 *     // do fixed enable delay
-		 *     // enforce prepare_to_enable min time
-		 */
-		unsigned int prepare_to_enable;
-
-		/**
-		 * @delay.enable: Time for the panel to display a valid frame.
-		 *
-		 * The time (in milliseconds) that it takes for the panel to
-		 * display the first valid frame after starting to receive
-		 * video data.
-		 */
-		unsigned int enable;
-
-		/**
-		 * @delay.disable: Time for the panel to turn the display off.
-		 *
-		 * The time (in milliseconds) that it takes for the panel to
-		 * turn the display off (no content is visible).
-		 */
-		unsigned int disable;
-
-		/**
-		 * @delay.unprepare: Time to power down completely.
-		 *
-		 * The time (in milliseconds) that it takes for the panel
-		 * to power itself down completely.
-		 *
-		 * This time is used to prevent a future "prepare" from
-		 * starting until at least this many milliseconds has passed.
-		 * If at prepare time less time has passed since unprepare
-		 * finished, the driver waits for the remaining time.
-		 */
-		unsigned int unprepare;
-	} delay;
+	struct panel_delay delay;
 };
 
 struct panel_edp {
-- 
2.33.0.309.g3052b89438-goog

