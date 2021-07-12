Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2431A3C648B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 22:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236689AbhGLUFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 16:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236672AbhGLUFB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 16:05:01 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EBBC0613DD
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jul 2021 13:02:12 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v5so27273530wrt.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jul 2021 13:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=InVnPLy1h+Gn4xVBn/fC7AZt6grH88jqC7oOozTIXb8=;
        b=X+SJ3p0ESK4TQAQ/qH/+BAUMT6xrms/nqyPKdH0HxK3ym7UQ3p95EVQZ7XCWfzGR/y
         fkmaGRWWf7ruyInATjXDAqzkFIUWmEheqOY9qU0bBEDLG3unVw+cktegJiy4Ce9efes5
         3RgAX2dj1ORkeX7jkS+IWjkhq297tm+bn7wxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=InVnPLy1h+Gn4xVBn/fC7AZt6grH88jqC7oOozTIXb8=;
        b=TMIuGOHAqejnc3yaepiXM/kcijsdapEWBeGaGHdar82hZfHqerrGiQwdEsksnEb7zM
         05DWPOnqEps8G/dpq8KSy14xHT/yACNQZL30RXLAVQSSJnGquja9s5ldM/Dgh0zXkOmI
         5tvUDcML/7gvdKbXKqCKmg5q1E1FVJmSPbfWPIewOscw/RG77b6Qlh3c7kQWj4sfNCYD
         2u9P+B65ZgLtVzSOGy2Zp8V26/xkPW8BfyIaL2hLv2zCyFBIgGIDYk/fQvulOzrX++A8
         ysk3dWWDY2IKbCFnOdyWZJMn8AEJs2Poh6A5HiODslVwvmgDLlQMc0/OaqT647K0K3uV
         +gFQ==
X-Gm-Message-State: AOAM532kdoyaKWt9HCzzIDZT3VxyjOxt6jlQKsh2wHD5x1iZj7yUt3OO
        A/3OyJpLJhsTiWlQppGJNFRyAw==
X-Google-Smtp-Source: ABdhPJyJSV9zsmZBMr7dsHfxfEOPFY/zcUhgikRQEnDQpbjq7rFktFp+vN9flFcWF5qevrFsmcL8wA==
X-Received: by 2002:a5d:6786:: with SMTP id v6mr870277wru.290.1626120131603;
        Mon, 12 Jul 2021 13:02:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id l14sm9858221wrs.22.2021.07.12.13.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:02:11 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH v4 14/18] drm/msm: Don't break exclusive fence ordering
Date:   Mon, 12 Jul 2021 19:53:48 +0200
Message-Id: <20210712175352.802687-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
References: <20210712175352.802687-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There's only one exclusive slot, and we must not break the ordering.

Adding a new exclusive fence drops all previous fences from the
dma_resv. To avoid violating the signalling order we err on the side of
over-synchronizing by waiting for the existing fences, even if
userspace asked us to ignore them.

A better fix would be to us a dma_fence_chain or _array like e.g.
amdgpu now uses, but
- msm has a synchronous dma_fence_wait for anything from another
  context, so doesn't seem to care much,
- and it probably makes sense to lift this into dma-resv.c code as a
  proper concept, so that drivers don't have to hack up their own
  solution each on their own.

v2: Improve commit message per Lucas' suggestion.

Cc: Lucas Stach <l.stach@pengutronix.de>
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

