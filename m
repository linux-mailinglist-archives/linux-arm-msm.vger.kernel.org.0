Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA6617B1B36
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbjI1Lf7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbjI1Lf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:35:56 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F122A193
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50306b2920dso15273629e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695900939; x=1696505739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mwojS2vRgU0By0A79lo56wad98V4s7w+Z/gFSHxlY0=;
        b=d7E8ae6DNkAKNGymBsxxdd0v8MOKO2B0C+5h91xjpy8CQV7szQ0cQA1vG96DUU/ejo
         3n57/Cu52+cwr1nS3riws2zTrAvqpEZnSLFP5cn0X7LeQT3JG45kvo09pjIHPsfFUI9k
         8PtW4rPqTM96M/miDYmxm0T/jkzpfrmRPZIwsOsVNs82xveAtNrDT9BCaDjXD1T6PbZV
         gZJ0wztJAMYum38BSfsfOeM8mU8lD0St0Ja3pZNepIugqlr1Fu6/GR5drp5yceJRAm9/
         Hxdh7UGA/FWgyrm0iz4VHl+UAlbdXufEag/wKiB7PhorXrBMnPIv+mH6DnRbpaFYxtKH
         LCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695900939; x=1696505739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6mwojS2vRgU0By0A79lo56wad98V4s7w+Z/gFSHxlY0=;
        b=obXgxavwJwNFYGgIhoCTgVVlBaz+34ZEsQBQSlAsDRL1IrZedq6HgVJNl7BALgkdBn
         U/fkOHg/07uwq7TwU1K+xpzmQhvi9TS23I+tNrNKGs1nSlqpOBzazF05rFkdTUbuZscQ
         3BuyAICa2Mq4GRUrT+iU06L+EV6S9++KxPLNkXx61iFFmk99FXUdapxq8YMMkTOl7rf3
         F/yz4tG+UKYwhvPcUlEOCt/qa2WzgjAV3FaqKc2NvXPEZEI2VFNcdE+hkr4vePZnzUrw
         56PzNDSiQ30njIJOfYmWnQ2rJpNq30vhViMRO5giy9CvQGaKqMyAog5CAYZ2iLPGstS1
         zfRg==
X-Gm-Message-State: AOJu0YxZ+pY/hoFLAeHIdgzZ/s/i5PLlBKjqsivdEuB6FgG+U7QDVdc3
        HRHgHEK53js2wHdQrkW5kIk8LQ==
X-Google-Smtp-Source: AGHT+IHvXf5uuypVZ4LAbgpB3n1z9XFnN75tDbFJjU9l5WICLaMnfHsa2E/yVUF65Vdt1MyquEL71Q==
X-Received: by 2002:a05:6512:3714:b0:503:2567:c42f with SMTP id z20-20020a056512371400b005032567c42fmr681831lfr.0.1695900939293;
        Thu, 28 Sep 2023 04:35:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:35:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v3 3/6] drm/msm/mdss: switch mdss to use devm_of_icc_get()
Date:   Thu, 28 Sep 2023 14:35:32 +0300
Message-Id: <20230928113535.1217613-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
References: <20230928113535.1217613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Stop using hand-written reset function for ICC release, use
devm_of_icc_get() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 2e87dd6cb17b..75ec5e89894d 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -50,14 +50,14 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	struct icc_path *path0;
 	struct icc_path *path1;
 
-	path0 = of_icc_get(dev, "mdp0-mem");
+	path0 = devm_of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
 	msm_mdss->path[0] = path0;
 	msm_mdss->num_paths = 1;
 
-	path1 = of_icc_get(dev, "mdp1-mem");
+	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
 		msm_mdss->path[1] = path1;
 		msm_mdss->num_paths++;
@@ -66,15 +66,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_put_icc_path(void *data)
-{
-	struct msm_mdss *msm_mdss = data;
-	int i;
-
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_put(msm_mdss->path[i]);
-}
-
 static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
@@ -391,9 +382,6 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
 
 	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = devm_add_action_or_reset(&pdev->dev, msm_mdss_put_icc_path, msm_mdss);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.39.2

