Return-Path: <linux-arm-msm+bounces-3063-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBFE801FDE
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 01:05:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929D61F2101D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Dec 2023 00:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A362F38;
	Sun,  3 Dec 2023 00:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="coxPpZKs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A88BE3
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 16:05:37 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50abbb23122so4667640e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 16:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701561935; x=1702166735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JO3m8ahifaDZ0+MNukHcqzkkdAa1Y9cf8gmY03LWk14=;
        b=coxPpZKs77ZyM1pXxmt66CeRKf+hVxFyJiD6nurJI8MLJbVJGKM0nvNijGOpP4nL52
         WOQETEBaKFP5KHvzkVTXF6pm04/MG4SItAr0xRCKM4pvoP/3v+4mnwRX6XMaF5IgQrbY
         IxxMiMDWnpspw9vM7nFNEYdv1cs02LdWemV0HeJXnJhtiolUS8FhFdr8RdEXthlrsDwx
         ONT+bvuLinJ+k9LKAklAcP8WXXbtJ9v1tzjOniJuoNf2R6AfuBBofNNTeDAElj+cW4/J
         8QjyAEs74Wbigyxe8sevUm6IIA+sIMko8E+F8b9TMkRd0VgoY+q6PT19xnjnc5MDaO12
         6Sag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701561935; x=1702166735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JO3m8ahifaDZ0+MNukHcqzkkdAa1Y9cf8gmY03LWk14=;
        b=NlGRf2TqqlJXSuahdlWL97shqpACwxe5fje59pxHmo6X7alZ9KoSfPeuIDJBq8Pj9M
         YB0IJfAVCPwiv/+KM+9zS4OdVuHH7nGFyQLTqpxjyKuNoVi1ds+uQUc+5RIZf8BjdOq0
         Js4ZKwcutcfJyfl9fZWlP9eLb8K9f5fSgBGqxL8/HuIXEUkaNHwxdKlyBB4uj+LCJK95
         QIOB0M5P74oJ7keudv0XMzHIVUYhAxTrsciiy/5/vqvIEVEro8mwwUzGxBhEipusevrW
         t3QQzD/s9CTMzEjJfXNeoRvTZF7pN3cWzJccyTE6QP4W5fqwrIVzGh3TPWAOPWrxyKRe
         dAig==
X-Gm-Message-State: AOJu0Yz6cCEHAtiW0QIoo7Cwzz9rXrZQ7pApI0U3DB0kV8bhRGsKup/7
	awglcDDFf2uq5tzWWfQ3fAkHKw==
X-Google-Smtp-Source: AGHT+IH/f0Rg02BqzF0RxgclP0Ngb9Yhu8RdxeWoyIlgBcPLdaE4UHjLlCCMIAdKZLauDY7T3sDXtw==
X-Received: by 2002:a19:ca5e:0:b0:50b:eead:3756 with SMTP id h30-20020a19ca5e000000b0050beead3756mr343659lfj.54.1701561935562;
        Sat, 02 Dec 2023 16:05:35 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 16:05:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH RESEND 1/5] drm/atomic: add private obj state to state dump
Date: Sun,  3 Dec 2023 03:05:28 +0300
Message-Id: <20231203000532.1290480-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drm_atomic_print_new_state() already prints private object state via
drm_atomic_private_obj_print_state(). Add private object state dumping
to __drm_state_dump(), so that it is also included into drm_state_dump()
output and into debugfs/dri/N/state file.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_atomic.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index f1a503aafe5a..c31fc0b48c31 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1773,6 +1773,7 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
+	struct drm_private_obj *obj;
 
 	if (!drm_drv_uses_atomic_modeset(dev))
 		return;
@@ -1801,6 +1802,14 @@ static void __drm_state_dump(struct drm_device *dev, struct drm_printer *p,
 	if (take_locks)
 		drm_modeset_unlock(&dev->mode_config.connection_mutex);
 	drm_connector_list_iter_end(&conn_iter);
+
+	list_for_each_entry(obj, &config->privobj_list, head) {
+		if (take_locks)
+			drm_modeset_lock(&obj->lock, NULL);
+		drm_atomic_private_obj_print_state(p, obj->state);
+		if (take_locks)
+			drm_modeset_unlock(&obj->lock);
+	}
 }
 
 /**
-- 
2.39.2


