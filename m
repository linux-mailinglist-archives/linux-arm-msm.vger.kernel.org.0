Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F229437663
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Oct 2021 14:06:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhJVMJA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Oct 2021 08:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbhJVMI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Oct 2021 08:08:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB837C061764;
        Fri, 22 Oct 2021 05:06:41 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t9so520442lfd.1;
        Fri, 22 Oct 2021 05:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R84D4r5FDARD/g2x4xeRmi2uz90HxOZb8w5h12y7ut8=;
        b=B/HOvEO5kKCZyxZM+elLWHPy4zHRSzOIWXG6wYfi895M/WVqzNFbT53DYErRvwXujp
         XlUVYujetUVeWxeQmhj9eW+gj0pLadHZsoXAn7kaZ1GMO0SJL0sdl51UWsk3VZWR0TcP
         eNRmNpoUhZbzl65l8m/8GkpHoZ7u/dmwjSCOuHcWI3q1hDSb5t8K0uje/zxCa7/L0gHt
         TTm08hGuhKbDb4FpX1Z/gYoQcLbCyKQtpBuxv/YcONd8xFbDKAT117b9OQ/e25JlPYm8
         +ykIwo40NC9qvTke9oNzqkhoGOLMotRkkGcN3l0Rww/yYUdBMR+G9my+BT/wOgPOBVEk
         bflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R84D4r5FDARD/g2x4xeRmi2uz90HxOZb8w5h12y7ut8=;
        b=W0CoRLAulcH+xwRDg9Coek9cZLpYJv0oxgM19LxekQKiAAJ0EUKcxy3KYqJ8b7+Xyq
         9VDLD9fBKQWjWqcm1PM7WhKgvP7CidnLCPeaOTGEfnqf5sCHu6UaO1KYHfNBag8y9mAU
         ZmxH5fSPpUJddFiW4bJXMpSWP0qTNgexOMOXDVmDULRgkGI2LGCfuOCEtFKx5Z/21aDA
         Qn4dYUpjW3CNPZjdH5mK6WuX2qVbj0siN6+a+9mORVPfxQfKA9QbZ+fKeCfC4UgUX3mG
         mXz3ehSA9PcKeHrAelqjpPOSOGgtzr7TykZP6UKN+DM0+1Mar7aHjeMZwOD2yK40951W
         xwng==
X-Gm-Message-State: AOAM531nTcRMnHStIJwe4wPHu8wkmwTym4syobtJbs429+Dszx0qZXyR
        0Oi4bBzeTZIqC6tBax2r47YlwG3771Dtl06QJq8=
X-Google-Smtp-Source: ABdhPJyzFpyP0COpqxNMoju9KRywPlL0uzmAAZt7vzpS1TRsvN+hRj8eVtTncT5Hjno9P3zXfcxRHw==
X-Received: by 2002:a05:6512:3393:: with SMTP id h19mr11367891lfg.363.1634904400116;
        Fri, 22 Oct 2021 05:06:40 -0700 (PDT)
Received: from trashcan.lan (public-nat-10.vpngate.v4.open.ad.jp. [219.100.37.242])
        by smtp.gmail.com with ESMTPSA id bu21sm715299lfb.39.2021.10.22.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 05:06:39 -0700 (PDT)
From:   Vladimir Lypak <vladimir.lypak@gmail.com>
To:     Vladimir Lypak <vladimir.lypak@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/msm/a5xx: Eliminate condition on setup of SMMU CP_PROTECT
Date:   Fri, 22 Oct 2021 11:31:23 +0000
Message-Id: <20211022113128.102304-1-vladimir.lypak@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Only GPU that has larger SMMU region size (0x8000 dwords) is A530.
All other GPUs have 0x4000 SMMU region. However those GPUs work
correctly with larger range protected because there is no known
registers after SMMU region.
This patch needs to be backported to stable releases because A540 GPU
was forgotten to get its branch (that would set up protected region of
0x4000 dwords).

Fixes: b5f103ab98c7 ("drm/msm: gpu: Add A5XX target support")
Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 5e2750eb3810..ecf6318a247f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -851,11 +851,8 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	/* UCHE */
 	gpu_write(gpu, REG_A5XX_CP_PROTECT(16), ADRENO_PROTECT_RW(0xE80, 16));
 
-	if (adreno_is_a508(adreno_gpu) || adreno_is_a509(adreno_gpu) ||
-	    adreno_is_a510(adreno_gpu) || adreno_is_a512(adreno_gpu) ||
-	    adreno_is_a530(adreno_gpu))
-		gpu_write(gpu, REG_A5XX_CP_PROTECT(17),
-			ADRENO_PROTECT_RW(0x10000, 0x8000));
+	/* SMMU */
+	gpu_write(gpu, REG_A5XX_CP_PROTECT(17), ADRENO_PROTECT_RW(0x10000, 0x8000));
 
 	gpu_write(gpu, REG_A5XX_RBBM_SECVID_TSB_CNTL, 0);
 	/*
-- 
2.33.0

