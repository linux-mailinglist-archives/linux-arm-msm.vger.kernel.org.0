Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4486E54CAA5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 16:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242460AbiFOOAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 10:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347969AbiFOOAD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 10:00:03 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF87C37A99
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:41 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id c4so19028568lfj.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bEZ1NYwvFdMufdWC263WCaYuMJCoQlXujRGSLpZbvcs=;
        b=HoEHo8nE7GLoRGEAW8WNXManvVcmOERlVef/MFIQmTjnWqI9n6KuhjFTXXyu467mCP
         wDh3yHjP+hfr8e5XXVLtM9JYP1iaPcbWylOLxKPlzGt/4ZN4vUsGM4wkkfqEqZgrPUJj
         6XnAa9Y+TFfOkXp/XWOpWTP9A2OAC4uaAadarau8UYJkQ0zyAahzmsTeOy5sxn+qGAlz
         OU2WDv5hp1Et8LCqN47xtG2o1ZtZvdqbJBPwYyT7G0uMMIodTLUgFeJk7aw2tVkeGFdD
         Ax3Hi6obgp4xhkf1fxYH4dN7M4sWY2QfeafWwwSNRedp46CDBYOM3J8nenyAoYAL9a4M
         JvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bEZ1NYwvFdMufdWC263WCaYuMJCoQlXujRGSLpZbvcs=;
        b=6xIn7BbIVABdoaWp8DE5s2aRs8w1I2s7kNw9cM3aY0m0tLvE3C/j2lXgeRbio3mmWL
         lq7Z3g5JyVO+MBgjy+/hSQwyIwaSg48QzgrdBqOyHmpr6nS8oxGHGAlM0FH/jM8C0uum
         0ZPV9FPCqKqialzNVfQI86xwAB4/yQ12ApHeH7cKSUZeRzy7A6MvyONK2RUdyd1nS+Nd
         mVlEk0xT89NnPjJU1TBZ8wUfAhjw6VuyoxcxXnvYrAVtn5zXDposA0bGXn8xh9fDYLIu
         xCoowLYpqO3CpwOt47KvB1on80FpTtzYlvdUmoUuEwdSTLRjgdQhl+M6I/Oi763e4Q8U
         ymsw==
X-Gm-Message-State: AJIora/r7PzWvCJA+b1eOCaNi4mJzS4XLUMUXWmv+WyLlpzH9X/g8FVt
        yjINYV0ZW3bQtEnr4oYU3nvH/g==
X-Google-Smtp-Source: AGRyM1uXl2s7Akk5f7xlXiXmsBx1wbqbRqPDTlvwERbZp7pnN9o7vXDeIEsp8qtITl4tR0HL0nb1SA==
X-Received: by 2002:a05:6512:3b8d:b0:478:f9f3:962b with SMTP id g13-20020a0565123b8d00b00478f9f3962bmr6579960lfv.169.1655301580074;
        Wed, 15 Jun 2022 06:59:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z23-20020a2e8e97000000b0025530fa4edesm1694962ljk.49.2022.06.15.06.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 06:59:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 4/5] drm/msm/mdss: move is_mdp5 condition to msm_mdss_init
Date:   Wed, 15 Jun 2022 16:59:34 +0300
Message-Id: <20220615135935.87381-4-dmitry.baryshkov@linaro.org>
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

Move is_mdp5 check to a more logical place, to the msm_mdss_init(),
rather than getting it in the mdss_probe() and passing it then as an
argument.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index d81d8fe3584e..ce8ff5bfe55a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -329,8 +329,9 @@ static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct clk_bulk_d
 	return num_clocks;
 }
 
-static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5)
+static struct msm_mdss *msm_mdss_init(struct platform_device *pdev)
 {
+	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
 	struct msm_mdss *msm_mdss;
 	int ret;
 	int irq;
@@ -420,11 +421,10 @@ static const struct dev_pm_ops mdss_pm_ops = {
 static int mdss_probe(struct platform_device *pdev)
 {
 	struct msm_mdss *mdss;
-	bool is_mdp5 = of_device_is_compatible(pdev->dev.of_node, "qcom,mdss");
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	mdss = msm_mdss_init(pdev, is_mdp5);
+	mdss = msm_mdss_init(pdev);
 	if (IS_ERR(mdss))
 		return PTR_ERR(mdss);
 
-- 
2.35.1

