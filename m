Return-Path: <linux-arm-msm+bounces-28256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B3994D65D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 20:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C18A3B21A90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 18:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B88A15B98F;
	Fri,  9 Aug 2024 18:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cDUWftdS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B917115AD9B;
	Fri,  9 Aug 2024 18:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723228678; cv=none; b=FvoKDk3++srGlvP04Z4kGNnz8jBqCJJNCR4tbJLxeqx+e5+zCKSwmxdhXv7EhouSnfUGi2LwA1O027EWCJmPEQ425mxrTiKWQfENX7snFBSwMgXcJSCNKJ0nZ1/5OI/bgsLc688RmuGdtkdpIfp7educHInnEQPaAwGqtTLLKOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723228678; c=relaxed/simple;
	bh=Lvd1+b+rzlVHbVA2wsGaQIik0N4Z41fVLeWvp32JF/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ir5DkncwGusEd8ba3BsOx9iW/2rWm91YQl2KODXQybdYG94GbbjKPdkODJam4xFMXWYHW2ilmIVQHE1gfq+gBWoRx9qdQLJ6dzTdTc+kAq2ZZQtZcQobyMJiNOORQYsDQ/u9KNPP17ZczKQfd8OvtC8GdCcDVT/z0ytC/Zo6prE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cDUWftdS; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2642cfb2f6aso1615944fac.2;
        Fri, 09 Aug 2024 11:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723228676; x=1723833476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=23V8N5AdZVNN/gtxnVahpyZ2F/zrIdL7fbh1DnGikW8=;
        b=cDUWftdSu6cMa1E8Ful5TC4KhDk9QYx2/mS9aE+XnyEHbxzSxp+uiwPgWBPI9CX4QJ
         dnmjpgO1hZY2bYbZDGmFG8wMx2hyFLY4xT7oERF8BcWgbj+u/3IVfKSgSoRyDDxMinjc
         Ov/y0RjP9RCsRKdtORHBk72H8hCOiRBfftdt/v4DmC9uPuizXiJv7FwRE3fcPLwmhdxY
         WdHSxRbXn4PSQdgIouCVGPHXiAjTfJiibPARP08DOVxjBEYzEjKmkKl+r3XV8TuA1RWI
         0lKHyECosj8smd2puVn9nHba6xVgNs+6S9KQdi3RSVGcuoIMe/n1KvHSZnzsSJPbBIBh
         paOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723228676; x=1723833476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23V8N5AdZVNN/gtxnVahpyZ2F/zrIdL7fbh1DnGikW8=;
        b=TmgT6PhbWwHernEvXcmBG4ZIHYxwV3f3MtBDYjslOQ3HaTBVPFpuVdGc8U05svfn8X
         0hJVIXpLuRuXYffcccDPR39LGPjuy9NRR7rSnyVh7j7apTNQnvxyk+LunGY9TcErfKDy
         GTLKRnIGK9gI4uBNYhPuKDxvFSYFSitRsSVPWewl0NQQmqPdaL9U8kYFcFhFNIidUzh7
         LXMc00d8CBl2nv2kBLpoTh8XjD9Pt7QKnKAEl7azbZdO3IZ99HkQlKoOiD8eTkg5w+6v
         L5A+VodKxhZ/dttfukU5p+FNxH288P51jr+87omVqyVGvwyg6mP4HBws40wCEjr836sG
         7vnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlgs3/+dHpxQ1BjbE1F5fKlQ/30V1CP2iEu0FVvIMEavAzB0rnKj1vXnEW18GeA79lWWrlrz6bARG6kXDm/0tefZPIoznphya/QRLJmadQWzvKfI/F3jPNK/24UMSBqBk30rgRQ37XhGY6AA==
X-Gm-Message-State: AOJu0YzdH1dFz0NK558CPre8pyuCT9Jl9MJCDGPJKxEyVxrJsr06hBmE
	a0bDu5dxtXCPd83NwT6ODebV7a2SdBChyN5HxvTfmUzhvAQXC5XM
X-Google-Smtp-Source: AGHT+IENkZRkxsFSj8C+quRCgcAYIlP4KqTdlj4pXZh5I6G6gUctkIHTSWJe6NHYXlgtEeTz+miBOg==
X-Received: by 2002:a05:6870:8318:b0:254:94a4:35d2 with SMTP id 586e51a60fabf-26c63021a6dmr2759931fac.45.1723228675709;
        Fri, 09 Aug 2024 11:37:55 -0700 (PDT)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a4a962sm68841b3a.106.2024.08.09.11.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 11:37:54 -0700 (PDT)
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
Subject: [PATCH] drm/msm: Remove unused pm_state
Date: Fri,  9 Aug 2024 11:37:52 -0700
Message-ID: <20240809183752.160634-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This was added in commit ec446d09366c ("drm/msm: call
drm_atomic_helper_suspend() and drm_atomic_helper_resume()"), but unused
since commit ca8199f13498 ("drm/msm/dpu: ensure device suspend happens
during PM sleep") which switched to drm_mode_config_helper_suspend()/
drm_mode_config_helper_resume()..

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index be016d7b4ef1..c2eb9f14323e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -215,8 +215,6 @@ struct msm_drm_private {
 	struct notifier_block vmap_notifier;
 	struct shrinker *shrinker;
 
-	struct drm_atomic_state *pm_state;
-
 	/**
 	 * hangcheck_period: For hang detection, in ms
 	 *
-- 
2.46.0


