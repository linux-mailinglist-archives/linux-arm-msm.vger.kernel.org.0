Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63ACF37013E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 21:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231909AbhD3TcJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 15:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231924AbhD3TcB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 15:32:01 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B150C06138E
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:11 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id m37so7514605pgb.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aJ+k3IkP64GrSMDN3XqhlRCKvJ7LRYhzYp66VmVBeis=;
        b=YPUpF5gx6Lu8x87kWG9G1iUmfJZTG1SZgK7pPfzpCnhg+TO/nM1cgv9t3JdcWDSGAB
         NX30bokGW4Z2WZ5U4ysecHQfhymeosrtVZDi4XJhd28gmzQi+er5E1eIRH5Aew4WAYDr
         ZcPfKN3smOIxktECGFriRt108hyAVsWrSaqyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aJ+k3IkP64GrSMDN3XqhlRCKvJ7LRYhzYp66VmVBeis=;
        b=COU4UFX+fXMMJ0MuBFHpIr+8i/ZGXDJ9SeYEfDdHYbZl87IqPC6a+Lua7EDFK93I3c
         gexhr+3DPAeCX7KY47MzFsnM0Y7l2woPUTa0txN/8mMppuqZ67Y1G4XsWiYulC65hpL5
         0bfpt/7hg2bs11Gs3MucqNK1E/A6/R8Mxg1cUP/6W5E9x1d77ShwO9aUKOL5c04oKISN
         aLUrwQbT4GsRxHVF27bZ2fVOaIVsHoCUnJYTsObeiqcCXznhZbtIg+bAFWdWOxKer1kT
         zy5dVutXh7sVQkgGU7PKjukPVwTkpV1QoEqVlhJq7yNfN4swgKsI8qdYW8OA/nKS7jMU
         nSQg==
X-Gm-Message-State: AOAM533yW2mx1lslWM+fkb0MPO81T9mmyynNDBdw+pgUkJB3ntQplQ0Y
        tynorZF/BFFNomkFi1Tui0plsg==
X-Google-Smtp-Source: ABdhPJxcQu43rdPftTPt75+wh2/LKuEDDLavYiD0jFeq32eOpYBQlZf0JkfMckweSNYSpOTy6PnPaw==
X-Received: by 2002:aa7:9e9e:0:b029:257:b49:2800 with SMTP id p30-20020aa79e9e0000b02902570b492800mr6753357pfq.10.1619811071035;
        Fri, 30 Apr 2021 12:31:11 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
        by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 12:31:10 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 4/6] drm/msm: Move FB debug prints to drm_dbg_state()
Date:   Fri, 30 Apr 2021 12:31:02 -0700
Message-Id: <20210430193104.1770538-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These are verbose prints that tell us about the framebuffer state. Let's
move them to drm_dbg_state() so that they're only printed if we're
interested in verbose state logging while drm debugging.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_fb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index d42f0665359a..90514d3179bb 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -60,7 +60,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &iova);
-		DBG("FB[%u]: iova[%d]: %08llx (%d)", fb->base.id, i, iova, ret);
+		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)", fb->base.id, i, iova, ret);
 		if (ret)
 			return ret;
 	}
@@ -139,8 +139,8 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 	const struct msm_format *format;
 	int ret, i, n;
 
-	DBG("create framebuffer: dev=%p, mode_cmd=%p (%dx%d@%4.4s)",
-			dev, mode_cmd, mode_cmd->width, mode_cmd->height,
+	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)",
+			mode_cmd, mode_cmd->width, mode_cmd->height,
 			(char *)&mode_cmd->pixel_format);
 
 	n = info->num_planes;
@@ -193,7 +193,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 		goto fail;
 	}
 
-	DBG("create: FB ID: %d (%p)", fb->base.id, fb);
+	drm_dbg_state(dev, "create: FB ID: %d (%p)", fb->base.id, fb);
 
 	return fb;
 
-- 
https://chromeos.dev

