Return-Path: <linux-arm-msm+bounces-989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE47EF4F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 16:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4A01F259B8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 15:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1700D32C92;
	Fri, 17 Nov 2023 15:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqwlhRIu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20CED56;
	Fri, 17 Nov 2023 07:14:25 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6c4eaa5202aso2089633b3a.1;
        Fri, 17 Nov 2023 07:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700234065; x=1700838865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=neKamCZO2wHDVbcksPS6RZHdFnPapK4yzUpgs5f2M5Y=;
        b=TqwlhRIu/qlRj1E2yMaU2KztJPTJAzUDVU6qbaujEogaWRUIqjKOfUbZfCNq894odJ
         IrkkPXnzxW1Hny3uCQXD2qniXz2BGnd6vNudC5PH86gpBb43M9Ad+JBFWDzAfEBdae87
         4gXLHl3EVIw6mb8HYIBsckvnDc9xWDngTeuaTAb5k8Gt5ew68RhuSMB4UeKXR+aJo6gC
         vePc338mvZssNi3B/Gw95ASvZTqEI/iWvpfMt/ufamFWZZdoRXWen2pNFxjt5vzturt9
         +H/706WOFcBj8FdWVKvHWKQCjM87Atfub92tpRbGoFuM2JUgfkMZJ1xH2yRYqX9Jpef4
         5ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700234065; x=1700838865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neKamCZO2wHDVbcksPS6RZHdFnPapK4yzUpgs5f2M5Y=;
        b=fKSJthGixcujM2Y7N/J/cN8jmA0oWtwRmhTjyW/OYm3HYov3kTYkgVbdWRl1Q5Q9Nm
         daAnpsZ6NwnvuPryjRvoswRqJRWhntavmEusn1ABjYYL9NVagAsJi9TVEiXxQOzfNJWz
         ROKiv35JY+vqirr8+BSGi9lMMFDl3O4PPIy65s5a5fMqLpwaqU4yQKVjtsO8DHu7H5tv
         qKt6LfcPHv2d9OvxcuamUf+bEvF32L4dGErB4PhXj03p6prxGqYjl525il4W0LgYm8ej
         8us5FOe+jUNxpMMuZnnScw3YytVzYzm5AaP6ZgnYkTPuzctDJR/OCuZp6pQhWfoF6eFy
         OnwQ==
X-Gm-Message-State: AOJu0YykajZqmG/RhYnViMNCAiME7LOBoeIPNFyB7jXILelse3v8UvyV
	laX55ULhTdEqonHJTIRrKfo=
X-Google-Smtp-Source: AGHT+IHNamJGjWsZcOgdHZgk/IVdURgF/leP60XW8Fd2vRVnOipM3gRSx8X3je7JYe506jJkwKWbDg==
X-Received: by 2002:a17:902:d4cb:b0:1cc:5a74:b1df with SMTP id o11-20020a170902d4cb00b001cc5a74b1dfmr13978668plg.2.1700234064990;
        Fri, 17 Nov 2023 07:14:24 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id m18-20020a170902db1200b001c8a0879805sm1474315plx.206.2023.11.17.07.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 07:14:24 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm: Reduce fallout of fence signaling vs reclaim hangs
Date: Fri, 17 Nov 2023 07:14:19 -0800
Message-ID: <20231117151420.351995-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Until various PM devfreq/QoS and interconnect patches land, we could
potentially trigger reclaim from gpu scheduler thread, and under enough
memory pressure that could trigger a sort of deadlock.  Eventually the
wait will timeout and we'll move on to consider other GEM objects.  But
given that there is still a potential for deadlock/stalling, we should
reduce the timeout to contain the damage.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 5a7d48c02c4b..07ca4ddfe4e3 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -75,7 +75,7 @@ static bool
 wait_for_idle(struct drm_gem_object *obj)
 {
 	enum dma_resv_usage usage = dma_resv_usage_rw(true);
-	return dma_resv_wait_timeout(obj->resv, usage, false, 1000) > 0;
+	return dma_resv_wait_timeout(obj->resv, usage, false, 10) > 0;
 }
 
 static bool
-- 
2.41.0


