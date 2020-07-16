Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C723222CA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 22:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgGPUV2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 16:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgGPUV1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 16:21:27 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E1EC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 13:21:27 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k71so5363127pje.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 13:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pz5u7Nl+iTJUonoiBLwcqOKTZmTebMlmblSIOFO6rAM=;
        b=d1KqoUc9C65mdlIM1wphjX9P9IvQqnkH+VGwg/9vsqbDhMF3tDcIpZMzzqkhrqVqiP
         uBxiOsyg8SCYYZ7sMGB0J94YxMnLxQWj9PiFOhub5rbkZikf76aLsDuutPUqOHMg5Wfg
         /UTwEqcNRFWh5p+d8sfnnwVnT90s2PhcNYhw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Pz5u7Nl+iTJUonoiBLwcqOKTZmTebMlmblSIOFO6rAM=;
        b=hYYUuzMYeKnJnYkiRXfSe+aRjkqhOCDjnJ6USSXbFWbKP2DpVC7aI6mZvg7Cmigz4u
         QHLx53O1DzGaiF2SxR0oh7+hqyDlRKwuZSXXiX1opbNHWMbFQDqgXx8JlcNvKpwy7I+g
         vXqW/BvfJ5t6DJNw7oTwsM4+RFrzAX5WlsaP2Od0khZhquuyxXKiJFBCJdqPg+lJFRq1
         AMWGJpYw3jwPlapac1+FhSzOT1sV9u2UKG/mAS3e8PYObzynOOD+wmR3O5diEl/Vug5r
         2fxzE488zwadCQ4TSN7xzDlSEa7JIW2/oZ/d5okWANr/AnWwlEkmmb31DQmgyYhu0Ri2
         QX6Q==
X-Gm-Message-State: AOAM530F5vXUJDa3UqVq1xLfp/1yahADl0wRLNjoMMdw0ZgflqmHo7j4
        zBFzrU5dCC6JfVrW4EnZaRrMDQ==
X-Google-Smtp-Source: ABdhPJzawA3nZe2sQ2O21b+jEe2lje6nBGUfnkf12tO9O2zxF36z+tkqvDv1LnqypSnSRKd1+UUnNg==
X-Received: by 2002:a17:902:5981:: with SMTP id p1mr4745234pli.141.1594930886819;
        Thu, 16 Jul 2020 13:21:26 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id m17sm5815606pfo.182.2020.07.16.13.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 13:21:26 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     robdclark@chromium.org, steev@kali.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel: simple: Delay HPD checking on boe_nv133fhm_n61 for 15 ms
Date:   Thu, 16 Jul 2020 13:21:22 -0700
Message-Id: <20200716132120.1.I01e738cd469b61fc9b28b3ef1c6541a4f48b11bf@changeid>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On boe_nv133fhm_n62 (and presumably on boe_nv133fhm_n61) a scope shows
a small spike on the HPD line right when you power the panel on.  The
picture looks something like this:

         +--------------------------------------
         |
         |
         |
Power ---+
                                           +---
                                           |
              ++                           |
         +----+|                           |
HPD -----+     +---------------------------+

So right when power is applied there's a little bump in HPD and then
there's small spike right before it goes low.  The total time of the
little bump plus the spike was measured on one panel as being 8 ms
long.  The total time for the HPD to go high on the same panel was
51.2 ms, though the datasheet only promises it is < 200 ms.

When asked about this glitch, BOE indicated that it was expected and
persisted until the TCON has been initialized.

If this was a real hotpluggable DP panel then this wouldn't matter a
whole lot.  We'd debounce the HPD signal for a really long time and so
the little blip wouldn't hurt.  However, this is not a hotpluggable DP
panel and the the debouncing logic isn't needed and just shows down
the time needed to get the display working.  This is why the code in
panel_simple_prepare() doesn't do debouncing and just waits for HPD to
go high once.  Unfortunately if we get unlucky and happen to poll the
HPD line right at the spike we can try talking to the panel before
it's ready.

Let's handle this situation by putting in a 15 ms prepare delay and
decreasing the "hpd absent delay" by 15 ms.  That means:
* If you don't have HPD hooked up at all you've still got the
  hardcoded 200 ms delay.
* If you've got HPD hooked up you will always wait at least 15 ms
  before checking HPD.  The only case where this could be bad is if
  the panel is sharing a voltage rail with something else in the
  system and was already turned on long before the panel came up.  In
  such a case we'll be delaying 15 ms for no reason, but it's not a
  huge delay and I don't see any other good solution to handle that
  case.

Even though the delay was measured as 8 ms, 15 ms was chosen to give a
bit of margin.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I don't actually have a device in front of me that is exhibiting these
problems.  I believe that it is only some devices and some of the
time.  Still, this patch seems safe and seems likely to fix the issue
given the scope shots.

 drivers/gpu/drm/panel/panel-simple.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 88493538a147..046a06b55800 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1260,7 +1260,21 @@ static const struct panel_desc boe_nv133fhm_n61 = {
 		.height = 165,
 	},
 	.delay = {
-		.hpd_absent_delay = 200,
+		/*
+		 * When power is first given to the panel there's a short
+		 * spike on the HPD line.  It was explained that this spike
+		 * was until the TCON data download was complete.  On
+		 * one system this was measured at 8 ms.  We'll put 15 ms
+		 * in the prepare delay just to be safe and take it away
+		 * from the hpd_absent_delay (which would otherwise be 200 ms)
+		 * to handle this.  That means:
+		 * - If HPD isn't hooked up you still have 200 ms delay.
+		 * - If HPD is hooked up we won't try to look at it for the
+		 *   first 15 ms.
+		 */
+		.prepare = 15,
+		.hpd_absent_delay = 185,
+
 		.unprepare = 500,
 	},
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
-- 
2.28.0.rc0.105.gf9edc3c819-goog

