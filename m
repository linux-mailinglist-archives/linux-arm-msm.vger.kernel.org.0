Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37EB6102DF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2019 22:08:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfKSVI4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Nov 2019 16:08:56 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:38642 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbfKSVI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Nov 2019 16:08:56 -0500
Received: by mail-wm1-f65.google.com with SMTP id z19so5480658wmk.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Nov 2019 13:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/J7G3D2ebt6Z0HB4QG8yK+4PVkYn3CZE5ldyfHzxSrE=;
        b=Y/D3zFMQVqiSBfqH6DZ+/jejFtdbuHL69Yvo58kYvUYGswh2OtzunEL51V44+jnRNa
         ri1kIAI1ZNJN/CtNFGIo+A400H2rA2nL/IEVUKaLYCYC1t/ulVTa46bNV8lnrM52+bJh
         1LyG44aDuM6YxyD6IdzCvZtz5DTf0tod3Ew+I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/J7G3D2ebt6Z0HB4QG8yK+4PVkYn3CZE5ldyfHzxSrE=;
        b=RaTs7U+YCOsdCO0LqE+wypQKMNeCF/sfeFDh5hYUcysP332FRvCBd5GzlkQza/UY0V
         PBnBCRhmDLVtEhWAtKYM4xRtA09Z26aGTMLGI3m/Im6rERiQv/onbMeFn4DP7nYVwGNT
         vxR+pIDviCJbtUbUl7Q1S0FqQ77xsiS0D1kDGOqoOqB+FrbRixK1mLKpkfPXH8Q1jFn6
         Rv2DsHXVge9hO96wFGrniTf5S7hIcFiivwyq2xTEKN1BYmt6NF4PifCrbDWV9nGWWemt
         SyKEw80AZlkQ4elw+Bi92AWmeilrtWKpBE2IKKgi6yjWXDutCC+9yFSNe/oya9ZyxCew
         QFwA==
X-Gm-Message-State: APjAAAU8wO5+iEwLfFXEJ6XLVYLEuUufJ1u4mmGx/eRRfGukLBsoFu/B
        9M/jApEXKAOgH5BNqmsDtX9ggg==
X-Google-Smtp-Source: APXvYqweGr5lRb2H3jBAb7BO6vyXvuEU0Xn9y82lr1/l6PpO5IamxURKkygb4S/V5DyM3yZ+YUBQ7Q==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr8080941wme.118.1574197733780;
        Tue, 19 Nov 2019 13:08:53 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net. [212.51.149.96])
        by smtp.gmail.com with ESMTPSA id z14sm28005126wrl.60.2019.11.19.13.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2019 13:08:53 -0800 (PST)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm: Don't init ww_mutec acquire ctx before needed
Date:   Tue, 19 Nov 2019 22:08:44 +0100
Message-Id: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For locking semantics it really doesn't matter when we grab the
ticket. But for lockdep validation it does: the acquire ctx is a fake
lockdep. Since other drivers might want to do a full multi-lock dance
in their fault-handler, not just lock a single dma_resv. Therefore we
must init the acquire_ctx only after we've done all the copy_*_user or
anything else that might trigger a pagefault. For msm this means we
need to move it past submit_lookup_objects.

Aside: Why is msm still using struct_mutex, it seems to be using
dma_resv_lock for general buffer state protection?

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index fb1fdd7fa3ef..126b2f62bfe7 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -54,7 +54,6 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
 
 	INIT_LIST_HEAD(&submit->node);
 	INIT_LIST_HEAD(&submit->bo_list);
-	ww_acquire_init(&submit->ticket, &reservation_ww_class);
 
 	return submit;
 }
@@ -489,6 +488,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	if (ret)
 		goto out;
 
+	ww_acquire_init(&submit->ticket, &reservation_ww_class);
 	ret = submit_lock_objects(submit);
 	if (ret)
 		goto out;
-- 
2.24.0

