Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 842956F393D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 22:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbjEAUeO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 16:34:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232967AbjEAUeM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 16:34:12 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9AC735B0
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 13:34:10 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4efe8991bafso3986288e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 13:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682973249; x=1685565249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCXshE3LSm11sHVAf0ozYtKAYbdoivwwYotK5GTV+xw=;
        b=IhjJFVvfnzmdwOgCUfOtEhLjgjlAAwtDudc28E1A7bllZtjDvsUSA0VUrAnFnJ2sL1
         T6WKxGlBsBlMnL5nXRPg+/mCfGvbxFLXZDy3al0H1YnOMbn2RJlI2xqxjLpWKu56cWrP
         Y7WK6Y6rb82kAcUmf8OueqmHrHa69sa45AhS/Ir7gBJQjYSyTu2b2dUl4MFS6OMANdp1
         kDB71fKiY4w2wYGwTCR9HApBmoRvbstlCjWQe1ovywq3iahDrD5R1+dz4/TrGSw39t2l
         CGI4abGI3U4Hh+wrNbGnyAM4wYH+CvqWM4oR5NcIJdd68IW6G3905UJwM+xXRr59794J
         uF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682973249; x=1685565249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCXshE3LSm11sHVAf0ozYtKAYbdoivwwYotK5GTV+xw=;
        b=MXJU8XonrDUe3i3PF1TBJ3tG1zpO2R1eQ6VDk0De75WInrm2B+2Rn4uBkzaCN7Od8E
         fa7IvcfSesH5j8INclF8OR1Bxn7f/Ypbeq1AU4oDLbdQGX/uEzlqPwhCcMe9v7EPTJWe
         9iKJyq7k2+DaJDRSp10GkpgER2hnRcxDT8zPCfxxJNl1B8MUMX/xR5GxQDxESt9/BZQC
         8EJOiyMk7We8vRXggMEXyYRqpYl/yYP0zHgZL6zavICYywvhHI/q8rqUbtv9dymC+GwC
         9QpYHstDDZsCtdIGjYISkw99ebBJsvGth1o+XepTVupmQVa2PayXTQdKw3ZWlnitQozP
         Vx/Q==
X-Gm-Message-State: AC+VfDyeatuqe3meVN3e6AJ8V7tcHtPGrqFpYg3UmYPusHjzeYndJcX/
        +OpKvKLH/wdWIL0BCEzPOLqbxw==
X-Google-Smtp-Source: ACHHUZ60TqRdbs2aCYrf4EKbhZ9jTcqbs6GNXfuhCdQz1GYbvzzy5/B0XeiWxbWv3af4TPVMZYCMYg==
X-Received: by 2002:ac2:44d2:0:b0:4db:3847:12f0 with SMTP id d18-20020ac244d2000000b004db384712f0mr3501433lfm.50.1682973249157;
        Mon, 01 May 2023 13:34:09 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id f27-20020ac251bb000000b004eb018fac57sm4885909lfk.191.2023.05.01.13.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 13:34:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 08/10] clk: qcom: gcc-mdm9615: drop the cxo clock
Date:   Mon,  1 May 2023 23:33:59 +0300
Message-Id: <20230501203401.41393-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
References: <20230501203401.41393-1-dmitry.baryshkov@linaro.org>
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

The gcc and lcc devices have been switched to the DT-defined cxo_board
clock. Now we can drop the manually defined cxo clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9615.c | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index c1742113b0eb..a28df201e87d 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -26,17 +26,6 @@
 #include "clk-branch.h"
 #include "reset.h"
 
-static struct clk_fixed_factor cxo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "cxo",
-		.parent_names = (const char *[]){ "cxo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 enum {
 	P_CXO,
 	P_PLL8,
@@ -1618,10 +1607,6 @@ static struct clk_branch ebi2_aon_clk = {
 	},
 };
 
-static struct clk_hw *gcc_mdm9615_hws[] = {
-	&cxo.hw,
-};
-
 static struct clk_regmap *gcc_mdm9615_clks[] = {
 	[PLL0] = &pll0.clkr,
 	[PLL0_VOTE] = &pll0_vote,
@@ -1731,8 +1716,6 @@ static const struct qcom_cc_desc gcc_mdm9615_desc = {
 	.num_clks = ARRAY_SIZE(gcc_mdm9615_clks),
 	.resets = gcc_mdm9615_resets,
 	.num_resets = ARRAY_SIZE(gcc_mdm9615_resets),
-	.clk_hws = gcc_mdm9615_hws,
-	.num_clk_hws = ARRAY_SIZE(gcc_mdm9615_hws),
 };
 
 static const struct of_device_id gcc_mdm9615_match_table[] = {
-- 
2.39.2

