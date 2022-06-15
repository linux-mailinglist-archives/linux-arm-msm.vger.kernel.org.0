Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A55F254CAA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 16:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351808AbiFOOAI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 10:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355365AbiFON7n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 09:59:43 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5AA3EA90
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:39 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id s6so19011112lfo.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s7APmfDxZ9CONW1VV/1LqJYroxXkuoozEYXQ/yDdg20=;
        b=hyUqcZekXRgexYiKGD2q8zWkKeqPJpYyK8qDciad4fo4gdkZHdrGE+QfWvb7Y+HUpy
         Z2885KQ6v3JJr/GlZnq0czEvvj3i2lsifzcBg8P3C3vfqu/7UZykhqTfPdvm83ib2613
         vChWIywetv8A7hbaN7FSop/gVtVhUF44skXbRM8CODxPOfPe0zueEHVd8IjbdHOjGOBJ
         nL9CNDN2cetMUrivD1pq7v/Kc0a4KLwFSJe5OxA3XYzJ6PEqOjxjsuMRo1pvIUsMmlBW
         zfqKo946LvQZTmNGrIFsix6LK1+OeXS2UgbiWYKU/jboeCcFlzb/R9EkNYgA8W431po/
         0mMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s7APmfDxZ9CONW1VV/1LqJYroxXkuoozEYXQ/yDdg20=;
        b=DNDDSBSbADLXyYS/aJw+rrFFkzOplMG7wAPvvkHtKixCPzuGwDu+g8whMjXSlCCN3+
         zPo+gsB8Bp8GBwnAj3tOJw9iwExxgXrwyguJSNJ5MHr73+995XNwx50/BT4qXaVo/pA6
         AuMv1ZvsUiCIlc55/Fcf0+tiXMoQk84C2vclODwOSsRn+vRUnL4MNnIgmU1kbzZ7ydZ1
         4h2J0yQm93Tjaxhs6KeEg/h1RDu82RNf2xr+QRwm00DBPoJ2gySuWzt+RcuHtExEPxpI
         UGCPw3uFjtTl085zJN8NY9Ka1Of07Vafc9MzHfnFOY5CCBquNmKtDPdzfT1ZNqmNLvax
         6cKg==
X-Gm-Message-State: AJIora9ZbfmQlXGNYS/pjlR9ExmikqXR0RGos8b3tfeQwFxq8yUsRbgl
        DTPIqj4b+rpgobiRQyuAC1QCwA==
X-Google-Smtp-Source: AGRyM1u1X5RspLOTnKenLe+Uy7DLhi2ZnRQC6OJVD8m35jxqQZmL/Z+mYrb0acxUvkmsApX9De9p8w==
X-Received: by 2002:a05:6512:b86:b0:47d:ba62:8c11 with SMTP id b6-20020a0565120b8600b0047dba628c11mr6083614lfv.328.1655301578016;
        Wed, 15 Jun 2022 06:59:38 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z23-20020a2e8e97000000b0025530fa4edesm1694962ljk.49.2022.06.15.06.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 06:59:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/5] drm/msm/mdss: enable optional core clock for MDP5 MDSS
Date:   Wed, 15 Jun 2022 16:59:32 +0300
Message-Id: <20220615135935.87381-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org>
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

Enable (optional) core (MDP_CLK) clock that allows accessing HW_REV
registers during the platform init.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index b41848bfff91..f7b4628986b8 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -288,7 +288,7 @@ static int msm_mdss_reset(struct device *dev)
 /*
  * MDP5 MDSS uses at most three specified clocks.
  */
-#define MDP5_MDSS_NUM_CLOCKS 3
+#define MDP5_MDSS_NUM_CLOCKS 4
 static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_data **clocks)
 {
 	struct clk_bulk_data *bulk;
@@ -305,6 +305,7 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 	bulk[num_clocks++].id = "iface";
 	bulk[num_clocks++].id = "bus";
 	bulk[num_clocks++].id = "vsync";
+	bulk[num_clocks++].id = "core"; /* for hw_rev access */
 
 	ret = devm_clk_bulk_get_optional(&pdev->dev, num_clocks, bulk);
 	if (ret)
-- 
2.35.1

