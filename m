Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2A8246A4B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 22:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbfFNUhQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 16:37:16 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:41602 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbfFNUhP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 16:37:15 -0400
Received: by mail-ed1-f68.google.com with SMTP id p15so5225617eds.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 13:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zVH7XHQ8Vodmfu+Eco8dq0pOjj0+eXdvJUJLOoKsml8=;
        b=N1jH3Kvy0RZEAGCS+7KCoptKdbFR5zlJnpnezAw0MXLyzqJJ6wvq3X0rtHTz6IEMnv
         ih9r3S9gV/t9un6IES5ZDL8OJkoReezm3l5+65YMYkigl2mCKg0eRorjTcsriljh0UuB
         R73kz2AHoHiDRXKzy+P4do4c16+5gEGPn6Ucs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zVH7XHQ8Vodmfu+Eco8dq0pOjj0+eXdvJUJLOoKsml8=;
        b=dJjAHBgAhPCptr/oOVXiwn6o1sjWy3d6ZAtGMLt6aAvdT9qHaIQDlneteHjFVcIjgq
         HUvZubWhbXacEODOURbD+cBTxdqbX+QFFR5N0CA3OlMgsMeB3rcde1y6K4t901XIzpJ1
         JzEji2obO9qbNs6Caz6yIbw+RaYALzNpcKjk4eHi5H2sGxruuP5cVWyvpJmsmbiEJVSx
         OZTOspG3/L6DTAA4TD1ILhJESVHA6tx5JhEmkV0DLNnucWuzw11vOkJhyLV1wufaN6Z3
         O7CT0WLMvCEgoqIuNGuJ0LYMkvkO6E/DuZGQADU6vcLMU8ZHOgsFAWMRQdn7CpFgm5GN
         GcNA==
X-Gm-Message-State: APjAAAX0fqd2ZRZQVmbyfHJX3DunYZndDxB2dilt98njz4YjgXND2dPO
        vy60gqvRDyDt2Tp8lajjyZ8fZQ==
X-Google-Smtp-Source: APXvYqzWRT/tdgTN1qrlvzH9uhWZ8qgzCNOYU/CZOPFjPZVUnKmjz6flOflss0hoCQIpwlp1/8IX6Q==
X-Received: by 2002:a17:906:31c8:: with SMTP id f8mr78455436ejf.131.1560544633618;
        Fri, 14 Jun 2019 13:37:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:37:13 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 45/59] drm/msm: Drop robj from msm_gem_new_impl
Date:   Fri, 14 Jun 2019 22:36:01 +0200
Message-Id: <20190614203615.12639-46-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Only user was the prime import, and drm_prime.c takes care of that
now.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 35f55dd25994..404b6fea9e35 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -947,7 +947,6 @@ int msm_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 
 static int msm_gem_new_impl(struct drm_device *dev,
 		uint32_t size, uint32_t flags,
-		struct reservation_object *resv,
 		struct drm_gem_object **obj,
 		bool struct_mutex_locked)
 {
@@ -974,9 +973,6 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	msm_obj->flags = flags;
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
-	if (resv)
-		msm_obj->base.resv = resv;
-
 	INIT_LIST_HEAD(&msm_obj->submit_entry);
 	INIT_LIST_HEAD(&msm_obj->vmas);
 
@@ -1018,7 +1014,7 @@ static struct drm_gem_object *_msm_gem_new(struct drm_device *dev,
 	if (size == 0)
 		return ERR_PTR(-EINVAL);
 
-	ret = msm_gem_new_impl(dev, size, flags, NULL, &obj, struct_mutex_locked);
+	ret = msm_gem_new_impl(dev, size, flags, &obj, struct_mutex_locked);
 	if (ret)
 		goto fail;
 
@@ -1095,7 +1091,7 @@ struct drm_gem_object *msm_gem_import(struct drm_device *dev,
 
 	size = PAGE_ALIGN(dmabuf->size);
 
-	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, dmabuf->resv, &obj, false);
+	ret = msm_gem_new_impl(dev, size, MSM_BO_WC, &obj, false);
 	if (ret)
 		goto fail;
 
-- 
2.20.1

