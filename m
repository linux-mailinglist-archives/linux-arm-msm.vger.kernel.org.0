Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9923D1BFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 04:46:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbhGVCDw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Jul 2021 22:03:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbhGVCDs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Jul 2021 22:03:48 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E70C0617A2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 19:44:16 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id a132so5087912oib.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jul 2021 19:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uhoriXxwuf3F+ep/Ax/y3D7yAyI4y+wKU+diem5MpTA=;
        b=ZdBi2xPCD1R0VnJO6SavUR7GyC1Qambh3gp4KeO0sbhvIYnOo6MPCsLJ6v1Cl5f4VA
         Anr4nQvC+6tFNE6CeRot/cI4AVIUFN2aHccBkHRvZ+JibvKCbHl2rH90fyEhMjZxegBq
         Q+S4kxj6APRr8EgUnH4xDmSNZXsIIT3w1SlYuTfeOvepP6A448tE5GTgO+Shk8sCkCyv
         HUZJeQhlMw3ByhEnOq/HHR84wSmAUArNiu55uIkyvPxtQVcMQ425L2jhoTc3hnfNvB7L
         hmmCCUij94G13agr+DrhgA7fq9PgnQ96VRlFlkAF5gXxg92nBKobk77Usgv+7rBUxLuP
         BeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uhoriXxwuf3F+ep/Ax/y3D7yAyI4y+wKU+diem5MpTA=;
        b=r4sTPPxe9cBTcoVDPzUD8jA2o/TcFoQ2A4gVpSvwIW6MxwkVAJ2/MuSDVaQT647+aw
         k2Zy6GJLPL96pWqE+/GVz21EwbJVdSXQCs5j8z5QW709VcAxk8xiiAqlNdK//UBqggCh
         Tt8+ge3MMo8vCgvReSV4wEXPLdpyhISIacofWJuVbcueExf6ucVJ7L9j0LYal1tZ6cA3
         1uIAQ6MeNLQwhVxipazXgIrlQQ/0XJXzfrz3bB5awmXm7925qKnCfW+wdQaYwwfamSAy
         DAXg8VgAEWIQWQmkwYPJXe9PgewI85dHOx2PqJfPRTruLWteDsZhh4Y8BcB7YX182Zmd
         pydA==
X-Gm-Message-State: AOAM533hLrMsHg7/Yxxgk/qMcM0BeYlsi89KuP7l+1nWocpaoVKNtk2C
        0F4W3mwYKF1u3FQJw1TsGctWUA==
X-Google-Smtp-Source: ABdhPJyGElkKfHDf6jyZwFqec1oLyl/N/ypeSqKhVHIH8x4MMGHzo5HPp19meT7huH/WVt7TtNbxRw==
X-Received: by 2002:a54:4102:: with SMTP id l2mr27057626oic.126.1626921856181;
        Wed, 21 Jul 2021 19:44:16 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u18sm5346519oif.9.2021.07.21.19.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 19:44:15 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] drm/msm/dp: Allow sub-regions to be specified in DT
Date:   Wed, 21 Jul 2021 19:42:27 -0700
Message-Id: <20210722024227.3313096-6-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all platforms has P0 at an offset of 0x1000 from the base address,
so add support for specifying each sub-region in DT. The code falls back
to the predefined offsets in the case that only a single reg is
specified, in order to support existing DT.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.c | 49 +++++++++++++++++++++++-------
 1 file changed, 38 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 1a10901ae574..fc8a6452f641 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -63,18 +63,45 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 		return PTR_ERR(dss->ahb);
 	}
 
-	if (dss->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
-		DRM_ERROR("legacy memory region not large enough\n");
-		return -EINVAL;
-	}
+	dss->aux = dp_ioremap(pdev, 1, &dss->aux_len);
+	if (IS_ERR(dss->aux)) {
+		/*
+		 * The initial binding had a single reg, but in order to
+		 * support variation in the sub-region sizes this was split.
+		 * dp_ioremap() will fail with -ENODEV here if only a single
+		 * reg is specified, so fill in the sub-region offsets and
+		 * lengths based on this single region.
+		 */
+		if (PTR_ERR(dss->aux) == -ENODEV) {
+			if (dss->ahb_len < DP_DEFAULT_P0_OFFSET + DP_DEFAULT_P0_SIZE) {
+				DRM_ERROR("legacy memory region not large enough\n");
+				return -EINVAL;
+			}
+
+			dss->ahb_len = DP_DEFAULT_AHB_SIZE;
+			dss->aux = dss->ahb + DP_DEFAULT_AUX_OFFSET;
+			dss->aux_len = DP_DEFAULT_AUX_SIZE;
+			dss->link = dss->ahb + DP_DEFAULT_LINK_OFFSET;
+			dss->link_len = DP_DEFAULT_LINK_SIZE;
+			dss->p0 = dss->ahb + DP_DEFAULT_P0_OFFSET;
+			dss->p0_len = DP_DEFAULT_P0_SIZE;
+		} else {
+			DRM_ERROR("unable to remap aux region: %pe\n", dss->aux);
+			return PTR_ERR(dss->aux);
+		}
+	} else {
+		dss->link = dp_ioremap(pdev, 2, &dss->link_len);
+		if (IS_ERR(dss->link)) {
+			DRM_ERROR("unable to remap link region: %pe\n", dss->link);
+			return PTR_ERR(dss->link);
+		}
 
-	dss->ahb_len = DP_DEFAULT_AHB_SIZE;
-	dss->aux = dss->ahb + DP_DEFAULT_AUX_OFFSET;
-	dss->aux_len = DP_DEFAULT_AUX_SIZE;
-	dss->link = dss->ahb + DP_DEFAULT_LINK_OFFSET;
-	dss->link_len = DP_DEFAULT_LINK_SIZE;
-	dss->p0 = dss->ahb + DP_DEFAULT_P0_OFFSET;
-	dss->p0_len = DP_DEFAULT_P0_SIZE;
+		dss->p0 = dp_ioremap(pdev, 3, &dss->p0_len);
+		if (IS_ERR(dss->p0)) {
+			DRM_ERROR("unable to remap p0 region: %pe\n", dss->p0);
+			return PTR_ERR(dss->p0);
+		}
+	}
 
 	io->phy = devm_phy_get(&pdev->dev, "dp");
 	if (IS_ERR(io->phy))
-- 
2.29.2

