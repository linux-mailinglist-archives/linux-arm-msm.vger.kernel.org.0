Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC02F496703
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jan 2022 22:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232050AbiAUVG0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jan 2022 16:06:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbiAUVGX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jan 2022 16:06:23 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E059C06173B
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:22 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id u6so4626534lfm.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jan 2022 13:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zxJMNd08fBIp+phPJjWAVZVWzjoHZnrrt+sPMY4L3X0=;
        b=U0SJ6kNwlAVK9R+AcmLc81cHW/T42DMoHeozc8q6GPXb0tpw3UTaqJzZPAinfU4LOn
         5iLOc5E4IeQhREBs5haYK/qGXvQFLyOpUh4vQ9KgXQjEkW9f0i7mNa/blIxfK7tSsKR7
         Xf9IHn9QYDn7RXE04gBqyRa3UC+vEVQ3EhfE+QPOB43rqCv8qJ4bQHX+Tyea7yf/FVT5
         6FByPF5KiXvtDkYX0Bo82KAkyH8DZ+kMciiJwTP60Y02VOQHZgSD/2pkXkPFSCyf6g9x
         bIESuf3zFmrAT2NyxLYpovwvF7amHE8JL8ezlBVQ/77Q+MlC1hsfADO/UfgegDXsjQNY
         j+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zxJMNd08fBIp+phPJjWAVZVWzjoHZnrrt+sPMY4L3X0=;
        b=blBOm+XlrCMl9vQXnKfUXgEDAnX0pkBd2T4oDAUwC2kMncUQPSbMI9oJOhqHmjnv5f
         NMub7xEhE5EuPaUYvnbll1CqIodmq5/Yj6styWiwkwqTrIN6Wp+GHl1dxvFKQqygE56H
         U5UychhUkgizcVBW8Bm3zqLtlykkTO0HMq9sYy5fO1r2bm/g5dHT7aBYOwHqsT+3V8QL
         h6m76D8NpzHCWBIXupEeBUmCI3/czPsIQE1xdeJKqDAQm241XH6mTVeiSwKqEnGBg8d2
         rP+VeTTlOmJ5IWbtjGnnqg4lwjqw/0vEOUEGaZNANmAi9T1TQgrU7WMNJr3XKckBoL9C
         aFOQ==
X-Gm-Message-State: AOAM533hDMaXl2qrPVy2rhzA/9sWHFwBIB0CsecGQfMDqjEhefHYoTu0
        D9K7XngrdTyJWjkmna4nDeu/Xw==
X-Google-Smtp-Source: ABdhPJzaDDU0OKXCYAq0mbfnqeGh81j0gQXOcW5KGFYmTrSX1bXNsjhXvftg7xP82vTRHwSgoAkeUA==
X-Received: by 2002:a19:645b:: with SMTP id b27mr4916176lfj.262.1642799180808;
        Fri, 21 Jan 2022 13:06:20 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v10sm279125ljk.44.2022.01.21.13.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:06:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 1/6] drm/msm/dpu: drop unused lm_max_width from RM
Date:   Sat, 22 Jan 2022 00:06:13 +0300
Message-Id: <20220121210618.3482550-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
References: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No code uses lm_max_width from resource manager, so drop it. Instead of
calculating the lm_max_width, code can use max_mixer_width field from
the hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9c83d6e427a..b5b1ea1e4de6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -114,18 +114,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 			goto fail;
 		}
 		rm->mixer_blks[lm->id - LM_0] = &hw->base;
-
-		if (!rm->lm_max_width) {
-			rm->lm_max_width = lm->sblk->maxwidth;
-		} else if (rm->lm_max_width != lm->sblk->maxwidth) {
-			/*
-			 * Don't expect to have hw where lm max widths differ.
-			 * If found, take the min.
-			 */
-			DPU_ERROR("unsupported: lm maxwidth differs\n");
-			if (rm->lm_max_width > lm->sblk->maxwidth)
-				rm->lm_max_width = lm->sblk->maxwidth;
-		}
 	}
 
 	for (i = 0; i < cat->merge_3d_count; i++) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 1f12c8d5b8aa..0f27759211b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -20,8 +20,6 @@ struct dpu_global_state;
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
  * @dspp_blks: array of dspp hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *pingpong_blks[PINGPONG_MAX - PINGPONG_0];
@@ -30,8 +28,6 @@ struct dpu_rm {
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
 	struct dpu_hw_blk *dspp_blks[DSPP_MAX - DSPP_0];
 	struct dpu_hw_blk *merge_3d_blks[MERGE_3D_MAX - MERGE_3D_0];
-
-	uint32_t lm_max_width;
 };
 
 /**
-- 
2.34.1

