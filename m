Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0746465A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Dec 2022 01:08:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiLHAI5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 19:08:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbiLHAI4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 19:08:56 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EEFF8BD1C
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 16:08:55 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id x6so22698918lji.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 16:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFLaHZzkiofOVWIbXQa8n2M4jPc4703bol8Amy6xF6Q=;
        b=q4QZscJbVJ4+cMD+Sd5P4PS2VTHzKRk2e5IlSgibIu5y9guIxKS1LXNQaHZiPWm+Fc
         WcoZOAgLCb+qxrKwRDeRVhVHreqdTjhSe+WAx5zlUsgFtjyC475KrjNUDZP008mHnZcz
         IJQMhkfX7EN+R8zZWOrry4aLzuzUz9ghbsSSA9byzC0s2AOchiyiGRHxhZ6dPLy9Ld3k
         9dwcT0a8ipDVgUE5JnoDekBjuRNTJyJBJEdgRCO8EhXu5+uFXVdS2jUnuJKDqP8Rho22
         54ZegU8t5SOwNKSOu0Rka/1mJyjEbpcSHC7PKAWpwnDgFCocDPRnbB67X9qqwU5wXxYH
         1x6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sFLaHZzkiofOVWIbXQa8n2M4jPc4703bol8Amy6xF6Q=;
        b=yRhVd1YuRhpst4Us0AfvvpKHU59EeO+12OmLOXF5eVJ+V0TiL3ofON/gmWAQWo6oEW
         deyzUoxdFMlNi0V5QE8mwUXtcVkYhYPb/xahemz/cPTLQBdo2zeUT2LGyRCWVEugN6eB
         bUBnbnL4yMApSKt6HAz0QUHVoMCQ5rtrINw2v+Z2ByB41DIC/Tac1jXl4z3h7AFOZv3Q
         IR3UKMAjxzutyJzwx+EMuKak7yKeGvU9bH83YlPpbXwZd0F6EvpkbB+OaTOpXBiEeLOf
         EAbGlIwZ1Cg+PCIl2qD+3C7Z1yTXrYeYf8B3EHDicjlY6STMGaG3C6p2upl4AU0Tb5JZ
         n7qA==
X-Gm-Message-State: ANoB5pnPI8HxBODKq3iCXXyG5NK4+t0oC5q8vFvsbaVEjSxcEovGB2ez
        r/pmZ0CmsGnmyjXsgrENsQftdg==
X-Google-Smtp-Source: AA0mqf5OGwIKsS/5oBYlLFBiB9Kk6hm9x1GyIUM8OdXypovLhfvBw+K61Qeka6zugKsZ01GiELeeAA==
X-Received: by 2002:a05:651c:171c:b0:279:f169:9b53 with SMTP id be28-20020a05651c171c00b00279f1699b53mr5898335ljb.132.1670458133887;
        Wed, 07 Dec 2022 16:08:53 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z6-20020ac25de6000000b004a2c447598fsm2062992lfq.159.2022.12.07.16.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 16:08:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH 3/4] drm/msm/mdss: add data for sc8180xp
Date:   Thu,  8 Dec 2022 02:08:49 +0200
Message-Id: <20221208000850.312548-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
References: <20221208000850.312548-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add platform data for sc8180xp based on sdmshrike-sde.dtsi.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4401f945b966..5e19ec897670 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -518,6 +518,12 @@ static const struct msm_mdss_data sc7280_data = {
 	.macrotile_mode = 1,
 };
 
+static const struct msm_mdss_data sc8180x_data = {
+	.ubwc_version = UBWC_3_0,
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+};
+
 static const struct msm_mdss_data sc8280xp_data = {
 	.ubwc_version = UBWC_4_0,
 	.ubwc_swizzle = 6,
@@ -553,7 +559,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-mdss" },
 	{ .compatible = "qcom,sc7180-mdss", .data = &sc7180_data },
 	{ .compatible = "qcom,sc7280-mdss", .data = &sc7280_data },
-	{ .compatible = "qcom,sc8180x-mdss" },
+	{ .compatible = "qcom,sc8180x-mdss", .data = &sc8180x_data },
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
-- 
2.35.1

