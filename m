Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 764F36A97C1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjCCM5k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229699AbjCCM5g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:36 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 694975FE81
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:34 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id i28so3541620lfv.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
        b=dQ3kq2F7RnY3i897+kT4TuTTExsNuUx95xfa6b+Z+A1IqNlmhtfRxE4LMqP6D2RPrU
         SCFy2oItL/Q5QZxLdtTHvXdcyACJdJ8NXX7JQJttR5SitOKre2woe10tw4eymRsKhxeM
         /Ou58GzyDT48QzxuL01Il3h2m9cyDyCL1QCxZVKBVuy122L+mpUHaacs3anbeoV2iTgM
         kAFaxQRXLyv2JoppUjf0pB9LszovTP2SspCPjxFdA62AxolAVihVN9/1JVuOs51Isw98
         VItYoYYHY6cUN51BVUfesb3CZvYXUn18OQqs7wRIAAiMN8oBc540wzkICNMNjr7gAYc4
         m49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
        b=IXmSIOX51f9uIniIc91Ecdzej5PE3y19RHrOuvNrRrAbiY218zJUY+7ww4/OGPhY6j
         f6HVMsikgIi4zJQNofN2RdneakE9kC+brwmbt3fcEezcamtoHGXijzGP4ln87mgTyEzY
         2FlUB4KDgwkIBrpZnz8OLB9E5KXC8jGLfqUkFP7J5FaYXG97S91Bzjjt98k4MAOnZp4i
         mbbt5K/LqFTJFzFWWTqV0jASSzC01Kw8Y9qtyaiODmCxeRaqiy1zq3ta2WLCh53ph6ed
         KOfhgWhSqXddfQb8qX8KOhYpTKeyw8khlzX/gPi+bhJYDinAM/wKonMFK6XH1XHasdmt
         xZwA==
X-Gm-Message-State: AO0yUKU5ucYhZHVgJYAehqY937KG3jKUxHAxkQ3GGfaZJLcOr8mXjX9B
        LxeJzGK6Sg8kRv3hV8ovsztoPw==
X-Google-Smtp-Source: AK7set8Lj99QXeAeIb1sW51QtD/bk7y1+w/X6ua6qtkuHRMTIQXtZz8NW4gDQ6Y0nVlGq/EYykTGFA==
X-Received: by 2002:a19:5519:0:b0:4db:3847:12f0 with SMTP id n25-20020a195519000000b004db384712f0mr598153lfe.50.1677848252790;
        Fri, 03 Mar 2023 04:57:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 10/30] drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid fill
Date:   Fri,  3 Mar 2023 14:57:05 +0200
Message-Id: <20230303125725.3695011-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3030cd3b253a..0a43c5682b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.39.2

