Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18961D3EBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 22:11:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgENUL2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 16:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726128AbgENUL1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 16:11:27 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB21C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 13:11:24 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id y16so328872wrs.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2020 13:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u5+ZIsepmANUb25rp8z2+IfwFZccCxjdXSGCg+HwNG8=;
        b=inEPheZK6U783qRJhkzWRpmM2fI++8ygHH4D+jRYdwfk13oSlcSH5TIdtyUS3a9T8+
         ygc6H70ykiMA4j5aqpKMv7VgZHV6lFT7H28kRXzI3dlqaZB8DWa+oEyaGv3U26Da8UHS
         +sjzVxs+fGPUwbt7WH+FD4J5d19UwkMzQiY7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5+ZIsepmANUb25rp8z2+IfwFZccCxjdXSGCg+HwNG8=;
        b=mFccPnn5Ypezl8etW1Soy77ptI5kOhgoXZ7D/wDF7gp9TZS9xDAPss6DHejwzC9RCL
         Beqg/Bl0jAjN028gEMvPppWzEzkkCUoMXTqrqmG1sYn0Zxf5w7WiNk8KfS3KXl5iJ8+J
         +l917XqPcZ7gW0oWcgrmuN7vcw6uoySygjDgHDaUayTspcMTQCnEJ3HuHkqLlcQxgI6F
         eQQ4JvIUUtP4xTYXg2HIYOP2ALjUHSPQIX0miA88dT5fFRufjdnOn8Wme/TP0qb89sjt
         +sszIugLgjbljbv/6OKQ4x8dE5iqUyJ+YG2cxFsIhTNQiBPjbrb9DKSR5AOl9wYQNANk
         SvaA==
X-Gm-Message-State: AOAM533QyCY+at5GplMiQ2m1c8p6sMOW10GqPShmUulgYLUitfkP7AMr
        7HWj/As6ZGl0Mo99gKhNXunPnQ==
X-Google-Smtp-Source: ABdhPJysl6I2xvCb7jPdlVQDQlxQlPIyMi7UVtnoTkHcbr+49z0N4ds2zUKEDu32/GtpZz8jBcnZ4A==
X-Received: by 2002:adf:df12:: with SMTP id y18mr173997wrl.94.1589487082845;
        Thu, 14 May 2020 13:11:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q74sm248655wme.14.2020.05.14.13.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 13:11:22 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Don't call dma_buf_vunmap without _vmap
Date:   Thu, 14 May 2020 22:11:17 +0200
Message-Id: <20200514201117.465146-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I honestly don't exactly understand what's going on here, but the
current code is wrong for sure: It calls dma_buf_vunmap without ever
calling dma_buf_vmap.

What I'm not sure about is whether the WARN_ON is correct:
- msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
  a pretty neat layering violation of how you shouldn't peek behind
  the curtain of the dma-buf exporter, but par for course. Note that
  all the nice new helpers don't (and we should probably have a bit a
  warning about this in the kerneldoc).

- but then in the get_vaddr() in msm_gem.c, we seems to happily wrap a
  vmap() around any object with ->pages set (so including imported
  dma-buf).

- I'm not seeing any guarantees that userspace can't use an imported
  dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
  guarantees that an imported dma-buf won't end up with a ->vaddr set.

But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
calling dma_buf_vunmap is the wrong thing to do.

v2: Rob said in review that we do indeed have a gap in get_vaddr() that
needs to be plugged. But the users I've found aren't legit users on
imported dma-buf, so we can just reject that.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79fbc9d6..e70abd1cde43 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -554,6 +554,9 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	int ret = 0;
 
+	if (obj->import_attach)
+		return ERR_PTR(-ENODEV);
+
 	mutex_lock(&msm_obj->lock);
 
 	if (WARN_ON(msm_obj->madv > madv)) {
@@ -907,8 +910,7 @@ static void free_object(struct msm_gem_object *msm_obj)
 	put_iova(obj);
 
 	if (obj->import_attach) {
-		if (msm_obj->vaddr)
-			dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
+		WARN_ON(msm_obj->vaddr);
 
 		/* Don't drop the pages for imported dmabuf, as they are not
 		 * ours, just free the array we allocated:
-- 
2.26.2

