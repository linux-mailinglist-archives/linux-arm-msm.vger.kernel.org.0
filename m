Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0DB4003E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Sep 2021 19:09:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350225AbhICRKc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Sep 2021 13:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350238AbhICRK3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Sep 2021 13:10:29 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8188C061760;
        Fri,  3 Sep 2021 10:09:28 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id v123so4746144pfb.11;
        Fri, 03 Sep 2021 10:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oML9T4hNm8T0JbKhVIBMBwI7KEbiqjIJg/n4n2ZhuRU=;
        b=hprSMkscOds52ztZ0BN1ncqwRrMGErH4qUBwiBSGlOxjVqx/rLSVp+NTIbG9FxMkyA
         uEUKcOlUE2bBlIKnUckrrIDt861OR+pc3cJKAtAobVUIQDYaLRo8L/0SMaNcUPIlxrVo
         jpTDplN8FwdiUYy3eeOfR+s8TS//2Arsea/rY8Zx0XecOEz9xvYvfKHKYIs9UerkARnx
         rFbgDTKO/DoqsUvPokQmx8T1U9oaRWAM2mW2y1ctXFYzUd3+tyxZ7pYcZGq7u1agNY+J
         xYd3+Tn0QgcQs8jdC9MCogCZ10hT0iPX8ECgx6oqBUPc33HQXQGQCaYFCOtQXA1mWP4i
         RIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oML9T4hNm8T0JbKhVIBMBwI7KEbiqjIJg/n4n2ZhuRU=;
        b=ZS/MX9Pl/DWNsy0J17cqBvhdEWB8N6C4JwDscdu3bZwtzLIlTPhEnxDjKr+/V+AToY
         vF0lXudiXHW4YjVoJMWkmBoKO18azmpsLyPqeW5QKdYvUr7FVewa70ycKo7mc3/kMVd4
         nejrLFm6iZOMJG38yqjjpE6IeGNQ7h98RIhi/wLrqDHjwIIiUL4nYIvh3HTyemwBZPPq
         H4yDHWMm7T6i9OztONwlIv7a2D9AFMv0swZQEHdI4yQMC6lgPjDi0tzeMi5Hfw89eLg3
         dttcCqMPF2LO+kpW9Gd7PFABlLHnQtNWtpy1/9Iik16cMd9O1/ezBII8jG6ztuV9ahu2
         0WoA==
X-Gm-Message-State: AOAM530sga9+HwdGva1MYh+Rnp05uvyLtIDqvIX+zmZ6CzafQKzWeaLm
        XLf3mfDiYesYdJxEfo2Zp2Nz3xaj+oW+yhXw
X-Google-Smtp-Source: ABdhPJzffmEzGJBQOIV01Wm1saidXbtMvwXfO7+MxwVKmd6kYopuUGSM5lHgrgqvCPH66IrCl7Sa0w==
X-Received: by 2002:a63:b707:: with SMTP id t7mr57341pgf.460.1630688967994;
        Fri, 03 Sep 2021 10:09:27 -0700 (PDT)
Received: from skynet-linux.local ([122.171.5.147])
        by smtp.googlemail.com with ESMTPSA id 130sm5905361pfy.175.2021.09.03.10.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:09:27 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rajeev Nandan <rajeevny@codeaurora.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/3] drm/msm/dsi: Add phy configuration for MSM8953
Date:   Fri,  3 Sep 2021 22:38:43 +0530
Message-Id: <20210903170844.35694-3-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903170844.35694-1-sireeshkodali1@gmail.com>
References: <20210903170844.35694-1-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vladimir Lypak <vladimir.lypak@gmail.com>

Add phy configuration for 14nm dsi phy found on MSM8953 SoC. Only
difference from existing configurations are io_start addresses.

Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
 3 files changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 8c65ef6968ca..9842e04b5858 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -627,6 +627,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_14nm_cfgs },
 	{ .compatible = "qcom,dsi-phy-14nm-660",
 	  .data = &dsi_phy_14nm_660_cfgs },
+	{ .compatible = "qcom,dsi-phy-14nm-8953",
+	  .data = &dsi_phy_14nm_8953_cfgs },
 #endif
 #ifdef CONFIG_DRM_MSM_DSI_10NM_PHY
 	{ .compatible = "qcom,dsi-phy-10nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index b91303ada74f..4c8257581bfc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -48,6 +48,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_7nm_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index d13552b2213b..9a6b1f0cbbaf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -1065,3 +1065,24 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs = {
 	.io_start = { 0xc994400, 0xc996000 },
 	.num_dsi_phy = 2,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
+	.has_phy_lane = true,
+	.reg_cfg = {
+		.num = 1,
+		.regs = {
+			{"vcca", 17000, 32},
+		},
+	},
+	.ops = {
+		.enable = dsi_14nm_phy_enable,
+		.disable = dsi_14nm_phy_disable,
+		.pll_init = dsi_pll_14nm_init,
+		.save_pll_state = dsi_14nm_pll_save_state,
+		.restore_pll_state = dsi_14nm_pll_restore_state,
+	},
+	.min_pll_rate = VCO_MIN_RATE,
+	.max_pll_rate = VCO_MAX_RATE,
+	.io_start = { 0x1a94400, 0x1a96400 },
+	.num_dsi_phy = 2,
+};
-- 
2.33.0

