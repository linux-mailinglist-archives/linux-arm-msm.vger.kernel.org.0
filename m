Return-Path: <linux-arm-msm+bounces-3481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18198805E6F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 20:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 499F81C21072
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 19:14:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DFF6D1AC;
	Tue,  5 Dec 2023 19:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDq0QzXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9BE1B0;
	Tue,  5 Dec 2023 11:14:35 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d0c94397c0so6939825ad.2;
        Tue, 05 Dec 2023 11:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701803675; x=1702408475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pknw/VvLYNK3NWesRCpLV0ugYlmOF45KcA+VhnXY908=;
        b=bDq0QzXa143rDela7NtPJF7BCJpg1IMQ2DxGQMgCxolBDvIUt6XsKPF/7caJztyCRA
         0V6HdrHQhGz+UftVv6AW9GQX732rUwQo4emwsgUqKioKLYkyV8J1ul9v6asadOEYcKGN
         sUBH/r2J6ttTT0pSjvWkF64YvSK/fIlS/eL7TL7qhMRQWryULxbLXJpJcFVG5KSC0+AU
         RnPNY9hnh4hZFZXHQ62NjP+SqC3DWWHgFTxPtHdmqZnql8CDdek+SFqDEcSyHIBW96k5
         Dus57OsjOn7c0ff7bxH/NdJ7+E66hT4wIxhfOUBXqTHfTcrGBvZkv/4z5G+ZfNISv97R
         RZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701803675; x=1702408475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pknw/VvLYNK3NWesRCpLV0ugYlmOF45KcA+VhnXY908=;
        b=Y2afiJ/KzJDUdk1IQLtafkvbOMSEl2Js10xcLogH7Lmb3g5G88k640QhgqrVRtVOeg
         Q2GaCMv5JQ6BqXWQGzEPISV6h9irtUfvXBEke/Le5eoXpqf0uNBoVlbTGEHO16jYGEN7
         fK/RgUujBMS3XfrcXblNh6iOeK42LFMp+9ZIbnAQSUpk8HDyCu/8C5K3WfCclQxak52K
         f/AuaB2V0mkKFNy08izBAK78+d3WpqpJzrp4UxrsosjzhKZu0L70BJBSGcOyAb9wHH5V
         lYkLW9JoBw5NSHBywkGNU/pbnA5XJwBZLcjMPMD+0WUEH1LifLNdFeX3HvgeKXCRsXEk
         I5OQ==
X-Gm-Message-State: AOJu0Ywgd13IjyXCPkZKRP0xuNltbbjaVHp8WcPG7v/M8E5/BZL+vTow
	OHhqv+CnS2vNaBeGtau0BAU=
X-Google-Smtp-Source: AGHT+IH4QhGGCVQMZI6/S/JvN8KqYxLVz7LDAfS1buVk/65HdT/cEHqN5rKl2W7Ul3X8Yiq0f49aKQ==
X-Received: by 2002:a17:902:8f8c:b0:1d0:6ffd:ae0a with SMTP id z12-20020a1709028f8c00b001d06ffdae0amr3516430plo.113.1701803674929;
        Tue, 05 Dec 2023 11:14:34 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902f54e00b001cfd2cb1907sm3871557plf.206.2023.12.05.11.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 11:14:34 -0800 (PST)
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
Subject: [PATCH] drm/msm: Expose syncobj timeline support
Date: Tue,  5 Dec 2023 11:14:30 -0800
Message-ID: <20231205191431.373564-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This does unfortunately require a mesa fix to avoid turnip hanging, but
we don't have a good way to know the userspace version.  Fortunately
that fix is now in mesa-23.3.0-rc3 and later[1].

[1] https://gitlab.freedesktop.org/mesa/mesa/-/commit/2bd7e293bfed5d2956a5dcb3e17555d0f6817986

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c        |  1 +
 drivers/gpu/drm/msm/msm_gem_submit.c | 13 +------------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 50b65ffc24b1..c7ac2c0a7e27 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -893,6 +893,7 @@ static const struct drm_driver msm_driver = {
 				DRIVER_RENDER |
 				DRIVER_ATOMIC |
 				DRIVER_MODESET |
+				DRIVER_SYNCOBJ_TIMELINE |
 				DRIVER_SYNCOBJ,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 40878c26a749..9cffa4b50c39 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -511,12 +511,6 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 			break;
 		}
 
-		if (syncobj_desc.point &&
-		    !drm_core_check_feature(submit->dev, DRIVER_SYNCOBJ_TIMELINE)) {
-			ret = -EOPNOTSUPP;
-			break;
-		}
-
 		if (syncobj_desc.flags & ~MSM_SUBMIT_SYNCOBJ_FLAGS) {
 			ret = -EINVAL;
 			break;
@@ -593,12 +587,6 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 		}
 
 		if (syncobj_desc.point) {
-			if (!drm_core_check_feature(dev,
-			                            DRIVER_SYNCOBJ_TIMELINE)) {
-				ret = -EOPNOTSUPP;
-				break;
-			}
-
 			post_deps[i].chain = dma_fence_chain_alloc();
 			if (!post_deps[i].chain) {
 				ret = -ENOMEM;
@@ -617,6 +605,7 @@ static struct msm_submit_post_dep *msm_parse_post_deps(struct drm_device *dev,
 	if (ret) {
 		for (j = 0; j <= i; ++j) {
 			dma_fence_chain_free(post_deps[j].chain);
+			post_deps[j].chain = NULL;
 			if (post_deps[j].syncobj)
 				drm_syncobj_put(post_deps[j].syncobj);
 		}
-- 
2.42.0


