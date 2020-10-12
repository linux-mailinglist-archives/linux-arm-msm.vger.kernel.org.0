Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28D4728ABD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726959AbgJLCJM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727389AbgJLCJC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:02 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCF47C0613D5;
        Sun, 11 Oct 2020 19:09:02 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id r10so12804928pgb.10;
        Sun, 11 Oct 2020 19:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t6k0W0LUpGL7/GToLy9vCWhiEXYilH3isH63u8Yx9dc=;
        b=cYOdqk6JAEyJPNarImCdXuJLSaTP5hF3m1LbjGxMAKM4MFzOh/QWL4z8r0onTZixmv
         yYkmmpQDdFX0OwxHTLU8XHVitUgxmHbY+VgNmfTHJh0WSrMa/xANqnLQuTOcWIInbzDw
         UfcxFAepPMoCFtwEzdSyf2Ye3iKQUTWpwtNijBFPh0bmxE62Swxqg7NXW9H1c2cIZ+gs
         5q7uX9NGAwR5FW5q/lEs1s+TzByAGZcWfIF+LWklwrapace46kSUKaz+J1Ups9zY5HXt
         mcdofmZpHFDCXRkEXSYV8gza5oxh222MiaZcqqSrb1mB18AGlDIOYvKvOJ8DhpnrTJbT
         KycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t6k0W0LUpGL7/GToLy9vCWhiEXYilH3isH63u8Yx9dc=;
        b=ichaJuk0Krvr60T+0jhTzclCmzpb3W4H/uCEieL7jYBp/Eh2OJggi0WSNqGO+YOCfG
         EmYHg1aftuIiOTK0I9iHIBEM3t3scAQFx3NWdkyf4cSGQUvPcDgCpgBHqRSK3yoprQHU
         5ppdBoDjFNg84aivk5aI1CpPXWQoL2vGilYZ/pZVla4sb7cYd46rL7Z+5CvaLyTIe/jl
         ahc10Gqhpvq4MOCE6JxY7jvcCuBfmQwyMTgoHsvbt5bc+zfrQyP2i2dQLmHxQouBGoD4
         XPbzr9Y2K8cv1Q17CK5c1Lh0sqVKZJh/QY9j6uhvvt1M7UsS3VQnJoeaSKvfjE3cStcr
         cd8g==
X-Gm-Message-State: AOAM533usB2knY6ZtpQt5FzfpLCf8iUqvuUTnI9gN+dXOByjUl5gn3JY
        Gyt1aO4pA34pW/IbXp/VWLE=
X-Google-Smtp-Source: ABdhPJxO6HzuIjY5oyjtW2Q9UuwL21khrzejoxEMJIqlzoRA6aoWAf2AHjFZUW1waNpmmy9hyrFHAA==
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr17790795pja.36.1602468542200;
        Sun, 11 Oct 2020 19:09:02 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id g4sm17835780pgg.75.2020.10.11.19.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:01 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 07/22] drm/msm: Do rpm get sooner in the submit path
Date:   Sun, 11 Oct 2020 19:09:34 -0700
Message-Id: <20201012020958.229288-8-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Unfortunately, due to an dev_pm_opp locking interaction with
mm->mmap_sem, we need to do pm get before aquiring obj locks,
otherwise we can have anger lockdep with the chain:

  opp_table_lock --> &mm->mmap_sem --> reservation_ww_class_mutex

For an explicit fencing userspace, the impact should be minimal
as we do all the fence waits before this point.  It could result
in some needless resumes in error cases, etc.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 002130d826aa..a9422d043bfe 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -744,11 +744,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 	ret = submit_lookup_objects(submit, args, file);
 	if (ret)
-		goto out;
+		goto out_pre_pm;
 
 	ret = submit_lookup_cmds(submit, args, file);
 	if (ret)
-		goto out;
+		goto out_pre_pm;
+
+	/*
+	 * Thanks to dev_pm_opp opp_table_lock interactions with mm->mmap_sem
+	 * in the resume path, we need to to rpm get before we lock objs.
+	 * Which unfortunately might involve powering up the GPU sooner than
+	 * is necessary.  But at least in the explicit fencing case, we will
+	 * have already done all the fence waiting.
+	 */
+	pm_runtime_get_sync(&gpu->pdev->dev);
 
 	/* copy_*_user while holding a ww ticket upsets lockdep */
 	ww_acquire_init(&submit->ticket, &reservation_ww_class);
@@ -825,6 +834,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 
 
 out:
+	pm_runtime_put(&gpu->pdev->dev);
+out_pre_pm:
 	submit_cleanup(submit);
 	if (has_ww_ticket)
 		ww_acquire_fini(&submit->ticket);
-- 
2.26.2

