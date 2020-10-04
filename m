Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D78D282D26
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726688AbgJDTVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbgJDTVc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:32 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E003DC0613CF;
        Sun,  4 Oct 2020 12:21:30 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id a200so260618pfa.10;
        Sun, 04 Oct 2020 12:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xYPy68YgElKqp/ZhwxT4I2bIBmneh2iMyGRUpgP2Kzg=;
        b=nAEMC704Ssavz0xGEbyrm9K3jWYyc1bgQ8dkA/ZspvJj4to7+Qa/6sZC/5TF/Opmem
         a9nqKcM2G9xVuXLm8cbAQG8SzHpUnGGjNwB+ghB64XjnG1eTbQCMxqStvSZZJO5eeZUk
         LydYUfqZEQVU+7FyjFh6dMVBLk/nY2VDGRCxfzab2hTnkBZWzh5zyq/aNdHVAd66dnZz
         fGRG/HstoIwx+oeBbasuKNtclyI8BMIKy1MpRe/vSqJvMBGH2YVDRXKmyebjf26dv3Q4
         zvYdMozFYF1+7VnS2O4Lz+nu29Ux+JnkNAYgoOtf87f0lNPohyynlHzkoXl3s8Xb32w/
         rE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xYPy68YgElKqp/ZhwxT4I2bIBmneh2iMyGRUpgP2Kzg=;
        b=Y8ahQbEY4yewLJOcml4VHz+fuMNy9FFrs8MQqJSVlX0ulcXFpS0RCvHROUxyk47lA9
         evply72JsESXmQViMl7doIw9gokMcYvIJgFxkTZO7nupnn1cJeVyZQKiZGTsxxv9PyVE
         5+bmSIPNKB6WpI4Y4WgUYutLcYpeUwuq41lyxgkod+wyN7VUGhcPXVfD0YRy7n2fpfJm
         AcLBuJMIHLko2Fe27UdQseu6ck1fj7LWJigqTYf5Khmvn0s5ATm78RFGi3zrmLvvYL9Y
         zYb8r528Kxiue+4I9hpkBZphIx5YNUo+8mk9zAw6gVG09e5n1qbcDgfI05mtgTphah8w
         uw0g==
X-Gm-Message-State: AOAM533arq1S/9FD9775ZbQaT4h51ONBI7WKgcEX0uegjMcniPO461XF
        bf1oDvP3ciMvP55E/KLVsuk=
X-Google-Smtp-Source: ABdhPJz9b6MrGzYddugbdJh3IUMYkbMj+m/4vj4/TIpTfnWuCI/9BDLXB513Fc0erhJoaG/QFDw4ng==
X-Received: by 2002:a63:2022:: with SMTP id g34mr10627104pgg.378.1601839290364;
        Sun, 04 Oct 2020 12:21:30 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id z63sm9337766pfz.187.2020.10.04.12.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:29 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/14] drm/msm: Drop struct_mutex in free_object() path
Date:   Sun,  4 Oct 2020 12:21:42 -0700
Message-Id: <20201004192152.3298573-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
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
index c52a3969e60b..126d92fd21cd 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -927,8 +927,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -965,20 +963,14 @@ void msm_gem_free_work(struct work_struct *work)
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

