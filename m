Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC9765C258
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:55:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233392AbjACOzW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233465AbjACOzV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:21 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CE0FCFF
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:19 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id i19so19162521ljg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+f7Q8Ej3DlZV14zViS3TK1LhXbsnOpnbgzTShiMYtUo=;
        b=kOpnFoqwOXUm15m9UsWg8qqIPy1lchV8PahHl+myh1yYFZsT3oymenK9XD3AurTCgh
         z0M/dGN+1we4/WYbqXcsrIwyO71XT3DM26k+ONAHXz3v3MH6t8D0L+mICoIWVAMX2uWH
         Ytjy2CiRQ8g+I3zmHGG67LO/BDx1ViLcMQfo7LX4T8xh9eA36Q2bsV3RWTCxux+PlzR0
         y9KdK5FBB2Cdb8RJ592+/RrHoqpc2CZH/AE0ON9kpFdqvtPZ98VhuTXDxWwuNZODoNW7
         2sTeR72xL2+2Co9kaoLm35xiKO1wrc6UcaooP4Q0sX47kvhOZDhE7u391kQkX3znx1Kg
         UjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+f7Q8Ej3DlZV14zViS3TK1LhXbsnOpnbgzTShiMYtUo=;
        b=upzznLOmNzrXeXIHJwYO7ckTlczwbXHvhfAUYdLBHRjr+LdxOPbmcl0x2tXPp21Ed+
         yO9IojN7GFjeZKoM2SCF3/Z4KboxGRC7wtC7CN3crHZmB6V5xDOAZlO88D6/jFq38j8d
         Dt+WHMngd8WErBbH/AqBQKWY2EI5qNOXZhzfZj87wMadMwbUCh3QDHa/H62xIJgBmJVU
         LEGCodc8bqyvfHiHvfxgTsBMO6JIUU30UdmU2/U0+1tMH2vIN/AAoS3zbt5eaJIrVA6X
         VD/bGaxYoWTodvKBemYffPSJQ+FpSpKOkBNDeV7bOagX/Lq+/4TSONmbHcm1wq5U9oZc
         vBKA==
X-Gm-Message-State: AFqh2kp0BEz1vKND75NagXSM08dACFA/F4xdid8w9K1bfl+BvpSRWlv4
        BM9Cf1BIaDJJb/QdK2ruQHnwcQ==
X-Google-Smtp-Source: AMrXdXsX6s1looOAXWapnq1IcI5oIVK61gr3g9y7cEAS8lacYhVc/l+ue7CwWCY2sOdTXcJpPt9yTA==
X-Received: by 2002:a2e:b0e4:0:b0:27f:b636:94a1 with SMTP id h4-20020a2eb0e4000000b0027fb63694a1mr8869423ljl.21.1672757718236;
        Tue, 03 Jan 2023 06:55:18 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 02/21] clk: qcom: dispcc-sc7180: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:54:56 +0200
Message-Id: <20230103145515.1164020-3-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sc7180.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 5d2ae297e741..9536bfc72a43 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -351,8 +351,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_byte0_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_byte0_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
@@ -365,8 +365,8 @@ static struct clk_regmap_div disp_cc_mdss_dp_link_div_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "disp_cc_mdss_dp_link_div_clk_src",
-		.parent_data = &(const struct clk_parent_data){
-			.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw
+		.parent_hws = (const struct clk_hw*[]) {
+			&disp_cc_mdss_dp_link_clk_src.clkr.hw,
 		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
-- 
2.39.0

