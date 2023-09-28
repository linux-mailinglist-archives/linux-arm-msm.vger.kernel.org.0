Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB8F7B1B37
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Sep 2023 13:36:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbjI1LgA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Sep 2023 07:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232002AbjI1Lf4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Sep 2023 07:35:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 658731AD
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:42 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-504b84d59cbso2489550e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Sep 2023 04:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695900940; x=1696505740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eb1RaFTPuOznsZqFGXUK4RnXqt+ysVjM/0XAAs1EH/E=;
        b=ua4q8f3XqTmy9pUe7zeMXAn3k4ADHGGBIPaRwqmxYU05107B85M0istvEJOlJXBvfK
         oqn2CZLQ/lxqUxmdJIELQsKF2jAFdi95B2g1X9YDdi924noxc6RtyA5p2Dud8z8+4iJA
         Ew2icoyB4TrYksdzBnQADDxpD+biLenkBEIV+ZXO+xEWoo2hhP9zPWd3ioBoqaWEUzpT
         fWK1ZkzF1hJ96L9+F04GNmJo31x/qLriXHtBU0qbL8Sfimzx9P9R9UqJ/hhbFAIu0Zdy
         yemt4XqpXIbpaKX8hZYBFF7WypIgSXP3oGnbbMEoYmkKDtoPG6VMSb6F014DARddEF9I
         wd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695900940; x=1696505740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eb1RaFTPuOznsZqFGXUK4RnXqt+ysVjM/0XAAs1EH/E=;
        b=mOhMmyHuAYuATrY57tI7rOTpkACAR2yXK0qEwY93tskcU2WZCud8QLQosubZ5zJPe9
         aZEgySbY0WD/tPHU0OM+mcsg7aXZKPJxrn2lsVZL5YsGrsgG8Solc+RV6U/zTy81p345
         MwwaJJue9Vk8tdRcXpWlCFK+W4zb5NGj1az7qD0Hi8ZYqd+aHN8fBmZmot6f3bpKts8g
         eQCWLpil6Z/008n1bi76hJTa9kHzX1XPLKGTyLSRoS650hGU/gymnMKidikyYtEL7PEe
         PwisJ549I8SXdJpjJHcBcVPqIVUwovVltvgLKe5Y5bPXFZ7TP4FUaGMwQlruUXo3615M
         HvgQ==
X-Gm-Message-State: AOJu0Yw5OEIlM8z5L3creHFAmd/UFLQ1Xue1y8k2IkHYUE8XgyMj6Z8y
        7cwurCprGp1A/YQHUByPNtqNzg==
X-Google-Smtp-Source: AGHT+IGBdkcRrvknuZD4d194L2ZCqUJBec7xmOjhz7SNrqyOHnIwOet6vWxOy+DCm82lEiZ0jer+KA==
X-Received: by 2002:a05:6512:617:b0:503:19d9:4b6f with SMTP id b23-20020a056512061700b0050319d94b6fmr859945lfe.0.1695900940716;
        Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a0565123d8e00b00504816564c7sm704327lfv.104.2023.09.28.04.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 04:35:40 -0700 (PDT)
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
Subject: [PATCH v3 5/6] drm/msm/mdss: inline msm_mdss_icc_request_bw()
Date:   Thu, 28 Sep 2023 14:35:34 +0300
Message-Id: <20230928113535.1217613-6-dmitry.baryshkov@linaro.org>
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

There are just two places where we set the bandwidth: in the resume and
in the suspend paths. Drop the wrapping function
msm_mdss_icc_request_bw() and call icc_set_bw() directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index ec8608e22b24..1a921e9107b1 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -66,14 +66,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
-{
-	int i;
-
-	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
-		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(bw));
-}
-
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
@@ -227,14 +219,15 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
 
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
-	int ret;
+	int ret, i;
 
 	/*
 	 * Several components have AXI clocks that can only be turned on if
 	 * the interconnect is enabled (non-zero bandwidth). Let's make sure
 	 * that the interconnects are at least at a minimum amount.
 	 */
-	msm_mdss_icc_request_bw(msm_mdss, MIN_IB_BW);
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, Bps_to_icc(MIN_IB_BW));
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -286,8 +279,12 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 
 static int msm_mdss_disable(struct msm_mdss *msm_mdss)
 {
+	int i;
+
 	clk_bulk_disable_unprepare(msm_mdss->num_clocks, msm_mdss->clocks);
-	msm_mdss_icc_request_bw(msm_mdss, 0);
+
+	for (i = 0; i < msm_mdss->num_mdp_paths; i++)
+		icc_set_bw(msm_mdss->mdp_path[i], 0, 0);
 
 	return 0;
 }
-- 
2.39.2

