Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D59765C277
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238003AbjACOzy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237947AbjACOzg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:36 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E071FD37
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:32 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id i19so19163334ljg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHb2vG/zHJu2ft1PmGfbVVwers8XZhZ9ShHXWJI54JQ=;
        b=l/XkdR7ikpP4dx2SzvkusCfMHk+JXZgRyKWmtBjOMAmFw0CbMSUHosoGteyaJ7s5IS
         OQFv6q/hFMxGXL5q038aTawH2VzRDut83CezaQ0VPlmhy6ry1ydFtMVYIUtIBbPkhLXP
         GW3pSC0G9MRwxT/a9zJfMMD3VQoQlrxZMEz0K2Zb4PtuzfVJf2C51jE1JUwX6Y3Eue0X
         nvp0xPDapYkpRr3ywi+1hPN3JAVqJNxi2dWKODoerJjgG7cD5HIzdQ37aZRUUewtiQfG
         MwMn3ovFi0SxILkVjncdV7naMd9jqodfKoKGc5fsziGE716TzVAwOyFNH+buNGFmgDiB
         UXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHb2vG/zHJu2ft1PmGfbVVwers8XZhZ9ShHXWJI54JQ=;
        b=0yRWhtaLkTnxMQgrLALO6HygpNJ3mAQAR/SQas3Vzp3IaEzU6SQbLfxLFHRa3Fcneb
         LzqLb+ZAnD0hSqTHmAcmNfjCYuEvTXlGhU5gWlAvewtzYOcW1COOjPVU9KgZDH/sRGlI
         Gu5J41qjN7bRLZwk+D1zbuIqzCZn++WT+a5+1ugSgTkeFqq14iH5uWJ5cuqVT9g4uMhI
         kdBBsle+YYoGQLPY00rq7GlZXQlNNOjVkM2NFhAYsV0WNAapkbRcnbDTx04FqWH7uBVk
         ObbnJPGrUQfcIMqO1Xp537aRKANw9dQmcNZ3TWJ2MVgk2k690fKCE/gBFWA1KAM4YgaB
         2I6g==
X-Gm-Message-State: AFqh2kpJjviE8X7v0kEuVyOIfsv9YIkJ7EKXCrRl9bpTy7AyVaAxWM8F
        DYPWRJAvX12qDxv97G8YrcaYrnqhx6g+ICG1
X-Google-Smtp-Source: AMrXdXtjP8LO81VAk4mOgDLYr9fsMR7aO1WciAD7zGPbhDVIqne5LiUnRCycPxnncb5c5Dsfu6OHdw==
X-Received: by 2002:a05:651c:b25:b0:280:117:c82a with SMTP id b37-20020a05651c0b2500b002800117c82amr429697ljr.39.1672757731968;
        Tue, 03 Jan 2023 06:55:31 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 15/21] clk: qcom: gpucc-msm8998: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:09 +0200
Message-Id: <20230103145515.1164020-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
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

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-msm8998.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-msm8998.c b/drivers/clk/qcom/gpucc-msm8998.c
index a925ac90018d..f929e0f2333f 100644
--- a/drivers/clk/qcom/gpucc-msm8998.c
+++ b/drivers/clk/qcom/gpucc-msm8998.c
@@ -106,9 +106,9 @@ static const struct parent_map gpu_xo_gpupll0_map[] = {
 	{ P_GPUPLL0_OUT_EVEN, 1 },
 };
 
-static const struct clk_parent_data gpu_xo_gpupll0[] = {
-	{ .hw = &gpucc_cxo_clk.clkr.hw },
-	{ .hw = &gpupll0_out_even.clkr.hw },
+static const struct clk_hw *gpu_xo_gpupll0[] = {
+	&gpucc_cxo_clk.clkr.hw,
+	&gpupll0_out_even.clkr.hw,
 };
 
 static const struct freq_tbl ftbl_rbcpr_clk_src[] = {
@@ -142,7 +142,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	.freq_tbl = ftbl_gfx3d_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
-		.parent_data = gpu_xo_gpupll0,
+		.parent_hws = gpu_xo_gpupll0,
 		.num_parents = ARRAY_SIZE(gpu_xo_gpupll0),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
-- 
2.39.0

