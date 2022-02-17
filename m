Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD8FE4B987F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 06:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234546AbiBQFzv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 00:55:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232434AbiBQFzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 00:55:50 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642B3297209
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 21:55:35 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id o2so7990371lfd.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 21:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=drjumxndbzX+6GFJB5Dmk6y54nmLjOv/EUxYvEGyT4A=;
        b=AUhT4DHLKtovjntbmor9hU5AEe8ZJ+s4CzKYxgP0DqZbknyHQ+IqYPARbQXEwcjaDQ
         vfluYvD7kY9EoqnIXbo9itc1LRRPXYXJ6DMbFgQC7A4k54ri+eBwheRMXXjFOPuTc0ca
         PnCkCw8VuK4GMpjKXYs7IYGz/ILDafSjx95h6uZxrYIYPT3eZOBKa7JFLRBY61MmR0zu
         ytMMGy8qvM8YNRfj1jMvSJwqJt6l1JMICCm8rtnXo8PWc+sRg52/TbVRJB4qNABGNK5w
         9haS715r8K4UoFhLlwnI347xAo8woh6Q3m+zHOq89ha7yp3tFx0hZbDkBuU2JudwqYxk
         MKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=drjumxndbzX+6GFJB5Dmk6y54nmLjOv/EUxYvEGyT4A=;
        b=icOJhIoEjSYzMwXeVKUWiqo9NfKrvqJpovAKI11uRSKqEl7blDm77xU3rFkvcwU6Ec
         pvZS9zymWYGeH+jHsDtjkRu9U6tfYnZPCCP9nEpZP0Q/XIzE2yFiCVBLVVHWhT6FsIG7
         Sf4ecBRy1LzGxHQiuPt2/TRiLYgftTWljstpaZoJz0mGQ36ojPjafh+rewZPsoR1v3jn
         C51hQIYPY8RhYClm33O7jAOSpIH/KPddkH3gtjigG9Nj5u58k7NYKSRFQLqjQWy78z/C
         AVrivE3rR7birTl7RJ0LzJ21ceDfSoKaNpbLX6x9IhSBwvCttcawfS9pf9PdYT1HZX/g
         yCPQ==
X-Gm-Message-State: AOAM532xzi8J+qInebEluZPvU0vXMI5jR6BuO3DTfibW7mZ9e2cSmHwA
        pOPPAzu3VV/5rxNdqqVuxSoAnQ==
X-Google-Smtp-Source: ABdhPJxpYeLeX+6JhET9BkV26RPrl9O8ozgStECmPhqvP2i2E2DyaadYgqiqizuz2ri57+VQAFqcBw==
X-Received: by 2002:a05:6512:ea5:b0:43b:3603:69d9 with SMTP id bi37-20020a0565120ea500b0043b360369d9mr1012827lfb.71.1645077332832;
        Wed, 16 Feb 2022 21:55:32 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u13sm5015998lfs.260.2022.02.16.21.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 21:55:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 2/5] drm/msm/dp: "inline" dp_ctrl_set_clock_rate("ctrl_link")
Date:   Thu, 17 Feb 2022 08:55:26 +0300
Message-Id: <20220217055529.499829-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
References: <20220217055529.499829-1-dmitry.baryshkov@linaro.org>
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

"ctrl_link" is the clock from DP_CTRL_PM module. The result of setting
the rate for it would be a call to dev_pm_opp_set_rate(). Instead of
saving the rate inside struct dss_module_power, call the
devm_pm_opp_set_rate() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  |  7 +++++--
 drivers/gpu/drm/msm/dp/dp_power.c | 33 +------------------------------
 2 files changed, 6 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c724cb0bde9d..07f6bf7e1acb 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1332,12 +1332,11 @@ static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
 	opts_dp->lanes = ctrl->link->link_params.num_lanes;
 	opts_dp->link_rate = ctrl->link->link_params.rate / 100;
 	opts_dp->ssc = drm_dp_max_downspread(dpcd);
-	dp_ctrl_set_clock_rate(ctrl, DP_CTRL_PM, "ctrl_link",
-					ctrl->link->link_params.rate * 1000);
 
 	phy_configure(phy, &dp_io->phy_opts);
 	phy_power_on(phy);
 
+	dev_pm_opp_set_rate(ctrl->dev, ctrl->link->link_params.rate * 1000);
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
 	if (ret)
 		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
@@ -1451,6 +1450,7 @@ static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
 	 * link clock might have been adjusted as part of the
 	 * link maintenance.
 	 */
+	dev_pm_opp_set_rate(ctrl->dev, 0);
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
@@ -1482,6 +1482,7 @@ static int dp_ctrl_deinitialize_mainlink(struct dp_ctrl_private *ctrl)
 
 	dp_catalog_ctrl_reset(ctrl->catalog);
 
+	dev_pm_opp_set_rate(ctrl->dev, 0);
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
@@ -1887,6 +1888,7 @@ int dp_ctrl_off_link_stream(struct dp_ctrl *dp_ctrl)
 		}
 	}
 
+	dev_pm_opp_set_rate(ctrl->dev, 0);
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
@@ -1942,6 +1944,7 @@ int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
 	if (ret)
 		DRM_ERROR("Failed to disable pixel clocks. ret=%d\n", ret);
 
+	dev_pm_opp_set_rate(ctrl->dev, 0);
 	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
 	if (ret) {
 		DRM_ERROR("Failed to disable link clocks. ret=%d\n", ret);
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index b48b45e92bfa..893a57dd97d9 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -150,44 +150,13 @@ static int dp_power_clk_deinit(struct dp_power_private *power)
 	return 0;
 }
 
-static int dp_power_clk_set_link_rate(struct dp_power_private *power,
-			struct dss_clk *clk_arry, int num_clk, int enable)
-{
-	u32 rate;
-	int i, rc = 0;
-
-	for (i = 0; i < num_clk; i++) {
-		if (clk_arry[i].clk) {
-			if (clk_arry[i].type == DSS_CLK_PCLK) {
-				if (enable)
-					rate = clk_arry[i].rate;
-				else
-					rate = 0;
-
-				rc = dev_pm_opp_set_rate(power->dev, rate);
-				if (rc)
-					break;
-			}
-
-		}
-	}
-	return rc;
-}
-
 static int dp_power_clk_set_rate(struct dp_power_private *power,
 		enum dp_pm_type module, bool enable)
 {
 	int rc = 0;
 	struct dss_module_power *mp = &power->parser->mp[module];
 
-	if (module == DP_CTRL_PM) {
-		rc = dp_power_clk_set_link_rate(power, mp->clk_config, mp->num_clk, enable);
-		if (rc) {
-			DRM_ERROR("failed to set link clks rate\n");
-			return rc;
-		}
-	} else {
-
+	if (module != DP_CTRL_PM) {
 		if (enable) {
 			rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
 			if (rc) {
-- 
2.34.1

