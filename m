Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA9BF2B1C84
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 14:52:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgKMNvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 08:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgKMNuZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 08:50:25 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93926C061A47
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:25 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id p22so8201893wmg.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2020 05:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OFGPsQBWaqIstUovZEQuV7ZoQw1xUxoIPu10HqknCTI=;
        b=hDDNRtwmjy7UzVPZNCJaQ+bu+PRm7kW3v0HnLqD/oaFNjNOldbhgb4hKirvW7RQ3XG
         txtByjBe8inFiRzGvNE+0ZhuM7fV8Syu7RL2PxTSw2iQ4LD1FFAVBa7/GJ93TuAgl0XA
         ACpV0/PDpouzHfBWTiLt7rJyhWBmcfvQ9qFIvNY4YbDDotBVfQmZZoxQ8vEKkrAwZ3DS
         i3XKYmnsRMMZb3YU7tGhZTUDY4RrTNSSIqPhVlTAfqW/ZFop7DarUDsHz7+LSVLhD4vD
         hnfZR+RX+VS+Bxjl5AVbcbeSDW5bYjOBDFd4HsO95GvFkJNQ/mV9Ogq4rZyjmic5vcYi
         FTZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OFGPsQBWaqIstUovZEQuV7ZoQw1xUxoIPu10HqknCTI=;
        b=MYFkFYxfYhBsYzGiA7wKm9WFpHlK2HhJ9u15OLn1uTyeNhPqUvkrTbYJq4P4eTxp3X
         qv/3dX4u5CskUPRhe76dcfQp2xKCWQEUgvXFOablvej/auTjSB4bVtuaP8kMwsEClUNN
         bhds6yDQBotV7oNbyzqqOFbYkOsfp5mKdafFiWkxM9FbThm6F+0bFONLxCq5l1Y7kGFo
         mla2XefyXNGAZ5dpq0b1x9IElGGT/sqkevpB16tfFf6CfTnIWhpZ6+AYetG3dxcZqjpx
         6/D/lSTV+AkH7VIJHbXbTJDC+hr78irlKbJXoOwNz1TAmL4WAgH/iSIS6hQ5dWLTCtF6
         OmUg==
X-Gm-Message-State: AOAM5306rZAbGnxd1zCWN0HIfOLNB5YpAj+LWqNyaz+AMBqnOP45Y0L3
        o/C++6nlsLhZKmNaBED+3G65ew==
X-Google-Smtp-Source: ABdhPJyRl6lkCY0QwpZX7ubai9WllsidpusPMAw7vEARujcTCQ0A8ompo9Cv1/xtXRSuPmAwCaT85w==
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr2533032wms.182.1605275424372;
        Fri, 13 Nov 2020 05:50:24 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id t11sm4561614wrm.8.2020.11.13.05.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 05:50:23 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 34/40] drm/msm/disp/mdp5/mdp5_ctl: Demote non-conformant kernel-doc headers
Date:   Fri, 13 Nov 2020 13:49:32 +0000
Message-Id: <20201113134938.4004947-35-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113134938.4004947-1-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Very little attempt has been made to document these functions.

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'enabled' not described in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess function parameter 'enable' description in 'mdp5_ctl_set_encoder_state'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'start' not described in 'mdp5_ctl_commit'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 030279d7b64b7..b5c40f9773629 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -213,10 +213,10 @@ static void send_start_signal(struct mdp5_ctl *ctl)
 	spin_unlock_irqrestore(&ctl->hw_lock, flags);
 }
 
-/**
+/*
  * mdp5_ctl_set_encoder_state() - set the encoder state
  *
- * @enable: true, when encoder is ready for data streaming; false, otherwise.
+ * @enabled: true, when encoder is ready for data streaming; false, otherwise.
  *
  * Note:
  * This encoder state is needed to trigger START signal (data path kickoff).
@@ -507,7 +507,7 @@ static void fix_for_single_flush(struct mdp5_ctl *ctl, u32 *flush_mask,
 	}
 }
 
-/**
+/*
  * mdp5_ctl_commit() - Register Flush
  *
  * The flush register is used to indicate several registers are all
-- 
2.25.1

