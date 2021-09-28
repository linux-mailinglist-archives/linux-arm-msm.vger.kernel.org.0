Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D6B41B3C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 18:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241752AbhI1Q0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 12:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241702AbhI1Q0E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 12:26:04 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2279C061746;
        Tue, 28 Sep 2021 09:24:23 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id x8so11714582plv.8;
        Tue, 28 Sep 2021 09:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHlhAnJc71taZr/+BkaaA8wu8hR4fcgSNUCat/tWerI=;
        b=daUOaWa3DRPTu4mbZ1dBxI6Jqoe5tBfdeHvSmVmieVSsPj2tzkn1WUfOOG0takYkdZ
         xWFd1ua+TFmGjqcMBx9AWSxn5C3jzjzwzkRnFdlK1VBl51Xgeol6oyj5TvRpzBnLRC/o
         qv7c1/QCbV+rKwAA6lQbfPDcmJJb9Z1FCkt+D8fLlbLWbOkC4PyVw5TryjBMOyUlv7p2
         KvwczCZy2wRBzVDRNKtNe4x9ZSJcfHW91XErR09/yG9TAe09rGRmqknEPxuL7DL3etvA
         gcLRSGoyqfZcx0DL2NAZ7pPCZE7fCrzE+IyyRunakQmtKgaW9hV688+pG/agoW84Kc16
         VdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FHlhAnJc71taZr/+BkaaA8wu8hR4fcgSNUCat/tWerI=;
        b=kXgkJZsIyGRcnA7avJMoK9AZR8ELQNVj9T3zf3mFztXEjc+P4/E70DrlAw9sj/ZKku
         m5ilOvkXG/SQ6o+JjrdoBqbziZBd3T9DU1JtfZqlxCC4QwT+wbHymEYO7V2vNz+BKoQq
         tezU5qNLWu6kp+bBOEOKKENnsevCi8LUI1TOCj4loZnbFCbYpmAnWH31eGIn6yVBDQUr
         Eg17L/DjruaQdg0kxTibOZy2aSlGuZoIX9TsnKotvU1OlL+1bIXI4nKolEYrH4ZLubmm
         OewLxT7/e1dflnAsK94c007jkIunM5jO7s4i0v2QqYivebjgkfvJ4JCWEY57/GSnJ2/N
         G2sg==
X-Gm-Message-State: AOAM531dnA8tInc1HK6TLOC9RikLoKVOgSyi9Ydz3IikNfrDlGYNCJ0l
        IQTxFP0IgiMeyYKxCzS3dlS+khTTLM0=
X-Google-Smtp-Source: ABdhPJxRoIfwR6j3nkdfKPAphyQ2MJbzLyba1v5zHwK/OM3EMGR2rXvXK833SIEOuAE3eVmE9y8roA==
X-Received: by 2002:a17:90a:514e:: with SMTP id k14mr918232pjm.154.1632846263013;
        Tue, 28 Sep 2021 09:24:23 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id c7sm20537216pfd.75.2021.09.28.09.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 09:24:21 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: Remove some nonsense
Date:   Tue, 28 Sep 2021 09:28:59 -0700
Message-Id: <20210928162903.1104847-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

These aren't used.  And if we add use for them later, we should probably
do something a bit more structured than string parsing.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
 2 files changed, 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b131fd376192..e32dbb06aad1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -958,12 +958,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
-	.core_ib_ff = "6.0",
-	.core_clk_ff = "1.0",
-	.comp_ratio_rt =
-	"NV12/5/1/1.23 AB24/5/1/1.23 XB24/5/1/1.23",
-	.comp_ratio_nrt =
-	"NV12/5/1/1.25 AB24/5/1/1.25 XB24/5/1/1.25",
 	.undersized_prefill_lines = 2,
 	.xtra_prefill_lines = 2,
 	.dest_scale_prefill_lines = 3,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d2a945a27cfa..4ade44bbd37e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -676,10 +676,6 @@ struct dpu_perf_cdp_cfg {
  * @min_core_ib        minimum mnoc ib vote in kbps
  * @min_llcc_ib        minimum llcc ib vote in kbps
  * @min_dram_ib        minimum dram ib vote in kbps
- * @core_ib_ff         core instantaneous bandwidth fudge factor
- * @core_clk_ff        core clock fudge factor
- * @comp_ratio_rt      string of 0 or more of <fourcc>/<ven>/<mod>/<comp ratio>
- * @comp_ratio_nrt     string of 0 or more of <fourcc>/<ven>/<mod>/<comp ratio>
  * @undersized_prefill_lines   undersized prefill in lines
  * @xtra_prefill_lines         extra prefill latency in lines
  * @dest_scale_prefill_lines   destination scaler latency in lines
@@ -702,10 +698,6 @@ struct dpu_perf_cfg {
 	u32 min_core_ib;
 	u32 min_llcc_ib;
 	u32 min_dram_ib;
-	const char *core_ib_ff;
-	const char *core_clk_ff;
-	const char *comp_ratio_rt;
-	const char *comp_ratio_nrt;
 	u32 undersized_prefill_lines;
 	u32 xtra_prefill_lines;
 	u32 dest_scale_prefill_lines;
-- 
2.31.1

