Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D853BC91F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 12:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231254AbhGFKO4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 06:14:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbhGFKO4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 06:14:56 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A256EC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 03:12:17 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id t14-20020a05600c198eb029020c8aac53d4so3342491wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eK8t9BEjbT//Rj4X6P1/lXym1o29s4XXgV4fm7IqVSk=;
        b=kWZV1mpE1AInwl6j30iEOk6ezDVr32HVfzgJQxtdJro6607JT5suF4GWCqBcjUEbam
         XhQNJzP8MSccGPCykN97E2CC9Chc0cgCGff4zSCaCTwQ2cUlP+QLNcyS7VtEXgv3RVRB
         OKR+KhaSG0xcQ9L8NQxw5ng46E5kW5p5F2X3s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eK8t9BEjbT//Rj4X6P1/lXym1o29s4XXgV4fm7IqVSk=;
        b=Dq432YasDajZNBmbM7SmPANFgpLEONAaFXRWQYNob5jFdTvx2OgAKHBtcmHhHMFFwS
         6Q6mhBsGez2Efqt8cGscBtL9bIuk6nZnzoy0U//GoIFFM8pBj0QQkZ66AmH5wNJdcn0Z
         zbPPrh8zxvHa442C1HnG8p4jA+vFV01lDuonWyzAbTGno+gATM/1eyXKiE4twRWaKR+1
         KuogoZJfqRnWOOxoFQ8We0DCCO0QrA5aaxfuV69FPRAEhMjUhM4JD9r8k8vytCBtPMQq
         5HFSJJfo0NerKvjEUtjhTC2nYP5KVXPgVafAERlseBUciX/LJOoFrOM3gvPOokxxvE4S
         H45g==
X-Gm-Message-State: AOAM530xrVZlrB0BPLwHZJB0FdQMF+qsHm3qUgSCE9iy+qSPStOZOv3h
        AdlJW9iLqAVIO6GD4a6BXIeUYQ==
X-Google-Smtp-Source: ABdhPJxEDVRYf4jHMU2qeOsNXRMr4+1OkGaalkBSQqZe5EBhZ/N8/6og1cZ8MfQphbVhzw5iK7eGXA==
X-Received: by 2002:a7b:ce0d:: with SMTP id m13mr1209304wmc.59.1625566336286;
        Tue, 06 Jul 2021 03:12:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u2sm9862739wmc.42.2021.07.06.03.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 03:12:15 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 1/7] drm/msm: Don't break exclusive fence ordering
Date:   Tue,  6 Jul 2021 12:12:03 +0200
Message-Id: <20210706101209.3034092-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's only one exclusive slot, and we must not break the ordering.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but
- msm has a synchronous dma_fence_wait for anything from another
  context, so doesn't seem to care much,
- and it probably makes sense to lift this into dma-resv.c code as a
  proper concept, so that drivers don't have to hack up their own
  solution each on their own.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index b71da71a3dd8..edd0051d849f 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -306,7 +306,8 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 				return ret;
 		}
 
-		if (no_implicit)
+		/* exclusive fences must be ordered */
+		if (no_implicit && !write)
 			continue;
 
 		ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
-- 
2.32.0

