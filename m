Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDCD439FDB3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 19:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232660AbhFHRcN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 13:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232818AbhFHRcN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 13:32:13 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5464BC061789
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 10:30:04 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id g12so11198639qvx.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5iTTcnEmTfembJ+1uyx3iDFNZSnQPXZr+n41PTIaxsQ=;
        b=Y5LC8khEOg/81kB3kO/4DnceDZQD2wJvbbOb9htCqVDvG79i3u9KzeMqg7EkaTlDLS
         jvT7n8SjbCBjHYms8Jnvo2N35gYpe1GtOP643LB6jnymFrRyxJqB8uzjNTlzhXfzaFwJ
         nanZGAJbBotCaO1/bfeDrhOzqj6OvopAVvPnKVKyb8eude8LltVOvJtYKb/5HfkNSzOo
         5XqjZ4+5TAwReTji5MPZbb9Z7srJVZ2eRYmyH0f52XLtFPXiEtdD0IACohYxE3jkbGq/
         TSessnNOyDT3ge8RZtNQYqLQWvW9svehN0LHF4Aeux5Y2eD40HXkWyQLvEm/wxwZLYRV
         Gyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5iTTcnEmTfembJ+1uyx3iDFNZSnQPXZr+n41PTIaxsQ=;
        b=nhhzkXq5FZcPr+kqPphW4ocFJ7RJFlZ52kOworhVQAnSYY93I3nK3zi/Cnrc/tOM35
         qVkgBCD62ANB/F63j7rMr7xbbpcnnFVltq/sYa74qRIlnh1MPFIuQ4YXBXH2LDpA+gby
         6GOgNdrrR8UGTZgAcOvtjR/FrrT9uuGUkSx1HxdQqDA0idMrdoN/Kh+BUxtHVflXep5y
         vE4XXI8Puz/00v/TDF8+z6Ua8OaIW9wqxoG3W1iZ2ZdWvcwC5jP9KMer8d1K2n11dSxI
         iELas4BhXeM52RJkuLE9zj4su2iErulsUBGhnqRSRJ/vNeAJJjb44FmbwvxiPztA1AMG
         8mhQ==
X-Gm-Message-State: AOAM533XCcoTjI7Ac+AqQmzafzHsGNkQPMAcsEW+1aJbMOeSxfAM1EHX
        pETLWLRFG8lD2I+S7yxDme+y8g==
X-Google-Smtp-Source: ABdhPJwlJ63UJzGcxuw+MAyhjOGHtzO+tePHYiAZkwXO7YJMIEUZLK8buNXDGwyy3AtTIDfZM19xnA==
X-Received: by 2002:a0c:e18d:: with SMTP id p13mr1229492qvl.16.1623173403538;
        Tue, 08 Jun 2021 10:30:03 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id d10sm9482983qke.47.2021.06.08.10.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:30:03 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/5] drm/msm/a6xx: use AOP-initialized PDC for a650
Date:   Tue,  8 Jun 2021 13:27:45 -0400
Message-Id: <20210608172808.11803-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608172808.11803-1-jonathan@marek.ca>
References: <20210608172808.11803-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SM8250 AOP firmware already sets up PDC registers for us, and it only needs
to be enabled. This path will be used for other newer GPUs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 3d55e153fa9c..c1ee02d6371d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -512,19 +512,26 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
-	void __iomem *seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
+	void __iomem *seqptr;
 	uint32_t pdc_address_offset;
+	bool pdc_in_aop = false;
 
-	if (!pdcptr || !seqptr)
+	if (!pdcptr)
 		goto err;
 
-	if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
+	if (adreno_is_a650(adreno_gpu))
+		pdc_in_aop = true;
+	else if (adreno_is_a618(adreno_gpu) || adreno_is_a640(adreno_gpu))
 		pdc_address_offset = 0x30090;
-	else if (adreno_is_a650(adreno_gpu))
-		pdc_address_offset = 0x300a0;
 	else
 		pdc_address_offset = 0x30080;
 
+	if (!pdc_in_aop) {
+		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
+		if (!seqptr)
+			goto err;
+	}
+
 	/* Disable SDE clock gating */
 	gmu_write_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0, BIT(24));
 
@@ -556,6 +563,9 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 		gmu_write_rscc(gmu, REG_A6XX_RSCC_SEQ_MEM_0_DRV0 + 4, 0x0020e8a8);
 	}
 
+	if (pdc_in_aop)
+		goto setup_pdc;
+
 	/* Load PDC sequencer uCode for power up and power down sequence */
 	pdc_write(seqptr, REG_A6XX_PDC_GPU_SEQ_MEM_0, 0xfebea1e1);
 	pdc_write(seqptr, REG_A6XX_PDC_GPU_SEQ_MEM_0 + 1, 0xa5a4a3a2);
@@ -596,6 +606,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_TCS3_CMD0_DATA + 8, 0x3);
 
 	/* Setup GPU PDC */
+setup_pdc:
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_SEQ_START_ADDR, 0);
 	pdc_write(pdcptr, REG_A6XX_PDC_GPU_ENABLE_PDC, 0x80000001);
 
-- 
2.26.1

