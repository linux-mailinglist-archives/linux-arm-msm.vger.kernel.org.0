Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B24539497F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 02:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhE2A0z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 20:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbhE2A0z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 20:26:55 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45B39C061760
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:19 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id q1so7763343lfo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xjGr8zrVoodPGoZ+CmB2tC5N2dK4RzlqkPi3DgmLbfg=;
        b=VuDOOtoBvA0CaQnrlfhc8IsfATwRDUEvlzzBZ+oA7N9cflulstBufYmDbG/evOUwLb
         x/g7Dpc9j0x7S1V8GC2Uu6INlHOjwtoPQeVhxQU72H8cWed6G1pVYkD2IvdIfzdJGGam
         sFU2jDtsrFd7Me2icggO5qUR5lyIcjnqJr49M0Q7E+rcymTOok69wHghbv34/dFfSqe0
         VOvMfgVKftK0HWRR4apYZ8IxhiISXZrx/uzTw1cn+4jzKVB9dn6O0b8/YPFMkEPunsXc
         1qH1oWiFnqyGFBXFmN0rThBWHjF54fISqox8BviWBr62tkyxuhZaRpx6Hn2ZfmGIfLx1
         1NTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xjGr8zrVoodPGoZ+CmB2tC5N2dK4RzlqkPi3DgmLbfg=;
        b=YxPDtY1DRK4eJORFUpkQtjhTn1aIxS+P7HwSjXTOup6zx5W9Cal3EbNX2wO77ODW7y
         aQJjlQNjcV00MIi5xDn1r8BAwwYOoJQ6z6q0Z+l8pm/6a6rO4MJEfhXnBkgrLZ8NYCIb
         8ruIZTSv1kPq22F1h95qUuSgw/sdg+NLy7IQHDOl+dMSgHXxCVwz4t71RAImJ0s0V/1v
         NhRc70UvAoR7DqSm9PHn/v5OyqhvGwTgKDkkGYWscZzAF8Xq4LhRXXN+m8N2ft8peUIB
         oboPtsK9WvLZPRWXEfL0NPV6hM6478xmXx5Hc+wqpfVe0cfVexKVHw7XHqj8x858yly4
         On1w==
X-Gm-Message-State: AOAM530Ld+XU9cY+6mIVovsUI9nz3A9MYcPCHQbHVxmyh6ROgUPWMJDT
        XqGahtYF0XH13+eQ3UWZ/1l1UQ==
X-Google-Smtp-Source: ABdhPJw22wrdYu0yhkTcrdRn6v+jdyyDFi0zoH9wEQAMDNpmWZz54XvGUxbZPywma0aMj80RT+o5xw==
X-Received: by 2002:a19:ee15:: with SMTP id g21mr7601957lfb.338.1622247916549;
        Fri, 28 May 2021 17:25:16 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 17:25:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 1/8] drm/msm/dsi: make msm_dsi_phy_pll_restore_state static function
Date:   Sat, 29 May 2021 03:25:01 +0300
Message-Id: <20210529002508.3839467-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_dsi_phy_pll_restore_state() is only called from msm_dsi_phy_enable(),
so there is no need to export it. Mark it static.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  1 -
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 30 +++++++++++++--------------
 2 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 876053ba615b..c467ad609453 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -170,7 +170,6 @@ void msm_dsi_phy_disable(struct msm_dsi_phy *phy);
 void msm_dsi_phy_set_usecase(struct msm_dsi_phy *phy,
 			     enum msm_dsi_phy_usecase uc);
 void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy);
-int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy);
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy);
 
 #endif /* __DSI_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index f479e37d6428..36878504bbb8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -559,6 +559,21 @@ static void dsi_phy_disable_resource(struct msm_dsi_phy *phy)
 	pm_runtime_put_autosuspend(&phy->pdev->dev);
 }
 
+static int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
+{
+	int ret;
+
+	if (phy->cfg->ops.restore_pll_state && phy->state_saved) {
+		ret = phy->cfg->ops.restore_pll_state(phy);
+		if (ret)
+			return ret;
+
+		phy->state_saved = false;
+	}
+
+	return 0;
+}
+
 static const struct of_device_id dsi_phy_dt_match[] = {
 #ifdef CONFIG_DRM_MSM_DSI_28NM_PHY
 	{ .compatible = "qcom,dsi-phy-28nm-hpm",
@@ -838,21 +853,6 @@ void msm_dsi_phy_pll_save_state(struct msm_dsi_phy *phy)
 	}
 }
 
-int msm_dsi_phy_pll_restore_state(struct msm_dsi_phy *phy)
-{
-	int ret;
-
-	if (phy->cfg->ops.restore_pll_state && phy->state_saved) {
-		ret = phy->cfg->ops.restore_pll_state(phy);
-		if (ret)
-			return ret;
-
-		phy->state_saved = false;
-	}
-
-	return 0;
-}
-
 void msm_dsi_phy_snapshot(struct msm_disp_state *disp_state, struct msm_dsi_phy *phy)
 {
 	msm_disp_snapshot_add_block(disp_state,
-- 
2.30.2

