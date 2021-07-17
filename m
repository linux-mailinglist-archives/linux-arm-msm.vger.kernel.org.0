Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8033CC35E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 14:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233715AbhGQMnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 08:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233568AbhGQMnX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 08:43:23 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F141EC06175F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:25 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id q4so17924954ljp.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jul 2021 05:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hoN8ubV+NL8AcGXwOuvZXUIKfTF5XnABfb0Z79GoR78=;
        b=PvBXsDKynPr7GGJktT7Bkhm5GSrb1FnEVgMo5OV1Y3sYC2xMN7OVRigr3nCHK+OWgQ
         B1LmRcEFbxPtouXGbR5DazBg1btY1ocTIgOspuuf08tSZe0oG/j9Qq/OrjUF2D7bRX8Q
         nPtwe3cFZtPq1VwlfsNwVDhukblJAhXK6bDfDZgqe7YKini3zh3x1eit/CfvprJ3a0Ks
         M2VjiaUmVaCt01K2YTgj3jHACPZH++xxGgLnJTotgVgf6IS2UBrX7rmEDRjOMArpXLaQ
         HJWFBs5xZ6ho/OveseZK6oBNW3Cis4+5dXN5BWdE3+Twa2SUJfuRmRRbBIcsFihUuKxh
         9ZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hoN8ubV+NL8AcGXwOuvZXUIKfTF5XnABfb0Z79GoR78=;
        b=QhA9D2eA2LWS5/nEYog3N+Hi4UeYZejBmiZm2taWj1U5IFY78KUJqJQdBWy7wOvgj8
         WkaL7l2U/U6lcX3E3WhGV+uJcc0KOi/m+DpPXc8SkIXVFN/aoJLN1MrWnJB50nFHverx
         EggDdD89AJrGbcVAIwoWQezP3TrZHv2OmSIvLkchgYnqOsDk2U6gNsNu+1U53IwhqGNk
         z7uabgG5pZdTrHtA/ywQ9iej2GER0qIcMZtA8iXLoRUe71IqWpehQFjAlTIYtwjEk8Ki
         SSKsmS6xgDBIcKGNm7+DAPCBzxEGRFCtx2pEjz1nRj0NO2opiGfTidLvX4iOqpIm+SKh
         AYxA==
X-Gm-Message-State: AOAM5333xN/KeK7F2mzmvS1pLz+i+gX6MnoCL7nnO/jYDxt3KHql++9h
        3xaFSfQ9NgSKRRxwz0ijZHhDqg==
X-Google-Smtp-Source: ABdhPJyDAMpkxNCeCyDg4d41c3ZKCMFx16bjQHTR2qtezTonojG/p2TOp2opOGm3V2NDvAhkNWPc/g==
X-Received: by 2002:a05:651c:512:: with SMTP id o18mr13289143ljp.484.1626525624349;
        Sat, 17 Jul 2021 05:40:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f25sm794264ljo.126.2021.07.17.05.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 05:40:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 4/7] drm/msm/mdp5: move mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
Date:   Sat, 17 Jul 2021 15:40:13 +0300
Message-Id: <20210717124016.316020-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
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

