Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451B93DC043
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 23:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232774AbhG3V1D (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 17:27:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhG3V07 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 17:26:59 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A19E5C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 14:26:53 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id o44-20020a17090a0a2fb0290176ca3e5a2fso16248275pjo.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jul 2021 14:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/9pe0vp/2S/yyqFRQwYtuI91YF1fj5/j9qd/6MVyxqs=;
        b=BHXVq1MELYCtBV1DweXqBcVD2kudADL1JM8qpK0g3TeRhog1FtBWSIOx+tkx0O2qeR
         f0uNhIkDdWYsdXndWcG4IeUH9hqRqUc84qcym81SiRG6Sm3AS1vYv15zDyEN4rp3RLcI
         4qNTMUpBQgkmsR043IFfKWNnWLfZnFcZHfa5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/9pe0vp/2S/yyqFRQwYtuI91YF1fj5/j9qd/6MVyxqs=;
        b=snfzWBh3ziRIGeg77dBMDu/T/jOnzoKnwxV+UIuMHMSxYcJMg4VmXOlbnDdva0OItz
         5E8qt1Cc4aQhpMwrKCDFHgY+jLIGvrfOZsn8LjdKswvOll/WBoptmqOf9hPZu5FosOCn
         k92SEevE03omjfRLwnH2yFZLCbzfmrtoqBeO6JyXzon+SUN7jf8iwH1LeVqPpfIijCv5
         Xmeczj4HaPwxioBzg+Hao97hkb2Jvw/NWD9Z8CTx8aPZT0JGzyQmdVyaEA2NRYe0Nny/
         K27JkEj7R9Ir4oSjBd4X+oytmlRRrqCo7CfxM43nZbLOvU9ETYorVgOeoj1cmwIewqjp
         Tl4w==
X-Gm-Message-State: AOAM5321AsyNLnt8UzzaRFhdpAR0FBbYZfEvtaP7SFQFKD+XRqWwf0qz
        tZ3l3aXJYPBtW80nCyld6N/6eg==
X-Google-Smtp-Source: ABdhPJxBN3lxm1xi3KDrnnKCQfeCE7CY6sVtsiHHzl5j9dYSm4NyqWLxct5ErQnSu186qB/gdEC1Pg==
X-Received: by 2002:a62:7c4d:0:b029:3b0:b284:fd9c with SMTP id x74-20020a627c4d0000b02903b0b284fd9cmr2739725pfc.11.1627680413218;
        Fri, 30 Jul 2021 14:26:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:3424:e0ac:5a92:d061])
        by smtp.gmail.com with ESMTPSA id u21sm3484625pfh.163.2021.07.30.14.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 14:26:52 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Maxime Ripard <mripard@kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] drm/panel-simple: Split the delay structure out of the panel description
Date:   Fri, 30 Jul 2021 14:26:24 -0700
Message-Id: <20210730142537.v2.5.I11c226341f8e86d376a53d5ec11cb82f6fd2c38c@changeid>
X-Mailer: git-send-email 2.32.0.554.ge1b32706d8-goog
In-Reply-To: <20210730212625.3071831-1-dianders@chromium.org>
References: <20210730212625.3071831-1-dianders@chromium.org>
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
---

Changes in v2:
- Rebased atop revert of delays between GPIO & regulator

 drivers/gpu/drm/panel/panel-simple.c | 159 ++++++++++++++-------------
 1 file changed, 82 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index b06bf30c65d0..7d80bb20e6e0 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -41,6 +41,87 @@
 #include <drm/drm_mipi_dsi.h>
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
@@ -85,83 +166,7 @@ struct panel_desc {
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
 
 	/** @bus_format: See MEDIA_BUS_FMT_... defines. */
 	u32 bus_format;
-- 
2.32.0.554.ge1b32706d8-goog

