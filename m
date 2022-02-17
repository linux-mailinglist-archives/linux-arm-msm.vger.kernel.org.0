Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFD54B987D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 06:55:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbiBQFzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 00:55:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:34448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234540AbiBQFzw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 00:55:52 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDFC295FD0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 21:55:37 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id n24so6645297ljj.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 21:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ELWJzwknTbo8V/NBjl+dsOP5IJD11EhzymdHIJHz4Lo=;
        b=yCDDfsBMHBjAf/YtdEVTAviPOlHteynapJRfsV8un6d4eyfRZPbUdrr7H1jHc9RLu7
         S2ubQ2F5ghpCmdgyuZpO5QWmETu1rJ4LarnZNlV5q2XktSQ2PGHjj7H4UrzBSbdKMm5u
         maMBoW4nCw929vnJF7aaakSeiXCyiZDFNDq4M42XorEDHXMauy53AXFcYXBZbo+y8Wdg
         BYt4uSDCWkGGG8vpS0cztMbzcwOKsnGLXml/ywMlVx0g4lh/qdyIOeqReO0KGIPn1SRm
         THkzjnZioicHP5gFvfWIciN5HlnF7WXpII1wPZ4kqKTFzJq5HItSqnU9dQFnbIJL3lqb
         p6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ELWJzwknTbo8V/NBjl+dsOP5IJD11EhzymdHIJHz4Lo=;
        b=pfurhgbiy4QkMN3a8IK10iVW7TL24RSsHwuzXgGpbQguLfsVmaoibDhGLkdMkzwYs1
         v1Jt3Lu2Gzv/2BNwavrp6M01BgEL7Ht72L3PAwijEJ9RH3mkBFQiEE9DT98k+hv7d1Z2
         I2IwVrOsfhi+zaCntdT0Qi0H1lTm9o95GV55900OrI8LZiTUmT//0Cg14u4D+sLMdI8R
         04Bv0c8/mSffVZ0NyOegyoFWBchBVFjXKLCdhDW20/ayc2M0bP4Q6zbQY6PIJ1y7lJ2y
         41CmETfGozxvwmymdOy1HQnSn1n2IH7pF1fa26ahHI4/YzQBxCCrWsSXfsrvTjXkhEiy
         zZgg==
X-Gm-Message-State: AOAM533eVho9oMIs32AME+svZOg733kVEx1pHDRxeOYBfu8oN50ph2+7
        8QAdIOIYu3RDDrROL2AfOfoXlw==
X-Google-Smtp-Source: ABdhPJzngQA4L1vwgFLgntsnVIWJbqn4fDzzi6VUYuu+l9gCYUae0lRxUr3ldrb12+sLgzMWyG48IA==
X-Received: by 2002:a05:651c:160a:b0:23d:1418:8db2 with SMTP id f10-20020a05651c160a00b0023d14188db2mr1069229ljq.361.1645077334537;
        Wed, 16 Feb 2022 21:55:34 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u13sm5015998lfs.260.2022.02.16.21.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 21:55:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v5 4/5] drm/msm/dp: inline dp_power_clk_set_rate()
Date:   Thu, 17 Feb 2022 08:55:28 +0300
Message-Id: <20220217055529.499829-5-dmitry.baryshkov@linaro.org>
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

Inline the dp_power_clk_set_rate() function, replacing it with the call
to msm_dss_enable_clk().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_power.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
index 6920d787e7aa..8d63a51cce7d 100644
--- a/drivers/gpu/drm/msm/dp/dp_power.c
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -150,21 +150,6 @@ static int dp_power_clk_deinit(struct dp_power_private *power)
 	return 0;
 }
 
-static int dp_power_clk_set_rate(struct dp_power_private *power,
-		enum dp_pm_type module, bool enable)
-{
-	int rc = 0;
-	struct dss_module_power *mp = &power->parser->mp[module];
-
-	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
-	if (rc) {
-		DRM_ERROR("failed to %d clks, err: %d\n", enable, rc);
-		return rc;
-	}
-
-	return 0;
-}
-
 int dp_power_clk_status(struct dp_power *dp_power, enum dp_pm_type pm_type)
 {
 	DRM_DEBUG_DP("core_clk_on=%d link_clk_on=%d stream_clk_on=%d\n",
@@ -187,6 +172,7 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 {
 	int rc = 0;
 	struct dp_power_private *power;
+	struct dss_module_power *mp;
 
 	power = container_of(dp_power, struct dp_power_private, dp_power);
 
@@ -214,9 +200,11 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 		}
 
 		if ((pm_type == DP_CTRL_PM) && (!dp_power->core_clks_on)) {
+			mp = &power->parser->mp[DP_CORE_PM];
+
 			DRM_DEBUG_DP("Enable core clks before link clks\n");
 
-			rc = dp_power_clk_set_rate(power, DP_CORE_PM, enable);
+			rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
 			if (rc) {
 				DRM_ERROR("fail to enable clks: %s. err=%d\n",
 					dp_parser_pm_name(DP_CORE_PM), rc);
@@ -226,7 +214,8 @@ int dp_power_clk_enable(struct dp_power *dp_power,
 		}
 	}
 
-	rc = dp_power_clk_set_rate(power, pm_type, enable);
+	mp = &power->parser->mp[pm_type];
+	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
 	if (rc) {
 		DRM_ERROR("failed to '%s' clks for: %s. err=%d\n",
 			enable ? "enable" : "disable",
-- 
2.34.1

