Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334E435463B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 19:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239525AbhDERm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 13:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239419AbhDERm1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 13:42:27 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED5AC061756;
        Mon,  5 Apr 2021 10:42:19 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id nh5so4220236pjb.5;
        Mon, 05 Apr 2021 10:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lNUTj4cH2m+cKbQ1c8oBegHz15SkUdeTuXeC8QriD2w=;
        b=FYbnGNI+71Ugjz8aN913ncSWFoObUE+d7Ay9FWTkF4UYUw7/NkIgMd4KpR/ccYHhxM
         GxqwieReZYObur7q27lHWLPL2G9aaxsK1rehNeGDK1/d/JpamGzTu9gcgWL8F2vajDIY
         XRiponVvQngtXWAbtodxFlMPMnKEkLeBHiuiPa/h6ao34MVE/ml9ZTCGy22IkSmigeSb
         Huzyk7xgj5ADAU3WoXzIkc68tX7UUMgTCoE0ffi7aWb/i4g865LwbTCZlJdjGHQA7UPm
         b4aov0nhZAAasvRCk81CiEEMUcFlVh3atghT3b10VAe1gD4ORUOHVxzJLLVJZHOIk9CB
         mHgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lNUTj4cH2m+cKbQ1c8oBegHz15SkUdeTuXeC8QriD2w=;
        b=DR+MTxioSUnw8DqnOvh+hvA/wgyqQvXWfWLKRo7kS5V+2ubdMrHtV2St8sQv3DfH3F
         TR/8DotRXINiEO8ztoqH/rsu7SBhlVUJ9WGAqheLIhPy5EnIrTGBDiq6f4/2FnXJTzzl
         kft41gxDkuUWCB9l6gd3+Sa7ieVoiRU/XGX6286FpOgkMPL+Q0un/xZ3vDwM53mIsYAC
         +kVgbxc+TSs4PBBKa2zxtDxQDCeKAOzyR2xad1k9DAnvW1z7Wx9eyGtuKrSClu+Ey0VA
         uLkfqpSl69CD6oGse8RCnYXSq+d34TCSSSau5nFu0jTnXcRhUaNgJq0Q1Fx5MqjGmbwR
         VSkQ==
X-Gm-Message-State: AOAM530Lm5K9T6bD2LAFr3lHHwgjHwe19Ow92KTSRjLzdOhDXS0EgS9a
        Sc8bfVU237pJgPLh10iDCww=
X-Google-Smtp-Source: ABdhPJxdRO85RG3m2k3YtzCW0Xv3vu3+xlX8l5aNSXS4owe3vLWNMG9v/9vzzZfQ/AsXSkrK6IUCzw==
X-Received: by 2002:a17:903:31ca:b029:e6:65f:ca87 with SMTP id v10-20020a17090331cab02900e6065fca87mr24984947ple.85.1617644538682;
        Mon, 05 Apr 2021 10:42:18 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l25sm17411896pgu.72.2021.04.05.10.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:42:17 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/8] drm/msm: Small msm_gem_purge() fix
Date:   Mon,  5 Apr 2021 10:45:30 -0700
Message-Id: <20210405174532.1441497-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Shoot down any mmap's *first* before put_pages().  Also add a WARN_ON
that the object is locked (to make it clear that this doesn't race with
msm_gem_fault()) and remove a redundant WARN_ON (since is_purgable()
already covers that case).

Fixes: 68209390f116 ("drm/msm: shrinker support")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 9ac89951080c..163a1d30b5c9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -729,14 +729,16 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
+	GEM_WARN_ON(!msm_gem_is_locked(obj));
 	GEM_WARN_ON(!is_purgeable(msm_obj));
-	GEM_WARN_ON(obj->import_attach);
 
 	/* Get rid of any iommu mapping(s): */
 	put_iova_spaces(obj, true);
 
 	msm_gem_vunmap(obj);
 
+	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
+
 	put_pages(obj);
 
 	put_iova_vmas(obj);
@@ -744,7 +746,6 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	msm_obj->madv = __MSM_MADV_PURGED;
 	update_inactive(msm_obj);
 
-	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 	drm_gem_free_mmap_offset(obj);
 
 	/* Our goal here is to return as much of the memory as
-- 
2.30.2

