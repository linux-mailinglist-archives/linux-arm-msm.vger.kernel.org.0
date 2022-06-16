Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7B8554DC8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358827AbiFPILN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359639AbiFPILL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 04:11:11 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F35415D674
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id y29so665676ljd.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zG8AgCbvolywbm1HYRUBI+oIpM7+L6T+cPP5dNMB4hc=;
        b=ca6QfihE4eXibLWPlq9uDaBNu8Lus7TF7PcqKKlxmUxrlPHFpGoWXijBUQRMRlhTX8
         e0X+gG92wtF8ysvIkRHPCh5yv8qap9G/IrVJJqP+wQ9mbLf2cUkBG79X9lDHVgGa0jIt
         waioQ9FGfOBAZ88GWJdTbSaIVrotrn9Ygnj+dd5SdpDZwyfsi4Yflgo8D2wHE5WU44CJ
         SMwqC+BNm/PFb2E1LM9Xpy22Cis3afW4s3COpHueg/TCif3oXoi0q22s3Am4iZd+04Dc
         AvT98DY0OM2hU755yPuiy1+xbvYxa39Ke214V2HiteyvMVqcXViH0yIn7vZhMOIW3gDd
         Xa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zG8AgCbvolywbm1HYRUBI+oIpM7+L6T+cPP5dNMB4hc=;
        b=4heYUXPM3MbWXW8yai7oFQ/iwyafTMf+ZMpeY7Z0JGi4JWe8d1yiF3ORAsG5whlW+j
         y/VudsATod3zmn9nxeD5YWxmyLbPJj66yR8PMCxM6K87pW4AWHVy7DCPWXT+srpZKTnO
         2jVFSWcOBzgAk9hwX4GQRdtgRPGSB+WAKs2W9uSqWbymQL0eBd4ls5Nv02AXwuls/g1N
         Hprexl2GoLQPH2J3NJPJvZ/d+jOU5/SvWB/koz4AIrbHnblNTeaUtbR9uHBpKHxXhJIa
         9w91YswTmn1s30sAVm1BijB+8/iUc+y5Gsu1rLdWa42ZP9M5OUrrel8uG+7+fGPfRQ3+
         r43Q==
X-Gm-Message-State: AJIora8JpJo+2ZFMe3i0dZi8rWRc5u4qIaP3e59X4AwApSvzNdrM5649
        sHzI0RB+RMsA0vxBo43ECyX8ZQ==
X-Google-Smtp-Source: AGRyM1uk/XeBo42spcjRTwN/mEek1/KIQ+zmRK6eOpObHUWjWIAB1rcdMXexy2X50jufv0VtCnjFbA==
X-Received: by 2002:a05:651c:1784:b0:259:eb76:b268 with SMTP id bn4-20020a05651c178400b00259eb76b268mr1933654ljb.75.1655367069258;
        Thu, 16 Jun 2022 01:11:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 01:11:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
Date:   Thu, 16 Jun 2022 11:11:02 +0300
Message-Id: <20220616081106.350262-2-dmitry.baryshkov@linaro.org>
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

Follow the lead of MDP5 driver and check both DPU and MDSS devices for
the IOMMU specifiers.

Historically DPU devices had IOMMU specified in the MDSS device tree
node, but as some of MDP5 devices are being converted to the supported
by the DPU driver, the driver should adapt and check both devices.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e23e2552e802..e8bc6d5f6ac1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1002,14 +1002,22 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
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

