Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBE61B0DCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 16:04:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgDTOEF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 10:04:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729405AbgDTOED (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 10:04:03 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FEBAC061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:04:03 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id l60so8448776qtd.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eW6T1wQC7jFy/lW3/sPzizGiLZZu/K+yKI7oSfRVfR4=;
        b=Z666IGajMXYRRwkHoXM1JRZxVO4XDY1ykrsRr2qEOOJavpPTpIJZhgCer2Aoee0EwA
         UdHcHFGyuTfs/KODgOFLxX07AE88WHPM6IrBe/skj1fsAJolUHIRx4oFckeUKb7XkdWT
         TtZpCo9IkcZRZzjReBIUD3hFNGw1mfjsETIuBVfbrWmLp+mPEWH/kJGrj3rQSfXFKzDj
         oHhpYfA1qTqUilsT+KzXX0Vid4dM+Pu4uQis2BpBzdp+vk4Y7Yf404/tuWuaEYLiYamK
         QwN1Tnin0aezydvwZ69gfmwStRMowsmLixqJmpvJANIbIj5DswQujVMh81POtEhy2sOk
         zZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eW6T1wQC7jFy/lW3/sPzizGiLZZu/K+yKI7oSfRVfR4=;
        b=ILoZteezSCoOX3Dv42dM3lqUuu3H0oV+zqnJHeD+fRG7rMu289VYuwPRBdJLNdwCu7
         87K8FkjM/9yGSxUhuEfff7ARtuOhanVeHS1dZRluhcpvweuLghvd5IRymlm07kLCZ+ou
         8DQmkADaeyI7CSyrZv5BHEhpMOdsdcXIbD1i8zDIvBiz1syZkeQ3i8FS7nzMp/eeICY/
         R7X6M/laXr3+rmI46IH/hH2vw0F1J6bAyfhUIMmnRC0hlvviHpdXc+1DHNbTeyteIogq
         P0em2NLuerrYzZ+rCYLyKZpEpdYu9pZro3wVn3rBJIxDf+LCUfTdiSt4K91fXo4N1RVB
         lCtQ==
X-Gm-Message-State: AGi0PuZ1BYxLlS+kIeScMJTm0/X4MD2wT/9MvSR/P0yhiuMBU07gN18K
        vD3+2Unn1JSL9JbI6v3xsYSlZg==
X-Google-Smtp-Source: APiQypLJlfTA0EEOcTyxsbG8dZpAA7Or75F4BrxU0/Gdcf5iKcvhGZOpowt/67eQ2sV42bZ7V2Vk0A==
X-Received: by 2002:ac8:73d3:: with SMTP id v19mr16321592qtp.263.1587391442783;
        Mon, 20 Apr 2020 07:04:02 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id t75sm609424qke.127.2020.04.20.07.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 07:04:01 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 7/9] drm/msm/a6xx: gmu_pdc register values for A640 and A650
Date:   Mon, 20 Apr 2020 10:03:11 -0400
Message-Id: <20200420140313.7263-8-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420140313.7263-1-jonathan@marek.ca>
References: <20200420140313.7263-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 3e51939eb867..b583bf6e293b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -469,10 +469,18 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
 	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
+	uint32_t pdc_address_offset;
 
 	if (!pdcptr || !seqptr)
 		goto err;
 
+	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
+		pdc_address_offset = 0x30090;
+	else if (adreno_is_a650(adreno_gpu))
+		pdc_address_offset = 0x300a0;
+	else
+		pdc_address_offset = 0x30080;
+
 	/* Disable SDE clock gating */
 	gmu_write_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
 
@@ -523,10 +531,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 4, 0x0);
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_MSGID + 8, 0x10108);
-	if (adreno_is_a618(adreno_gpu))
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30090);
-	else
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, 0x30080);
+	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_ADDR + 8, pdc_address_offset);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS1_CMD0_DATA + 8, 0x0);
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD_ENABLE_BANK, 7);
@@ -538,17 +543,12 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 4, 0x10108);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 4, 0x30000);
-	if (adreno_is_a618(adreno_gpu))
+	if (adreno_is_a618(adreno_gpu) || adreno_is_a650(adreno_gpu))
 		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x2);
 	else
 		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 4, 0x3);
-
-
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_MSGID + 8, 0x10108);
-	if (adreno_is_a618(adreno_gpu))
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, 0x30090);
-	else
-		pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, 0x30080);
+	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_ADDR + 8, pdc_address_offset);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 8, 0x3);
 
 	/* Setup GPU PDC */
-- 
2.26.1

