Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6F7354630
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 19:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239260AbhDERmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 13:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239227AbhDERmT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 13:42:19 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B20CC06178C;
        Mon,  5 Apr 2021 10:42:12 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id m11so5984225pfc.11;
        Mon, 05 Apr 2021 10:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hft/qShxHo0bK33jERj2ZhfMZ7O/VHjF9RLnRkSOuTI=;
        b=c/hVy6Rjga0/F4Ynn4GXA9wFndHn3akAXUMMcmBNsZpKtr6LAj3nHXVoeFvS69vkWO
         5UiVrkG9JCNVpzh7PWcbbOCWfqF8K1h484iNhoageOyvJvQ8Wla3cFCPyuhtlkVxRCKY
         jkqm+gQ0ttd3i2jG6+4syBmu6mxKbE0XmoQawe4hLcyt50Zzg1t8DmjtBRcLyEsY5uvQ
         cH+Jsb78Eh6yC/rTCy90iDi/rxacodWfYInSYvply95Jjopy8ExZeUXtvfzBt2fiSjT2
         1xaoIJhGH2of4TJTmlcGhiUDo3/DWLCMPDDMpGFaLTv+5YJwFtRvBIzWtS38D6pHctWW
         TMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hft/qShxHo0bK33jERj2ZhfMZ7O/VHjF9RLnRkSOuTI=;
        b=fqcKx0yuGyaP21dllOHkgG9vd1QAXJnQIgA60bSLvQ/00i2TnuvNQE6A+IWaE3rX/v
         p1zqwguZ3NqPU5V7zmAL0C4sfOdFoS+44A7NXQbiqPeEM/BBgzKM1McDRn4Ag+Lk8mBj
         QNWgXFIkLglkB7lfkSVULxzC5qfK7bDzrHG9vwjpAH2YOfkowDNNBwmDKKq7+H4nVgMC
         cXbWNY4pjHpWFzlw28ERuM7pqjHdG3Wu+NmDyg0zoR2P6Ln5Ug1yc/9Rn+OM9Ul06jhx
         9xx53SLwbvssn5loG3omMGFwOHmUwAmi/hZUmexkgNVcCRBC4fwvwoBaH5MwqGo6iBqd
         wkvw==
X-Gm-Message-State: AOAM532bZjQ0MlP8NzPFe7Js2i+tkrOkyYWzUYB00hhjpfe7qVvQ2y2n
        L+Pi4I0COBKx6q8FhHxr+8Q=
X-Google-Smtp-Source: ABdhPJzmZZbLJeQ4J4wHDZid4oFT6Yl/7zQkym+z79mPochrvWMslUalo4Qv8GYrkFzvSmdKAPe0Ow==
X-Received: by 2002:a63:ff4d:: with SMTP id s13mr23749361pgk.310.1617644531620;
        Mon, 05 Apr 2021 10:42:11 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id l25sm17411741pgu.72.2021.04.05.10.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:42:10 -0700 (PDT)
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
Subject: [PATCH 4/8] drm/msm: Split iova purge and close
Date:   Mon,  5 Apr 2021 10:45:27 -0700
Message-Id: <20210405174532.1441497-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Currently these always go together, either when we purge MADV_WONTNEED
objects or when the object is freed.  But for unpin, we want to be able
to purge (unmap from iommu) the vma, while keeping the iova range
allocated (so we can remap back to the same GPU virtual address when the
object is re-pinned.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 71530a89b675..5f0647adc29d 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -357,9 +357,14 @@ static void del_vma(struct msm_gem_vma *vma)
 	kfree(vma);
 }
 
-/* Called with msm_obj locked */
+/**
+ * If close is true, this also closes the VMA (releasing the allocated
+ * iova range) in addition to removing the iommu mapping.  In the eviction
+ * case (!close), we keep the iova allocated, but only remove the iommu
+ * mapping.
+ */
 static void
-put_iova_spaces(struct drm_gem_object *obj)
+put_iova_spaces(struct drm_gem_object *obj, bool close)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct msm_gem_vma *vma;
@@ -369,7 +374,8 @@ put_iova_spaces(struct drm_gem_object *obj)
 	list_for_each_entry(vma, &msm_obj->vmas, list) {
 		if (vma->aspace) {
 			msm_gem_purge_vma(vma->aspace, vma);
-			msm_gem_close_vma(vma->aspace, vma);
+			if (close)
+				msm_gem_close_vma(vma->aspace, vma);
 		}
 	}
 }
@@ -711,7 +717,8 @@ void msm_gem_purge(struct drm_gem_object *obj)
 	GEM_WARN_ON(!is_purgeable(msm_obj));
 	GEM_WARN_ON(obj->import_attach);
 
-	put_iova_spaces(obj);
+	/* Get rid of any iommu mapping(s): */
+	put_iova_spaces(obj, true);
 
 	msm_gem_vunmap(obj);
 
@@ -1013,7 +1020,7 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 	/* object should not be on active list: */
 	GEM_WARN_ON(is_active(msm_obj));
 
-	put_iova_spaces(obj);
+	put_iova_spaces(obj, true);
 
 	if (obj->import_attach) {
 		GEM_WARN_ON(msm_obj->vaddr);
-- 
2.30.2

