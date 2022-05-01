Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DE7516395
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 May 2022 12:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240778AbiEAKN6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 06:13:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243262AbiEAKNx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 06:13:53 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DADA13DCF
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 03:10:27 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x17so20935500lfa.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
        b=d1bvtS0N6dIqktEIIlNJ2QBhXBskRsIxYdnDTi+Gw/NPPipud0ttUypiQi8R58saKo
         C6ll9v/V66B/hYdcuXt1pVaBcszyIhQVkT9cL0xcibHBmXLBJM2I8XwhLqgZmAdW8lBG
         m/d8bcYuccTPhc6hDMOQO81EtBHiNAhm3ECQsdF47/Svv8q73Z2VOdoWgdyRqF2b7v2R
         HR09XTKEKRAZNvbo6RATSTuiEVeffmLQMasRekRTFwJ/V9qVpvlOHFKTmgEuiLW6jEet
         eWhDslj6rgJmnSj8L0KHYuWAULNrZACTERSr3XAZHtz9g8Jy9AP7brV9b06ferjUPpwm
         PW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
        b=0NgA9g53Io8+9coLc5J0nFEXv2hiuqV0KXRDhxjURm8nAZ9dbPQcqXOrVX3CWUsMrd
         32KuqBKXS514vvvgBDch66HsT48xrBTQzKl10lkhymY2SgviP5tM67AHwyLBcPqQ/mWq
         jFcpbLYl1f/FJoiZWtjyKKkynUVI/5m2yN6/wk8KYkHYR0uJW6dB25HkESqB7hgfl3hF
         6t9kQutJ+EDkHB3i0zmWuKrgUlBhgsUAoKbqyDKYG8aY3rdl/jSkLgnTTt2kZe+egUxC
         l3HhbqzqIzamKRzOnH+HxJZG5LiH7o5LCxeloImB9fpB+6+lsQvEYT7sWhbdn3LGMBZm
         lHZA==
X-Gm-Message-State: AOAM5330VlQ1rspzhmkKK7KF2wTAMmK6S/wtXa5ZkmJ3DQ+AnLxj2fM2
        QYkN5ZuKA6kR4N5xko9P9g5DMbRU0K22JQ==
X-Google-Smtp-Source: ABdhPJy+qSaB35tEuaZl8E2U/QytPoM+/Y5D8MZQVYBje/2lYI6+egHRI7TBm7Y965f4DOZEmRk0cQ==
X-Received: by 2002:a05:6512:3d13:b0:472:5d8d:5202 with SMTP id d19-20020a0565123d1300b004725d8d5202mr3298812lfv.331.1651399825737;
        Sun, 01 May 2022 03:10:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h7-20020a2ea487000000b0024f3d1dae7csm766412lji.4.2022.05.01.03.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 03:10:25 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/msm: Stop using iommu_present()
Date:   Sun,  1 May 2022 13:10:22 +0300
Message-Id: <20220501101022.3931295-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
References: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
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
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 4a3dda23e3e0..a37a3bbc04d9 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -266,8 +266,14 @@ bool msm_use_mmu(struct drm_device *dev)
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

