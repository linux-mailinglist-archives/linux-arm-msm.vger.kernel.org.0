Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF7F292FB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgJSUpj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727849AbgJSUpd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:45:33 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57F17C0613CE;
        Mon, 19 Oct 2020 13:45:33 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id c20so674837pfr.8;
        Mon, 19 Oct 2020 13:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CYBCVrY685HpPEa6dE7fFTDE7n8ofYv7TLo5Wicy7lE=;
        b=GiwH1Q5B4PiL5LYkHEor5z49PWGBBdaa+huKsZYFYRdx2+L6Ry5cf3kcdcS0yDJbkP
         DrDGo3ozr/wLE7s0yZGHCiPlQ3BhFs4s1JnbWUHnejHFSFwZYukMSRwFoZYfCXDRgfKq
         STIdnMVI/xY4J3LN1yUgzA1kuL4arQzVScCAuQEe+bl7c1A5R66X/dj0rbfEHRs445Rb
         FPcYwWe2bwxl+5cGq50w6XwiyF09cbpKhuxxa7qd4WqimLsDhdt7nOv48f3GO1xfslbv
         T22HVH4qwjgbmYrQjwRS4SbpXnhP5SbuF9ZD16xvAoLtO3/g4jXeTGTWHkNlkDJilhXM
         ezkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CYBCVrY685HpPEa6dE7fFTDE7n8ofYv7TLo5Wicy7lE=;
        b=hjlO6weahgVaAhseNRHitHK7LUVNnhDB56pT2P/wq0dHwxFkWxQD9Jg+hLnpwSVjNP
         3Htl6xh0Ui4cZazCgxDvVXBSMUPVahsLzs7TNlJ4MmpKfMfpD+u+G41bDjKWibS4frWS
         7ZsM4sCP9spIWiGyjYCnwUQCvcIyEn4MXK/KWt7C7nakmAQmjlJNzI2FXj/Uda7Dqb0l
         a1Qm5JfOHXiC/jL/43vTWvsqUVWRUfabKAH45Z4OqXGlx8yh3cNGg42ARLjYFMV2qzO4
         saIQ/RdIRj8IPE4qAELV/JUUObxVT/4XO2zYBns41gMMROFpXTEpHWty5xne+8ga3y2B
         1Hkg==
X-Gm-Message-State: AOAM530ekgCMNMzR5Z7rLEO3rpjWing3KR1ydcKeNJSy703rRycoUDV7
        QaDsB0e5vRfiQGd7SMsvSz7IaS1p6UU9vg==
X-Google-Smtp-Source: ABdhPJwu8RH/sEalbXmMg2n6kOuq8ij3zolDwaNhEx69jNBGXrtTvP+zpgA6E5EROWIB5EMH8aToRQ==
X-Received: by 2002:a63:f84c:: with SMTP id v12mr1320550pgj.125.1603140332905;
        Mon, 19 Oct 2020 13:45:32 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id t3sm435790pgm.42.2020.10.19.13.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:45:31 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 03/23] drm/msm/gem: Rename internal get_iova_locked helper
Date:   Mon, 19 Oct 2020 13:46:04 -0700
Message-Id: <20201019204636.139997-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We'll need to introduce a _locked() version of msm_gem_get_iova(), so we
need to make that name available.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index afef9c6b1a1c..dec89fe79025 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -376,7 +376,7 @@ put_iova(struct drm_gem_object *obj)
 	}
 }
 
-static int msm_gem_get_iova_locked(struct drm_gem_object *obj,
+static int get_iova_locked(struct drm_gem_object *obj,
 		struct msm_gem_address_space *aspace, uint64_t *iova,
 		u64 range_start, u64 range_end)
 {
@@ -448,7 +448,7 @@ int msm_gem_get_and_pin_iova_range(struct drm_gem_object *obj,
 
 	msm_gem_lock(obj);
 
-	ret = msm_gem_get_iova_locked(obj, aspace, &local,
+	ret = get_iova_locked(obj, aspace, &local,
 		range_start, range_end);
 
 	if (!ret)
@@ -478,7 +478,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 	int ret;
 
 	msm_gem_lock(obj);
-	ret = msm_gem_get_iova_locked(obj, aspace, iova, 0, U64_MAX);
+	ret = get_iova_locked(obj, aspace, iova, 0, U64_MAX);
 	msm_gem_unlock(obj);
 
 	return ret;
-- 
2.26.2

