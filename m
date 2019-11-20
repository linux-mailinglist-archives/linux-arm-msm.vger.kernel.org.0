Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E956510380A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2019 11:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbfKTK4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Nov 2019 05:56:16 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36231 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728942AbfKTK4Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Nov 2019 05:56:16 -0500
Received: by mail-wm1-f66.google.com with SMTP id c22so7300723wmd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2019 02:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JjFMOaCeGH9JROPsuOGBrMP11R57ZOXn6oqH37RHktY=;
        b=Us1Lehu5jYPWv2Zo6d6t/Uab94E25yywuZHTZ5IXjkEw8OC+KJyLv0VlgNUBaAn+GW
         D3dTXqSs8hqAZY3pxKLqrTjP16uxMK6lrC69rExoWseqrhekdrjfS9o4evqfSN7kgUqz
         m1ltwjuxARvl1NHypf255OEhwrg54o9fLz5jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JjFMOaCeGH9JROPsuOGBrMP11R57ZOXn6oqH37RHktY=;
        b=fhihWH3/e2EUryujV937PJDtP/pDmUcqWJXZCxrU9weYKdHmYlKaRjM/+WKFZNMakA
         DRXBmIWyqack42HhOwusYnZJVRfARn2oNfjddHyoD8QXx9AhgEFiCzaJv+9+XGqDjN7F
         xOA2JZvI+MdL5DIAxGFKkJYgdKtfpiUiSvQ0t2QkbmTdLvf/NwF0ya7hTBulyHNvKopt
         +kV51NKEs4Q/WpNjjObwjeoJ4wz9GlrMDjhUtpEyNJWEniqol6PaRLoL3Q/BMe7r6uTl
         Po+JyAywE+LyCJKAej1LCWSC6RhdBERcRLOG9uMWI24ijvVoflrPchOkmJBqorV4emDU
         QtnA==
X-Gm-Message-State: APjAAAVtxE1PXCqtr7vNVgLabw4jB5UE/UuXm7W0sgefp2nevSL0OA+b
        3jN9/shJjXoe5yxpGtvSvECCrw==
X-Google-Smtp-Source: APXvYqw/47BZ5KcwK7RVhJ9Ph7mNdq0/WEIut+JpU/tMKjfMnCcriWYrX+AOttR4RzYHhfL+SQG/jA==
X-Received: by 2002:a1c:96c9:: with SMTP id y192mr2511706wmd.8.1574247373806;
        Wed, 20 Nov 2019 02:56:13 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id c15sm30796132wrx.78.2019.11.20.02.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2019 02:56:12 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Don't init ww_mutec acquire ctx before needed
Date:   Wed, 20 Nov 2019 11:56:07 +0100
Message-Id: <20191120105607.3023-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
References: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For locking semantics it really doesn't matter when we grab the
ticket. But for lockdep validation it does: the acquire ctx is a fake
lockdep. Since other drivers might want to do a full multi-lock dance
in their fault-handler, not just lock a single dma_resv. Therefore we
must init the acquire_ctx only after we've done all the copy_*_user or
anything else that might trigger a pagefault. For msm this means we
need to move it past submit_lookup_objects.

Aside: Why is msm still using struct_mutex, it seems to be using
dma_resv_lock for general buffer state protection?

v2:
- Add comment to explain why the ww ticket setup is separate (Rob)
- Fix up error handling, we need to make sure we don't call
  ww_acquire_fini without _init.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fb1fdd7fa3ef..385d4965a8d0 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -54,7 +54,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	INIT_LIST_HEAD(&submit->node);
 	INIT_LIST_HEAD(&submit->bo_list);
-	ww_acquire_init(&submit->ticket, &reservation_ww_class);
 
 	return submit;
 }
@@ -390,8 +389,6 @@ static void submit_cleanup(struct msm_gem_submit *submit)
 		list_del_init(&msm_obj->submit_entry);
 		drm_gem_object_put(&msm_obj->base);
 	}
-
-	ww_acquire_fini(&submit->ticket);
 }
 
 int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
@@ -408,6 +405,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	struct msm_ringbuffer *ring;
 	int out_fence_fd = -1;
 	struct pid *pid = get_pid(task_pid(current));
+	bool has_ww_ticket = false;
 	unsigned i;
 	int ret, submitid;
 	if (!gpu)
@@ -489,6 +487,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
+	/* copy_*_user while holding a ww ticket upsets lockdep */
+	ww_acquire_init(&submit->ticket, &reservation_ww_class);
+	has_ww_ticket = true;
 	ret = submit_lock_objects(submit);
 	if (ret)
 		goto out;
@@ -588,6 +589,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 out:
 	submit_cleanup(submit);
+	if (has_ww_ticket)
+		ww_acquire_fini(&submit->ticket);
 	if (ret)
 		msm_gem_submit_free(submit);
 out_unlock:
-- 
2.24.0

