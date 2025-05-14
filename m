Return-Path: <linux-arm-msm+bounces-57939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1803AB7401
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 20:06:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E55F7AC14C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85284297B86;
	Wed, 14 May 2025 17:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bj2N82pB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC01297A7D;
	Wed, 14 May 2025 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747245452; cv=none; b=FSyNtFFcXZcMs99ATZcrkt8BsUzbkYX461YkGFHjNpc6knPOn3wl98WDCBtOudVbW568KolbiPzZYGuc+5d3+rifGvXgAZ2+knYLdbFYfLHeLl8aqVqAxGGfkYN/brfVHSWUvlHHxOdyhDbQ9Jm71bHVAUf+t/6qS2lDbnnjZVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747245452; c=relaxed/simple;
	bh=6ziZ+/0+Vud8pxi92QumAEtZxrXg4TC3SoYTqb934rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMu9kQQsAgcXF/jzftKBfXTAad7YzKk+9m/04of/ZthHWS/eY1fEJD7+TbXRRA9hTh4tc8uin/uKkUce0bNaW1wcdiujSPMs+5LzghnyEROotAnyazJiFC8+zpEh7j34fzN7M4q5hqkeUNIXY939G4m7mUDJGKUM9GtbEJfC5bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bj2N82pB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso148440b3a.2;
        Wed, 14 May 2025 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747245450; x=1747850250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/A/RGPDJpbD6ohkqzZy4WVuOmFQs5dwsGRntfJWp3M=;
        b=Bj2N82pBNcA8lOmqXB2MiwnuBBrJkc8Wxb2x0Sy+kXHL9HIos8QnDNTKFRjd1xYuRu
         G4+uU0Ta4ycEzVwY+BeFehIQz4OA/sXuShr4nhoh2U4XHX3z6yvIxylEjcLl2R+eYr0c
         N+MaGdTovKIy0O33+qnC8xYODaF2QUymrE6Qe7kMMExb4je1EYA5H8LrJ3g6RAoacfD/
         nU4tjPZdjcoAXJsGJT8IojsvfVbdwlzHFf5cN2N5ISY3d0GgucSH1cz7+Ldn3E3dxZ/e
         6zBadXCkrM5eI3M26Z5j8kdaZawyAxw9Qh0q/FLQpiEdxIaHsxbS12ofTuon9tQD4KU5
         UAdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747245450; x=1747850250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y/A/RGPDJpbD6ohkqzZy4WVuOmFQs5dwsGRntfJWp3M=;
        b=r24Bod3AMxd46RfKFz2LTQvUzy8h9x7iie0oMIXcJ7gubBdklaVimgCzdoFpuuKZI7
         PIJ+WIVYPDSWP1hF+q0wwnNjs3rocb/9O5THumcTblcaN3oMQElxSvhmAACEguJoR8OM
         PiclMTELUkRvMFmpUk5W8vJSLi8XV3UUu98R3mMg7JJg3qpsWjsbDQnhUuE4ilfB5hD5
         biE30XvkeqN/blnIISd52d4fQfNFQa0+C4th5nQIsCKmiuQSDAO9IO5v2Ejfwi3I8NU6
         AFg8P2SyOEyOZIE8ETQs7Ugv+M7/OnXwcprzKumr37DEMJ/vTmuN+5KR39v876yIztS7
         EiTw==
X-Forwarded-Encrypted: i=1; AJvYcCVGc4f//LadrTKYv+7qYkrTLhMEKlC8L64IIwHaMlSW5X3RlMImKm5t9/ESWoRwmPmqC6kbVTzPCsQ4pqpu@vger.kernel.org, AJvYcCWNZ/jOSjwX6UvhXA0daV176aaXEtc58vX6Mdv5vqT7m3qUaH1KR0hdePhXe5hGh8HSOlEeXgcRUNSTODXl@vger.kernel.org
X-Gm-Message-State: AOJu0YzAsBS464/vTzAnaVusAp53rl2VitpSRfsM2W4B5RKNTl97T2qS
	Bt4jd8mlaEbWfgl4kPGur2v9YliFDJKgYVhB7Np3fV2iVLMGt97R
X-Gm-Gg: ASbGncsNqDf8/fT8HJRyAnE6E0WvG09JyB4zpWuWrFTC7atsWeoYFzDqKJYYcc4Ee7s
	GqxqDOn8Y9uMFfExxc0VZNCD/0PoTkHmHsLP0fK2O8Pf1ugDWdMZUFUGck7oPTXWLkBXT8Bq5CI
	T+PRY5ypXTqMGSWFYYNv0Z8ixPHrU14b8+A99lIoeYR2uYp6QjCufC58HEJeZlcK+dfb36Zp4Dd
	RiP7zg+dF9fqE1Kokhpa00TFY7BVu69GX7C3tU6h53B8flLqitKw//sUM9V6Cj1xG9SkuUJm4tf
	X/MC1ktZu3PfY09ii2yCJvgWWln0ZcLs3GpurHy2gMh6D1U6BRbfKEXGbkhsn27M0u7lWCbsSbB
	hJroSotAqOtktxVuFASiJMrgNsA==
X-Google-Smtp-Source: AGHT+IEBPsN9kmTr0M4YA45nIruo5l44NuAsME11AdFzUP9aa2BDaGOzNiFa2hh63FW9eSi8T8YPkA==
X-Received: by 2002:a05:6a00:3022:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-7428928d581mr6647749b3a.6.1747245450421;
        Wed, 14 May 2025 10:57:30 -0700 (PDT)
Received: from localhost ([2a00:79e0:3e00:2601:3afc:446b:f0df:eadc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0cdd7sm10147820b3a.90.2025.05.14.10.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 10:57:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	Connor Abbott <cwabbott0@gmail.com>,
	Rob Clark <robdclark@chromium.org>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 39/40] drm/msm: use trylock for debugfs
Date: Wed, 14 May 2025 10:53:53 -0700
Message-ID: <20250514175527.42488-40-robdclark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514175527.42488-1-robdclark@gmail.com>
References: <20250514175527.42488-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rob Clark <robdclark@chromium.org>

This resolves a potential deadlock vs msm_gem_vm_close().  Otherwise for
_NO_SHARE buffers msm_gem_describe() could be trying to acquire the
shared vm resv, while already holding priv->obj_lock.  But _vm_close()
might drop the last reference to a GEM obj while already holding the vm
resv, and msm_gem_free_object() needs to grab priv->obj_lock, a locking
inversion.

OTOH this is only for debugfs and it isn't critical if we undercount by
skipping a locked obj.  So just use trylock() and move along if we can't
get the lock.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h | 6 ++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index abf463d700b2..c8b72f68f807 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -922,7 +922,8 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
 	const char *madv;
 
-	msm_gem_lock(obj);
+	if (!msm_gem_trylock(obj))
+		return;
 
 	stats->all.count++;
 	stats->all.size += obj->size;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 1e9ef09741eb..733a458cea9e 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -280,6 +280,12 @@ msm_gem_lock(struct drm_gem_object *obj)
 	dma_resv_lock(obj->resv, NULL);
 }
 
+static inline bool __must_check
+msm_gem_trylock(struct drm_gem_object *obj)
+{
+	return dma_resv_trylock(obj->resv);
+}
+
 static inline int
 msm_gem_lock_interruptible(struct drm_gem_object *obj)
 {
-- 
2.49.0


