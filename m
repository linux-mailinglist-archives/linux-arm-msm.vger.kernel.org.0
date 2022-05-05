Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4720751B483
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 02:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbiEEATw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 20:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbiEEATt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 20:19:49 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31C9A4AE29
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 17:16:10 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id l19so3672141ljb.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 17:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
        b=gkcH6vyhw4QT1tnvJaJgrYP4LsDs07MNRXSwqlRWpZ1qNEW4lrBoYEYI/o47S7rWIz
         XsDpSKRgMAdib/F7ACZGpPiPJv36KokgdX/s1PQlVwwQ1LzkbmTVxZaMzechmmd7crKQ
         KpVRs5GQDxGOGM+sOwFp7Zrb/5WYLHw6P48CJQ1vlAy56k9UPRcIb9qSwzVTq83HmOkF
         ZUAULTng0oThFeeOFg/7q6ICnYWS3X1WMXOfs4RQluALo9JWr7qv9d0v/JRE5RlB8iZA
         jKiQoCDpihLK65T7X7czbyNk++hkye1KmBjVpGvKcyQpHS50zI8H12I5qcXDM4HhdVzH
         ZAmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TI23wKQEneJ5WP1153aFPWXvGTv0wcRzY+mGykcwofk=;
        b=o7QwNCrv90bDpSjT5G+s7ODWm1frmJ1aMRL6oBfXt6PM4R1xLi1c6MnSMefvkgXpDY
         ZJtYs+juuoZtdyF12ZpyFHeX2Ah5xkqpfkgFbYaTs2NcXvQ6TL4Xfefg7rWrX7IXZIPm
         L3xSRKxsVp6K6BVBBd3p22HCX0NyJXqtsPkl7NCOGapXwmifa8p1/6hvosNaTnv1JQ3M
         XCn4wiopIUPg3L4d7/dUbLh/5sXZhKYJbfoYbBrziDuG7khvwMMCi14h4YzkmhFNDaTT
         NB3s+9aB3GIDRXNlgu8PSnyr7899qZIUTu1i/IaCjUXl62GuOysuwuwwrzISA9QYvD37
         Yulw==
X-Gm-Message-State: AOAM533rRjUgnZ22FEYdnzCb+9q6GAxQ7adkGGBMAsCoa+6DgrFfDve0
        S1N3u48ZOyK32HpmNIAbJGH9kQ==
X-Google-Smtp-Source: ABdhPJwD4QW6UJ+J7EMA1VgNHtzOlyK9oR84PU7v9fs+dZkyUgSwmJ7vfnhT4blOr4yp7I9mfynVgg==
X-Received: by 2002:a2e:8e84:0:b0:24f:1d40:ceb0 with SMTP id z4-20020a2e8e84000000b0024f1d40ceb0mr14868330ljk.292.1651709768554;
        Wed, 04 May 2022 17:16:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u24-20020ac25198000000b0047255d211b0sm6714lfi.223.2022.05.04.17.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 17:16:08 -0700 (PDT)
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
Subject: [PATCH v2 3/5] drm/msm: Stop using iommu_present()
Date:   Thu,  5 May 2022 03:16:03 +0300
Message-Id: <20220505001605.1268483-4-dmitry.baryshkov@linaro.org>
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

