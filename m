Return-Path: <linux-arm-msm+bounces-14307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E87C187DF21
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Mar 2024 19:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF9AE1C203DA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Mar 2024 18:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 439CB1CF90;
	Sun, 17 Mar 2024 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHkmOhe9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720851CD3D
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 Mar 2024 18:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710698551; cv=none; b=EHk8WhNjv37ff9pRDkV3Qazs07/ORKfQDTAscw6L7kkrpg9H9TV9NynXmMZkGGs9i2Ft6c2ZuYHjmEWrnPAB93xmvUgp+dDJsj7kCHRdYQCgAuSVBg24/rPno4e1dF+IZy/3/uKNKLX2jZGd8qPffE09rgy9mFucuWpQvD/kXPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710698551; c=relaxed/simple;
	bh=D+qvVh0fxJVNOZLE5aXUyFEzSnwnskp7ab6OPEi/q68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u0jwVo/wVW536fnU4x7rNOGkQLiUj/gKZdg90exPuJnAiZ9wJv8pKJgDwMWsasp9LE3SlDAcrRB3M8n7sqn34GWNLxiHpio005UX2QOExhgHV2wX4q1dWzWS2rSMXS2u5g+O7mIscI4PnI/S7kpC9oeIsjDW+1faWnph1taUkSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHkmOhe9; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d27184197cso48395601fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Mar 2024 11:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710698547; x=1711303347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUbeueA1ROk6a8DiyLDqdiiGKg+OYyEnSiWbLatHNh0=;
        b=jHkmOhe9vsVYOBKhpZY5QzvaXQ52P5xESP3+AKDLo6+4iw0HXM1vMepcaaHievsyWg
         4QqLqr6pyOHlnWAtYjjJJcGS2vmmBR0aPw2dCsqZke3HhP5fzEquEsQskw5oJEoP41KX
         o4ZO3btDZpn01gqDYjE05wmgKL+RyHZbQp/FASqeNKLzMwRW03vCWZd2czBMmV5CsAiD
         b4gK2BjdRJgx/+ujVWOdvxEZo3Lz4QoBbk7qrwKEMJfRXRvvJh4K4nAWVxGYOSRldXTo
         hoDIhyybyxIQAX0pSHg2SiO8N/fxCP8wbMbkZtDYM56rjRbv9tjZ6DUQZjjumxr+yrIv
         wE0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710698547; x=1711303347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eUbeueA1ROk6a8DiyLDqdiiGKg+OYyEnSiWbLatHNh0=;
        b=RfpsTrJ/wOu2N30218EWf1FDfPqWSePJt5ZYtQqVhywiPcW3mT3w8lUINJWC8kPQt6
         8hNnGKzCqyKyvO1ip/aZM72QNXG77IRHfPt8a/oiGvgTeG3gJxOU98ZN/Iq6PNhrWOYT
         va4n9bgbBAGGp5cc5GLSI2LMGnqCn3OMOygxvtVqN7rasHwndfHa47TNIzM7DHGHr66D
         N7dLHIv5IZzG/aKfV8Xe6WZjWG+YWhuU7j6Bx1F3Bjxjf/vKsiuEjkUfP6JkXbfnntSv
         zyN8fqKBUxZQlmmE60vWAtAkTzjNNUZlPkhK1VNOLJYDnJWZexQcmqPKrN37lr5j9UkL
         pwaA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ2tAWM5oRtslFs63qYmF2EPW9bvl/GnfI5KZWiOFgidkEnpTKZwgnvJjpkbpshcQfsNslUAjAW9dZxsGnuH85hWsDc/2rmvd85h+qFQ==
X-Gm-Message-State: AOJu0Yw12Ms8s6RDj4sA3vHijtrq/rkucuWKDC6ELtKude+sEduMq1Xx
	2NTyiTcq1Rc/XZmXZaMqvcZSjHbX6EYDAIGj4+w8YRsItjbx6fLU
X-Google-Smtp-Source: AGHT+IHYndevLgkLj2qn2VG5Ekz45J5RTZHx/x5titxqY0o/yJQDg+GTMq5OAZ75QcYiLH1jriFPAw==
X-Received: by 2002:a2e:3613:0:b0:2d4:57c5:8862 with SMTP id d19-20020a2e3613000000b002d457c58862mr6915147lja.4.1710698547509;
        Sun, 17 Mar 2024 11:02:27 -0700 (PDT)
Received: from betty.fdsoft.se (213-67-237-183-no99.tbcn.telia.com. [213.67.237.183])
        by smtp.gmail.com with ESMTPSA id w6-20020a2e9bc6000000b002d2d384519dsm1173483ljj.102.2024.03.17.11.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 11:02:27 -0700 (PDT)
Received: from ester.fdsoft.se ([192.168.1.2])
	by betty.fdsoft.se with esmtp (Exim 4.97.1)
	(envelope-from <frej.drejhammar@gmail.com>)
	id 1rluq2-000000005e0-2eHg;
	Sun, 17 Mar 2024 19:02:26 +0100
From: Frej Drejhammar <frej.drejhammar@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Frej Drejhammar <frej.drejhammar@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 07/11] drm/msm: Use drm_driver_legacy_fb_format() for fbdev
Date: Sun, 17 Mar 2024 19:01:32 +0100
Message-ID: <b0b9563ed12a403883e7f2239eeb8bd2a007ad40.1710698387.git.frej.drejhammar@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1710698386.git.frej.drejhammar@gmail.com>
References: <cover.1710698386.git.frej.drejhammar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch to using drm_driver_legacy_fb_format() instead of
drm_mode_legacy_fb_format() to use the same logic as for the
DRM_IOCTL_MODE_ADDFB ioctl when selecting a framebuffer format.

Signed-off-by: Frej Drejhammar <frej.drejhammar@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org

---

This is an evolved version of the changes proposed in "drm: Don't
return unsupported formats in drm_mode_legacy_fb_format" [1] following
the suggestions of Thomas Zimmermann.

[1] https://lore.kernel.org/all/20240310152803.3315-1-frej.drejhammar@gmail.com/
---
 drivers/gpu/drm/msm/msm_fbdev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_fbdev.c b/drivers/gpu/drm/msm/msm_fbdev.c
index 030bedac632d..05bedf210572 100644
--- a/drivers/gpu/drm/msm/msm_fbdev.c
+++ b/drivers/gpu/drm/msm/msm_fbdev.c
@@ -77,7 +77,9 @@ static int msm_fbdev_create(struct drm_fb_helper *helper,
 	uint32_t format;
 	int ret, pitch;
 
-	format = drm_mode_legacy_fb_format(sizes->surface_bpp, sizes->surface_depth);
+	format = drm_driver_legacy_fb_format(dev,
+					     sizes->surface_bpp,
+					     sizes->surface_depth);
 
 	DBG("create fbdev: %dx%d@%d (%dx%d)", sizes->surface_width,
 			sizes->surface_height, sizes->surface_bpp,
-- 
2.44.0


