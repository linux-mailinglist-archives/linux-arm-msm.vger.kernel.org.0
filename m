Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 082112B4E0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 18:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387745AbgKPRlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 12:41:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387734AbgKPRll (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 12:41:41 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88BF7C0613CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:41:41 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id 23so19630092wrc.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 09:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tTwQDvBtnpWbM0srw/EUqdspNhCuLlcukla9ix/INuQ=;
        b=g4UiDscwY/1oIPlgmGmNSmsyprgvCPP0mfkN+jRO3SE5cBqae6RaGAR9IUaPSZUxof
         j13OCWwzarpHIiVkv/lCvijBftpfBu3CfwV0uAjtOACmRqUmmVRJlu1hHjjaEbDQlhau
         I3K2FUugZPw1tr7zsOT1+KjOpoBTufXi3dq7ToTrVwC/NOrUntqtEDSpKQ+AMfuu02b+
         IHC2wQjp7Zo7nwOPGEe5P34uAZNk9FrdMb1xYPUHtFbeTil2AN3lzicyIi1JXHzEphOm
         MHsyCNW6VNsOf4OCewOVHOGuHu2VVqA3RsBCJbEMA5lv0zhTazg/R/MSD/z2Av9RU94p
         3YxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tTwQDvBtnpWbM0srw/EUqdspNhCuLlcukla9ix/INuQ=;
        b=lc7oDrWd5D1njLtBFGV3z6cTTmI1jLGtS/RBM1e5wYhDrkQuy6F+DmXJoA0jXJJ+bq
         ZtyN7m3p8ElYBQpdJP32QIAPLTlL/Xj0siSiFIxb2tlUrv8ErWmGBP1Z6r48UQOduCQF
         rq+4pCZGkdMf1sRiTpVtQHK6VbhmMtDDt36wpS31ltJQdxzi1nYnJilycn/mQij0txZb
         ykihm60OiSKZLoLK5sz28OIEhs36BgogkGoxGdrQXRMkKDnAyWv2DGKvRu+bdT6N6zcq
         9b07uucV0hCqEPTscXA848E6YaD3GfFfKnGnXAKXvHd2sEb4qiw7f5VQg2mCRS9EPEaM
         zLuw==
X-Gm-Message-State: AOAM531yUv2JEdC6D6HSQuUAOqITkKuahCdORSDBlO8RpNQDgVdJ1OG7
        NNdFOu+XmuCifq1UfkOAB5ZQ+g==
X-Google-Smtp-Source: ABdhPJyNP2NVhgTiLMxWbWxmQP47XGLeaZhP7nL1I8MHMwAmQ8wJVsvtnCWCCTWN8bCCxgCJTJY0tw==
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr20442206wrv.258.1605548500288;
        Mon, 16 Nov 2020 09:41:40 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:41:39 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 15/42] drm/msm/adreno/a6xx_gpu: Staticise local function 'a6xx_idle'
Date:   Mon, 16 Nov 2020 17:40:45 +0000
Message-Id: <20201116174112.1833368-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c:33:6: warning: no previous prototype for ‘a6xx_idle’ [-Wmissing-prototypes]

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index fcb0aabbc9852..03c2f7e0c9497 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -30,7 +30,7 @@ static inline bool _a6xx_check_idle(struct msm_gpu *gpu)
 		A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT);
 }
 
-bool a6xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
+static bool a6xx_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	/* wait for CP to drain ringbuffer: */
 	if (!adreno_idle(gpu, ring))
-- 
2.25.1

