Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E743649052
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 20:07:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbiLJTHS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 14:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbiLJTHQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 14:07:16 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56AFDF42
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:07:15 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id x11so8384332ljh.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Dec 2022 11:07:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WGA3CE1U6R6bJ/377jev2Um8kAhck2W0ep0wN2HF6s=;
        b=k/XiHFjXATVRZi8jK9CRKg/tT5rAv3ADytboTWHeaJhOvNEH70ISUs+129IdQw0Q6/
         twivCw38QMOLD0TbbCbHWp5vFSIntOm8Hl1jkr7M3oKl5WhS4o+WOdt+keEAKwZQ8sPI
         8Y70ZH9y0MKe/e/mPwUMECEN8cgVSHl38NnQlKqZsOMOo3hkH3+7i98/KZGViPMryxpx
         4dANqhuqJvhYKvz8g/7SmNGXYDChFKMcJKPCr2FupaAjtU3fvp6H+E0Cbb611EIeusqC
         0PHbJOG7+EB/qdoMQxJXZXHuC81EEOb2YsvSp+ZTtG5ZcII4o/Bka4UBQw+htyqcmbVn
         jpDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WGA3CE1U6R6bJ/377jev2Um8kAhck2W0ep0wN2HF6s=;
        b=fEwLvMOKYirhTEg74E6eN4VStxBsfjfUGP61eckMPfZvDi1OxQvbCKiY+tMrHaezR7
         KYlp6YiLR17zPBO5/PJrxiKOGuUZg1dgN3SfrHf3nrZdVe9W/yLlBvIfCIdCPAdxsqnL
         XSanrUGV1LJw1WHqSEJY6IQsfcXjvJqRFvhOq23kjP9gEg4dObTeFP67HdifslkEdJr/
         UaigDKeXN4Yoxe1lamtBm2N8HkTp9TZKh+8qEDlyHe3OBhaBa2w85JLvJUuCiPA8yQ/d
         LkpWaethupJ9jXnmeLS/BgKZTjkbkSMSUfxCpxICJT7OjyO+6CIw5hGsrj8GSu0Nj4Fp
         EmpQ==
X-Gm-Message-State: ANoB5pnG9v13cwMvQSTXOs5etb+jIEH9o6R8i25u2hlgHNeNGSPnZoMM
        YfPiJwBXqxpswIWAsu0LTfnl0bztR5Y9H3Xi
X-Google-Smtp-Source: AA0mqf7QS7GXgY0sTOmYy20gHq3UwQAOvQuFpkXlgf+9oixgvPbcG3GsHsd7DLdGxHt0B+XT7/gOFA==
X-Received: by 2002:a2e:be28:0:b0:26f:db35:2e96 with SMTP id z40-20020a2ebe28000000b0026fdb352e96mr5076627ljq.8.1670699234142;
        Sat, 10 Dec 2022 11:07:14 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v14-20020a2e7a0e000000b00279e93c9c25sm701622ljc.29.2022.12.10.11.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Dec 2022 11:07:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 2/3] clk: qcom: gcc-sm6375: use parent_hws for gcc_disp_gpll0_div_clk_src
Date:   Sat, 10 Dec 2022 22:07:11 +0300
Message-Id: <20221210190712.451247-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
References: <20221210190712.451247-1-dmitry.baryshkov@linaro.org>
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

Change gpll0 to use parent_hws instead of parent_names for
gcc_disp_gpll0_div_clk_src clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/qcom/gcc-sm6375.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index 89a1cc90b145..6d75f735a7a6 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -2330,8 +2330,9 @@ static struct clk_regmap_div gcc_disp_gpll0_clk_src = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "gcc_disp_gpll0_clk_src",
-		.parent_names =
-			(const char *[]){ "gpll0" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_regmap_div_ops,
 	},
-- 
2.30.2

