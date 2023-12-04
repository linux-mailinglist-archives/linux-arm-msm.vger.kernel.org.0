Return-Path: <linux-arm-msm+bounces-3273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3AB80342D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 14:15:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED8EE1C20AC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 13:15:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27B1024B2E;
	Mon,  4 Dec 2023 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPYL82JH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FC04FA
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Dec 2023 05:15:00 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id 2adb3069b0e04-50bfa7f7093so898641e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Dec 2023 05:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701695698; x=1702300498; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDYOW09h+pT00R97XM10ZVFeYIp6xI3XBNZf6tighVY=;
        b=lPYL82JHGt4Vg5bgYZ7X6IdzlP295TdD9h0MIl4xHNckU8VUlLXXOjUhnfJ07MiJDA
         ZRL/KIAbjfv5OA1iUZAQmDLY6MJCjo9iW76AlVvfAmqe6tY1Ej41CKYfF2+qaTBegeTl
         6mg/OWzwHmwExiCx+1juZ3um12xIiXlijnWGaHtJTfQprW1Lfj5l0Q8a04ZVcAeAzRxI
         wwnKuvu/LGfKFrC4soBHKzBU00tumq70Y5KjWl87OqI4mMn4Amx6Xzt41V5Zqqxkgjjf
         iKsHQJOdQ3Yb8B2K6HaxH5hM78drVJwqPQfPcZ7hpqggvt099ZFhqS/N+ktqXAT0q7JE
         hZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695698; x=1702300498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDYOW09h+pT00R97XM10ZVFeYIp6xI3XBNZf6tighVY=;
        b=FqA7xrxUBnBJFz+Smn83NH/Yj1cSy5ZpE31+P4j9uDF1VUgeqi9lwox5AzNeN9ZUNs
         19Z9bPu4LXCvOup5jGA1ZPOPozPsMnJU0SXTEp/DC1TLULHI7vnYv1Ls8SODAgrSRtVj
         WjK4OfBL0GVWfDgAeE1jHYDhqOlCJHBPUFh7N4Gab7R5iRJCAW0+2d9q+doD0PMR4OaJ
         dLQDbC2mILd2TqY4+dhy5yqxwhTl3twe98DLKumOdLRgG6Mv3HPrH/rUzL/RPUsPen2y
         hDcwZSvgHM0fYBknATfAkw099uole6LqE4zYQUP08gOqmC55XyfOfLvgoGvy7Vn5+Ja4
         BehA==
X-Gm-Message-State: AOJu0YyvV1vtqRGHAwb/Dmg7HXc7RfvF4M2MkZnU70xHE9ASVjqN0dB2
	bRs8trg34Gh2uLMA/5LU5AOxhQ==
X-Google-Smtp-Source: AGHT+IFYEXM+I7k7BfurZSUwYVxgU9MIJ9BegdhKzAyCoiOcrClosqZ8ZjBR5b2uLlnUHG4uDlAkWg==
X-Received: by 2002:a05:6512:2396:b0:50b:d764:96a4 with SMTP id c22-20020a056512239600b0050bd76496a4mr3713697lfv.136.1701695698646;
        Mon, 04 Dec 2023 05:14:58 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
        by smtp.gmail.com with ESMTPSA id br25-20020a056512401900b0050bc59642casm1251924lfb.286.2023.12.04.05.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:14:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/7] Revert "drm/atomic: Add solid fill data to plane state dump"
Date: Mon,  4 Dec 2023 15:13:50 +0200
Message-ID: <20231204131455.19023-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
References: <20231204131455.19023-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e86413f5442ee094e66b3e75f2d3419ed0df9520.

Altough the Solid Fill planes patchset got all reviews and
acknowledgements, it doesn't fulfill requirements for the new uABI. It
has neither corresponding open-source userspace implementation nor the
IGT tests coverage. Reverting this patchset until userspace obligations
are fulfilled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c | 4 ----
 drivers/gpu/drm/drm_plane.c  | 8 --------
 include/drm/drm_plane.h      | 3 ---
 3 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 1339785fbe80..02aa7df832cc 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -726,10 +726,6 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
 	drm_printf(p, "\tfb=%u\n", state->fb ? state->fb->base.id : 0);
 	if (state->fb)
 		drm_framebuffer_print_info(p, 2, state->fb);
-	drm_printf(p, "\tsolid_fill=%u\n",
-			state->solid_fill_blob ? state->solid_fill_blob->base.id : 0);
-	if (state->solid_fill_blob)
-		drm_plane_solid_fill_print_info(p, 2, state);
 	drm_printf(p, "\tcrtc-pos=" DRM_RECT_FMT "\n", DRM_RECT_ARG(&dest));
 	drm_printf(p, "\tsrc-pos=" DRM_RECT_FP_FMT "\n", DRM_RECT_FP_ARG(&src));
 	drm_printf(p, "\trotation=%x\n", state->rotation);
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index c65c72701dd2..c8dbe5ae60cc 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1641,14 +1641,6 @@ __drm_plane_get_damage_clips(const struct drm_plane_state *state)
 					state->fb_damage_clips->data : NULL);
 }
 
-void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
-				     const struct drm_plane_state *state)
-{
-	drm_printf_indent(p, indent, "r=0x%08x\n", state->solid_fill.r);
-	drm_printf_indent(p, indent, "g=0x%08x\n", state->solid_fill.g);
-	drm_printf_indent(p, indent, "b=0x%08x\n", state->solid_fill.b);
-}
-
 /**
  * drm_plane_get_damage_clips - Returns damage clips.
  * @state: Plane state.
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index d14e2f1db234..4b7af4381bbe 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -1025,9 +1025,6 @@ drm_plane_get_damage_clips_count(const struct drm_plane_state *state);
 struct drm_mode_rect *
 drm_plane_get_damage_clips(const struct drm_plane_state *state);
 
-void drm_plane_solid_fill_print_info(struct drm_printer *p, unsigned int indent,
-				     const struct drm_plane_state *state);
-
 int drm_plane_create_scaling_filter_property(struct drm_plane *plane,
 					     unsigned int supported_filters);
 
-- 
2.42.0


