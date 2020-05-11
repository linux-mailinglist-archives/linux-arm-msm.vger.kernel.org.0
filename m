Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B20D11CD55D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2020 11:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgEKJgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 05:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725790AbgEKJgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 05:36:02 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 172D2C061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 02:36:02 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g12so18366958wmh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2020 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GPf4uEQTc/afTL7c/d2cSeqRiW2RQV3fjrBit70wmW4=;
        b=WOk5qAdJnGfzedSYVjf9nBySpoGM+n2oOhUsj1JX9TIbBH8jTCWX2rsyBduOMQCSc7
         neKaN8es7sL9BwmHgzRQCqOJyE9qnPM80O5sRkjxPrHc9R6U3W/hmK9HzJHex4UHmHjX
         jK07NS0y3glRT5GD/LViGMTUeQNL/dzkeL3Ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GPf4uEQTc/afTL7c/d2cSeqRiW2RQV3fjrBit70wmW4=;
        b=r2fHGK1JaO5L6G9pdVqN4I2CbWCT991R6/UY/qoCKnaLPRCfD+cElvJ+FKHuWkXkvr
         DT3vVIfJeYPERjHt8dg2vxZl4WaKvcB1gLBCUgB4OylDYnUhVsjwBTcW2j7Jq9KEi3Hu
         KA7qbaZRf/BdfHVQlW9rnGp24lNeCy49AoIWz9p/egn+bzSywNgFnTPWZtvaFK8tPpWT
         SdjZPbo6GqWhhOCk3syB0WNYrOKytaoCWGFjgMB+YfkzICaKXks5dxaLy0vcBdNk2ZbH
         iqpqAJggMSQhc6kd/8CEhapStKdIaLxJa/VeoGRjfClCDG4Xa2AD0kdQ5bZsiDyxHA5Z
         1Mfw==
X-Gm-Message-State: AGi0PuZruk5+bwRlhmgFbp3BBlm3boXe+FXCshfAqQPivNYoev72btBa
        qDnkkBytJxigsZHA2RY1/kKdrXQm/h8=
X-Google-Smtp-Source: APiQypLI5J/YwNBWeinmIVZanIUCMAm2cxmh3WAHdA3Qh3SfT+IosHz9CBc6cX7rogzLt2gPdQQ8nQ==
X-Received: by 2002:a1c:a102:: with SMTP id k2mr9162940wme.39.1589189760853;
        Mon, 11 May 2020 02:36:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id q17sm9013945wmk.36.2020.05.11.02.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 02:36:00 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/9] drm/msm: Don't call dma_buf_vunmap without _vmap
Date:   Mon, 11 May 2020 11:35:46 +0200
Message-Id: <20200511093554.211493-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
References: <20200511093554.211493-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I honestly don't exactly understand what's going on here, but the
current code is wrong for sure: It calls dma_buf_vunmap without ever
calling dma_buf_vmap.

What I'm not sure about is whether the WARN_ON is correct:
- msm imports dma-buf using drm_prime_sg_to_page_addr_arrays. Which is
  a pretty neat layering violation of how you shouldn't peek behind
  the curtain of the dma-buf exporter, but par for course. Note that
  all the nice new helpers don't (and we should probably have a bit a
  warning about this in the kerneldoc).

- but then in the get_vaddr() in msm_gem.c, and that seems to happily
  wrap a vmap() around any object with ->pages set (so including
  imported dma-buf)

- I'm not seeing any guarantees that userspace can't use an imported
  dma-buf for e.g. MSM_SUBMIT_CMD_BUF in a5xx_submit_in_rb, so no
  guarantees that an imported dma-buf won't end up with a ->vaddr set.

But even if that WARN_ON is wrong, cleaning up a vmap() done by msm by
calling dma_buf_vmap is the wrong thing to do.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5a6a79fbc9d6..3305a457960e 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -907,8 +907,7 @@ static void free_object(struct msm_gem_object *msm_obj)
 	put_iova(obj);
 
 	if (obj->import_attach) {
-		if (msm_obj->vaddr)
-			dma_buf_vunmap(obj->import_attach->dmabuf, msm_obj->vaddr);
+		WARN_ON(msm_obj->vaddr);
 
 		/* Don't drop the pages for imported dmabuf, as they are not
 		 * ours, just free the array we allocated:
-- 
2.26.2

