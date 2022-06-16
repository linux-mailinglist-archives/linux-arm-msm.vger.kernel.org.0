Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA8454DC8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358831AbiFPILP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359649AbiFPILO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 04:11:14 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E05E05D67B
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:11:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id t25so1049715lfg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aLVnUM+AqDl4tXNkj90J627+4z77zCYSsGSFtgLCsrQ=;
        b=tU8wJlzCAB9KAxWRVZYppXhrZRGt+jzRnYQpAl3BNoGOATcHnBQOY2/mAx7GckMCXS
         RkjnetmGIHJVl2jxHUro0vUn7AEEA3xVBvRmek1RQHm0hHtrZ1GOuu7o6FSF/imylrQY
         Az2JAiqCJiXFaGiSvOCKHN2tF0c6+4BrCxksbob0Z1+aK2LEXupPTHS48M0ZMsBydXfL
         jlOO0xNTAFpj2B4t+Z5hRJo8aL/f7ghIwVt+uv5p0GZ8dzqhOczWi8TTMXaJ7V9OpJQM
         74r3SVO6LkxA+81nb0BQ6q6HxdX3YQ6HFhXkW/H6F8MTdJnL5978M3YsVbSSBomjWDtJ
         eBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aLVnUM+AqDl4tXNkj90J627+4z77zCYSsGSFtgLCsrQ=;
        b=b/h0EXFIQzYARWnISyehcbPBCwRW3qmv28hecFviqErwwAbn4QJybbNFLb79ooO6Er
         UWmJvMcd302ncO8VTtitmMkR8BfgpX4E/gXHy2fzHh4mhrmX0C5Y3LLaoZwF9lOWlb0y
         oaNgZs1FLETFzu4TRM0IvAA7ljf2CO9xhXVRvPAG8YdnW6R8L5R/kQPFKn0Lkfihxd2C
         HJ1xJIV7bcovevUDDlrChfpVEQ70HKKXM+oVM4XpK9L6GSaPRd5locmaj2Gf37rtXzyG
         NX6BK2VfMxZzS2CGaazwH+8Jn+2BpJ1n8pjLUGDMMRo0Yi8s9kerVx8MgxtmoFMD1t8R
         16IQ==
X-Gm-Message-State: AJIora/R1vzAaKiI8VLWW8GwZMl4Vxojq7gRzJVOYCLi+u2yNuRYmv16
        2Zs4mtQw7LIa2SglsEMnGvGbIQ==
X-Google-Smtp-Source: AGRyM1v5s3DiaabHbHg4BhCVByW26chL0Mvy/RL3fwSwKimfMRFRtdA8vLdVpzN7Qirit67Tf5ZxXA==
X-Received: by 2002:a05:6512:1399:b0:448:9f0b:bf4f with SMTP id p25-20020a056512139900b004489f0bbf4fmr1959636lfa.67.1655367071239;
        Thu, 16 Jun 2022 01:11:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
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
Subject: [PATCH v3 3/5] drm/msm: Stop using iommu_present()
Date:   Thu, 16 Jun 2022 11:11:04 +0300
Message-Id: <20220616081106.350262-4-dmitry.baryshkov@linaro.org>
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

Even if some IOMMU has registered itself on the platform "bus", that
doesn't necessarily mean it provides translation for the device we
care about. Replace iommu_present() with a more appropriate check.

On Qualcomm platforms the IOMMU can be specified either for the MDP/DPU
device or for its parent MDSS device depending on the actual platform.
Check both of them, since that is how both DPU and MDP5 drivers work.

Co-developed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 44485363f37a..c781307464a0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -271,8 +271,14 @@ bool msm_use_mmu(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 
-	/* a2xx comes with its own MMU */
-	return priv->is_a2xx || iommu_present(&platform_bus_type);
+	/*
+	 * a2xx comes with its own MMU
+	 * On other platforms IOMMU can be declared specified either for the
+	 * MDP/DPU device or for its parent, MDSS device.
+	 */
+	return priv->is_a2xx ||
+		device_iommu_mapped(dev->dev) ||
+		device_iommu_mapped(dev->dev->parent);
 }
 
 static int msm_init_vram(struct drm_device *dev)
-- 
2.35.1

