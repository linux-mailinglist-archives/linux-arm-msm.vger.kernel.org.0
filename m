Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89C81418426
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 21:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhIYT3f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Sep 2021 15:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhIYT3e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Sep 2021 15:29:34 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5739C061570
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 12:27:59 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u8so55118387lff.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 12:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GNhncKhzYt179JtcdPH7NHcfH9wwnLbbbm0VxyfgFY=;
        b=Gj5pzAQvVgG2EffN+M+6NlFN8FcsHHq1Wn80RUxW4esA5eJjxuh+fNK0wva16U3AM7
         PYkL2thL37ugm+QR7NUPh01QXaYpyvkrBzRgN7aRvEzhGb6VgzrPe1940OR80e31IsV/
         L39vWXpE/d1l+vHZyGMXGbbrfofIbkt3pKaGWsN00zO3EpFlOpaTBIt5tOFid8W6fMdf
         /kjEKFNuJUyQufP2PRx5RuUC5W8NQXhzHw91v/P4Y6G8qJ0shZ26nQiyIRChLa/2zEAA
         URACDn0qAZgDmwsdQMlV36gR64lHB7e9XCq7SzYz00TC9Gzr0+O2Vu8k5JDJ1N//ZH+B
         4Bog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8GNhncKhzYt179JtcdPH7NHcfH9wwnLbbbm0VxyfgFY=;
        b=5OMJhA+wnUHPRxdp1OEM2g3OV7tK0Y+2YbcrLi3+IEkYwp0hZOcR0dchXfcnMMEJqG
         oNgkQhRS+X6l2CpM/jaw/v7imSEDIhn9rsvgc7PS+vUBCBjC6j0arCH7PFXMm2QUUskP
         wQcgJjxEl7zxuhIY2sNwex8dHrzgXyFJSGg3HDIVoNxWlWyZGk5igyxwKR4UVq8mPg6F
         KOueOIzQ/dXFpi0DMxosV2ez76BWsyHEMdKqJHy/mZXNfbHA/QRwRooOlotRn0O18Wp+
         /FVRewpPm6MeO6Tu1MUGo83MeuEOBpb95MvzR9sgFy/7FK9Lq8FcM7HfzkwP5S2L2jmP
         85kw==
X-Gm-Message-State: AOAM532mdHRZNHSpK+d0hFoqXVBNGG+evKeOegy3ASK4ghLHoImZPSQ1
        9p2GO0IxSaD3YlbjyswGKlKaDQ==
X-Google-Smtp-Source: ABdhPJy6LX179GHqGuBzASUeTK3hyXnohSWMwDszmleLcDgLGKerUG7Nt+weSiJSkUa7xW24kN4OJw==
X-Received: by 2002:a19:6a16:: with SMTP id u22mr16061203lfu.444.1632598078048;
        Sat, 25 Sep 2021 12:27:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x9sm1100753lfn.303.2021.09.25.12.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 12:27:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: fix possible oops in msm_submitqueues code
Date:   Sat, 25 Sep 2021 22:27:54 +0300
Message-Id: <20210925192754.3416212-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Even without GPU, the ctx->submitqueues list should be properly
initialized. Otherwise msm_submitqueue_close() (which can still be
called even w/o the GPU) will ooops while trying to traverse the list.

Move ctx->submitqueues initialization earlier, before !GPU check.

Fixes: 86c2a0f000c1 ("drm/msm: Small submitqueue creation cleanup")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 32a55d81b58b..a0303be05445 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -128,6 +128,8 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
 
+	INIT_LIST_HEAD(&ctx->submitqueues);
+
 	if (!priv->gpu)
 		return -ENODEV;
 
@@ -140,8 +142,6 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	 */
 	default_prio = DIV_ROUND_UP(max_priority, 2);
 
-	INIT_LIST_HEAD(&ctx->submitqueues);
-
 	rwlock_init(&ctx->queuelock);
 
 	return msm_submitqueue_create(drm, ctx, default_prio, 0, NULL);
-- 
2.33.0

