Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71801292FF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730311AbgJSUqT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730147AbgJSUqP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:46:15 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA61C0613CE;
        Mon, 19 Oct 2020 13:46:15 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id q21so666957pgi.13;
        Mon, 19 Oct 2020 13:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=22Jlev5gAzt2xdCMyh1bV9HE1I+PJVS0r6/a1b11meI=;
        b=F/JS5BSQUzZBgIosKtn3TjchC81I0HCUqgLhuGxddGfI29vzgf0/Ac+CvyfgjYVX7Y
         9fnF/gV2IXCYc/v/KgfMuGWeKiO5LNpRVkzAIdMRgZsQCXcqbakNFumug8d7X4GbaqYA
         0v03SCROmNrVe/c0el2xA2+fhPkTmMso332FVWDaggSahQQnMCzm69dluPdhPWQ2fxtG
         FAHuK740cXxPj6WXkaHi0e8eBpUTMpb+LolIpkW8Gs6Ymm3X2WaYzuDs2JM6w0+pc14l
         V2DgxHZ9q0CNDsabOz/bjoQq538V1ErhcL75B+/up0bZSyblJgUWzzeRSA3BQh/stxj7
         Y0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=22Jlev5gAzt2xdCMyh1bV9HE1I+PJVS0r6/a1b11meI=;
        b=VsNY6hnaLQTqdR/1KwcyGMEsiLoitnKhVK09N1D4YvkXE6+EoTgz4p3d/+yp0LL1El
         0jLyJSo6ZawSCkGa4mPXH8GE98RF6ANkPX4LQCGsuO8p7HJzFCaJRqOKQwtb6mE7Imv0
         CgzXa1bdtQEtgG/9+8kn8p/Nen1IACgpdlat+aRHTsaYiFIz2+Rzk9l1JR9m38+QyVbw
         KJWNRds75tmfWGaaLrOrLB8rgsCxUEwqtjxit+SFpLNLTjuPHlSNiez1Xhp3ujJx7h3K
         yi54sMqgmhZ1hM6famC6jsNLrBSyuFTb8GKRqYp5XtEvqsTWFykezgIYKCknAa+QK6O2
         eDFw==
X-Gm-Message-State: AOAM531Z3dZmdiiTdidae5TwbReTGGErAhSzyo2ZB9D80JJKS7iZezP6
        qWJCAijPp8nbA8Mb4wdMKls=
X-Google-Smtp-Source: ABdhPJwdzx2KBhZc3edpmg8ERbRwwRTRFA0QkUXk+3oFfZHlQ54Q/dXufyuu8YqMSWhzmvx0D3JrxA==
X-Received: by 2002:a63:3fc7:: with SMTP id m190mr1281127pga.293.1603140375067;
        Mon, 19 Oct 2020 13:46:15 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id s20sm590362pfc.201.2020.10.19.13.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:46:14 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 19/23] drm/msm: Drop struct_mutex in free_object() path
Date:   Mon, 19 Oct 2020 13:46:20 -0700
Message-Id: <20201019204636.139997-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that active_list/inactive_list is protected by mm_lock, we no longer
need dev->struct_mutex in the free_object() path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index e4876498be47..af1abddca78e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -949,8 +949,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -987,20 +985,14 @@ void msm_gem_free_work(struct work_struct *work)
 {
 	struct msm_drm_private *priv =
 		container_of(work, struct msm_drm_private, free_work);
-	struct drm_device *dev = priv->dev;
 	struct llist_node *freed;
 	struct msm_gem_object *msm_obj, *next;
 
 	while ((freed = llist_del_all(&priv->free_list))) {
-
-		mutex_lock(&dev->struct_mutex);
-
 		llist_for_each_entry_safe(msm_obj, next,
 					  freed, freed)
 			free_object(msm_obj);
 
-		mutex_unlock(&dev->struct_mutex);
-
 		if (need_resched())
 			break;
 	}
-- 
2.26.2

