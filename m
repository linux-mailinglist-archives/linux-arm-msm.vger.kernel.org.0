Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EBD279918
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:52:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729480AbgIZMwD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZMv7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:51:59 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87246C0613D4;
        Sat, 26 Sep 2020 05:51:59 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id s12so6820224wrw.11;
        Sat, 26 Sep 2020 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bfU07Sm/xnGk1ZoqGi3z7IAKufG/nzCUlkWJYq8AY8E=;
        b=IzmQm6XbCQ69LpzKcQnuxob4HVKpjYiqdfqLjsIaRcZAMmkQkIn3BvISKHfk/iCC1r
         PyFNQ0ZGQyqBQECOlSP5Ii8Xye9vAp/tVeTZeipry5JoAOouu63UUipFnmQg5ainNyxn
         K04MVpXax6XxOTW4is5uLY0V2K9p6IYvput9Q3hRaPAobWrVVniKCJLbpyikrbWS6E1D
         UnlVEZ3byGqm2bmkH0rV2qag+phoVusP6M3RMiZRany0Q37pdfrhTbROzMBh38hv9isU
         Mg1gZ2AqiXBNIqsq497nzXSU6PRuXTQv8Tb2iDtwQ50+5gkXLaZmmCqSp3LmL6kFR5SQ
         zLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bfU07Sm/xnGk1ZoqGi3z7IAKufG/nzCUlkWJYq8AY8E=;
        b=uaDGW6fxZbGFvvcfQCwYRuK9M23vpdz4vt20Y3f+c/b7WCu9wbQKB9GsNLf9Fy62z1
         AljPHzRLYY48/jeGVcGVXrSjqka1oEEuDjoEz+RtBJt1S8sFaqIfeNGYJNkI6EKDDdI0
         5dIIMgo90+ywGAsFy4M8ML5KHJOcyrZ8kVo2VacvuUKObD7n2JObhI30ypLwwEb55XRW
         QiQpKUuNPqVxxaCde6uJl6FFJ5/fNriE7sxTpIb4rvVPuA2dHU2xaCUoZWu43oNxAgsD
         MqYbUYo+t/Liq/6FT9AdHm4Eliq3X1tjd8W91qzGY15eCXge8X+ogQ9EbrV80Owbfx5z
         iIuA==
X-Gm-Message-State: AOAM532JNDdPHRELJkUA14vpFmE3KcouMTft2RdgZO7JuxlwCLgVJ4/b
        ZvPkUG3kGKuWbYHXswnDROM=
X-Google-Smtp-Source: ABdhPJymVrWyxKk8FPpBnafiDwxaLvCuGCbsK3Nt3czYF4XZeLZxOK6gm8PUJoJ+LrliQnqQ2ZLqCw==
X-Received: by 2002:adf:b306:: with SMTP id j6mr9029874wrd.279.1601124718190;
        Sat, 26 Sep 2020 05:51:58 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:51:57 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] drm/msm/a5xx: Reset VBIF before PC only on A510 and A530
Date:   Sat, 26 Sep 2020 14:51:43 +0200
Message-Id: <20200926125146.12859-5-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

Resetting the VBIF before power collapse is done to avoid getting
bogus FIFO entries during the suspend sequence or subsequent resume,
but this is doable only on Adreno 510 and Adreno 530, as the other
units will tendentially lock up.
Especially on Adreno 508, the GPU will show lockups and very bad
slownesses after processing the first frame.

Avoiding to execute the RBBM SW Reset before suspend will stop the
lockup issue from happening on at least Adreno 508/509/512.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 9bcbf6cd5a28..00df5de3c8e3 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1306,10 +1306,12 @@ static int a5xx_pm_suspend(struct msm_gpu *gpu)
 
 	/*
 	 * Reset the VBIF before power collapse to avoid issue with FIFO
-	 * entries
+	 * entries on Adreno A510 and A530 (the others will tend to lock up)
 	 */
-	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
-	gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
+	if (adreno_is_a510(adreno_gpu) || adreno_is_a530(adreno_gpu)) {
+		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x003C0000);
+		gpu_write(gpu, REG_A5XX_RBBM_BLOCK_SW_RESET_CMD, 0x00000000);
+	}
 
 	return msm_gpu_pm_suspend(gpu);
 }
-- 
2.28.0

