Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93E1B45CF3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 22:37:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351815AbhKXVkk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 16:40:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351697AbhKXVka (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 16:40:30 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16944C061746;
        Wed, 24 Nov 2021 13:37:20 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id gx15-20020a17090b124f00b001a695f3734aso3968518pjb.0;
        Wed, 24 Nov 2021 13:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xo64Z06VK9djsBpMwA/kmmq0aY4Br5jzhSEbD50Z0N4=;
        b=kr9xAcTb6KjI4HMyh6lER9oWkUXGMB2DUApAFlvKjQibThaaFYCg3ZXglx46ws3LjW
         ttpdP9QH/yY9ZMTud8QBAc3XqeYCCkE1OkHt/T1yfq92ei58QjClA0ncdererQSRmTbQ
         gvO1Ez4NzKrbIWd9t6ea9SZeVSTHByNSnHROFs1r4I7Xw9pH41TQe2n6m8k7Uus2Vw0m
         9XOC/3GRHHRUm8zQ/eJpQZDeRi4ESbDH1gwglUbj8eDzpr9xZqMwA/pzPCoX9IknqycI
         KNMTG0UHRcoiu8nay7teS7jJiGqowVZwA9XHPvZBQkfOvxZv6h5dlbVDVjiD7Sx1zaDR
         IKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xo64Z06VK9djsBpMwA/kmmq0aY4Br5jzhSEbD50Z0N4=;
        b=h9uZhzpbawTB6loCwByQ6E5wXYYkyPCWoLch2FWWkLvOUiEIK2Nl8+MooXk+OwBekw
         yd3mD4k9s3/BG3NaiYXRGjvkHTsZXTgJtKtP51u1Srih1S5oZ8WKLyBu/ZijufbMIjZa
         LQ+ro/WC1Vy1v7m03VH2tegoDjyg+cz07FKhijDyV0emyfh20elSb6/0RS4Nv/UGqQ4c
         AWBVJG4v6cpebB2qvhZYuzrILIivq2KRxJtk2z6G+toNt/qvBvMh/VhK0DBhAsu7Cmc1
         TRFUthd930cLI9vVZCXDlGBbc2f0dmvUuTUMY1H7hPH5Lawl2zsq9UyVhrxfB6Ee3yQz
         7Ijw==
X-Gm-Message-State: AOAM531YF1HmoRU5GeYOOxiLv0ySw06UHlTrN1OpNbViL2QN4dFUYVuk
        hOAweGNlHgXoUZEOrwUfrio=
X-Google-Smtp-Source: ABdhPJzh44tw9P3I/mqiG6qgvxA4wLye4Bn4K8czdGIHeFf9evQGp4cLkzNfVGdQcaNx+ZjJ+2nrLg==
X-Received: by 2002:a17:902:d505:b0:141:f5f7:848e with SMTP id b5-20020a170902d50500b00141f5f7848emr23110997plg.72.1637789839653;
        Wed, 24 Nov 2021 13:37:19 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q6sm711783pfk.144.2021.11.24.13.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 13:37:18 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <swboyd@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/7] drm/msm/gpu: Add some WARN_ON()s
Date:   Wed, 24 Nov 2021 13:41:30 -0800
Message-Id: <20211124214151.1427022-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124214151.1427022-1-robdclark@gmail.com>
References: <20211124214151.1427022-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

We don't expect either of these conditions to ever be true, so let's get
shouty if they are.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index a379f98aca54..6c42cc0ebe84 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -504,6 +504,9 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struct msm_gpu_state *state)
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	int i, count = 0;
 
+	WARN_ON(gpu->needs_hw_init);
+	WARN_ON(!mutex_is_locked(&gpu->dev->struct_mutex));
+
 	kref_init(&state->ref);
 
 	ktime_get_real_ts64(&state->time);
-- 
2.33.1

