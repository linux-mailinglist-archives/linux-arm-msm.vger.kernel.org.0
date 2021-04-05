Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C0B354633
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Apr 2021 19:42:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239283AbhDERmV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 13:42:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239291AbhDERmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 13:42:20 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 733B7C061788;
        Mon,  5 Apr 2021 10:42:14 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id c204so4862303pfc.4;
        Mon, 05 Apr 2021 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tgo9D0hje3g+WF3fE8utkvq2AhTGNUmeDw54h5VPmLM=;
        b=rj7smkgnlpLC/bTHiifDMhJrEeJ89AG1HOeRjIFbjIs7Lv6uu6et9szKj5V9gH3DuJ
         LUU2GeBZfoq3BnTAUZXy0cOvMNCHLB2Dh7XysYM+46tfZfFbPuqXdP2CkdhxVrxVRNf7
         LYWiSptv6sucT44AMh0VnEffS8tnz5xVTnCKDgybWHNti8+U4yzFMIQEn4bW91xaNNUQ
         z1vPOVM/hgffT6ZaLaI8iNiPYHAuGDh4fdt4qHsFiWY/C5PmEQP/rSm/CD+gY6bEkDDA
         Vnizln7kX3+PD8ISt/LtfG/oMlLNPbIJ2tZyshxwd0aL1NsOZkmUNjIaTY2jx9FqjTFR
         bz/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tgo9D0hje3g+WF3fE8utkvq2AhTGNUmeDw54h5VPmLM=;
        b=Q3ZMwTtMC3kQfnP93kb4Iks2ekpD25qLDEDlTb4RaT27G8kUtNCYS1zdIXv6JMRh9C
         kI+dT2QeHrPvNqqbZ2tk0uPBjePbFMW2NFGyzI5azo4dRbtZ3J9dplQtFk9OTn8rqooI
         tJvl5PFBfM/wVu3uFxpt/WjViB3GIGB0frAO5Ojrt44zHRFrVP0FcL3d69x2+8Gmfa6A
         Izu5140RlJq858naEDhNy1MkKr7+JVdy5FQCIbdEI6ubbTkHxEYO3Y3TMimEqKZrt6re
         YDtP/dwyezRZXZ00fMSsWbNT1TyogbSU70/ncZUfbWh3118XISbmHKFwG9yfrMhc9Sye
         WmyQ==
X-Gm-Message-State: AOAM530wSPp4KsFanP/5lmkuloJuLOO9J44twcJptXbciyaXFl/Yc3ci
        kq3pT8BU38FrK7kEKZH36OM=
X-Google-Smtp-Source: ABdhPJz6fKeO/l5QlHXYUTnnn6zgKzUbJ7cRbP+y9uy9gEdCqgJHFfHw4BPwA5IULkeOGOVPN4Bxiw==
X-Received: by 2002:a63:2e47:: with SMTP id u68mr24203990pgu.6.1617644534048;
        Mon, 05 Apr 2021 10:42:14 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id hi21sm92676pjb.36.2021.04.05.10.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 10:42:13 -0700 (PDT)
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
Subject: [PATCH 5/8] drm/msm: Add $debugfs/gem stats on resident objects
Date:   Mon,  5 Apr 2021 10:45:28 -0700
Message-Id: <20210405174532.1441497-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405174532.1441497-1-robdclark@gmail.com>
References: <20210405174532.1441497-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Currently nearly everything, other than newly allocated objects which
are not yet backed by pages, is pinned and resident in RAM.  But it will
be nice to have some stats on what is unpinned once that is supported.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 7 +++++++
 drivers/gpu/drm/msm/msm_gem.h | 4 ++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5f0647adc29d..9ff37904ec2b 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -902,6 +902,11 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		stats->active.size += obj->size;
 	}
 
+	if (msm_obj->pages) {
+		stats->resident.count++;
+		stats->resident.size += obj->size;
+	}
+
 	switch (msm_obj->madv) {
 	case __MSM_MADV_PURGED:
 		stats->purged.count++;
@@ -991,6 +996,8 @@ void msm_gem_describe_objects(struct list_head *list, struct seq_file *m)
 			stats.all.count, stats.all.size);
 	seq_printf(m, "Active:   %4d objects, %9zu bytes\n",
 			stats.active.count, stats.active.size);
+	seq_printf(m, "Resident: %4d objects, %9zu bytes\n",
+			stats.resident.count, stats.resident.size);
 	seq_printf(m, "Purgable: %4d objects, %9zu bytes\n",
 			stats.purgable.count, stats.purgable.size);
 	seq_printf(m, "Purged:   %4d objects, %9zu bytes\n",
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 917af526a5c5..e13a9301b616 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -162,13 +162,13 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 		struct dma_buf *dmabuf, struct sg_table *sgt);
 __printf(2, 3)
 void msm_gem_object_set_name(struct drm_gem_object *bo, const char *fmt, ...);
-#ifdef CONFIG_DEBUG_FS
 
+#ifdef CONFIG_DEBUG_FS
 struct msm_gem_stats {
 	struct {
 		unsigned count;
 		size_t size;
-	} all, active, purgable, purged;
+	} all, active, resident, purgable, purged;
 };
 
 void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
-- 
2.30.2

