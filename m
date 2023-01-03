Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A6E965C278
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237964AbjACOz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237687AbjACOzX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:23 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8CAFD16
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:21 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id u12so28371382ljj.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Blotrti0ge/4Qx87QAt1BInr5zZfEl1NfBEa60STC2c=;
        b=pjS6LufsM2bG7VD3mO60vlYQY1iyPLGx4suMUisX/Qx5iP/ksDtuEfbf0YQTlxvPAW
         xw7KouJgXQL0BKSo/ZPMLH0+NZTgqY3l8XlqKDbKngAwWKurTzllm4hogjAgMjY1NO8c
         mZlDPYA2QC1fNOJJIZh0mjq9NsNoYYYKNBasZoBMTU5+JCOMkpO0Opa0fIqewwpZRm8S
         4sM5YfJ6HYdmtqpbZVPWWeWi5sgcX2wMtTLdyrkd7rMgx+9RWB1ldoUMHE+Ol69rILx0
         /U/+J+1OacPpMMxqKmfSvM70tMxuXxdomM+SNimibhGV12rImnJRq454nFehlSZliSJi
         VuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Blotrti0ge/4Qx87QAt1BInr5zZfEl1NfBEa60STC2c=;
        b=wSrNQ78Ip/fKlOSoIByon1t8//GxQepunWb8uMnPA4vDwA3xqYMdSY5f3wvhzcLBCg
         H4FA+xwVxsSlkdDH7BE3wqtZERybTiRzfMnIn7fs8o1p09+4bg52SyCTMbTAvyPf2QBW
         kzxgIN8hlKiGPvzC9UAgMDDRP6qt4eL5fcMA9yQVQwvePM5OwWskAjLMvnpQE8Dk7yzO
         tcooxG+mVKyakoBBOSSUyw67jyjKhwL4BZQRp1k2mgKhVYEP8VPGRabw6tIriXSJ29tT
         a5y5As/AW7lhCZ1syP7gn9pSH3Gnp6h/baSVVptRMOb7jpBIrZ7esfXJvQGa5z0mEJIA
         FYlQ==
X-Gm-Message-State: AFqh2kpPQxVjsjNkMrZjj4sYk5MjTNLI3BxF7DfsGpNMO7elNSaZ0CrS
        duorx3s0wCoBJi1+YoGRj5Nz50CQSnd/TT9q
X-Google-Smtp-Source: AMrXdXsdPi2eY33kbYrPZyfTvVMpiOXQpYXyiRtWklqA6siDuvNAg3rD2wjrf7/3XlHn6EQXLtkgeQ==
X-Received: by 2002:a2e:3111:0:b0:27f:d8c9:3f30 with SMTP id x17-20020a2e3111000000b0027fd8c93f30mr4783454ljx.45.1672757720150;
        Tue, 03 Jan 2023 06:55:20 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 03/21] clk: qcom: dispcc-sm6375: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:54:57 +0200
Message-Id: <20230103145515.1164020-4-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sm6375.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm6375.c b/drivers/clk/qcom/dispcc-sm6375.c
index 5ce9198ad611..caa1b90a5ff2 100644
--- a/drivers/clk/qcom/dispcc-sm6375.c
+++ b/drivers/clk/qcom/dispcc-sm6375.c
@@ -252,8 +252,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_byte0_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
-- 
2.39.0

