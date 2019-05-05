Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F339E13F8E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2019 15:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727601AbfEENE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 May 2019 09:04:28 -0400
Received: from onstation.org ([52.200.56.107]:46266 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727367AbfEENE1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 May 2019 09:04:27 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id E6AC33E956;
        Sun,  5 May 2019 13:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557061467;
        bh=IYRglZLmPUAWG3JXhJg/NhCUwxXVo+rWDdjly3A1S/Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=cisTXGYJKhqlZDiZ7H58vZ3MF5wT2phT/dMC/JzrjrWxB4vZ9keVlfpNH8QbDKxLu
         0H8OCuZYuSLBVybeIjy4Oj2edU6EY5o0g+6tuOcVtfAUaBd25YBQXVTTnBVPWZ27gP
         yX6QQc899NidHFHpeH2R+dGs7TFpodOVtUNJb6Xw=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Subject: [PATCH RFC 1/6] drm/msm: fix null pointer dereference in msm_atomic_prepare_fb()
Date:   Sun,  5 May 2019 09:04:08 -0400
Message-Id: <20190505130413.32253-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
References: <20190505130413.32253-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

_msm_gem_new() calls msm_gem_new_impl() with a NULL reservation_object
struct. msm_atomic_prepare_fb() assumes that the reservation_object is
always set, and attempts to reference a NULL pointer. Correct this by
checking to see if this value is NULL.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/msm/msm_atomic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index f5b1256e32b6..0da80a93876a 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -56,10 +56,12 @@ int msm_atomic_prepare_fb(struct drm_plane *plane,
 		return 0;
 
 	obj = msm_framebuffer_bo(new_state->fb, 0);
-	msm_obj = to_msm_bo(obj);
-	fence = reservation_object_get_excl_rcu(msm_obj->resv);
 
-	drm_atomic_set_fence_for_plane(new_state, fence);
+	msm_obj = to_msm_bo(obj);
+	if (msm_obj->resv) {
+		fence = reservation_object_get_excl_rcu(msm_obj->resv);
+		drm_atomic_set_fence_for_plane(new_state, fence);
+	}
 
 	return msm_framebuffer_prepare(new_state->fb, kms->aspace);
 }
-- 
2.20.1

