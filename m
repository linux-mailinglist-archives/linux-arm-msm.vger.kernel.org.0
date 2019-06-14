Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1EF746A92
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 22:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728509AbfFNUiO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 16:38:14 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:44428 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727174AbfFNUhT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 16:37:19 -0400
Received: by mail-ed1-f66.google.com with SMTP id k8so5198118edr.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Jun 2019 13:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kQ8UHufwWNTTgSokamGs0VFlz+rFtI/LHqZSwoXLdZQ=;
        b=jvhoh6wm8ifEGI9+HrQ3lAHO4ydWoN2wxaV3vn5pbUcjYmpo4Scds/Qbr1ftmywGn/
         UTGHjXzjQ7jT2A3HMTWQiFH9AR+KNZ277LF1QvbUhudX/uFDkP+zFtX8kns97a+Rzoop
         dtCG6oakORnAJEjmqEHM3I8rNUw5nT/t/JZwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kQ8UHufwWNTTgSokamGs0VFlz+rFtI/LHqZSwoXLdZQ=;
        b=ByG0lcz792jqepN42TuPCo/yxE6qbGhz0ws7lDuUO3cSgqR2gUlJL4lcF818g+UuiU
         u/G3EmVnrms8g3yMO4492gFqbVgteNbu5Abg1JfVt+PU9Dcn1PXwHsOqxU1GcPOrCsQZ
         iJk4s5uLQnuvmwuYTZKtFVjxo5JB+DBrCbNagT4RijDCEtnNq4N1jZ2mTU3kdpFsjt2Z
         Nc0WEy9d90wahx65xYNv2HV4GEum4jmB7Qf0jGJdJXDuu3yqPVsRTeCWrNylDOw8w1xa
         gfbsb3hWDs7DXZ9iB/9FDEhZFzIZM96/gXx98Q5nCZslEqkkWe3jlBlUgDvx+0k85YMH
         qf4Q==
X-Gm-Message-State: APjAAAX5+13LBFQLUY7giTOxkUYVCq3oZu76jNAqoANSNASl/gvaevtP
        fPVGSsvUD8c996mV0Xi1IpepxWoZ1vU=
X-Google-Smtp-Source: APXvYqyK6VvDvj7T1kTB9MdPOGrQCwMd5ois0SBU0b1hPA5QXVn9O+zvIFjOdvxCLc1Iaz5Esr5Qaw==
X-Received: by 2002:a50:90e7:: with SMTP id d36mr103589766eda.202.1560544638224;
        Fri, 14 Jun 2019 13:37:18 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:37:17 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Fritz Koenig <frkoenig@google.com>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 49/59] drm/msm: Use drm_gem_fb_prepare_fb
Date:   Fri, 14 Jun 2019 22:36:05 +0200
Message-Id: <20190614203615.12639-50-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm has switched over to drm_fb->obj[] a while ago already, so we can
just use the helper.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Bruce Wang <bzwang@chromium.org>
Cc: Fritz Koenig <frkoenig@google.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 +----
 drivers/gpu/drm/msm/msm_atomic.c          | 5 +----
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d831cedb55ec..b10855374a8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -792,10 +792,7 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 	 *       we can use msm_atomic_prepare_fb() instead of doing the
 	 *       implicit fence and fb prepare by hand here.
 	 */
-	obj = msm_framebuffer_bo(new_state->fb, 0);
-	fence = reservation_object_get_excl_rcu(obj->resv);
-	if (fence)
-		drm_atomic_set_fence_for_plane(new_state, fence);
+	drm_gem_fb_prepare_fb(plane, new_state);
 
 	if (pstate->aspace) {
 		ret = msm_framebuffer_prepare(new_state->fb,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 131c23a267ee..e501c6f8d67b 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -54,10 +54,7 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
 	if (!new_state->fb)
 		return 0;
 
-	obj = msm_framebuffer_bo(new_state->fb, 0);
-	fence = reservation_object_get_excl_rcu(obj->resv);
-
-	drm_atomic_set_fence_for_plane(new_state, fence);
+	drm_gem_fb_prepare_fb(plane, new_state);
 
 	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
 }
-- 
2.20.1

