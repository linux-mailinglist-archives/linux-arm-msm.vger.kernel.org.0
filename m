Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B093BC920
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 12:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbhGFKO5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 06:14:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbhGFKO5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 06:14:57 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93B70C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 03:12:18 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id i8so12519602wrp.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 03:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
        b=fOHKcRBrqDpQMSUxe0M4ZFMVRFmAgoabsGu0LEn0ogBsEAYugsDkEBBZRNnqSd+aQG
         ACJChm6bV1k+6vbmvnfIcpF8Pjf3RKqmW+gSJVIie27q/PSewJ5soKS3DzZMqoeR5o2o
         otxaZUkQD9LUP3qSxy7RjptNmWyhCffqskmcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QjSmqlbIRb4rQlv/d4Pv/+GvfrOLmD0Jb/5nkyL4HJI=;
        b=W8bLtHHiFIHbh2nraw65jszAT1mCBnAg8uKXHuTWFzESxk+/+Yo1BFidYLZemQ7fK4
         advUUW8aP+HEL1S/ysKs8TEbxX4q5yRgxcvooSj9STmv5wjFHKyMjEPmoppAKPhiPTY9
         MHVXgfZMftkArJfRsXnBHnSTfREh6JWJUhAUd0Bze+bEh+Y3Q8oijjy11fx8cBlN/rn9
         V9I84Qbfrw8GYCQ08gY+dWJRzLOPsVHb6LD+N2w5mnUD+uTFOOWLdyWXBm8NBje5CTjQ
         vJKDHa4K3cuIEvRJ24nJiUaRJklGm08nlL0nP6mz3U1rwtwcNt9Kh0vDgNasY3G5CPZk
         eQJQ==
X-Gm-Message-State: AOAM533JsX5r69i6bpxRrxcKQkTyUtT8nezPnchoHA99V9gbC6KxnLtp
        KOhazH2xH1FY9SLbEDWRafmHJrRuBPiRtg==
X-Google-Smtp-Source: ABdhPJzRhuq1HqrzCBVXnJv+E7x6zUHp7tuCSXGXAIzhQ2SUN++Qu4ESB4yF70Ifgh+t7q4mP4C25w==
X-Received: by 2002:a05:6000:1b90:: with SMTP id r16mr12923636wru.316.1625566337206;
        Tue, 06 Jul 2021 03:12:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u2sm9862739wmc.42.2021.07.06.03.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 03:12:16 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= 
        <ckoenig.leichtzumerken@gmail.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/7] drm/msm: always wait for the exclusive fence
Date:   Tue,  6 Jul 2021 12:12:04 +0200
Message-Id: <20210706101209.3034092-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
References: <20210706101209.3034092-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Christian König <ckoenig.leichtzumerken@gmail.com>

Drivers also need to to sync to the exclusive fence when
a shared one is present.

Signed-off-by: Christian König <christian.koenig@amd.com>
[danvet: Not that hard to compile-test on arm ...]
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 141178754231..d9c4f1deeafb 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -812,17 +812,15 @@ int msm_gem_sync_object(struct drm_gem_object *obj,
 	struct dma_fence *fence;
 	int i, ret;
 
-	fobj = dma_resv_shared_list(obj->resv);
-	if (!fobj || (fobj->shared_count == 0)) {
-		fence = dma_resv_excl_fence(obj->resv);
-		/* don't need to wait on our own fences, since ring is fifo */
-		if (fence && (fence->context != fctx->context)) {
-			ret = dma_fence_wait(fence, true);
-			if (ret)
-				return ret;
-		}
+	fence = dma_resv_excl_fence(obj->resv);
+	/* don't need to wait on our own fences, since ring is fifo */
+	if (fence && (fence->context != fctx->context)) {
+		ret = dma_fence_wait(fence, true);
+		if (ret)
+			return ret;
 	}
 
+	fobj = dma_resv_shared_list(obj->resv);
 	if (!exclusive || !fobj)
 		return 0;
 
-- 
2.32.0

