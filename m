Return-Path: <linux-arm-msm+bounces-15107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F6088B43D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 23:37:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12C89B35D70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Mar 2024 21:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF37862A02;
	Mon, 25 Mar 2024 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DQVPqagL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DDD60267
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 21:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711400895; cv=none; b=bp1DkW4QORWSrHylMbdB2/YlYPbCi9Zu6MebmRL6IUM1pnGOqSWskck6t70qTQVZGfWy/xiNwuOATSXlSTooqvWvS5tI+ci/Y7+ISDPlprVfS5xJ/hGi5lGKB0qI9nw2YFkjPIFUtQ5tACXo8eWHlfCt2I6Uu7lSsOCbjiIZxAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711400895; c=relaxed/simple;
	bh=lniH+K6uobF32tHcdj8snosy2n/Wm+ZT7d9jUBOBkIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XQaCQDseUEB0qIMprHKmWaFCfw1wJI5ss9ryePcLd4Xnl3bER4DCOYlsbSeGjMsXOfDk1KkmLUSIN02AdMuolcRp/z+ZYG76QLKQ+w5Jpw8l+ihAY+yVsStSvgMOmRds+YIWfwU7FNCyausUeCVcB5BD4xG4QXwDLsgU/5xGjOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DQVPqagL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6ea9a60f7f5so1805938b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Mar 2024 14:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711400893; x=1712005693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mOw6fcswQwxOvYHww+pfzlL0zz/FCwx/qV0ISLCzS6k=;
        b=DQVPqagLnY5YLX7LfPp1gAEJzf5UnUSoy5UASsi3mXrRxzhUpiBZvsdxw94MK92Pnr
         uZIUh0pcacrNkTpTJp39fTSQSswvTIQqJsDlHPOumED4u8s8RtEknTc+hDLWduBq6H91
         f5VMWxi3bG0DhZpszI7Z82xa7bDanWZG4I0lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711400893; x=1712005693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOw6fcswQwxOvYHww+pfzlL0zz/FCwx/qV0ISLCzS6k=;
        b=WgVye6JbZgN3WnjDzufTQ8hVjyezMEddIGwwv8HUomZjQ8wTkp8RA7MPJiQVqxdM4N
         SmWo1s4Bi3wmP610/VuarDXB7c3WWSzHrEQ0U9F46JrkUS81gy+q9gcF9JW0asOMp3i6
         WtYmKq0FzX+iXP77XU2rChPCF02p7ub6q4+1+F+vBE2kqA2tgYQn/vOdhpjJqLMaLhHV
         I1RoiT20plitqXCkHVY3AUbGr6Z/YRZ2IX9eLz1BRFNBpeU7vT/kaq3NlKPGV3aHmXw+
         IAPd4wRoCwHvnyxlmQIQHOJ29/XchgWRvNDgr8KmB7srrix3Mq2SFaycd+f03mwZZR3H
         oRfg==
X-Forwarded-Encrypted: i=1; AJvYcCUUJmm1hxt096Th2oDOxU2YK0ygvcf/7FS2uBbGs61Lo+T5cK3ePZYnyF7VHlluuYBGJJd5Dak74Hop/aljdXkkbQOGChXVkCthjHzHcw==
X-Gm-Message-State: AOJu0YzaKYPh434JworsyvnGpQoixcEfz8Sw6ZptLS7JgI1vRPz+gnTi
	YytNR+B0bl8pUoDql55tDOSa341GrnarPOenr5TQjJ7cfQ2yDBQwpIZ4REphjQ==
X-Google-Smtp-Source: AGHT+IFNMzzlQS+M2WzYTzH5qd5yGumfrSL44l9e2y2KmdW8eGoSNDQ4K0XzusabfDNfOaNLkU2CdA==
X-Received: by 2002:a05:6a20:12d2:b0:1a3:4671:2285 with SMTP id v18-20020a056a2012d200b001a346712285mr7841746pzg.44.1711400893255;
        Mon, 25 Mar 2024 14:08:13 -0700 (PDT)
Received: from localhost (4.198.125.34.bc.googleusercontent.com. [34.125.198.4])
        by smtp.gmail.com with UTF8SMTPSA id fn18-20020a056a002fd200b006e4e93f4f17sm4584180pfb.117.2024.03.25.14.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 14:08:12 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add newlines to some debug prints
Date: Mon, 25 Mar 2024 14:08:09 -0700
Message-ID: <20240325210810.1340820-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These debug prints are missing newlines, leading to multiple messages
being printed on one line and hard to read logs. Add newlines to have
the debug prints on separate lines. The DBG macro used to add a newline,
but I missed that while migrating to drm_dbg wrappers.

Fixes: 7cb017db1896 ("drm/msm: Move FB debug prints to drm_dbg_state()")
Fixes: 721c6e0c6aed ("drm/msm: Move vblank debug prints to drm_dbg_vbl()")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_fb.c  | 6 +++---
 drivers/gpu/drm/msm/msm_kms.c | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index e3f61c39df69..80166f702a0d 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -89,7 +89,7 @@ int msm_framebuffer_prepare(struct drm_framebuffer *fb,
 
 	for (i = 0; i < n; i++) {
 		ret = msm_gem_get_and_pin_iova(fb->obj[i], aspace, &msm_fb->iova[i]);
-		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)",
+		drm_dbg_state(fb->dev, "FB[%u]: iova[%d]: %08llx (%d)\n",
 			      fb->base.id, i, msm_fb->iova[i], ret);
 		if (ret)
 			return ret;
@@ -176,7 +176,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 	const struct msm_format *format;
 	int ret, i, n;
 
-	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)",
+	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)\n",
 			mode_cmd, mode_cmd->width, mode_cmd->height,
 			(char *)&mode_cmd->pixel_format);
 
@@ -232,7 +232,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 
 	refcount_set(&msm_fb->dirtyfb, 1);
 
-	drm_dbg_state(dev, "create: FB ID: %d (%p)", fb->base.id, fb);
+	drm_dbg_state(dev, "create: FB ID: %d (%p)\n", fb->base.id, fb);
 
 	return fb;
 
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 84c21ec2ceea..af6a6fcb1173 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -149,7 +149,7 @@ int msm_crtc_enable_vblank(struct drm_crtc *crtc)
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return -ENXIO;
-	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	drm_dbg_vbl(dev, "crtc=%u\n", crtc->base.id);
 	return vblank_ctrl_queue_work(priv, crtc, true);
 }
 
@@ -160,7 +160,7 @@ void msm_crtc_disable_vblank(struct drm_crtc *crtc)
 	struct msm_kms *kms = priv->kms;
 	if (!kms)
 		return;
-	drm_dbg_vbl(dev, "crtc=%u", crtc->base.id);
+	drm_dbg_vbl(dev, "crtc=%u\n", crtc->base.id);
 	vblank_ctrl_queue_work(priv, crtc, false);
 }
 

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
https://chromeos.dev


