Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEC0F54CAA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 16:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355510AbiFOOAK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 10:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355248AbiFOOAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 10:00:01 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D971F4160B
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 20so19035114lfz.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 06:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ESJKapWNnw8tw1fCS4q6ugXslWZGCzhXQrREzvrDX9A=;
        b=mlHWN7WMxxt1qnpdtMUUAzh4kLmqQZlbcE3yEaIPgSq7bw+wcj2+u0KnWMG6UvXnxj
         SGEAmmYaINLO4Twb6oUTiKUMSkgMbQ9BY7JQvuXOK1TmirS2++Vf41hP896BGzyGt5mR
         6hOPqYBYSxkQCbAdddof/6Hl/0tcIawUC1SLzEG64c8YpUzxfeq6unLEbTlT0Ciux/1H
         dDxSuEmptUvTIAAeCwPAtSGZJFV9fvbxzJcuW54uPsbuhoALsrup0sbiBWiGzLEIMgXv
         U1S7vxMgtE0Qivb7LTzSP+UdAqA08UegxZe8bweuWX67JxkoMk2DC3kX1+bJUw2w1gEK
         13Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ESJKapWNnw8tw1fCS4q6ugXslWZGCzhXQrREzvrDX9A=;
        b=UrtDZGFufg4maPEahILhXVL0ef1dYy7/RMmffDw7t/g5DxGy/BDmCCntpIIi5yiup+
         LaPNT9Q3eN8C3FOwog2PxoiH4KI+C6hgAW7Dq83lId6sxVxg4Kmtf/dRFW0OI1fg6VLe
         hdmdec6gsJlHTixzwvwwAoSZuGr/O7F+PmKywTOS4LSdC4QMkgIHRKhM5qhpgtzK2ZdI
         Wt+KayIaRNykHkQFENfA9J7OCcS85Td6bp3n9QdzOjRUH+I3YqsKYFWgJasCFavjO8Nf
         OEAxgl7qeLr2FY2+/UQRBc2qDJdEvsaBOTJF4YazOPi16j88/M3py3JlQf+cknZ6QEs8
         hTRw==
X-Gm-Message-State: AJIora8DRla8ESlI7rx9baK1hy6z62n54gzi5+OQCDJ0/s1abLwidoc7
        i34EhvrY+B7Skh+YZHXdUuIw5zW7uhxgVfXG
X-Google-Smtp-Source: AGRyM1sZ1VgoM4AmEjYKT5MIQE/MAC9Lf8h2/BsOzxicN29oYsvzMkY3Cxb2IYT7Ds5RdmwC6UwG7g==
X-Received: by 2002:a05:6512:e95:b0:479:1087:2eaf with SMTP id bi21-20020a0565120e9500b0047910872eafmr6286782lfb.274.1655301579194;
        Wed, 15 Jun 2022 06:59:39 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z23-20020a2e8e97000000b0025530fa4edesm1694962ljk.49.2022.06.15.06.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 06:59:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 3/5] drm/msm/mdss: check for core clk before accessing HW_REV
Date:   Wed, 15 Jun 2022 16:59:33 +0300
Message-Id: <20220615135935.87381-3-dmitry.baryshkov@linaro.org>
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

Rather than checking whether the platform is an mdp5 or dpu platform,
check if the MDP_CLK is provided or not before trying to access HW_REV
(and skip reading the registers if the clock is not provided by the DT).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index f7b4628986b8..d81d8fe3584e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -32,7 +32,6 @@ struct msm_mdss {
 	void __iomem *mmio;
 	struct clk_bulk_data *clocks;
 	size_t num_clocks;
-	bool is_mdp5;
 	struct {
 		unsigned long enabled_mask;
 		struct irq_domain *domain;
@@ -186,6 +185,19 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
 	}
 }
 
+static bool msm_mdss_has_clock(struct msm_mdss *msm_mdss, const char *name)
+{
+	unsigned int i;
+
+	for (i = 0; i < msm_mdss->num_clocks; i++) {
+		if (!strcmp(msm_mdss->clocks[i].id, name) &&
+		    msm_mdss->clocks[i].clk)
+			return true;
+	}
+
+	return false;
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
@@ -198,10 +210,11 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	}
 
 	/*
-	 * HW_REV requires MDSS_MDP_CLK, which is not enabled by the mdss on
-	 * mdp5 hardware. Skip reading it for now.
+	 * HW_REV requires MDSS_MDP_CLK, which is not used for MDSS device in
+	 * older device trees. Skip accessing registers if the clock is not
+	 * present.
 	 */
-	if (msm_mdss->is_mdp5)
+	if (!msm_mdss_has_clock(msm_mdss, "core"))
 		return 0;
 
 	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
@@ -345,7 +358,6 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 		return ERR_PTR(ret);
 	}
 	msm_mdss->num_clocks = ret;
-	msm_mdss->is_mdp5 = is_mdp5;
 
 	msm_mdss->dev = &pdev->dev;
 
-- 
2.35.1

