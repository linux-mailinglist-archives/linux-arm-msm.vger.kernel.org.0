Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03F6A7507B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jul 2023 14:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232727AbjGLMLx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jul 2023 08:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbjGLMLw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jul 2023 08:11:52 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68EA8E53
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:51 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b734aea34aso19723201fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jul 2023 05:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689163909; x=1691755909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rgNwhxKw4bZ5s3ucnef5zeiAhvXraBKd19jFSLqsoHo=;
        b=Xxn+9ZtM1kISF8G9nVeegH/A6WkZuCAm2YNYaVXpgwQFrcxyVO3yDfweNVTo1QQcrI
         /fLBioGmRtQu+F0rNf3s8E2pUJg7snx91MzqrHPUTSa19+fRvMlT0J0/TmDnLe5LKXvC
         5bhFxIuQEZqlLjx7hEzlkxyMKxmc/1CIIKkvJL4NarAEllpvzo5X85W6z75HoJVU4Yfd
         0dtW4QvFdpfUjEryhZlHaIXJrdKIeKyBsNcExxFoW7rSkui9NeZRbm488zHQtyUhBYfj
         FmYz0aEJtLUWS4MkBmXDinhO5XfilIPufWDo6JbZFSyPE866cYtPueRHdSsQbZSK4bIp
         8RXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689163909; x=1691755909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rgNwhxKw4bZ5s3ucnef5zeiAhvXraBKd19jFSLqsoHo=;
        b=V28Pjur8QpyQAB+r2UqGUWMEN2UFYrKFJ+uO215Hn+Dt4QAY61oRMiFkBmHTYqKifZ
         Fynkx4B7UfJfxuHtiRoyL+m1anHyDCt/3wDznHfz5o0K22uEHr8D9JR0DgjurJkmMHgG
         pDJDx7Gi/bdhCo9I+40KhvsWO7sGmRTi4yQOx21TqlCFEJ4Gg1QTyQxQiW/bpnrY5/eb
         rHGPHALHAatq0DMRLEhOjmObRq+p0ujdjOvaHAgCyfNIvO87KOQZpiev7X/1UXUELavR
         UOh/vHQcNbuw2jvfMJk5ve27kNHGB8P4mE8GHKFeWtZlgfboRid0PRDqhCtHa7IPbIVr
         m0Ew==
X-Gm-Message-State: ABy/qLZ+R+nl7jOfG2/y+1zAX6sWrNj6SFn/n0/s60IyL3HzrywwIuGb
        TWwdRgQotWWEPcFwVf78n2UzmQ==
X-Google-Smtp-Source: APBJJlEoBVM7oIZB/8fguZjY6IW3oxraLQ8m9VrI4T5KyvjsWvgOEl+fZugMh6fH6yINf2SjFudqWA==
X-Received: by 2002:a2e:300a:0:b0:2b5:9d78:213e with SMTP id w10-20020a2e300a000000b002b59d78213emr15976449ljw.22.1689163909736;
        Wed, 12 Jul 2023 05:11:49 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:11:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 4/8] drm/msm/mdss: Rename path references to mdp_path
Date:   Wed, 12 Jul 2023 15:11:41 +0300
Message-Id: <20230712121145.1994830-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Konrad Dybcio <konrad.dybcio@linaro.org>

The DPU1 driver needs to handle all MDPn<->DDR paths, as well as
CPU<->SLAVE_DISPLAY_CFG. The former ones share how their values are
calculated, but the latter one has static predefines spanning all SoCs.

In preparation for supporting the CPU<->SLAVE_DISPLAY_CFG path, rename
the path-related struct members to include "mdp_".

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 304a6509e1fb..809c93b22c9c 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -48,8 +48,8 @@ struct msm_mdss {
 		struct irq_domain *domain;
 	} irq_controller;
 	const struct msm_mdss_data *mdss_data;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -62,13 +62,13 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
-	msm_mdss->path[0] = path0;
-	msm_mdss->num_paths = 1;
+	msm_mdss->mdp_path[0] = path0;
+	msm_mdss->num_mdp_paths = 1;
 
 	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
-		msm_mdss->path[1] = path1;
-		msm_mdss->num_paths++;
+		msm_mdss->mdp_path[1] = path1;
+		msm_mdss->num_mdp_paths++;
 	}
 
 	return 0;
@@ -78,8 +78,8 @@ static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
 
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_set_bw(msm_mdss->path[i], 0, Bps_to_icc(bw));
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
 }
 
 static void msm_mdss_irq(struct irq_desc *desc)
-- 
2.40.1

