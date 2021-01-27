Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6A2305F98
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 16:30:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343863AbhA0P2X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 10:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343620AbhA0P0w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 10:26:52 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD85EC0613D6;
        Wed, 27 Jan 2021 07:26:11 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id b21so2914636edy.6;
        Wed, 27 Jan 2021 07:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pProH2wUvDU/L6Oy5JoRN6CX/iVYV45okQ7VNurEBHI=;
        b=DA56AqEE1dVOWdLv4UMqlIoVhbx4+hUcBmOZGbV2UT1agSTJfJjaXzJt/OLn3274Tc
         eQNjHgaT25fZlC8G/WdWj20PJbYv4VojU7z+p6iXWYM9a0L6r8SyO0K3XOSQ8p9yoOuC
         H4BoBcQOsca+capI7VR+/O6AoGwauoTJokQjv13BlZ2U7S73SaROA5GKcx1W/T2Pgy4S
         KqMJtKGI8Gi2S1ktoVOa4sh1bi68li0lgCTusB/4yQn7v1luS5iVigHuYBpwyhjSZbia
         kQQT2WB7LyZ8bxcRClubqHLOd4vmpKcc1k5mfMAuipbum0b3oBc3mRyEnhFRQTp1aPRL
         CW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pProH2wUvDU/L6Oy5JoRN6CX/iVYV45okQ7VNurEBHI=;
        b=OJeLVI/Jc1hXKGS3IQCLKgkgN+OjAHOL7RZABNdVy5kgOtQz3tSOTq48CknFTcpHRc
         Koeh4Ytl4o44/UlANQpiU3Dd8vdSkv37JjFbD8ZjiX4ofjicKOYQ+5m8O82upNn2D5Gx
         VGq+G4VG+ww8iw6Z4sJ2QaWymaWAlKh677YoOECQpiHbIlN2UeJYpLrpfT0uIeRCDelW
         W8HpvlZMY3RMKNuBqi6S7SR/WPa8Y6VsVjtwFSRXmISG2hjxroOO/XllH4hdX0snMc/p
         BMzidaOCI9zZrfQLn4XyJMaXn8jZvcfnAuBdopzTv0qzZmS5WspByewKwHXhUS/npPo/
         gzhA==
X-Gm-Message-State: AOAM533QgQh6Wj0OnmCSSENmCY5TQk3leG25cgAfRd2YiheMiSBo1wYO
        MkNQklY091u2LmA6TXgbpAM=
X-Google-Smtp-Source: ABdhPJyou9+WGYqXXV8lZe5yc1353A+y2zdvINKmaSI37Hv9KVGyud7cCZrN5EF+nrh/ZqGEcbPbIw==
X-Received: by 2002:a05:6402:149a:: with SMTP id e26mr9856788edv.254.1611761170607;
        Wed, 27 Jan 2021 07:26:10 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id s18sm1547750edw.66.2021.01.27.07.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 07:26:09 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Lee Jones <lee.jones@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/mdp5: Fix wait-for-commit for cmd panels
Date:   Wed, 27 Jan 2021 17:24:40 +0200
Message-Id: <20210127152442.533468-1-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Before the offending commit in msm_atomic_commit_tail wait_flush was
called once per frame, after the commit was submitted. After it
wait_flush is also called at the beginning to ensure previous
potentially async commits are done.

For cmd panels the source of wait_flush is a ping-pong irq notifying
a completion. The completion needs to be notified with complete_all so
multiple waiting parties (new async committers) can proceed.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
Suggested-by: Rob Clark <robdclark@gmail.com>
Fixes: 2d99ced787e3d ("drm/msm: async commit support")
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
index 0c8f9f88301fa..f5d71b2740793 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
@@ -1180,7 +1180,7 @@ static void mdp5_crtc_pp_done_irq(struct mdp_irq *irq, uint32_t irqstatus)
 	struct mdp5_crtc *mdp5_crtc = container_of(irq, struct mdp5_crtc,
 								pp_done);
 
-	complete(&mdp5_crtc->pp_completion);
+	complete_all(&mdp5_crtc->pp_completion);
 }
 
 static void mdp5_crtc_wait_for_pp_done(struct drm_crtc *crtc)

base-commit: 59fa6a163ffabc1bf25c5e0e33899e268a96d3cc
-- 
2.30.0

