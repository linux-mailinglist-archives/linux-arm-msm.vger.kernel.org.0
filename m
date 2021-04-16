Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF03362B77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Apr 2021 00:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbhDPWmI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Apr 2021 18:42:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235218AbhDPWlp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Apr 2021 18:41:45 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4BB3C061342
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:18 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id b8-20020a17090a5508b029014d0fbe9b64so17158665pji.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Apr 2021 15:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3CBaXnhofZGLokcy5GKI7ovd/IyjXTz3GY4vum4+iKE=;
        b=RY9sWPnXQ22UDA7OtbghdHNT21aZAAof29hxLZmb6hl0qDiDEFDBuZNzVjSOZH65/P
         NW5oXgKdIbmRdm9evOGtekxD1IzIb5bDA5Fmem9VOjTClXuXtf3o1P6oF2ovR4Rc1HRz
         qnN7ko1TT0jsz8C3bbsgAhAqtdFxaXjcK/9/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3CBaXnhofZGLokcy5GKI7ovd/IyjXTz3GY4vum4+iKE=;
        b=NHq+7TO+vMnu+qN7jDGAOVsm1xYXmSQQSgLDjThDvRWsSAHA4LBvmoIzj9rA+s7YAm
         H0QEKTo4/5LJ4Suj/6itu37pLE+1vEUyE0aT6PgUas8MRTSCxn6LCBBBgml6PDi4AkdC
         g9jPST6Ks41AyRMphQCt/OrG2CtzyCdRhl9RrHdmfawRVb1iyWuF6TdZgx8aPKOQfFkx
         36uqGD91RQ1wHP4Yp2vUoDhaU0j++ZkkvWlvlxuRngcFisSUjJVMBETNrwu22HP+QXMN
         Wko2W0sbk3hKQWgcElpjTaY0oJl/mAUJuoXp+w+oz7q8oagTwRYq6ZmhlwMIkOyha1Vg
         fx4Q==
X-Gm-Message-State: AOAM530uVQzD4QrobKN0SDlnCFcGzjtQcBt0bciKRv6ouEPmgkNOuNMr
        NplcHIEBNhhzi3p0Bhk8EecJ0A==
X-Google-Smtp-Source: ABdhPJzuekYu017q0WOwn61aSZTq9qM6Vt9uP5gSgkDqcxNAy23/m+0FCgWy1W+/j12tg2B/IgMV/A==
X-Received: by 2002:a17:90a:c281:: with SMTP id f1mr11652998pjt.58.1618612878456;
        Fri, 16 Apr 2021 15:41:18 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:dc8a:c9d0:aa5b:5386])
        by smtp.gmail.com with ESMTPSA id r6sm5633659pgp.64.2021.04.16.15.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 15:41:18 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 23/27] drm/panel: panel-simple: Power the panel when reading the EDID
Date:   Fri, 16 Apr 2021 15:39:46 -0700
Message-Id: <20210416153909.v4.23.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
References: <20210416223950.3586967-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I don't believe that it ever makes sense to read the EDID when a panel
is not powered and the powering on of the panel is the job of
prepare(). Let's make sure that this happens before we try to read the
EDID. We use the pm_runtime functions directly rather than directly
calling the normal prepare() function because the pm_runtime functions
are definitely refcounted whereas it's less clear if the prepare() one
is.

NOTE: I'm not 100% sure how EDID reading was working for folks in the
past, but I can only assume that it was failing on the initial attempt
and then working only later. This patch, presumably, will fix that. If
some panel out there really can read the EDID without powering up and
it's a big advantage to preserve the old behavior we can add a
per-panel flag. It appears that providing the DDC bus to the panel in
the past was somewhat uncommon in any case.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index c91e8aa108f7..40382c1be692 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -510,12 +510,18 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 
 	/* probe EDID if a DDC bus is available */
 	if (p->ddc) {
-		struct edid *edid = drm_get_edid(connector, p->ddc);
+		struct edid *edid;
 
+		pm_runtime_get_sync(panel->dev);
+
+		edid = drm_get_edid(connector, p->ddc);
 		if (edid) {
 			num += drm_add_edid_modes(connector, edid);
 			kfree(edid);
 		}
+
+		pm_runtime_mark_last_busy(panel->dev);
+		pm_runtime_put_autosuspend(panel->dev);
 	}
 
 	/* add hard-coded panel modes */
-- 
2.31.1.368.gbe11c130af-goog

