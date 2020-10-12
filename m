Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FBF128ABCD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgJLCIt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726959AbgJLCIs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:08:48 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAAAC0613D0;
        Sun, 11 Oct 2020 19:08:47 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id c20so1527462pfr.8;
        Sun, 11 Oct 2020 19:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CYBCVrY685HpPEa6dE7fFTDE7n8ofYv7TLo5Wicy7lE=;
        b=NKTH6nfrwZXolxNsr19xp4xLaMqJC9vl+SkxxuIj08xFTOkA5Qzo1bMHZREAQhziwj
         v3GoO3qOzxhzJpMo+RT52XP04Yzt73SClT+zSy5b00dhFiI0orS0GmnMqfQlZXoVuD4K
         BqSFzsE60W4zzHrDPGmRkxr+2iQbb3XD8ZVwYMM7GDzBqX04G+FqqIL7m4kDnZGnFQyF
         sU+Qse6hVRV2LdDDKtVtnZEaljK85fZZE3+tBsQGWlvXRUD3+Un6muUEi3VzGjZ6Y2AN
         sGce+NHz+W9mysNXl+iowGg8PE5uz7h17bm5/OOCLkre7pXLggjBqy1gXNaaqIjMqpc9
         LmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CYBCVrY685HpPEa6dE7fFTDE7n8ofYv7TLo5Wicy7lE=;
        b=IZLBDe2N8gLrCdq2Jn/AJ/WO+a9ZL+PLbrYFR7jB5z+oT7ylaMKBZK1yToisv5qWZi
         XWO6Dye7iWz3H6HVovscXYrcVTgEmmXlADctXARnNvO1ItlaagIT05mRuPidLYNYdegl
         spvGJLVKcaWOuFYkiPISCgJQdpUK+V/Flc27Ytr0QA0uZ55v1cox3g5JcuJhrKK8Y5wB
         PdK78GV9e4pP5vOWJ0GAXESfnHdtZ2VDuo/drQV5q7Ye0RIvTCcvKnZ+F+ObHHd9Bd1E
         itnKAEN0tCnMtq1ZU95jBCIvFNk5ccQ5O9eBsdmWutZsysx/2Cw6xyp84FsdQbxMjwi9
         l9gQ==
X-Gm-Message-State: AOAM533co3vp9roFWmSL1BqNiDNX7FPAjavDno/G5YM645ZbsFCaOKA+
        z7rJ6LUd/7d7oLLl3dZ7Nb0=
X-Google-Smtp-Source: ABdhPJxWDZBEXxg+flabuSNdCK2BFFN1TFGw0NEt/TJwJynQmkjv4qLbFrPiFSZDYIJnIb1rtnWTiQ==
X-Received: by 2002:aa7:8d4c:0:b029:13f:e666:8f05 with SMTP id s12-20020aa78d4c0000b029013fe6668f05mr22358227pfe.0.1602468527481;
        Sun, 11 Oct 2020 19:08:47 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id ne16sm21118476pjb.11.2020.10.11.19.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:08:46 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 02/22] drm/msm/gem: Rename internal get_iova_locked helper
Date:   Sun, 11 Oct 2020 19:09:29 -0700
Message-Id: <20201012020958.229288-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
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

