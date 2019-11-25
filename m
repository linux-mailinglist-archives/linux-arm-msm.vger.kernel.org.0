Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF171108B1E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Nov 2019 10:44:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727188AbfKYJoK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Nov 2019 04:44:10 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51659 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbfKYJoK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Nov 2019 04:44:10 -0500
Received: by mail-wm1-f66.google.com with SMTP id g206so14403548wme.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2019 01:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3/JiBpwFT1+ekHayv85lWsaJZQoV1bVEwMRzX8OSdGk=;
        b=I8xrDF0oNAPYFO8Rb+AzffCtLbH9qIP552Uqu9j1vGLjJ6yQDhYH78ajtfzHuLbxeW
         9XLJmkSlZu3J4L4VbmvvYH7JF09ap94FA85ZC4oEJ6StY6rVm/WzAx3B1afQMTNLouYk
         ncw+6FQJXicsGzs333qgtuejaRLD0kbw7gwKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3/JiBpwFT1+ekHayv85lWsaJZQoV1bVEwMRzX8OSdGk=;
        b=hQ4T/C0rst1YsFnSnmc3ewO+i6D7zDaFYFkRxdtbCSNEgoMeQKOPDeYgur5yRKRM52
         zV39+GqAS0mbzhZNkkDbjHrAtn79btAClK5astKwm2oHut/6KSFeOF33lVw+goMKPIx2
         aVHiHDth6MFUORc+TtNVPiNjCcSmnBr1RJv67aXN/BXbWyLV+lw7KzyBiufD1n1JdBon
         EyJPGWG3XZNJwFggUDXQdOLfWrR1nZh5S6ijxjThfoclq8NoFIg0mD3YWV6aFeG4nGwj
         wzsGt0HTb/VvWHOHDw7knLa+zFx+yHRbwCmOdjduVNw6/a6Xyk3jEJI+hywexC/MAGs0
         bA4g==
X-Gm-Message-State: APjAAAXdEy1IPwqy5WpHyoipueyVryFanAultQrbZJMvMgQFGCh70/mu
        AOw9MpdGAX6DrYX3j6m0M5Ww2g==
X-Google-Smtp-Source: APXvYqz6TptZP6espzqoV7J4Xo6+2UKPpZ6aWz5jnYYvCXGuSvJjVXGzv0jO2i2J3D00Wy0yP1wdhA==
X-Received: by 2002:a1c:ab0a:: with SMTP id u10mr29419978wme.0.1574675047320;
        Mon, 25 Nov 2019 01:44:07 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id x2sm7598233wmc.3.2019.11.25.01.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2019 01:44:05 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/4] drm/msm: Use dma_resv locking wrappers
Date:   Mon, 25 Nov 2019 10:43:55 +0100
Message-Id: <20191125094356.161941-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
References: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I'll add more fancy logic to them soon, so everyone really has to use
them. Plus they already provide some nice additional debug
infrastructure on top of direct ww_mutex usage for the fences tracked
by dma_resv.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 7d04c47d0023..385d4965a8d0 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -157,7 +157,7 @@ static void submit_unlock_unpin_bo(struct msm_gem_submit *submit,
 		msm_gem_unpin_iova(&msm_obj->base, submit->aspace);
 
 	if (submit->bos[i].flags & BO_LOCKED)
-		ww_mutex_unlock(&msm_obj->base.resv->lock);
+		dma_resv_unlock(msm_obj->base.resv);
 
 	if (backoff && !(submit->bos[i].flags & BO_VALID))
 		submit->bos[i].iova = 0;
@@ -180,8 +180,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 		contended = i;
 
 		if (!(submit->bos[i].flags & BO_LOCKED)) {
-			ret = ww_mutex_lock_interruptible(&msm_obj->base.resv->lock,
-					&submit->ticket);
+			ret = dma_resv_lock_interruptible(msm_obj->base.resv,
+							  &submit->ticket);
 			if (ret)
 				goto fail;
 			submit->bos[i].flags |= BO_LOCKED;
@@ -202,8 +202,8 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	if (ret == -EDEADLK) {
 		struct msm_gem_object *msm_obj = submit->bos[contended].obj;
 		/* we lost out in a seqno race, lock and retry.. */
-		ret = ww_mutex_lock_slow_interruptible(&msm_obj->base.resv->lock,
-				&submit->ticket);
+		ret = dma_resv_lock_slow_interruptible(msm_obj->base.resv,
+						       &submit->ticket);
 		if (!ret) {
 			submit->bos[contended].flags |= BO_LOCKED;
 			slow_locked = contended;
-- 
2.24.0

