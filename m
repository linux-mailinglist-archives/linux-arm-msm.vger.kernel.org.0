Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2069145152B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 21:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbhKOU06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 15:26:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346045AbhKOT3u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 14:29:50 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBB9DC0431A8;
        Mon, 15 Nov 2021 11:10:07 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y8so9814755plg.1;
        Mon, 15 Nov 2021 11:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wDPmToaijo7T8aT7P3r6ZMwp5FJI2KCyBAGlYq2w7rM=;
        b=GIj9RXpkj2vA7zWzxBfBHgX2mUUcT2tHWP7cd9ldly7w/kWE3EVuQTmR4sPppk8hvr
         ZA0yMGzW6BMQXiTqouLTjq3xDhBjBeUOeSh35Y9wWL3gNA762y6FFDg9u//0W0btd4oj
         P9jk347dxLqAsPPpt1LAuBg7wevVo0BcGLDcoTU6ZNrwUphgopDtLcdusTp1j8wUB2z0
         YYsbIinNv+fNrmtFfALxooXQTac7w+LFpzZs8j3wAq0jjODamZ6Qq/2G9aULQ6ol8NWY
         CnmvF5GfqljRTjPOstArmUL22CEq4o5HS5RT4YSCDCzQlWx6PZRVKsr1BHMHUjIZYTbp
         okyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wDPmToaijo7T8aT7P3r6ZMwp5FJI2KCyBAGlYq2w7rM=;
        b=z5iD/GvMwAPBvlmhqrCtVRN42w4gVyyzVCpWPWiV8oIKURwS6yFvTSyUJdZgmSaGDb
         cyQbk4uzSri2ykzYtnrYm9fp88HXR/bxKNlxPRH+SX3wV/9on6YvHXgerVkZjS5dGsF0
         SW59XGKeYZ9rF5B0SuaN/A/tkXCDxmuIPuxKNL0UikeO87q1Q6VE+4GImmgKRzTH6vyS
         Qg5fEUnCetpH2Zecsq1V59OE0x8wuJ8V4QPjpdDImhIt8P9lLKwfQ4/Njd5+rnlWG8Xj
         k4sh1fqJPYKzv4H0fi24arjktTNoZxM4sGC0FUiKQxw2SgANTlBMZHBdWf9TEzJ7S2nK
         fWcw==
X-Gm-Message-State: AOAM532DuxaBoVzg400lViCdOFNgPOaylcR4AU83byBH6fE2wsmmJwkh
        tOk104RrSgiOi11ATaqcOgo=
X-Google-Smtp-Source: ABdhPJxkm0vEo2QPlPHnBhYa9RjtVtcJzMkuQtas1V0GtkWxUBLy59cyWKkt8W1adHeYtcjmRyK4ww==
X-Received: by 2002:a17:90b:17cc:: with SMTP id me12mr52788431pjb.141.1637003407408;
        Mon, 15 Nov 2021 11:10:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id i19sm15550492pfu.119.2021.11.15.11.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 11:10:06 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/adreno: Name the shadow buffer
Date:   Mon, 15 Nov 2021 11:15:10 -0800
Message-Id: <20211115191514.310472-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This was the one GPU related kernel buffer which was not given a debug
name.  Let's fix that.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ec8e043c9d38..a95977e8ad98 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -925,6 +925,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 
 			if (IS_ERR(a5xx_gpu->shadow))
 				return PTR_ERR(a5xx_gpu->shadow);
+
+			msm_gem_object_set_name(a5xx_gpu->shadow_bo, "shadow");
 		}
 
 		gpu_write64(gpu, REG_A5XX_CP_RB_RPTR_ADDR,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index dcde5eff931d..c6e7e7ca0482 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1068,6 +1068,8 @@ static int hw_init(struct msm_gpu *gpu)
 
 			if (IS_ERR(a6xx_gpu->shadow))
 				return PTR_ERR(a6xx_gpu->shadow);
+
+			msm_gem_object_set_name(a6xx_gpu->shadow_bo, "shadow");
 		}
 
 		gpu_write64(gpu, REG_A6XX_CP_RB_RPTR_ADDR_LO,
-- 
2.33.1

