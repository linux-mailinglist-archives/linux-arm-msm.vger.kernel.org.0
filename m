Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922D428ABEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729936AbgJLCKC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729774AbgJLCJh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:37 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68B61C0613D9;
        Sun, 11 Oct 2020 19:09:32 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id i2so12814860pgh.7;
        Sun, 11 Oct 2020 19:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E/TFR+2oS8aXAXQSVrSXxUZHArJIJxnLPvbb0HwdP28=;
        b=T5eHSyohXJkOLlo42v+Hi4QsriRdqy23BLoyzBTOrjdq9FBsd41nbdePj0h5LRzXHa
         08YC8PkYjvPxlIHrFUnl1RfWL2SRs9qszqeM7CyIrPnUr6YHKypPLYU0KgnCaRc+rDd2
         JyD3DJvFrOdFXEaYedVspZh4cPgjq1ov2o/tFLC/H+aSQkh3W3LSFQcq8DsyQCnUMeiQ
         gCnrCSQcU9/rfwfJnaRW9iPRo/3JF870WsYTTmbf4rtUuzp5vKqn2Kv++svKwGm9kJWC
         et1wlh9pMBw5cYhdS2hqhx/Sksmk62iupSXXf1b4SVbpOtZUEhlPZ+KumNkcxYg/DyDo
         Ri4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E/TFR+2oS8aXAXQSVrSXxUZHArJIJxnLPvbb0HwdP28=;
        b=IGiRxAiKRuTZv36vuJWAkM7j2nj1Uq58wZ9ixNz0v09Kh2bPD09fVMit20uQl8d64h
         DkwArEuENU9KHGXl50O2WexAkCSZKuh++HE1K52rJaPZ8cEf6hZz++jQepo6jIO1Hkr7
         gZeCttelNk0euCJd6pnVzvcl0X0vLOZMm0iW2k3PMu560ckXb5AmWVkA1mDq49GtFrW7
         luKJYWS8rlpXeyIauWEJkslcn6JzEHeeGjLYdTJytRBHFVfcsbDRSuzi36k2UVxTz3fG
         TXL6poyEV+H71ulojiuLQsbZek1kikq8/Ye+dFO3t0A0ujkXeGB6R9bHkQXwSxDjeR//
         NIFA==
X-Gm-Message-State: AOAM531d/1UO+AmIQcWFDD67eaQCp1Z42LD2unOm5Pjq8E1Qm/pdivAm
        wL1tija3WiCIToAnK0YiJo0=
X-Google-Smtp-Source: ABdhPJxaWc5G/1wsqt+UdJIQsybc5F/w1jq2ins3zBia7tRzGL51TsgYMNfBcPQwZZHYWheq6MVeIw==
X-Received: by 2002:a63:5914:: with SMTP id n20mr10707355pgb.69.1602468571975;
        Sun, 11 Oct 2020 19:09:31 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id fa12sm12653649pjb.25.2020.10.11.19.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:31 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 18/22] drm/msm: Drop struct_mutex in free_object() path
Date:   Sun, 11 Oct 2020 19:09:45 -0700
Message-Id: <20201012020958.229288-19-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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
index cdbbdd848fe3..9ead1bf223e9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -934,8 +934,6 @@ static void free_object(struct msm_gem_object *msm_obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	WARN_ON(!mutex_is_locked(&dev->struct_mutex));
-
 	/* object should not be on active list: */
 	WARN_ON(is_active(msm_obj));
 
@@ -972,20 +970,14 @@ void msm_gem_free_work(struct work_struct *work)
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

