Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC087B1B35
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbjI1LgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232000AbjI1Lf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:35:56 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABCF61AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:41 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5041d6d8b10so21200590e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695900940; x=1696505740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hyrq/9p6a7w92czNof0YScrpnYZ5+Pk4V0jGoWuhplI=;
        b=WG8vpb7VPwsbO77y8ei9rJMeaVPufyHXFHFucBSdDXkjCgYlO4dAWJMa9uuv0B55V6
         jd1TDyv5fslCCepYwfkEpCF34ng4DI7L1XQuiujmQ/bUBZ1quYoK7I1C6/tLuPGbcoSC
         ox0FSNEOgSe1AQm+VwmqcLdkd6GmWivQoZtR5Axqxi7tUJAVU+kSgiQtOC11MkIDh6H5
         ikSML8yqyzYDUXHdHP3lhQt1u5QoAhaxLYUcJleW9dta2LYNxVaeueQmgE6XdXtwG1lv
         c1L97buANISX0/69295eOTLeOo+IjH8X1Wx/TsChi/AMHQhH+Q5sJFIIXPM75A4e5pbl
         uK4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695900940; x=1696505740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hyrq/9p6a7w92czNof0YScrpnYZ5+Pk4V0jGoWuhplI=;
        b=dPm24bhaU47WT6EnnuwNxiLhamSjkbwb7b8Wm+GpqthwEx0JOjPvOvgEcDmlufDGga
         Ltsy0Ba9IFrnquxCVeMkrq2Nd+8A+28ZPMt7EQiEKvRgG40pbARMZP4GcsjeCbZdhrUx
         kG8Vlhhn0cgaxKRqify9sWmoigJBT5d/JSPkp0vArL0tPlAVxbkGJBMdGwnUmHFTYIc/
         xlpNIvoznwt+FlBVjcOay2V9J4dVXLidoJmMqAT/9XnDIkvIXajzSDu9fY4Uq6ZvjpJs
         2SYpkA50wVjh4zIlMJI3izpUkiStLVZdltHtJ0iH6gGBIsWZJhS6cds1BotG5H6rs6Cb
         Km1w==
X-Gm-Message-State: AOJu0Yw/jtwW57MPv4N+giwuqZw2xODE33OztrI0rJKLjwwOSwstITmm
        GrVX74aL9O3yi2aceT4bjy+sypv8XHVyfhMhEqsSOg==
X-Google-Smtp-Source: AGHT+IFaGDPZIgBROMCTUU7PTRhS1yzBK8TkZGSmBXT8o3kbeOM+J46ZFMC6mXAkSe2H9k0hev+HyQ==
X-Received: by 2002:a05:6512:3d0b:b0:4fe:2f8a:457e with SMTP id d11-20020a0565123d0b00b004fe2f8a457emr1000044lfv.43.1695900939987;
        Thu, 28 Sep 2023 04:35:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:35:39 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3 4/6] drm/msm/mdss: Rename path references to mdp_path
Date:   Thu, 28 Sep 2023 14:35:33 +0300
Message-Id: <20230928113535.1217613-5-dmitry.baryshkov@linaro.org>
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
index 75ec5e89894d..ec8608e22b24 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -40,8 +40,8 @@ struct msm_mdss {
 		struct irq_domain *domain;
 	} irq_controller;
 	const struct msm_mdss_data *mdss_data;
-	struct icc_path *path[2];
-	u32 num_paths;
+	struct icc_path *mdp_path[2];
+	u32 num_mdp_paths;
 };
 
 static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
@@ -54,13 +54,13 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
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
@@ -70,8 +70,8 @@ static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
 
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_set_bw(msm_mdss->path[i], 0, Bps_to_icc(bw));
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
 }
 
 static void msm_mdss_irq(struct irq_desc *desc)
-- 
2.39.2

