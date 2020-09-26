Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76EC827991B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Sep 2020 14:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729574AbgIZMwO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 08:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729448AbgIZMwD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 08:52:03 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D7B5C0613CE;
        Sat, 26 Sep 2020 05:52:02 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id k15so6806555wrn.10;
        Sat, 26 Sep 2020 05:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=foqK6d6PeFS41hCQFnmZHZLvMNZeja8GwkTNzpenNPE=;
        b=HZ5zxkP2mVnrLayUJOr3gUjOa49srhi8RntJAa++LZmdX4rp3uW0qGuZBgLxsOBB14
         qOJ8QQqciOxgx6cjavko9c0jfKNfSyAKC02HUBiwGszIzhTG9jf8O7Vmq7uTm/acLfPo
         6G1n9WMFR0r/PxgAYrmlQZDp0lcqDTq4Q0D+2Vjg3GghubLw2PPsl8x9qOYkab1LTl7h
         4k4YlEGyVYrCFXpDvdQ05hGKmVqqeJhaj6i0YS1a9vLC3aD40D7/1+V2wDmJ90K7GPw0
         W23gaq6402ta5qnpbhx4eISlTXdHEOleAHtnPofynlrq/zr0fuGyx5liHS7gm1f1t9Va
         9YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=foqK6d6PeFS41hCQFnmZHZLvMNZeja8GwkTNzpenNPE=;
        b=Eow24aJ9OLfdLKG+y7w2GEG7KqSvDYfhZWPN4bCZOpMFaeSAGlgGgoXpgq8iGcFIOJ
         DaJBfmTU3XzJG3MMhu0o63YfDFA57MhxwOiU4PnA1S/rw3sN0AKes6de3vxV1ZeHwKzC
         a5Ak9J3UmNys6xSAS7WBvHcx7V05cpI+1VNegUfFAHFW6Vf0iY8ozVHKxHv9lMYjOebQ
         Zjj/gIaWLe7WLEJTWWtCu6Zod0rLFZM6Hvu2XREhkbuz0lLb/dqMnkXrsU2PSP1RIFI4
         eiNROPj6fl91wgxPuv+sDK7FrQSPwWpogeAVe4YCfF0YX+Ij14mv+qATC57tsfpfQXMY
         MsqA==
X-Gm-Message-State: AOAM532rr0xchNHNvfnEjGF8jonpb//K3iMPnwpc75p1A2a3X9vFwOLe
        D7AT4zKQ9pOVv2eUQNowHyk=
X-Google-Smtp-Source: ABdhPJzj57ykvAkR8sPQK4WXT9fZ19k0L75upjkVIzxAPQQFacUyUnq9zlGMYnqhP+HWrKhHLLJlLw==
X-Received: by 2002:adf:cd05:: with SMTP id w5mr9428546wrm.62.1601124721243;
        Sat, 26 Sep 2020 05:52:01 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
        by smtp.gmail.com with ESMTPSA id a10sm2520451wmj.38.2020.09.26.05.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 05:52:00 -0700 (PDT)
From:   kholk11@gmail.com
To:     robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        jcrouse@codeaurora.org, konradybcio@gmail.com, kholk11@gmail.com,
        marijns95@gmail.com, martin.botka1@gmail.com,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] drm/msm/a5xx: Disable UCHE global filter
Date:   Sat, 26 Sep 2020 14:51:46 +0200
Message-Id: <20200926125146.12859-8-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200926125146.12859-1-kholk11@gmail.com>
References: <20200926125146.12859-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konradybcio@gmail.com>

Port over the command from downstream to prevent undefined
behaviour.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index bdc852e7d979..71cd8a3a6bf1 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -722,6 +722,9 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	    adreno_is_a512(adreno_gpu))
 		gpu_rmw(gpu, REG_A5XX_RB_DBG_ECO_CNTL, 0, (1 << 9));
 
+	/* Disable UCHE global filter as SP can invalidate/flush independently */
+	gpu_write(gpu, 0x00000E81, BIT(29));
+
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
-- 
2.28.0

