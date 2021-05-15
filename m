Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B035C381B9E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 00:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229568AbhEOW7Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 18:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhEOW7T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 18:59:19 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8523AC06174A
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 15:58:05 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id y9so2763693ljn.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 15:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ALt2xpqxR2M7ID0/lSTYxo899aEF0TaxPvxXAG/ycDA=;
        b=gvXEsRJs033GcqK2sH1Iyi/TjQHWKRC+qN8Ak/KNQd+PQsq7r659fLB/3hCUzmK+T1
         aXtxVuxw0vsnxFpV58u+qgoSKhHQvZRg9EaqykOAXGe/8wfFsmYzV2tk0PyFOF5ZQqVj
         hMXiMQtcBnxFlmULIHYH2BmktuhSk7RxsQl4+OFYTuVdnx0QLjeATmpcIdnUQCfXyVTQ
         4us/PzwIB1MauLsrLjGHG8nKWI3CbWccHFIG0hKABubseVKwgP/rOkDjwKMN3jXIiD/m
         acc8wQJkqhj26mxeUeGHda0Lu3zdHnqo5jwO2RRPD8at0wu2M9Fl4fGA6njNFkKmttfN
         3JAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ALt2xpqxR2M7ID0/lSTYxo899aEF0TaxPvxXAG/ycDA=;
        b=hGHJhwRVDtf5JIDB0dGS5ioiHjxF8A3wbmv6mXC4BtoiSSdrO6bIu0LygeHQ1cV7P8
         p7G+8UcNWHhMqjP1lX5hk7ZytU5u4myyNtkeNmNRyaPTfSZesbXG/7XiJASQjDlIyu+y
         yBLaC0w3lD3G/V5MeJ4NHDIKi1vD/mfmvT8PwFDKNHAutiw6dZ1ZHgUlhjnpEw6Q12QU
         5B6rpgz19VfpYEr8l6BW3HL2Lzk3YrKNaGxHZoR/dLaGLYG0AOVtKwEgEh4zlfiqP0Oj
         0UCpK2yMCqQogDnOm86hn9F/u2p3nlYPs24RxXalxABUG9w2g9UE8tAfvLm+An+JUat4
         b0Rg==
X-Gm-Message-State: AOAM533LaX8sB39tFl9vCXT213bN7KONidAzXnSJ9W22qFCft+noT4rb
        3LdAK74Mhli9fXuIEf2k9vTZrw==
X-Google-Smtp-Source: ABdhPJxVomA6+KwMCBCYalVwu8xNGF3Q1k/Cfb94TZzmYw24i1yt/uCu6UzbmXdojge9FbhmJX0aQQ==
X-Received: by 2002:a2e:a370:: with SMTP id i16mr25862713ljn.90.1621119484091;
        Sat, 15 May 2021 15:58:04 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j3sm1499729lfe.5.2021.05.15.15.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 15:58:03 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/6] drm/msm/dpu: drop unused lm_max_width from RM
Date:   Sun, 16 May 2021 01:57:56 +0300
Message-Id: <20210515225757.1989955-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

No code uses lm_max_width from resource manager, so drop it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h |  4 ----
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index c36700a06ff2..ec4387ad1182 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -88,18 +88,6 @@ int dpu_rm_init(struct dpu_rm *rm,
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
 
 	for (i = 0; i < cat->ctl_count; i++) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index ee90b1233430..0c9113581d71 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -17,14 +17,10 @@ struct dpu_global_state;
  * struct dpu_rm - DPU dynamic hardware resource manager
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
- * @lm_max_width: cached layer mixer maximum width
- * @rm_lock: resource manager mutex
  */
 struct dpu_rm {
 	struct dpu_hw_blk *mixer_blks[LM_MAX - LM_0];
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
-
-	uint32_t lm_max_width;
 };
 
 struct dpu_kms;
-- 
2.30.2

