Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03976297515
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:51:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752175AbgJWQuR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750451AbgJWQuO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:50:14 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E9DC0613CE;
        Fri, 23 Oct 2020 09:50:13 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id e10so1801681pfj.1;
        Fri, 23 Oct 2020 09:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=f5Lma5ixgLKqUWZE9zm+UsGyT5P2TCnzVnH8OP0YJLg=;
        b=nGWhOnAWdyKZ1mPvxWN1s86eaNOoGrxqk62ak4St0TLgzGl8Wa+qHX9Y9HQlFOsQR5
         vPLd660eG0FqLwXMxIbgjdNFHrW7mtekhjIZ/+46ZImvuZanHeaCV/V5nDV5j5Jwt9to
         F/Eq32YB0H0L7fjqVlO74u9b4DVONTnxPyfx1+KQtNn4BkpAn35IuhouKrk7ef0iHtXn
         IQIjYFGHJ9cAHjIJhUiG22orXiT3tBdVRPaAfTZ2ZZhvZAc3XqNDQl9abiIaAEwCZBJ8
         H+wmok9WObAfQf05zqHVKJE7XZh5sipFsdaxtwOT6+iDJmQ0IssuH1mlqeJO2Qotp6hK
         HekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=f5Lma5ixgLKqUWZE9zm+UsGyT5P2TCnzVnH8OP0YJLg=;
        b=Whem5g3JeqZsdj520HPYK+rx8pYgMCM8Dx/ABs6Cz4B6Bx9aALeOMM7cJ8iXJe1rCv
         8Jc7ie79eISzPgtgJxN5P9KvGhKIijwuzxzU7eVXoB3obDuCCO8XOBEyi8LQt3g6JbOM
         EqvhfTM9/qiadUXCNk7KlLeMR+zIj6AYYgHpZ/IiKvtHnv90nIE/9pr1V7Wl96cfAkmp
         HUXosX8sNq5ygeDyJ+Sic/lhavs6/SrZ47RSKgfuvIdOd6psrks9hyHwD3hF7By2HIIb
         0vHtb0dwMOHEatkQQapVaDGIGztWqylhk6Ex7c/48f3oHtNMWtdP3EhNJUxWIh2ds8cY
         eCcg==
X-Gm-Message-State: AOAM5326MjB4qJPevl4Z4q/mPcFibmdcfjACYuchDKKQEURc/1dMfVrG
        e5FaVkPo9Rs3n6Zx2NxNs6w=
X-Google-Smtp-Source: ABdhPJybEnZDk7Gh/5Cx54oRWuF8wWJTQoFNA6UmDDJPZI5aZB58FyTs7JHRWSS69yYEyloelPzksg==
X-Received: by 2002:a17:90a:aa90:: with SMTP id l16mr3507633pjq.0.1603471813469;
        Fri, 23 Oct 2020 09:50:13 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y65sm2610923pfy.57.2020.10.23.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 09:50:12 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 03/23] drm/msm/gem: Rename internal get_iova_locked helper
Date:   Fri, 23 Oct 2020 09:51:04 -0700
Message-Id: <20201023165136.561680-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201023165136.561680-1-robdclark@gmail.com>
References: <20201023165136.561680-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We'll need to introduce a _locked() version of msm_gem_get_iova(), so we
need to make that name available.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
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

