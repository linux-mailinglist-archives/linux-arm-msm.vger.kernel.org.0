Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BCA369ABB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 21:12:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243763AbhDWTMy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 15:12:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243782AbhDWTMw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 15:12:52 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17027C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 12:12:16 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id s5so41908415qkj.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 12:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5xJl3e5+bs5xqB+lF7D0IwdsLJO17snjwANXkX2D6wU=;
        b=yFL1c6CkBYFO5JvUiub7cftnWbdO+hwi+wprHjCffpYFQ9zqO0puXavnOKEyKqE88M
         Sz6qq1w8ugjMiCyhYwEETsIa6u5706n8155YOcMYS4yk1e9NBG1s5lIACSc1wTvDpqLt
         kCNK2YVcA7BElhE1qHDkGM0bh5VtJjJ5B9LXxOp6m97rV906P64zWI1cci3mE+xpQhPM
         oLOWM9D839/LDjt1Fih68q2xgwel149qbW9n+abS9DHT0KewIKCi+h2NT+ht+iiiIb4A
         mweOQW8fEAA+pIN08b6Y3c/hPxkrTq8gLsgcxq1t5tmrC8dG1sCAfIwPrsLosyUz3/J9
         VTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5xJl3e5+bs5xqB+lF7D0IwdsLJO17snjwANXkX2D6wU=;
        b=ihiKLSD6kPrC+g8LGvCNajatd9mkchkjRZsfMMl4gCIhPyCFuCI//F6xDVO7guWcCu
         fW2an/SeERlzM0Ds1nzImXrl2IVP3W58C7UerKI5P83OBkrHxzk06EdtVJh4w4Q/KBq9
         lsrYNKSoT+ZgFdFGoNxR+ddsAAvLc+/k7ophroCo7kyzeIHndifwaXWB9FAzw0kqBz5A
         YrCHsxIxdIr82kdFHIMea4Qsjndzd+l8EEzMFJfVyrMH+mblDUaPU5vv0LY3Ol5INNqa
         kvhv/cupCEQULORpWX9O2D+mx5tbbZJXtXejIdcl/nKY81Me4ryI1hjOAgkP8vX6dGXq
         hUBA==
X-Gm-Message-State: AOAM533M5MxRbsc1zwIWkvhjqeHMWHsYB+6CQsba/e0bz6lF0B67edn3
        GKKvOIiVZgZT4HFbTBHW2St5aw==
X-Google-Smtp-Source: ABdhPJyTqUJ+yXOSnr85wWiD5YuFTJo/pB6G1Lp1vxTohgVnsCkkTbkKgoGO2WgJsu6VOogbUcIBAg==
X-Received: by 2002:ae9:f404:: with SMTP id y4mr5460750qkl.500.1619205135351;
        Fri, 23 Apr 2021 12:12:15 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id a22sm4834630qtp.80.2021.04.23.12.12.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 12:12:15 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] drm/msm: use the right pgprot when mapping BOs in the kernel
Date:   Fri, 23 Apr 2021 15:08:19 -0400
Message-Id: <20210423190833.25319-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210423190833.25319-1-jonathan@marek.ca>
References: <20210423190833.25319-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the same logic as the userspace mapping.

This fixes msm_rd with cached BOs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/msm_gem.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 09abda42d764..0f58937be0a9 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -199,6 +199,15 @@ void msm_gem_put_pages(struct drm_gem_object *obj)
 	/* when we start tracking the pin count, then do something here */
 }
 
+static pgprot_t msm_gem_pgprot(struct msm_gem_object *msm_obj, pgprot_t prot)
+{
+	if (msm_obj->flags & MSM_BO_WC)
+		return pgprot_writecombine(prot);
+	if (msm_obj->flags & MSM_BO_UNCACHED)
+		return pgprot_noncached(prot);
+	return prot;
+}
+
 int msm_gem_mmap_obj(struct drm_gem_object *obj,
 		struct vm_area_struct *vma)
 {
@@ -206,13 +215,7 @@ int msm_gem_mmap_obj(struct drm_gem_object *obj,
 
 	vma->vm_flags &= ~VM_PFNMAP;
 	vma->vm_flags |= VM_MIXEDMAP;
-
-	if (msm_obj->flags & MSM_BO_WC)
-		vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
-	else if (msm_obj->flags & MSM_BO_UNCACHED)
-		vma->vm_page_prot = pgprot_noncached(vm_get_page_prot(vma->vm_flags));
-	else
-		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
 
 	return 0;
 }
@@ -632,7 +635,7 @@ static void *get_vaddr(struct drm_gem_object *obj, unsigned madv)
 			goto fail;
 		}
 		msm_obj->vaddr = vmap(pages, obj->size >> PAGE_SHIFT,
-				VM_MAP, pgprot_writecombine(PAGE_KERNEL));
+				VM_MAP, msm_gem_pgprot(msm_obj, PAGE_KERNEL));
 		if (msm_obj->vaddr == NULL) {
 			ret = -ENOMEM;
 			goto fail;
-- 
2.26.1

