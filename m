Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6C465C264
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jan 2023 15:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238006AbjACOz5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Jan 2023 09:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237821AbjACOzp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Jan 2023 09:55:45 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5972F10FF1
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jan 2023 06:55:33 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id p2so16489565ljn.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jan 2023 06:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxOVthWvasXwb6F3Ds1yi8gGSGtlriHch0mVVF3XhDs=;
        b=oyD4NTrit1F+IOegSp1pbZgnwq/drcgx7Pb9rLU05AiVAtVb656b9Tc/LS+ag7MG3s
         0W5VroR3jL7NflnfGobFkp4Df79vLhQb5oY3+2n7NrbvyeCK++IgpJkBpulRxKJJpEXq
         Ft06fHBq0CZr4VSEF0XHpYa77PC0tIebyQFHB99eQ0mGYJtmAzVQAaKOEHq8rOxaOAQn
         6sPutq6vb+D8jj25shdNGsqwu+qu6tl9upCg8bukrvgNqR/w0ZfThT/ll2CAO+hxg1DM
         cQHu8NAGZnpKgXc2cuurFjshbD2vZSTJMWoMS88/5aNCfaotycncDCnDORQeRcdrTTQV
         vfrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxOVthWvasXwb6F3Ds1yi8gGSGtlriHch0mVVF3XhDs=;
        b=uClRkl+ArxCfXaa8N6YZ9v3WWn8vbxtT8frHhc/P+xyZTZawPjMSUFQJWOBGIQy2dt
         AaAULJ87KUQ3R8YuFWeUSJr8mYQ5oDTiS/IQFUql3kxgoMttP855gnDmUrp/srCDXkjY
         EWlrWfZCtxxRr3vjb7OVNDjuEwhMqIiET4TLcI5sBb+FKUtN/M7Ekl2No8jhgqVGSVHa
         tcN6h8bmLRyGm88jxkF4fgc5qzDBWhermlzs1abP659IDj+PiuxfHgjyN4h9sJQ7Ey1U
         SeROYP6tZuc7LNIdDAShhzElh0xrrf1zwjWPHEQphOCX5xK9XHGinNUXKDz+0R/f3QkN
         e0kw==
X-Gm-Message-State: AFqh2kq3/aq65VPnvW1kkarDHHrL04VNJXCBAqaFi/KmjONq9nJ9+ECe
        Xc3qO9At6XPY6uXd2AUmOlbPhg==
X-Google-Smtp-Source: AMrXdXtwPePeGfh7VCC9gBqhPB7mIpYupKRbQaT2M5ap96vUN4yH59N7VBU5kXlaH3YyDc4amdDHjg==
X-Received: by 2002:a2e:b16c:0:b0:27f:d80a:b7bf with SMTP id a12-20020a2eb16c000000b0027fd80ab7bfmr4558683ljm.35.1672757732930;
        Tue, 03 Jan 2023 06:55:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3544015ljn.30.2023.01.03.06.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:55:32 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 16/21] clk: qcom: gpucc-sc7180: switch to parent_hws
Date:   Tue,  3 Jan 2023 16:55:10 +0200
Message-Id: <20230103145515.1164020-17-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gpucc-sc7180.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
index d738251cba17..c0b2c7af5f93 100644
--- a/drivers/clk/qcom/gpucc-sc7180.c
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -108,8 +108,8 @@ static struct clk_branch gpu_cc_cx_gmu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_cc_cx_gmu_clk",
-			.parent_data =  &(const struct clk_parent_data){
-				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			.parent_hws = (const struct clk_hw*[]) {
+				&gpu_cc_gmu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

