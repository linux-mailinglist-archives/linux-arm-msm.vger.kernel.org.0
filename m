Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6881D293000
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 22:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgJSUq5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 16:46:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728838AbgJSUpz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 16:45:55 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 755E2C0613CE;
        Mon, 19 Oct 2020 13:45:54 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t22so412231plr.9;
        Mon, 19 Oct 2020 13:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mM34E3X4vpoNxytPQSc+/o1jOvHyhw217+EG77sMv+c=;
        b=LBZq9e80i2kTt0UvwPxVRaQHTkxAHZL9msB0CkdkuL0IWIzAfxLCVskEC3TSNFtQvb
         lvuYYwdqrx+QaqBkViz2A25krnPpFxx7jbESi6FxAPo9AHhgK6jGJIaGWQffDGA58IoP
         bdtMy6UQDJqCJ/dDaJ5xwDq4UlaVu37cU5Pb3RdlSJirtvAptbf24+W6AbC+aN7Y432E
         K9tqD73KVYVETz5RCvkCZvOMb9y3Hzpj03sZeV6iyoVHtF6YoHcw0tGX8bZ1pYsT5V79
         DbMs0Rfj6y3eLMDDQjkTRna8X72vhpNiRQwgyDntt3OgIjEOlo/MuSeC+KUk7454Fk9m
         pafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mM34E3X4vpoNxytPQSc+/o1jOvHyhw217+EG77sMv+c=;
        b=V+Qg9/X8ikRjWCLkGy70thH/SfosJaiNbF0xlqt707+lC9m4YI64Zdb51rruVKHK/V
         11cm7BpNHybVBiXVpzDxX8g8ClSLAwh4tb/cDWNOqAVR23EkZYYePjPcJzy+cOqhxk7Y
         f2KN8TeNBTp0nULYXmulOS98X5Dbux0vRy7euKGIJbT8Lqyl7TEZbWwNPxz+ImHzRAFw
         4PFPzxd7JSVc9JysdDbJ4ExWrcbIkYCAxOUO6iro8efZYUrDV9EQUEvwQA21S8rV/veR
         osJZxSLdTfZrwENeW4jOxXvZnGxMLZZV96IvfzHAhkr7LfwKt2Lfr9gfrBlVooU1OyLq
         GrXw==
X-Gm-Message-State: AOAM533CsblRqaI8fAK6naRkTApFqorvhuRrTGSqATJ7PZqkuxDKAMVd
        YWzgEn4Pu0P0uS/NU0JT28I=
X-Google-Smtp-Source: ABdhPJxESgo/rkutIMHVbmiA9JJvXnqgXfWq+hL9O5Y9YxHLj0S+dAiI2e/Sxy8WF/AyK9oo/R81hA==
X-Received: by 2002:a17:90a:3e4e:: with SMTP id t14mr1175504pjm.217.1603140354046;
        Mon, 19 Oct 2020 13:45:54 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id y4sm399856pgl.67.2020.10.19.13.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 13:45:53 -0700 (PDT)
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
Subject: [PATCH v3 11/23] drm/msm: Drop chatty trace
Date:   Mon, 19 Oct 2020 13:46:12 -0700
Message-Id: <20201019204636.139997-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201019204636.139997-1-robdclark@gmail.com>
References: <20201019204636.139997-1-robdclark@gmail.com>
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
index 015f6b884e2e..ed6645aa0ae5 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -545,7 +545,6 @@ static void recover_worker(struct work_struct *work)
 
 static void hangcheck_timer_reset(struct msm_gpu *gpu)
 {
-	DBG("%s", gpu->name);
 	mod_timer(&gpu->hangcheck_timer,
 			round_jiffies_up(jiffies + DRM_MSM_HANGCHECK_JIFFIES));
 }
-- 
2.26.2

