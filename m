Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1280473D07D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 13:42:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231967AbjFYLmg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 07:42:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbjFYLmf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 07:42:35 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAB4135
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fa16c6a85cso1157911e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 04:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687693352; x=1690285352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
        b=bJDzcJXCkAPD5zeUzpoqy0kG3q005OtGeLsMf6/8V95IZdLI0J9FwWFQzM7I0TviaG
         7R72ljXh4KrImRig/whnSLpd6D+vlRxOUdDwWuupvCQS7qyud0wY7+GK+uT+kqTl9Tqu
         spKdhblRSZ/3kfTR4niN2Mbd10wb19O3UehlWtub8FJ/kOPQglGSe7XF9bIKwtfryB6G
         ApTzotjKQMX3+GMHDaU1t8gp+wa2hLP4pmo8Lqu+fEOwu1kpacrne/Ttr6H/9T0X90dE
         u1Lujt97vZeMsX1ApXMYlC9jczbq0/FkcAzNk0PxtqsRa8rOqSFB3L+HD3ABtublF8Qd
         PTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687693352; x=1690285352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
        b=eX3jBZL/2L65NK5jvoQ6s4wX6pTfau78e+VhLCv8XYJ8aG1//1vTh2CW+SXu3JaiVh
         ybkchnz+/bn7N7TwnClGYk76Ir5nBm+vx/9aibrghmXAnw8bUSI71JVt0zUE/zHeCQuH
         cdEBoUBYosdtvN0NW2Lb32s1d3rR4CQQ9SLMQ1R1fXx3Nx0OpEmKf9GOaQ4mhR3hjAOO
         RTwb6S5V01xEC6xW2sfMC9Pv77zad5TvsGwo0xRAtBbqAlnFfNWuKw6lWWr+xD+KFj04
         dctYtT1BXsWwwcklAvACiss7/rqu2skMcLjLF/Q1LF21YorOFdhLSkID6DvtyX/fjZIi
         5l8A==
X-Gm-Message-State: AC+VfDwB7JCqn82PEt9SgjfytjS7mgLJq6MidpHGxATwOYWLx2DVZ66l
        2G8BrKx1VuLox4WltzSSLA2IEg==
X-Google-Smtp-Source: ACHHUZ7uaGIlPGOJp+0nRUkLMEV41kt31Ga6/kU/1+uK8JUDcsenYErcV7bYVaZlQb/IfK6J5BBR0A==
X-Received: by 2002:a19:9156:0:b0:4f8:58af:ebd7 with SMTP id y22-20020a199156000000b004f858afebd7mr14228099lfj.39.1687693352116;
        Sun, 25 Jun 2023 04:42:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 04:42:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: [PATCH v2 10/15] drm/msm/hdmi: correct indentation of HDMI bridge functions
Date:   Sun, 25 Jun 2023 14:42:17 +0300
Message-Id: <20230625114222.96689-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 62ce1455f974..fbcf4dd91cd9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -291,12 +291,12 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-		.pre_enable = msm_hdmi_bridge_pre_enable,
-		.post_disable = msm_hdmi_bridge_post_disable,
-		.mode_set = msm_hdmi_bridge_mode_set,
-		.mode_valid = msm_hdmi_bridge_mode_valid,
-		.get_edid = msm_hdmi_bridge_get_edid,
-		.detect = msm_hdmi_bridge_detect,
+	.pre_enable = msm_hdmi_bridge_pre_enable,
+	.post_disable = msm_hdmi_bridge_post_disable,
+	.mode_set = msm_hdmi_bridge_mode_set,
+	.mode_valid = msm_hdmi_bridge_mode_valid,
+	.get_edid = msm_hdmi_bridge_get_edid,
+	.detect = msm_hdmi_bridge_detect,
 };
 
 static void
-- 
2.39.2

