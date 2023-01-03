Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D0F665C286
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238029AbjACO4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:56:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237980AbjACOzq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:46 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46C712095
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:34 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id v23so21934762ljj.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1Ir0b4PZio2nDCOf1eY2zl+qNhlaS9l7NxQ5I3uq+M=;
        b=FNLxKFHNex/PXUVh7X3uHGO5LoJ79Xze4mQaJjtvJ+YY0RBWtEUgrVy0RMUqxE2cMS
         bIB3/GGdE6YiyPzvy+Opl7u6bTzRZ5+F6pjJjxbb/sxhtlYnC9J3JBxi9QIIbbkaZg3a
         +tMGwPOXbT1FDl2B2oWgCjkZySea/ddlKZcrJxjl3R7rKDnKrYhpuXdD9OrdfTIieJUH
         LtqY6uJtvvoHN1qOOFzDPKfygkakT4n1J7LQDwxNMKdhNei3C1zvIB9lhUvBEtqifmpS
         jgs83hngP3ZvTP8uBqT6NKuXv+dpVcQfSMISmqEqjmxrH1JloDW58MnL2y6+0NTmMknt
         1f2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1Ir0b4PZio2nDCOf1eY2zl+qNhlaS9l7NxQ5I3uq+M=;
        b=2KzNWYuEnIzH2jJs9pL2T//5VmsHULQSRCCg5WcG0Iw7VnyXBTduy2GC2FJDcYXNYM
         KafRH6fjMCG5qJFfhyPZbF1qIUpgIehEplAMHdFCCrQMLXHCgfLY5+o0pyGJ8NVa3V8r
         AfnLcD/tmfVWYO9YruLYmzwjTfH5fOKxch18shImL+Y2vldVX/+qN9/BdXQ6EXxsORed
         I+v+2LtBEAYOzimxnwV4fgttWDPPJWnD+xWfWSJLLV3JcADbhIhuwN4HJaUN037p/On3
         o5Qu4kOYSCjC5MlxkNavhwbkTvBGl2KHE0dAmzZbUNlMyX2eV4ey9oef8xNPTesR18Bi
         pUDw==
X-Gm-Message-State: AFqh2kqLJ2MqSW/lgltYUQJYDkwqLK+uFnLRjg+0MMPqWPZWFq4jokx6
        nvUxi0MqeERQwwntrxD+A4KLbnydDxtT9teA
X-Google-Smtp-Source: AMrXdXs9MLgpc6BrlAvCj3EfLrkU8QUIly6/8gnUkZurNFcJqEqyCrYUm2hjah75AJYaDWaaJ4tK5w==
X-Received: by 2002:a2e:a54d:0:b0:27f:c95e:7619 with SMTP id e13-20020a2ea54d000000b0027fc95e7619mr8486125ljn.13.1672757734281;
        Tue, 03 Jan 2023 06:55:34 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:33 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 17/21] clk: qcom: lpasscc-sc7180: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:11 +0200
Message-Id: <20230103145515.1164020-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
References: <20230103145515.1164020-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change several entries of parent_data to use parent_hws instead, which
results in slightly more ovbious code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/lpasscorecc-sc7180.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index 33ed91c67e1c..010867dcc2ef 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -93,8 +93,8 @@ static struct clk_alpha_pll_postdiv lpass_lpaaudio_dig_pll_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "lpass_lpaaudio_dig_pll_out_odd",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &lpass_lpaaudio_dig_pll.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&lpass_lpaaudio_dig_pll.clkr.hw,
 		},
 		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
@@ -210,8 +210,8 @@ static struct clk_branch lpass_audio_core_ext_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "lpass_audio_core_ext_mclk0_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &ext_mclk0_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&ext_mclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -230,8 +230,8 @@ static struct clk_branch lpass_audio_core_lpaif_pri_ibit_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "lpass_audio_core_lpaif_pri_ibit_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &lpaif_pri_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&lpaif_pri_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -250,8 +250,8 @@ static struct clk_branch lpass_audio_core_lpaif_sec_ibit_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "lpass_audio_core_lpaif_sec_ibit_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &lpaif_sec_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&lpaif_sec_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -270,8 +270,8 @@ static struct clk_branch lpass_audio_core_sysnoc_mport_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "lpass_audio_core_sysnoc_mport_core_clk",
-			.parent_data = &(const struct clk_parent_data){
-				.hw = &core_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

