Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E63C506D24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Apr 2022 15:09:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351597AbiDSNHI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Apr 2022 09:07:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351021AbiDSNHH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Apr 2022 09:07:07 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF42377F3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 06:04:25 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id r18so20476476ljp.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Apr 2022 06:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=51y0snB2GUgkqHni5/VdYz/z1Uks4JZTasXp07lWCwc=;
        b=krgPmScwiYNT2fnOQoG+U/F5ZqZHDi1ZExMVupJiEUYyWrTMOMLk95Idi1CaQ+m8Vl
         Cq6zd8hZJK+ilNjf5+y7WNiaJL5G7dHbxn8eWRnmOi9VLfDEWvTeb28BPd+x5sOHtkqt
         MxksRdXGrrcsZd1ZJ0l23jw0M0uFjB09G2SSTdYA7OvnviTy3Gybljymww0kwr/gM4WT
         BP5VccwpA9oB3qzvRuia5DxEz6Ca4GMKJRU1voaGuaI91fK/xXYW72MaYXnbJTzlOI18
         UznWHujLlK+5f4Gw5g3xV9gbIWiVCucOyEGIATMJ0ofhcvgAeXsS/yfxFcJ8SsgCWnP5
         OjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=51y0snB2GUgkqHni5/VdYz/z1Uks4JZTasXp07lWCwc=;
        b=XsHUghtuhwwgDdxrwRDF9bnv1w/2NBzYnOcLnbiVEpVJwK/kuF0to0mjwJbehONoHq
         LaUbYudxc7s3PUNsg/fiNrkSQiLWEY3XBmNPr8LNLbqGxtOxN8opCsMbk/yTOc/bkRVB
         H6JP1nY2AVFjfp4FeUyR7XTAAeE3vD8cvTfxx07KpZjRT011HXPMKa9kJ44NvXyzdP30
         57WqMxXe42akjQdporWXK2QyJHtLG/NToDMJYazDI3vHKWmfpWHpHz/dMoAuBGjep7vj
         M1hH0Ke9uhm04wc9BJw7rg7jpC8ln2a46b7LOQ6n38krkbHCIkL7mCHUs5zYiswzLe2/
         P7kg==
X-Gm-Message-State: AOAM532nJVHSO5Ir48rRjV5Ouykpr4azIt2FMXC6+Q/5TF8NRUwkuqxS
        YNSMoo76xmxSHoC1Dr/O1AcwPg==
X-Google-Smtp-Source: ABdhPJxvXRNA7D4IGqYmR84etmLXxAFjgH3awFAVSeFJZs7nF3oksNfIfkvKk0MYPRquOpK9ov50xw==
X-Received: by 2002:a05:651c:103a:b0:24d:b8b1:b333 with SMTP id w26-20020a05651c103a00b0024db8b1b333mr6957160ljm.460.1650373463640;
        Tue, 19 Apr 2022 06:04:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h28-20020a056512055c00b0046bb80943a9sm1508810lfl.277.2022.04.19.06.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 06:04:23 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] drm/msm: Revert "drm/msm: Stop using iommu_present()"
Date:   Tue, 19 Apr 2022 16:04:22 +0300
Message-Id: <20220419130422.1033699-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

This reverts commit e2a88eabb02410267519b838fb9b79f5206769be. The commit
in question makes msm_use_mmu() check whether the DRM 'component master'
device is translated by the IOMMU. At this moment it is the 'mdss'
device.
However on platforms using the MDP5 driver (e.g. MSM8916/APQ8016,
MSM8996/APQ8096) it's the mdp5 device, which has the iommus property
(and thus is "translated by the IOMMU"). This results in these devices
being broken with the following lines in the dmesg.

[drm] Initialized msm 1.9.0 20130625 for 1a00000.mdss on minor 0
msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pm4.fw from new location
msm 1a00000.mdss: [drm:adreno_request_fw] loaded qcom/a300_pfp.fw from new location
msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
msm 1a00000.mdss: could not allocate stolen bo
msm 1a00000.mdss: [drm:get_pages] *ERROR* could not get pages: -28
msm 1a00000.mdss: [drm:msm_alloc_stolen_fb] *ERROR* failed to allocate buffer object
msm 1a00000.mdss: [drm:msm_fbdev_create] *ERROR* failed to allocate fb

Getting the mdp5 device pointer from this function is not that easy at
this moment. Thus this patch is reverted till the MDSS rework [1] lands.
It will make the mdp5/dpu1 device component master and the check will be
legit.

[1] https://patchwork.freedesktop.org/series/98525/

Fixes: e2a88eabb024 ("drm/msm: Stop using iommu_present()")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index b6702b0fafcb..e2b5307b2360 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -263,7 +263,7 @@ bool msm_use_mmu(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 
 	/* a2xx comes with its own MMU */
-	return priv->is_a2xx || device_iommu_mapped(dev->dev);
+	return priv->is_a2xx || iommu_present(&platform_bus_type);
 }
 
 static int msm_init_vram(struct drm_device *dev)
-- 
2.35.1

