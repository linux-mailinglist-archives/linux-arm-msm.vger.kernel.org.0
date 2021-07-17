Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6863D3CC618
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jul 2021 22:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235549AbhGQU2U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jul 2021 16:28:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235537AbhGQU2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jul 2021 16:28:19 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 280D9C061762;
        Sat, 17 Jul 2021 13:25:22 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id a6so6967574pgw.3;
        Sat, 17 Jul 2021 13:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/awU2N3myQptf0uqNzzrSWUhiz408vliBw9X+4I5S6k=;
        b=G+pKWLoZWzEXiW9Tf2ZyRTTszM+6/ldPsDNf9bkXRtMUYkEIBu9NinJBpBq8nOlJu/
         DzEmff5efg/iFbl2mfkG1KAqyxsvkWKTxTZA+eSPftQhtOcH9uptoyoOMXECT2uqoZMy
         dtZXXzwHKLyVYOZaDR7lMfvykSw4PYdRs+KKQZbWcktROnBZO2URVMHvBIA3Di8RNkga
         reS2xUs8vzkBLL/9oleq4gNv2oeqEtxF34Zc8eq4nA4+e+ww0Y/cSNV5eBMtfN0DDe4N
         HvsJmP728ENSS8OxNYfhcyaimp40VCwH7faZpsficBuTA6q7oGR7t/7hoK9dhYaIpLNf
         ir7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/awU2N3myQptf0uqNzzrSWUhiz408vliBw9X+4I5S6k=;
        b=ell5Sl0vzahWEhzTJ83cNocgrIcP9V9Xbra4ppDGNP50GOULRPaBvpwcnf3kmYeeVf
         tSIvKIAEvPEI4RCiqPrHge7d2OpL0WlM/j+ItfJMIe+bxktLisxmRTR+JrVua0od69kD
         ywTbSLZGZyMBOT33Z7mjNogHqyoAKD7r7iLzyo7cP8Co8mHqTEpE1MdlD5wOcabSj/8F
         npmoUM7/pawAxdwX9jNvBPq4UnfsjHcWznra8D8D//BP/xEV/7OzyYZr/Jvg3Ocmck2u
         WoUsgn9F60QvA0TWmeFgB8mdF86S4RTTDZgqgRagi+b1os6Jn/+goP00AJp3xjI2b0Qu
         6i6Q==
X-Gm-Message-State: AOAM531SS7uMwoi0X5vzEPcy6Ze8I/cZok7Whldh2p8QtqhqerY0UjHJ
        bjGtfhv6E5I32OHOr0dRK/U=
X-Google-Smtp-Source: ABdhPJyRFYdP/+zPVj6TMO22FwqlxVRZYcChWjdvdl1Wwqv2QJcWPavOP5m4JY1W3XCCffkN37vdMw==
X-Received: by 2002:aa7:81cd:0:b029:329:fcb0:1b44 with SMTP id c13-20020aa781cd0000b0290329fcb01b44mr17048343pfn.5.1626553521718;
        Sat, 17 Jul 2021 13:25:21 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id w2sm11365193pjq.5.2021.07.17.13.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jul 2021 13:25:20 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 02/11] drm/msm: Small submitqueue creation cleanup
Date:   Sat, 17 Jul 2021 13:29:04 -0700
Message-Id: <20210717202924.987514-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210717202924.987514-1-robdclark@gmail.com>
References: <20210717202924.987514-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

If we don't have a gpu, there is no need to create a submitqueue, which
lets us simplify the error handling and submitqueue creation.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index e5eef11ed014..fbea6e7adf40 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -66,6 +66,12 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 	if (!ctx)
 		return -ENODEV;
 
+	if (!priv->gpu)
+		return -ENODEV;
+
+	if (prio >= priv->gpu->nr_rings)
+		return -EINVAL;
+
 	queue = kzalloc(sizeof(*queue), GFP_KERNEL);
 
 	if (!queue)
@@ -73,15 +79,7 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
 
 	kref_init(&queue->ref);
 	queue->flags = flags;
-
-	if (priv->gpu) {
-		if (prio >= priv->gpu->nr_rings) {
-			kfree(queue);
-			return -EINVAL;
-		}
-
-		queue->prio = prio;
-	}
+	queue->prio = prio;
 
 	write_lock(&ctx->queuelock);
 
-- 
2.31.1

