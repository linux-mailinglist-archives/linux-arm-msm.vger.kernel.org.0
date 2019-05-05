Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B68313F8C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 May 2019 15:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727666AbfEENE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 May 2019 09:04:28 -0400
Received: from onstation.org ([52.200.56.107]:46280 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727404AbfEENE2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 May 2019 09:04:28 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 57E794501D;
        Sun,  5 May 2019 13:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1557061467;
        bh=BQ2yu4qmkQ3KcZaluxSLD+o9hT++EGQuoLaMCUSn0dA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=s1K5Mv7+r41NE5t824brUqiDq6BUxdeAohYmJbzZhjNWgeo+/TSMLquJYIdgzHJqa
         M2RRz59JpdpzI1aB8B6xt32ULAnf3S/6t4voYJmFw9LddJ/QYHPzLgNVP2q+U9b+ap
         Ebd1sz7pUj9oyLeSytEIrsnUKmg/L3SBSN5LehKI=
From:   Brian Masney <masneyb@onstation.org>
To:     robdclark@gmail.com, sean@poorly.run,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-kernel@vger.kernel.org, linus.walleij@linaro.org
Subject: [PATCH RFC 2/6] drm/msm: add dirty framebuffer helper
Date:   Sun,  5 May 2019 09:04:09 -0400
Message-Id: <20190505130413.32253-3-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190505130413.32253-1-masneyb@onstation.org>
References: <20190505130413.32253-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add drm_atomic_helper_dirtyfb() callback to the msm framebuffer driver
for the dirty ioctl.

Signed-off-by: Brian Masney <masneyb@onstation.org>
---
 drivers/gpu/drm/msm/msm_fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index 136058978e0f..8624a8e4025f 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -16,6 +16,7 @@
  */
 
 #include <drm/drm_crtc.h>
+#include <drm/drm_damage_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 
@@ -35,6 +36,7 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 static const struct drm_framebuffer_funcs msm_framebuffer_funcs = {
 	.create_handle = drm_gem_fb_create_handle,
 	.destroy = drm_gem_fb_destroy,
+	.dirty = drm_atomic_helper_dirtyfb,
 };
 
 #ifdef CONFIG_DEBUG_FS
-- 
2.20.1

