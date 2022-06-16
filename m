Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB5F54DC8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359639AbiFPILR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:11:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359647AbiFPILQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 04:11:16 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EA395D677
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:11:15 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id s6so1023360lfo.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R/TT3SVdPUhdUl9OHtlgB8o553M+9pau4/RhWjQqxiY=;
        b=qiUUeXk7cxeJ6BSkWCmvqUcL5iptuOVmiMiNiRZKtw5Hz95e1PgW30HPeEzKBmSp2N
         yn/JlnroKZUB1hurPbIHZ2KiRq9y5d6fRvjhwFnJVW9LaHoPDwBZ+iovqovQ1mTKn/F3
         mWkhRVsv7iwNQkPPL6yWbUb6eM4ANxlmeXCQqPH0RgFA3/5dFtRzzMg/QcS8QXEio8b3
         lErsozlByvmtzOkWxH2I/nYdD5+RrmEuHKvCIh5OgDNL/bFrjMVEYoZOzReon18Vv+Sg
         y0lHpPNQxz7uSujY6sHzU17mPP9NXOeVE1WVesrHoANP6SJEjuoerxeJ5Wx+kWq65WSk
         nkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R/TT3SVdPUhdUl9OHtlgB8o553M+9pau4/RhWjQqxiY=;
        b=mJW3k/4Mj0Q+NI1xBlFAVnsjVRvSGWkfggCPYEqDZSXlwQnL1l8kjEhkM8lN/OOiSS
         SxdEaSeklGVKJvwi326Gq7bwDTVzn5Anl/8fIEW4CNsy8KyeeLxmMNk6+AANjHvgs7Dg
         8F0sOxu5ENXm2y8UmMwMc8Re9ndo8j/zrtGo8nnLm1m1aNmCkoqy2KjkuGxVwcByqYjO
         /aEmj6eLPHHflJTFe9AUOL90Si4kGcLzRBCu8FAXwxE0+tozdFDGQr2cJE5FVzMylcUz
         wCBobytzFoWeWjkx05EFltP3h8DudfDd3IlyEMuEeIVdtHJFsg6J1QtA5CevTFIyYPS1
         dfwA==
X-Gm-Message-State: AJIora8S8ctZZozUKee997egOqLnUCXTcsY1jijeBOqMH2sosEU8noHR
        4bspIN18FubMTwcmQx+WIGdfZA==
X-Google-Smtp-Source: AGRyM1vms3xvojLkKGSylTCS0S+TI+LfzjHCSz2KHF17sM+nqnWa75t2amiGeUH7V5gOn+gmlrXcqA==
X-Received: by 2002:ac2:55a4:0:b0:47d:aab8:a67c with SMTP id y4-20020ac255a4000000b0047daab8a67cmr1920619lfg.301.1655367073851;
        Thu, 16 Jun 2022 01:11:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 01:11:12 -0700 (PDT)
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
Subject: [PATCH v3 5/5] drm/msm: switch msm_kms_init_aspace() to use device_iommu_mapped()
Date:   Thu, 16 Jun 2022 11:11:06 +0300
Message-Id: <20220616081106.350262-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
References: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
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

Change msm_kms_init_aspace() to use generic function
device_iommu_mapped() instead of the fwnode-specific interface
dev_iommu_fwspec_get(). While we are at it, stop referencing
platform_bus_type directly and use the bus of the IOMMU device.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 258632d5c411..8e18eca82bc6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -277,21 +277,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	struct device *mdss_dev = mdp_dev->parent;
 	struct device *iommu_dev;
 
-	domain = iommu_domain_alloc(&platform_bus_type);
-	if (!domain) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
-	}
-
 	/*
 	 * IOMMUs can be a part of MDSS device tree binding, or the
 	 * MDP/DPU device.
 	 */
-	if (dev_iommu_fwspec_get(mdp_dev))
+	if (device_iommu_mapped(mdp_dev))
 		iommu_dev = mdp_dev;
 	else
 		iommu_dev = mdss_dev;
 
+	domain = iommu_domain_alloc(iommu_dev->bus);
+	if (!domain) {
+		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
+		return NULL;
+	}
+
 	mmu = msm_iommu_new(iommu_dev, domain);
 	if (IS_ERR(mmu)) {
 		iommu_domain_free(domain);
-- 
2.35.1

