Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 450985793F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2019 04:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfF0CFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jun 2019 22:05:32 -0400
Received: from onstation.org ([52.200.56.107]:51848 "EHLO onstation.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726728AbfF0CFc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jun 2019 22:05:32 -0400
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net [98.239.145.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: masneyb)
        by onstation.org (Postfix) with ESMTPSA id 1A7CE3E898;
        Thu, 27 Jun 2019 02:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=onstation.org;
        s=default; t=1561601132;
        bh=9jlj6K/wCzudyHU/TvWT/fg1kMUL3abjYYgFk/BVctU=;
        h=From:To:Cc:Subject:Date:From;
        b=apeq8g6oJvoKBVl5xTxxuA5ZW9+h3DphDig2/d6lpZNPeiSaHjcSWs2i7biL8c9Km
         AXFFAXosWud+H0IilGshKMmDo5ndoB8BuY2xY3JZTHcbRqNjXvkFiwgtT85FyS5GCj
         dR3tLcGOStH6czxxnUfb+3fptT7iYlPdeqq9uyMs=
From:   Brian Masney <masneyb@onstation.org>
To:     jcrouse@codeaurora.org, robdclark@chromium.org,
        seanpaul@chromium.org
Cc:     freedreno@lists.freedesktop.org, jean-philippe.brucker@arm.com,
        linux-arm-msm@vger.kernel.org, hoegsberg@google.com,
        dianders@chromium.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm: correct NULL pointer dereference in context_init
Date:   Wed, 26 Jun 2019 22:05:15 -0400
Message-Id: <20190627020515.5660-1-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Correct attempted NULL pointer dereference in context_init() when
running without an IOMMU.

Signed-off-by: Brian Masney <masneyb@onstation.org>
Fixes: 295b22ae596c ("drm/msm: Pass the MMU domain index in struct msm_file_private")
---
The no IOMMU case seems like functionality that we may want to keep
based on this comment:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/msm/adreno/a3xx_gpu.c#L523
Once I get the msm8974 interconnect driver done, I'm going to look into
what needs to be done to get the IOMMU working on the Nexus 5.

Alternatively, for development purposes, maybe we could have a NOOP
IOMMU driver that would allow us to remove these NULL checks that are
sprinkled throughout the code. I haven't looked into this in detail.
Thoughts?

 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 451bd4508793..83047cb2c735 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -619,7 +619,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 
 	msm_submitqueue_init(dev, ctx);
 
-	ctx->aspace = priv->gpu->aspace;
+	ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
 	file->driver_priv = ctx;
 
 	return 0;
-- 
2.20.1

