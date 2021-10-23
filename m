Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B85B438430
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Oct 2021 17:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229901AbhJWP5t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Oct 2021 11:57:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbhJWP5r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Oct 2021 11:57:47 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1062C061714;
        Sat, 23 Oct 2021 08:55:28 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id np13so5001799pjb.4;
        Sat, 23 Oct 2021 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pscnLJEu2qwqCNNmnoLt+B8mAL+wT7Lt+stuxD0ggY8=;
        b=Oo4Cz062CbmERZh9cQYtnlsjZVdoIWqp2ACOFlujb5+SNCV+N4akytp60NUL9wAfEz
         byOwgGbuhWaJ3W9/eWrrADJv+5SQTdlaLDcmAvV2XfV4altCl4D0FgAlpar8Yu/HaPr6
         194SsLuXKa+niMEdJKtFVZLOPdpf1OJDuZ1Wu+nCnFUM+Kss9Q942Q8+pQVOv6ScBBU3
         9F40BtCUCZ/J3EsLFTNsHHGJTS6iBZZic6sBAVOkkokod383YBpphyAy09b43xpFJZDW
         eJCUz3d92fduswDTbojasGDCKfjFjuaXs+HUXbnn+tCl1OebI86nzIIrQi7IcWxEFAg2
         vPPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pscnLJEu2qwqCNNmnoLt+B8mAL+wT7Lt+stuxD0ggY8=;
        b=Fm8n7pvbkxA2A9i4OSH8vM0lu5I895lI8hys51lRFclieC5ErP/2pH8TjQ+TXWvsn8
         kIu8CZhSH6l8kYPSYv+oirw2OX+Z4ndwUEhd7aDZ+sm1clcGSM1nNr5PsvBbjLw5af0+
         wUzkOmbVqJ81M7HXBd1vv1htYp0jLZIQkNuxOWqB9FY+E3QhSrPOaRZGt9SmMX7fglbD
         +rsPGYZoyiTtC2B/RpUrqKUCIeLh9WfuxpB7y/SfG/SpSYulsj4QAeCwpZvVkwjm7TEx
         6ieUrZm6DSo1FMAzFMQ9KP+eNV0hL+uX2RKc6gJU+zNVMK+NhQP4kP2/PkQwz0OOfL3Z
         xkuQ==
X-Gm-Message-State: AOAM530UBPSMJbofMbJEUU02HNyOakiNXIeG9BUmiYtIhMbnO9Pg2rfw
        2fIgUil7Kx/HbeOx109xvOA=
X-Google-Smtp-Source: ABdhPJwWT9j1dSDtcKbwaRRfAclgDzrk4miF5isQUOQpvRwMPAgBFNwatBSKXrX5LgYc8Vk6BITa5A==
X-Received: by 2002:a17:90b:504:: with SMTP id r4mr4662808pjz.157.1635004528186;
        Sat, 23 Oct 2021 08:55:28 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id f20sm2767205pfc.185.2021.10.23.08.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 08:55:27 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Jessica Zhang <jesszhan@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Mark Yacoub <markyacoub@google.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] drm/msm/dpu: Remove impossible NULL check
Date:   Sat, 23 Oct 2021 09:00:12 -0700
Message-Id: <20211023160016.3322052-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jessica Zhang <jesszhan@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e91568d4f09a..0ae397044310 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -187,11 +187,6 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc)
 	int i = 0;
 	int rc = 0;
 
-	if (!crtc) {
-		DPU_ERROR("Invalid crtc\n");
-		return -EINVAL;
-	}
-
 	crtc_state = to_dpu_crtc_state(crtc->state);
 	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
 
-- 
2.31.1

