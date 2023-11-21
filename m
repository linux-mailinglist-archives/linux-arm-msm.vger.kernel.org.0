Return-Path: <linux-arm-msm+bounces-1258-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DCB7F2254
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 01:40:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4D6281F7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 00:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B781840;
	Tue, 21 Nov 2023 00:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFl80V1O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1629114;
	Mon, 20 Nov 2023 16:40:13 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1cc0e78ec92so31414955ad.3;
        Mon, 20 Nov 2023 16:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700527213; x=1701132013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0h8yAS+G8YHpuqagMyaQ9goLsE9tJyhmBTQ25AFj0s=;
        b=XFl80V1Og099vz55KWPDjiTyP9/em07jGeREaCjtjfkjMvA5QE6a/ZoNkWZcw9a0jb
         ngHgPouSgzkvgMdtHeIQD++1Ez72yp0PRUXivbOcebtdhSPLFf1O+mGu1ZOiMUrXLYga
         SHAvzkoSiYqZGoq/TaZCBITVE7lSyxRbL+UZsm+/r7dhiaJhfo0MbJHuNBcOOeCyZEWt
         L/4qLfP5wJHRRPzKKjxc1gWNMVC9N/KMJra2B3koQfS6AG701wx3Mm2noipzE/T2YjAU
         wkaho+5DyQtKcWN5KkknB3J567VJf+ScIx2REH2TXB8Qu+JzbpObvESlQz2rSs/Vpuay
         sDPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700527213; x=1701132013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o0h8yAS+G8YHpuqagMyaQ9goLsE9tJyhmBTQ25AFj0s=;
        b=dlYMHVhxFP2MWUoq0HniqdzXiAFLMldE6Bse7/Ww03wwMsJL5Lwd2NxG8/XXjhHcNJ
         UJ7AJvEvNRZbNg8A0Crw7XzzzHKAjl7hkE9IQGSmxUcvuHWY4/W6JySDyzc6MTWK8j3N
         QuxNKX4Z8zN+Ka5OXXRVYVEjK+QVVnPcPm0s1pKmzWAf4wzXUbwFlWP5tI62frE9pwS0
         lvhTUiBX4JDXziI7TpPFD48dBTvhozU+2JkeddtKVL95DhsiWHwC7m94ZyvL22WmAPe4
         vk382D0yg299uytaJSVjGYq2KDrmKz0Vj7hXyOgqB3PdobLctAupQ9fJszBTRQqUPScm
         wCuQ==
X-Gm-Message-State: AOJu0YzAMn3udRDZJAl5XFKgmqs/5xSiw11ZwlLgQXea6qyho96QRMdo
	4Rw23kqIQ/nzb2TqFH3VirI=
X-Google-Smtp-Source: AGHT+IFRewbZRAvUU6gZKQNB4YVM/KU5JvPUE8Ku/K2+YHY6o9UQhoZvejH2rTSIxis/nDYoz8E2Qw==
X-Received: by 2002:a17:902:eb8f:b0:1cc:237c:75d6 with SMTP id q15-20020a170902eb8f00b001cc237c75d6mr7706097plg.67.1700527213178;
        Mon, 20 Nov 2023 16:40:13 -0800 (PST)
Received: from localhost ([47.215.232.245])
        by smtp.gmail.com with ESMTPSA id u1-20020a170902b28100b001cf567252besm4035798plr.237.2023.11.20.16.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 16:40:12 -0800 (PST)
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
Subject: [PATCH v2 5/7] drm/msm/gem: Cleanup submit_cleanup_bo()
Date: Mon, 20 Nov 2023 16:38:49 -0800
Message-ID: <20231121003935.5868-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121003935.5868-1-robdclark@gmail.com>
References: <20231121003935.5868-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

Now that it only handles unlock duty, drop the superfluous arg and
rename it.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d001bf286606..603f04d851d9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -248,14 +248,10 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 	return ret;
 }
 
-/* Unwind bo state, according to cleanup_flags.  In the success case, only
- * the lock is dropped at the end of the submit (and active/pin ref is dropped
- * later when the submit is retired).
- */
-static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
-		unsigned cleanup_flags)
+static void submit_unlock_bo(struct msm_gem_submit *submit, int i)
 {
 	struct drm_gem_object *obj = submit->bos[i].obj;
+	unsigned cleanup_flags = BO_LOCKED;
 	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
 	/*
@@ -304,10 +300,10 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	}
 
 	for (; i >= 0; i--)
-		submit_cleanup_bo(submit, i, BO_LOCKED);
+		submit_unlock_bo(submit, i);
 
 	if (slow_locked > 0)
-		submit_cleanup_bo(submit, slow_locked, BO_LOCKED);
+		submit_unlock_bo(submit, slow_locked);
 
 	if (ret == -EDEADLK) {
 		struct drm_gem_object *obj = submit->bos[contended].obj;
@@ -533,7 +529,6 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
  */
 static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
-	unsigned cleanup_flags = BO_LOCKED;
 	unsigned i;
 
 	if (error)
@@ -541,7 +536,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
-		submit_cleanup_bo(submit, i, cleanup_flags);
+		submit_unlock_bo(submit, i);
 		if (error)
 			drm_gem_object_put(obj);
 	}
-- 
2.42.0


