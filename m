Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 868C927B6A0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 22:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgI1UrR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 16:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbgI1UrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 16:47:16 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1066AC061755;
        Mon, 28 Sep 2020 13:47:14 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id k18so2484175wmj.5;
        Mon, 28 Sep 2020 13:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AVg2siFSODBM8KrUjl/IWCFyPa/t9twpYMidcGJD0tw=;
        b=RNrMdmxsQtKunrZgNizedOFXQDLtQx4wUgn+Dt5NeZunqDjrYtKYxeVvhLJgj3biwC
         ZEFzzVc5FDM5Vb8PjDdPrzpK3GAuxO5m63JH8u5XUPA/f8oRT4t+wPfMmMasJFZWZTpX
         JbUaTe4ewU705ewL9cRPz41vBbAh0Ugb7pBb75lVHA2rS0ltWTH2Y2QGjH4Wz1UsVMw7
         Lgj2uvUI7LOhKW8t4iUEpJJ7lnuHpVe2sURDaUBv9H6fEZuzhlzm8y/ZviJi+GEe6D2K
         rd1FP22dxi9JMI6PSPCL3td9FxS7SnGhCa9UVGr3W8ylrG71kf1if1UsRLYFXz+VktFW
         mObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVg2siFSODBM8KrUjl/IWCFyPa/t9twpYMidcGJD0tw=;
        b=q8+LitYRoNfyIDw2/OYozW7m5dWu4t/EOYnYIwZO5jk+kHduyrGVo6weha+QaVAPTZ
         FvbzzY8RAoSumwu+79qD7GwuonKmh78CiBaiwJyLhn/Bgs1ZOt3CrpMI8sptRanUkzLB
         C3TVGPH7IuESbQs7PIeLUHcaELodeQeGwCUKV1UP2QNN8VjHZP9r43mXtsM/gYjsQOBw
         UFhm7mHgBoD7jzrHjgDzpCSWqM/mY8mjRMgIB2z++Uhk7X6bOmXL8i+ztjY+vmJliIaA
         /WC9XiJfemYdXAag58uIAG/Oh5iOkItFvknSS70CgqCObIIn/e+QrE4TIolfl0czyb1d
         vMFw==
X-Gm-Message-State: AOAM531X2reiKdakKXYEtAhXJji2gcDUgkXS4BrKkbwXkaU1p1nYNcJJ
        QjU7o0k1gqBFVNJrqwSfNH8=
X-Google-Smtp-Source: ABdhPJxgcqsHAISZw/02HIspGIwANjmZ24ND6sAhCncfMEDQkXl6xlOKfCNa3KpS4eudQtRHZDJBSQ==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr948374wmc.151.1601326032682;
        Mon, 28 Sep 2020 13:47:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 13:47:12 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
Date:   Mon, 28 Sep 2020 22:47:03 +0200
Message-Id: <20200928204709.45746-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The PC_DBG_ECO_CNTL register on the Adreno A5xx family gets
programmed to some different values on a per-model basis.
At least, this is what we intend to do here;

Unfortunately, though, this register is being overwritten with a
static magic number, right after applying the GPU-specific
configuration (including the GPU-specific quirks) and that is
effectively nullifying the efforts.

Let's remove the redundant and wrong write to the PC_DBG_ECO_CNTL
register in order to retain the wanted configuration for the
target GPU.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 91726da82ed6..6262603e6e2e 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -594,8 +594,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
 
-	gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0xc0200100);
-
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
-- 
2.28.0

