Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0FB282D0B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Oct 2020 21:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgJDTVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Oct 2020 15:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726085AbgJDTVM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Oct 2020 15:21:12 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A442FC0613CE;
        Sun,  4 Oct 2020 12:21:10 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t14so4331755pgl.10;
        Sun, 04 Oct 2020 12:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8roT9Qf/uCSVbwPyL+ZLgqLFUJWhIOLg7jX7brDWZVQ=;
        b=CN9uiFFrUASl4sYS287RnyYXZuyZ7Y2vAbTiPWN9SywBTKJ5RtW0OtFwOOi5Vgb2pF
         iK945jnrW5qYaz5lzdVXFta3bUO48vTw4wlgNcR/2NdjRQ6aZTa5jpDMHs/waJFIKKNn
         pqNK2Tqw8HNmFX3R+v6Fwu1mVWf5nVuz47tFalkfHjGrlpQoABy7873rtEL8S8HLj/Y6
         VJF9OLHcSnEKuzRdbBRyGvlMjtEFbfU1GZpcgz/NCaK1DHjdd4uiL/41OO9NaTq+jk4I
         DCyDvzFenQNg22JXc/fLQ6/IAcjxD4NMDHDFSfTRLkJ+02xqpIgUBWpDEsMzi1ODgRa0
         M2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8roT9Qf/uCSVbwPyL+ZLgqLFUJWhIOLg7jX7brDWZVQ=;
        b=HKXKWGQeUZnuG2CzqJ6vAN2xgEelefrIzLMI26cyGKaQRwiBseBJCPsV+Tgr/zdrFC
         gJe72hwyjKcy++rwOq5pG+y+9iQp9hpS8SzUPdEEtly8yTldJN2Ul/QVeiU/g/EPGKv3
         YjqHwfh75bVUsHBZzlAyceTyjyTGVZw3SJhSnThfwepF1EWRGjBe82u2nHWdoXkSdvSr
         uV8YG1DCrG2+YW8zCpGRRcilq+rzYoMPjnllPLAV3lcwJtNTICVE4MU8IP6xk3tVNz6K
         01xfYKzQraJAspfyBdtDjcwXjRa4yfvUr35XNo+BHNBQmQwZi4v/VcJdxDdEQ9z1TO32
         +Rwg==
X-Gm-Message-State: AOAM5332Lm492F+P7L6gCs8CxNOtK51+yhqBZppWnr4NBjiVlp5XQ+bA
        53DLIN1sSgM+H1vTTpOiJZM=
X-Google-Smtp-Source: ABdhPJzpVe6lU/lpwBKDe/+zQOSlcHlVKlEAL02V4leKB6Uq1FQPwew3fDKvnWcUxYT9D+3gGdj+lQ==
X-Received: by 2002:a62:5bc2:0:b029:13e:d13d:a130 with SMTP id p185-20020a625bc20000b029013ed13da130mr13182418pfb.24.1601839270175;
        Sun, 04 Oct 2020 12:21:10 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id x3sm9825340pfo.95.2020.10.04.12.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 12:21:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 02/14] drm/msm: Drop chatty trace
Date:   Sun,  4 Oct 2020 12:21:34 -0700
Message-Id: <20201004192152.3298573-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201004192152.3298573-1-robdclark@gmail.com>
References: <20201004192152.3298573-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

It is somewhat redundant with the gpu tracepoints, and anyways not too
useful to justify spamming the log when debug traces are enabled.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 55d16489d0f3..31fce3ac0cdc 100644
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

