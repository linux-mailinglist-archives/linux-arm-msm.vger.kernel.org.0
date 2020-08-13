Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E48E243F01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 20:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726334AbgHMSoa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 14:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgHMSo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 14:44:28 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F51C061757
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 11:44:26 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id k18so5126521qtm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2020 11:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i08DjFarJSioJFF+3BzXlzJrV3znYAwGrEz9J75FiX4=;
        b=Zey1i9YKtQygbzUDBlnW/AKCXPLBGNuzu5QshFKXWVoQGiehGBZWCktZt7P3kmrpyp
         etLXXJqJYrSLasI6L4DL57cfA+jq+WuaWJ/dPEgm2kOqm3bplNfFZIpdLzM7qO2fNPq7
         SI5LUPLrMuHlHu1uf/aInNBO05dHYBMtKk/hlVAFeX3t786TTYiuZEzAx4LXnEkK7I0e
         1p8k2gLsGsdxA6VIzuicHGDlI6A8b4Epw4DAlh/QfTuf/VfScE0xJyabJHg11CBxZeHE
         H0gbHy7e4Q3PbTQZ4meSA/pFmvsFfvHNyNKZ3BFuZp2OZnw9nKiJwvbWyHbdD+hYFFnb
         6FpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=i08DjFarJSioJFF+3BzXlzJrV3znYAwGrEz9J75FiX4=;
        b=BSjNIkJK93FwS/uBx2I1XbpMWO4uyHvgnfXQ/4fQLckVCQJtMBxUAVlwX4D6O8ed2k
         g+pegTl4OFagjnZq1pzvefKeEK47KxlztXUtRGhtjkjPVFPPqPE29W/Zd/9s+mBz9zXr
         0yiB6F0XUA3/B0RHGeYRv0oK4PXYCw6oFxG3Z0LzHsOe4zQvxLOe/9CHtaVUoGFPo3tY
         iBTNi1GXDMWeitAHnXhmlUvZUY8aUxYJEscuod0rQbTPOiDUFG+VmBAneharaanEH0Nz
         e17DqtscbbkyQBqYqeTHb2u24mKuIMd9CVltn4M/pzrAHnGCI1QNeWchg+z3Bc1eUFp/
         ky6g==
X-Gm-Message-State: AOAM530bjpsRKlQuas0uGXQVSAupluEdDedRiNQWpwl9J/74F+U8ORsU
        q2+VL1hE/L8MNpr5oGLa/CuN/w==
X-Google-Smtp-Source: ABdhPJyZpBHtFpCwUCN1Y5bRe8UUWA5ZmNxEvgqLYBigYpnTpeGmXkwoWEtaaNHcAVUMDbL7wZ6m1A==
X-Received: by 2002:aed:2946:: with SMTP id s64mr6816571qtd.204.1597344266044;
        Thu, 13 Aug 2020 11:44:26 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id k5sm6415227qke.18.2020.08.13.11.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 11:44:25 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/a6xx: fix frequency not always being restored on GMU resume
Date:   Thu, 13 Aug 2020 14:44:18 -0400
Message-Id: <20200813184420.18448-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch reorganizing the set_freq function made it so the gmu resume
doesn't always set the frequency, because a6xx_gmu_set_freq() exits early
when the frequency hasn't been changed. Note this always happens when
resuming GMU after recovering from a hang.

Use a simple workaround to prevent this from happening.

Fixes: 1f60d11423db ("drm: msm: a6xx: send opp instead of a frequency")
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index b67b38c8fadf..bbbd00020f92 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -845,6 +845,7 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	if (IS_ERR_OR_NULL(gpu_opp))
 		return;
 
+	gmu->freq = 0; /* so a6xx_gmu_set_freq() doesn't exit early */
 	a6xx_gmu_set_freq(gpu, gpu_opp);
 	dev_pm_opp_put(gpu_opp);
 }
-- 
2.26.1

