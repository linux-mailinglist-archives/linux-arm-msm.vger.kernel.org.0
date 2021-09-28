Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A68941AFEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 15:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240662AbhI1NWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 09:22:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240817AbhI1NWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 09:22:11 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03185C061604;
        Tue, 28 Sep 2021 06:20:32 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 17so21164695pgp.4;
        Tue, 28 Sep 2021 06:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oML9T4hNm8T0JbKhVIBMBwI7KEbiqjIJg/n4n2ZhuRU=;
        b=UTVqwqruHx96fUzy6SQA1KVfWWyJqB5FFYI6HMnAplSIWP5SYBDWt1sJ0BHXj8Qh7f
         /uhwW/0SdMrH9RRDFrLpRmkpX0Tos1dcjxnl2zT7Wp4yTE0YJflrjOU6N+Zva+fMI+Ce
         Btz3Ps605ycmVaUH7tHSrJiQ/ZwM7l85gJhTWnRsgiEpcjKW3be3P6XtUjzuyF4ibIwv
         mdVFqdIQN0orwXHARI3g2gFPZeHy7F8h0ZFzW6igU6y7t/0/Ew56mH/8BeS/eFDxoftp
         syx06zcF+7TnCtTybpZiN5O4CzJA/6vzBkJaiUB6C7SnX+WEmFDp9GWBPe5VW6OWJc5l
         GiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oML9T4hNm8T0JbKhVIBMBwI7KEbiqjIJg/n4n2ZhuRU=;
        b=Az8xKFvGz+ENBVIvjewLrUbDYneKw+BDDh8s16dVmQbux1dhvZTZp8CALLFcQEWagc
         sPlOEEkgbE6dhekgfN7oAY/6G76E5uHuF7Ftam5z424gtHpfUOYK+iBsOC/9lWVOBsTi
         5L1ivLIRdrlN/5xVxL2fiszJLgzttw6Wv8en3/5goBtWS4Zzhuhf/iQYMqYDp5Apw1Hq
         asO5WjkRmlsS1+7BVqcb+6cAfeWc/QddHIL00NmDY1BYTVJYHXJVHRw7FUiZjhRUWJbL
         NltFKXqqhFXabwYrCi4mJp65KP7YkqVe6neXBbLT/qJBS3SCoaPt9bZtPSBI+DH0o4+T
         OKTw==
X-Gm-Message-State: AOAM531KAaG33Pr2mRjl51DZdk9taMAH2pDDYV60LYZY2NytA343zYXC
        ZPgazNf5s+mTMTL4BqtA+YPKt1XBB7vhZWI+hLw=
X-Google-Smtp-Source: ABdhPJxAFqRPsHfFn+xjc98v2+BH64dfRCfTqLgcESaLWpiqybQpPW7z9u37350mto8exX/UmZgX4Q==
X-Received: by 2002:aa7:9499:0:b0:445:1c9c:3c1b with SMTP id z25-20020aa79499000000b004451c9c3c1bmr5376482pfk.8.1632835231310;
        Tue, 28 Sep 2021 06:20:31 -0700 (PDT)
Received: from skynet-linux.local ([122.162.197.175])
        by smtp.googlemail.com with ESMTPSA id h13sm22063964pgf.14.2021.09.28.06.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 06:20:30 -0700 (PDT)
From:   Sireesh Kodali <sireeshkodali1@gmail.com>
To:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Vladimir Lypak <vladimir.lypak@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Rajeev Nandan <rajeevny@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v3 2/3] drm/msm/dsi: Add phy configuration for MSM8953
Date:   Tue, 28 Sep 2021 18:49:28 +0530
Message-Id: <20210928131929.18567-3-sireeshkodali1@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928131929.18567-1-sireeshkodali1@gmail.com>
References: <20210928131929.18567-1-sireeshkodali1@gmail.com>
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

