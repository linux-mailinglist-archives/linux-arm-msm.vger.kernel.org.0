Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42E8C279910
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbgIZMv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZMv4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:51:56 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5BFC0613CE;
        Sat, 26 Sep 2020 05:51:56 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id q9so1936264wmj.2;
        Sat, 26 Sep 2020 05:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WtnGFz89R34zMewLz4xKY9RsBgKhUDP7y7BnbgJVIuk=;
        b=RbjddDmEq2v1dCLPsdcA1GlQymeCxffB55PzVyb6bDVA+C7qnVykp3AfY4/uvWhfu8
         nHD4oQR1bMSE6FUzeckQnT+VzZT3tEO1w3q/RosnrURt3SDmrQdoN+v9VcBaIr/V8hUj
         BQCOVymTMNacNO+hdE5GKTGbJHSF1Ojz7Vxk94vPMe0TGUouJxYppjsQXDshMybVdYMt
         1AlZpH5tMmWt8P2vTZxkBEUx4xzaSAAErXSxehvwqi+6LxBrY483/gZYfei8MpKOOPxn
         Q9lHdfGf44okhdLfNWQznOZIykrsKn2s2hHvXfdbUZMa4CzzQjjljo8Sgl3ygzTYTNmT
         DfIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WtnGFz89R34zMewLz4xKY9RsBgKhUDP7y7BnbgJVIuk=;
        b=jkBvxk1oMjAyP9t35gyZNyoHx5ih/VDkbPpoKQTXoWYPIqaawsyiEPdBZmGqhEICFi
         onwz5gaqnch6+PR8RqH2r+Zn2918HwAK8xWopxoOYvx+FfMCb0hRRJEF0jNp0oldBnRn
         08x0yAro2az02MVWSnxZLwtf0LAdCZFoq2Co4RKX3vdhzyR1xuhwl5WsisG62riKWsdM
         9g7GlbBAojkU8ad359raJD93pvERnXIXUspRmPr0M2JRsFQL02vvYeuruOWy2r3NzSKr
         s63G/Tg/3aKfz7KPDy5L7WK3VNxQn/rY2icPMKgZlguEAiri6Ot6XF7q9DTn9GyjKmAx
         Hppg==
X-Gm-Message-State: AOAM533QUG65TQBGU5BP0fJxPSEkjF4e792unwMtZD6pp1TmLvuXS4k4
        Za5V+XNbE2x13e0xMB/vMQU=
X-Google-Smtp-Source: ABdhPJztqPYuaxUqhiJHnlgspPDWDKt+SSYEyAxLwzTILjR/AIFGICR1CkT656KMnZk6HY1AdKTS0g==
X-Received: by 2002:a1c:6254:: with SMTP id w81mr2444847wmb.94.1601124714991;
        Sat, 26 Sep 2020 05:51:54 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:51:54 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
Date:   Sat, 26 Sep 2020 14:51:40 +0200
Message-Id: <20200926125146.12859-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
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

