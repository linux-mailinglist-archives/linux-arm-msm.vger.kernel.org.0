Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E25B251B481
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 02:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbiEEATv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 20:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiEEATt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 20:19:49 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C494C410
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 17:16:08 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h29so4988844lfj.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 17:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c6BZ7IebefRthM/nq1GeRPMj1Jfg2tTeYdhhJgi+YZc=;
        b=cpM1sATn9RUViJ1Bic7cx1LRL5UPGi6fxqpEieurV0Bsb5T/fFkJpcbQ+ePtVEBZKb
         akl4IUYvuuDmGtdEsD+IAuGIUUXtird5hqRDZ6BacP8sCRacTOri8m0KOzicuPOdK10k
         k2DKqA54+95QRLCaOrjwNEi58WMiRjOkSjb9Oe4ywfJ3UuVrY9vEQg/VLbqGi9mFXoDx
         xjGVqMX4WF1Ale+soM4Xt1pPsjlVDLCATB9g8VwNJF0AaBYnRsqmt1lJmR236qv5Z43X
         gxyVi9xyFoDLtAiTDG3tmfEoIi49vs0dyAu/mPx16FD10APgnyV4ohM1/sP92tiFJ5Rj
         eviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c6BZ7IebefRthM/nq1GeRPMj1Jfg2tTeYdhhJgi+YZc=;
        b=EcywWZIgELhit4Rv/R1BBYvArDZ6o28/kwVlIlSBpLi08hOYoXNrW4Xr/Bj98nbNpx
         LGaOZZku1s9pp0qeE1lfdKBy3kZZCaHWvVfPjtNiY/k9ps7DtvLdU7HzuKmYBiiuOJ2i
         MAv0G+XmdTSdoO8AbzXg2UepIORaTWRmPPKfPRwsEB1AALuINhbfm18IIKH9ggdfnu5X
         9J35PwLkMG23OGnKsBiVPpH8M4R2ABOE10OF11rm2KDJJiV4l/qyyon0N3GMjMkDGC6d
         hMgpkHtVZhe/e062HJiGN4/7at0NzAtxf30RWczMZFaKTLcI322B89B+Dbb0KRWfINWx
         yCEg==
X-Gm-Message-State: AOAM530bPmblNkkDuOJ0GvZe0Q3oP/E4+ZAkAZvDUbaX3D7LC5bF7dPv
        hA6ZM7lEYSZSeFY0zR1vdgj26A==
X-Google-Smtp-Source: ABdhPJxYtgU3N55D/VVUNnbpsOw/zycbxS6tYCG4Ppx3nvIcbx7NYbNwi0Hmse3nHEeZJ472gaFN/A==
X-Received: by 2002:ac2:544a:0:b0:471:f568:59d6 with SMTP id d10-20020ac2544a000000b00471f56859d6mr16053392lfn.492.1651709767179;
        Wed, 04 May 2022 17:16:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 17:16:06 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 1/5] drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
Date:   Thu,  5 May 2022 03:16:01 +0300
Message-Id: <20220505001605.1268483-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
References: <20220505001605.1268483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the lead of MDP5 driver and check both DPU and MDSS devices for
the IOMMU specifiers.

Historically DPU devices had IOMMU specified in the MDSS device tree
node, but as some of MDP5 devices are being converted to the supported
by the DPU driver, the driver should adapt and check both devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 143d6643be53..5ccda0766f6c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1004,14 +1004,22 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	struct msm_mmu *mmu;
 	struct device *dpu_dev = dpu_kms->dev->dev;
 	struct device *mdss_dev = dpu_dev->parent;
+	struct device *iommu_dev;
 
 	domain = iommu_domain_alloc(&platform_bus_type);
 	if (!domain)
 		return 0;
 
-	/* IOMMUs are a part of MDSS device tree binding, not the
-	 * MDP/DPU device. */
-	mmu = msm_iommu_new(mdss_dev, domain);
+	/*
+	 * IOMMUs can be a part of MDSS device tree binding, or the
+	 * MDP/DPU device.
+	 */
+	if (dev_iommu_fwspec_get(dpu_dev))
+		iommu_dev = dpu_dev;
+	else
+		iommu_dev = mdss_dev;
+
+	mmu = msm_iommu_new(iommu_dev, domain);
 	if (IS_ERR(mmu)) {
 		iommu_domain_free(domain);
 		return PTR_ERR(mmu);
-- 
2.35.1

