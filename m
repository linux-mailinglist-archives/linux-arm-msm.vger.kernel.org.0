Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297EF51923F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 01:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244200AbiECXZM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 19:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237650AbiECXZK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 19:25:10 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E720F1FCC1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 16:21:35 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id o69so15302973pjo.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 16:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCyuL8rj9y1A8bDYJ8Ok6fBVOndsrzjav6d8Lz8t4jk=;
        b=YVlF//VOfLdFfTHNcRkc8XnlCRMWvCRgRFOyO0OlWHfVA/1hmWIyQ24dRLBvLTt/09
         RixtWaNqCQvHR/DAubbDesLZC/lrn90ebAgeglGtOHCwyOkla9KZHMkdEOVb0RCDldeW
         Lc+nC8AdLpuEBt9M3EzTa/k7Hb47M7gokTp/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dCyuL8rj9y1A8bDYJ8Ok6fBVOndsrzjav6d8Lz8t4jk=;
        b=VhgNL6RWUgj95dJz8TW3NxWViCAKCSC1g9fOCTTINPPr3DFf1Z5OCbJIXOKOuvLhrQ
         y3sW/GyX3YB+NRgREaaWtQZA9KyGOxVMOyNjd8vvoqo8x8vEURWYrVvJEj69Y+5LCizV
         65f4xe5Jb7RHMz+09cEPVGqkFmRW2KEQjbdkTXeJ+zCedL3qir7IgOdtcYEMuuGRKVoU
         0pdy8QT0CCdulsq0k2LgKb+40+Nal7Lh0ofgu4CL6ydHaYGf4cy7E6S1+40m26NbKj+j
         aXYSwqZ7MNPYRguIL9+wYL/1Rj3UfStLzO3TIc9BLy3Fuy4DdcXlh80yF+I3U2H2wLFm
         lbzA==
X-Gm-Message-State: AOAM532BYDu1qlucfMBgllEopywUy9BonLKYrmYy7oATf+Cgmi0/VV+R
        B6jd5tN6i7hjytgq7Lt7RhgZ6Q==
X-Google-Smtp-Source: ABdhPJya1M18CBF7DP0IaMvzRvqWs1ZQknQS2KXlRom+8Op79bVXXJtl3EZCPPX8Tq6isGWo5p1MvQ==
X-Received: by 2002:a17:90a:1944:b0:1d9:7cf8:5457 with SMTP id 4-20020a17090a194400b001d97cf85457mr7232685pjh.112.1651620095171;
        Tue, 03 May 2022 16:21:35 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:93ca:84cb:c452:c0a3])
        by smtp.gmail.com with ESMTPSA id s12-20020a17090302cc00b0015e8d4eb2e2sm6872180plk.300.2022.05.03.16.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 16:21:34 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Lyude Paul <lyude@redhat.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Imre Deak <imre.deak@intel.com>,
        Jani Nikula <jani.nikula@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Document that power requirements for DP AUX transfers
Date:   Tue,  3 May 2022 16:21:08 -0700
Message-Id: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
X-Mailer: git-send-email 2.36.0.464.gb9c8b46e94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When doing DP AUX transfers there are two actors that need to be
powered in order for the DP AUX transfer to work: the DP source and
the DP sync. Commit bacbab58f09d ("drm: Mention the power state
requirement on side-channel operations") added some documentation
saying that the DP source is required to power itself up (if needed)
to do AUX transfers. However, that commit doesn't talk anything about
the DP sink.

For full fledged DP the sink isn't really a problem. It's expected
that if an external DP monitor isn't plugged in that attempting to do
AUX transfers won't work. It's also expected that if a DP monitor is
plugged in (and thus asserting HPD) that it AUX transfers will work.

When we're looking at eDP, however, things are less obvious. Let's add
some documentation about expectations. Here's what we'll say:

1. We don't expect the DP AUX transfer function to power on an eDP
panel. If an eDP panel is physically connected but powered off then it
makes sense for the transfer to fail.

2. We'll document that the official way to power on a panel is via the
bridge chain, specifically by making sure that the panel's prepare
function has been called (which is called by
panel_bridge_pre_enable()). It's already specified in the kernel doc
of drm_panel_prepare() that this is the way to power the panel on and
also that after this call "it is possible to communicate with any
integrated circuitry via a command bus."

3. We'll also document that for code running in the panel driver
itself that it is legal for the panel driver to power itself up
however it wants (it doesn't need to officially call
drm_panel_pre_enable()) and then it can do AUX bus transfers. This is
currently the way that edp-panel works when it's running atop the DP
AUX bus.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/drm/display/drm_dp_helper.h | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index dca40a045dd6..e5165b708a40 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -370,9 +370,17 @@ struct drm_dp_aux {
 	 * helpers assume this is the case.
 	 *
 	 * Also note that this callback can be called no matter the
-	 * state @dev is in. Drivers that need that device to be powered
-	 * to perform this operation will first need to make sure it's
-	 * been properly enabled.
+	 * state @dev is in and also no matter what state the panel is
+	 * in. It's expected:
+	 * - If the @dev providing the AUX bus is currently unpowered then
+	 *   it will power itself up for the transfer.
+	 * - If we're on eDP and the panel is not in a state where it can
+	 *   respond (it's not powered or it's in a low power state) then this
+	 *   function will return an error (but not crash). Note that if a
+	 *   panel driver is initiating a DP AUX transfer it may power itself
+	 *   up however it wants. All other code should ensure that the
+	 *   pre_enable() bridge chain (which eventually calls the panel
+	 *   prepare function) has powered the panel.
 	 */
 	ssize_t (*transfer)(struct drm_dp_aux *aux,
 			    struct drm_dp_aux_msg *msg);
-- 
2.36.0.464.gb9c8b46e94-goog

