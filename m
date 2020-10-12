Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B716E28ABF5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 04:10:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729746AbgJLCJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 11 Oct 2020 22:09:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbgJLCJL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 11 Oct 2020 22:09:11 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2369C0613D8;
        Sun, 11 Oct 2020 19:09:09 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id l18so3729220pgg.0;
        Sun, 11 Oct 2020 19:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kMl9yrbj49Q3BQxacHHpJSzD9mDjKljs1vKng3vrmmU=;
        b=Wr8RnpP+DKiQ8rLbmnjHRsXOyQyFSWALLo/UAqujFApoQq4ZZVPQgRcBkSxxFcKhNm
         vwxMociFcdb2pNKFj8flGOIyQko9+2Em6A9t6d6w08OT2qVfMah9wsHM/qijOW4FvcUh
         MUq5QVi/P7WSXilooCfbrhBLynMHMt46noLDfWtoPAWIXnKv92yLEuYtETwvaLIDBJJr
         1KZdoLNT6YtXGEOhAZmjn82+CSq0pQv701YqhdxqVHJ2mN0YBvlpt94F9LC/KUdbNKDf
         1UaRBV8w0tXDp+gFmsSCOCidbsmxG7SBPzhA50c3d1PWzsQ2Yteif+h1pXVBbvkVdNN7
         2s3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kMl9yrbj49Q3BQxacHHpJSzD9mDjKljs1vKng3vrmmU=;
        b=kmCVE1BVuU+EU2yr1OoLAH6tVXIVPrnAatx2lKl7wcROW3G1PXKhiyYHT8uHbgdR1y
         9MpDi5o2oj/BbOQ4PnzVi2Qp8X+INUU2ReBRtHe/d1WQO4XTchm1b4pnSFZhF2t1eByv
         MYorwjL40XxtIwhPViEUTxNFl++P9sGY46aNJnRJH4tbtJTefc9luQKSJQqMrzvQFBm4
         aEL7JX/MDizprVg5pODQxDJq6/t50PBD3gQsyMBgIpYcpx0fWpY3gb/j6wSAIPqyLs9G
         35EAITusy5rVF4uznwmE8ps4xIDu8+5xvJRuWGDKD6dLxCLsg62WrpVAzLTvufGXb0ig
         7UaQ==
X-Gm-Message-State: AOAM532zkiAqA9NCyHriYkGkfEvnALAJZeRPyFRAvnlwDdCpxF0Mlgz3
        Z2QUZ3Hu0tM6cDgQsXs1FTA=
X-Google-Smtp-Source: ABdhPJxyxbNBiotDIT/cDYvF6QqCUgr2LglsXzEClcUjc7Oi/NU+STJLnUbvz8pmg0pP8j9pAoijLw==
X-Received: by 2002:aa7:8588:0:b029:152:a38c:fbba with SMTP id w8-20020aa785880000b0290152a38cfbbamr22020945pfn.0.1602468549247;
        Sun, 11 Oct 2020 19:09:09 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id kv19sm21560346pjb.22.2020.10.11.19.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2020 19:09:08 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 10/22] drm/msm: Drop chatty trace
Date:   Sun, 11 Oct 2020 19:09:37 -0700
Message-Id: <20201012020958.229288-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012020958.229288-1-robdclark@gmail.com>
References: <20201012020958.229288-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It is somewhat redundant with the gpu tracepoints, and anyways not too
useful to justify spamming the log when debug traces are enabled.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index dbd9020713e5..677b11c5a151 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -535,7 +535,6 @@ static void recover_worker(struct work_struct *work)
 
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
-	DBG("%s", gpu->name);
 	mod_timer(&gpu->hangcheck_timer,
 			round_jiffies_up(jiffies + DRM_MSM_HANGCHECK_JIFFIES));
 }
-- 
2.26.2

