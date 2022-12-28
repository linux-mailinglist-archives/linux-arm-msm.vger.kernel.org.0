Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBCD56586C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 21:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbiL1Uha (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 15:37:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiL1Uh3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 15:37:29 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63D3F165AE
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 12:37:28 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id cf42so25073267lfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 12:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vOB2BNWwETzT/PWHCgK09Lr+xKNMr+FYMdGX1/NYIf4=;
        b=ITwWd+cnVms/1qZLMTx0e8qwcxdLBnaYhvApgSSaqOdG0yEXQZWcKVw3+gAgDpVLOv
         kBoSlf2UJL8MqHlIwdVBrqjMS92UoxR44lWdnK2ymUlcRfxIJZ35t+xAg8QNfVFLCoPO
         SJQv3ZqXEjCK6G09tV0UGtB5XZEvHv9Er2e5s8sn3Z2KBjwRmsPSN6DlOUKyZdL2yoNA
         pmUKPyCUIuR7UEz/4QQieTP8NsqT5Mt2AJt6A0HwrbXZCFoXQ8f6bZE49MpJ5v58z7LQ
         MtymHSxAS1TsC34DKXthdu32az4JsoHbe6chqghxrY641o1VPH8yqKjv1j7+2eFN0BqV
         qQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vOB2BNWwETzT/PWHCgK09Lr+xKNMr+FYMdGX1/NYIf4=;
        b=jV6VUMa5RIfSBlUkeoej3F+3v2Kv8/m87AGlT9UHp5Dd3bCTmetdFLrnOWzXKQlJWB
         Lnb4mnCJW1QGib5bvi9/Cyo8S9yXeVBfRIkQaXw4OyNGTr4Squr7omfoPGEI4sGkslFh
         O07Vo/NkvFzENLGo9SWKJ882sgtgCf/1D7w7opFkI45SaWxaLXSClAj4V1YXlOjtrYt+
         5F/HTlK2mL4E4hKhMBDBJJiN3zE3HiC7TMlO2JcaOoBb/9JosUJ3Cd+izHfsaYlz11LP
         7n9Uq7KeG51gHv9b87/zt+vEnTwI9dZfHcFOgoMzZVyJfroxLE8uCoiuTnp3wDQqo5FZ
         Zw/Q==
X-Gm-Message-State: AFqh2krr4+//1FvSsuz/cbQTYgM8ttFedUICQ20J2ObobHKZd1hTS2tT
        +/UYt2YiiUC5TGQ9VglgpGMcTw==
X-Google-Smtp-Source: AMrXdXuS/KatGX8neuVw/gQsgIFmzTYk8oxfx2PTno/VuDgQ2BFGZAMdbHV4mxJY5LkrOH4qID9SOw==
X-Received: by 2002:a19:7513:0:b0:4b0:38f1:1266 with SMTP id y19-20020a197513000000b004b038f11266mr9797142lfe.34.1672259846766;
        Wed, 28 Dec 2022 12:37:26 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id j4-20020a056512344400b004cb0dfe4993sm943001lfr.65.2022.12.28.12.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 12:37:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-msm8974: switch from sleep_clk_src to sleep_clk
Date:   Wed, 28 Dec 2022 22:37:25 +0200
Message-Id: <20221228203725.3131237-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
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

gcc-msm8974 uses the registered sleep_clk_src clock, which is just a 1:1
fixed factor clock register on top of the board's sleep_clk. Switch the
driver to use the board sleep_clk directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8974.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index 025cc9a20dbb..0231c1efd286 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -2110,7 +2110,7 @@ static struct clk_branch gcc_sdcc1_cdccal_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_cdccal_sleep_clk",
 			.parent_data = (const struct clk_parent_data[]){
-				{ .fw_name = "sleep_clk", .name = "sleep_clk_src" }
+				{ .fw_name = "sleep_clk", .name = "sleep_clk" }
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2275,7 +2275,7 @@ static struct clk_branch gcc_usb2a_phy_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2a_phy_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "sleep_clk", .name = "sleep_clk_src",
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2291,7 +2291,7 @@ static struct clk_branch gcc_usb2b_phy_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2b_phy_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "sleep_clk", .name = "sleep_clk_src",
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2341,7 +2341,7 @@ static struct clk_branch gcc_usb30_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "sleep_clk", .name = "sleep_clk_src",
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2440,7 +2440,7 @@ static struct clk_branch gcc_usb_hsic_io_cal_sleep_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hsic_io_cal_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "sleep_clk", .name = "sleep_clk_src",
+				.fw_name = "sleep_clk", .name = "sleep_clk",
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
-- 
2.39.0

