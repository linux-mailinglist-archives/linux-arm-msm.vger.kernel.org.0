Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E26323C370D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jul 2021 00:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhGJWW7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 18:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhGJWW7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 18:22:59 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3564DC0613DD
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id t17so32212282lfq.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hoN8ubV+NL8AcGXwOuvZXUIKfTF5XnABfb0Z79GoR78=;
        b=ZUh4O8Uq5OAkw2Yj6Tt6vfKLJ/c73uzzW70zh4gYRHDgFdfcbsa9TYHfkCUDw2rKi7
         kAdD8eskVqCnEQ0tu3+v+oF025XuGQj9vgwDSR4gl9g+Zw4RX3uAtMfP905ofFNlCThO
         ZHpI78Vokpv2+sTfxbqa38wjCZNVsayUgFO0bMDnQGY18cV8/6c4/jMyXHdrxrDNPeV4
         o0m7dwZaWRP7cZPv5kdtXUUDQcs+Xd+7imJa2oM6+0qswIrzcw2XFUAh8lLu6i6iE6m0
         3ijY7ZZDKsoS5GQhgCnFTjZLRb1x4E3pt2+6X24d0TGKdQrg+QzNZET55uHjYHVMueSM
         E2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hoN8ubV+NL8AcGXwOuvZXUIKfTF5XnABfb0Z79GoR78=;
        b=iZFLipbRyd+x/uJ+nS/UW/xTmNkzSOski5VRsy8swtnEbW8fKeKwRs4y80i1IiZN1z
         /6IDnAcywRjL3Pa4LDz+46+wBG/Au+kXfP96OizH20pKTWqedHs1Qxhvg6I/XZX1AEXO
         LIU0lZ3z9iKpNdczmXf/smDhoEmZ73iU2vzNJ6Fe5DQq9Pu6xx8w43OwhV5wNmfbBTJ8
         oZmnaZfcdoeOktWBk0q7mhK/esVtvQ5/Mh93hw3x418/Le85St/if1d9SMTvoMWaFkiJ
         lGkJ9v0wpkrwvfL+MIh3zFmIigc/3fEFnxuPjdgtDm71KewhSTSsjeLN+NenmkkeygNF
         u0SA==
X-Gm-Message-State: AOAM533NnSOcQVnCoWBmjTIqRuH5MOY1MwskKsFPEoF2aQB0FhSpCbPH
        7itxorM7SKFeQLcm5OD/4STqDA==
X-Google-Smtp-Source: ABdhPJyjcx0AB95L0qYORaJEoRS4aSNevZfMQ7NnsUs741NpjV75fb0/QM9yQBZhwXEVPVc2YlLDjQ==
X-Received: by 2002:a19:e012:: with SMTP id x18mr34883500lfg.394.1625955611596;
        Sat, 10 Jul 2021 15:20:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jul 2021 15:20:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 4/7] drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
Date:   Sun, 11 Jul 2021 01:20:02 +0300
Message-Id: <20210710222005.1334734-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move a call to mdp5_encoder_set_intf_mode() after
msm_dsi_modeset_init(), removing set_encoder_mode callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 15aed45022bc..b3b42672b2d4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -209,13 +209,6 @@ static int mdp5_set_split_display(struct msm_kms *kms,
 							  slave_encoder);
 }
 
-static void mdp5_set_encoder_mode(struct msm_kms *kms,
-				  struct drm_encoder *encoder,
-				  bool cmd_mode)
-{
-	mdp5_encoder_set_intf_mode(encoder, cmd_mode);
-}
-
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -287,7 +280,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp5_round_pixclk,
 		.set_split_display = mdp5_set_split_display,
-		.set_encoder_mode = mdp5_set_encoder_mode,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
 		.debugfs_init    = mdp5_kms_debugfs_init,
@@ -448,6 +440,9 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 		}
 
 		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
+		if (!ret)
+			mdp5_encoder_set_intf_mode(encoder, msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
+
 		break;
 	}
 	default:
-- 
2.30.2

