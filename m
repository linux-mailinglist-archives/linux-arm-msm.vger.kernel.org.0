Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9242D51B486
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 02:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbiEEATy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 20:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230124AbiEEATt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 20:19:49 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721764C419
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 17:16:11 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id m23so3667417ljb.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 17:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6EjkUPVslus6qGEdB9sA7jTUgeDFXhmLH2OeN7g9eO0=;
        b=BlLJ1Yg1CIAe5h/Tk3TduQWbRsRs3yZauWvhUdTLDAZRka6boVnJ9unKiGGCTUoNs3
         pmJujN9OuTCbEK19fqaUkQN+21CGPfQXp7nxpPeZm7uzb3/EbSrXu9f+eLtf6/2oplUD
         WnCxAE2NMcg2mPkKWnZnsejgk/Po99ZZlDoLJIl7u/lBOlCEXDDeIp9peXsNY2RQxs+u
         CnwJbkJefrDa2dEwBUlCM+UkGMcmZYaVGyEH4HybbwpSVi0Z0413LqMvTA41KwGOudPN
         Rrl3OcN2BU77kl+epcHu4zDao9IiDKdOv2sQh8TFo2iYcn7pS1wWyrlCaFI194/Dfluv
         +m6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6EjkUPVslus6qGEdB9sA7jTUgeDFXhmLH2OeN7g9eO0=;
        b=OY2U5WE20VGeMt7u0Lmeo8BnxcsFMscir7loFdg7/hBl6J/Mmu6+6FgL6KPojVjwjD
         LScuJ1nS6mTXz7mXE517LzLP81dbkz9RB0AfpAqLNfe6XMvH9VaRL3nkiGuloLMJLqJI
         j+CIVi20CIHUOC0sBFdaw697HfDXPxma/FwcGav5nV+97uuppjPl4XhU8HaFCja7fwbU
         eoe+yQHFxTWPgxXNxc4bFFg0TnVlaeu08RKgYALwa9wqmCom/OTvi87O6C9EPidyaaWu
         B94Tv0DTlAxq7K1ZNJ8TMpWAHSQ5KBsGBN3y3xRZOCBSlJ5l4xS1NdxnurWBewCjG4Zj
         VJ2Q==
X-Gm-Message-State: AOAM533gzfJCa1+2/Fae1ot1/mgbqKl93wjiqLDSMHBXMEZKUcaws4B6
        law55vrQyUMyqqQN4Xw8s2iMLg==
X-Google-Smtp-Source: ABdhPJyh8OD7KGQfcQZzVkzSGxGd98y2S1JgZPJU61HP26pjj+oMq1kTA5wqYw1xsinrnXlX+0bZ0g==
X-Received: by 2002:a2e:a448:0:b0:24c:8fe8:f3c6 with SMTP id v8-20020a2ea448000000b0024c8fe8f3c6mr14229380ljn.115.1651709769836;
        Wed, 04 May 2022 17:16:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 17:16:09 -0700 (PDT)
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
Subject: [PATCH v2 5/5] drm/msm: switch msm_kms_init_aspace() to use device_iommu_mapped()
Date:   Thu,  5 May 2022 03:16:05 +0300
Message-Id: <20220505001605.1268483-6-dmitry.baryshkov@linaro.org>
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

Change msm_kms_init_aspace() to use generic function
device_iommu_mapped() instead of the fwnode-specific interface
dev_iommu_fwspec_get(). While we are at it, stop referencing
platform_bus_type directly and use the bus of the IOMMU device.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 98ae0036ab57..2fc3f820cd59 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -272,21 +272,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
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

