Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653E63BFA26
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 14:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhGHMbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 08:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231449AbhGHMbc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 08:31:32 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E23BC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 05:28:50 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x25so2233876lfu.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 05:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
        b=B4zG8Ky92qLBbFlZhH+U2h2FVRIBjLTciaEZqKkabPvWU9yPHX5GrQ25COexC/rebA
         b0f2GFcF2nOlq/HUvn6PVoM7v+tRdBqzlU4zg5sVX1vmDS211dl3cnIJXKHtCNVpmRnt
         7Hp9BmdZwatvPcfikCotZm0XkrtLO0LujPQ/WbyzD6JLoteh4QhJcBesHAyyCvTAgIdl
         bx/Wom/LhH7TnXVV/XkoSKJLU40LDMUz2mbDTNFBr8h+4/EgWOdil4pK/QQoejqqh1j7
         a0BlOi3C5MwNrcfR0BsLqTIBEOwFU0RSyj/1f23gn1zglpAZUbW/H+MKS/j3+Y70I4rp
         IdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
        b=IEu4RkGgrdCgYNWvLndZ5ahjktMqLaZfU8IX0r4RlibbejJzkM7cdrfDY4HLm6LSHE
         LnZ5UZ4b+/KxUAvEnA6Vx7suNyaYUly9rw5VTeVh21zhZGFZQok8rQYXGY3YwX/jwvkY
         fb64pLme2BoXuMVhi+dQQTTwgCcMl99LNTzxu35X31fcTeBo3py1bBzYR+LTk1NrgO9l
         fYcZFSY4/mRYyGsFFDXyMNyh1ovhesLxEmcqfUO2SKnl8w1Y00iWRIwj90cm7UnrYrmJ
         qNfi93MG+vmbJxqIdlaPdy3WfsYhyJO0LTl6panhg6qE1/956rIKbHlKjfwrbMDbS4yg
         NE6A==
X-Gm-Message-State: AOAM532YHUGg7vx57eFpytXCtceSM5Mn+g8fkvuAl/BcYog+2ErO1OFl
        MN7Qq3uTTdcP7wm9z9f9x+4MkQ==
X-Google-Smtp-Source: ABdhPJw++sWzNmdENu5ts00eacjxt1C/Vguw+xsjeG7hfxU6wYobPRW3x6NaHOoLJ3dadUoRNM2KBA==
X-Received: by 2002:ac2:4896:: with SMTP id x22mr15612187lfc.600.1625747328534;
        Thu, 08 Jul 2021 05:28:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f1sm184368lfs.211.2021.07.08.05.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 05:28:48 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v1 4/7] drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
Date:   Thu,  8 Jul 2021 15:28:30 +0300
Message-Id: <20210708122833.363451-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move a call to mdp5_encoder_set_intf_mode() after
msm_dsi_modeset_init(), removing set_encoder_mode callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

