Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8286C297543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S461198AbgJWQvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752803AbgJWQvC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:51:02 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ABF0C0613D2;
        Fri, 23 Oct 2020 09:50:58 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id 19so1673676pge.12;
        Fri, 23 Oct 2020 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=T3n/W2hBHdYFkNX33oVXA/c4AmlMUnQ6/c07ibiZgNA=;
        b=R6xegtTENd9s9cRtgkN8d2Fcnu/DqggarHuf3eV++GtmVU1V0WM2Y1/05cF4lhfE0W
         G5n3o6YcFhTZ/Zu5LiHjnEjyyqxGVP0aH8fsBfmDxImp08C0R1y3ZGq/skOJqZFya2TB
         jz4Pi+dOugOOVlbK4sKKF3lqgM0haUR4aw8ca6CMG6VnZKRnQ3+EbaUBHWAAnV1VigMZ
         6dAt2p9bsa27X/bF7oVjb691ev0jizEYw1E/KGkUDD9aPwVijwxvnLYHlJHqYscAzzwj
         of1jyhs5jjZC9JKZJHzrMX1CnHcyZ9ZCHYS2+TnQ/eREl5t72c9gfBgt4y39/KBau4IO
         2CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=T3n/W2hBHdYFkNX33oVXA/c4AmlMUnQ6/c07ibiZgNA=;
        b=dc2gRva0EBmZxzuqWJlI1O8KECX31KvAUmCSmA8g3j25pcagraQWuheHmj3roj/h0o
         Z8fI61RyRmnH16MEa9z2obn0ysKV1jEk93oICgooMksuP5DCDuaKXn9Zz99sS5l/znaD
         nCWsaA9/TMZi4XmbsruYHYO+I/NjMGKm03amL6RRZFHs0JEiE64tQ3m+8gYqbqbJWKNm
         b4T/y/ZhyaZh+FUmrGtNW1FHiDe/3EcU0Q4aeuVh11+1sChqPCdmchKolxXfKbcYbEQR
         i2JkpfZXmyB/5FceFBV4QayCPkoXg73trb68ea/8ckCivlMva9BfTyLvokGX9L5x9KcU
         McQg==
X-Gm-Message-State: AOAM531znvif7Fr1XNFSdGq12Yr8pU6YkDk1pE/xi2TlaMg56Nl9ZU6I
        TvkUT8aADRfuLvCIcm17rYo=
X-Google-Smtp-Source: ABdhPJzIt2rBdXxh/2GoY4AOMK55pcFLFr/zrcSvKk+/BeuQVksIgw5DuPtrN6AF4BTLVGrbii/BWg==
X-Received: by 2002:a63:4083:: with SMTP id n125mr2869692pga.290.1603471858103;
        Fri, 23 Oct 2020 09:50:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id 204sm2658740pfz.74.2020.10.23.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:56 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 19/23] drm/msm: Drop struct_mutex in free_object() path
Date:   Fri, 23 Oct 2020 09:51:20 -0700
Message-Id: <20201023165136.561680-20-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Now that active_list/inactive_list is protected by mm_lock, we no longer
need dev->struct_mutex in the free_object() path.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b9de19462109..5d555750943e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -949,8 +949,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -992,20 +990,14 @@ void msm_gem_free_work(struct work_struct *work)
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

