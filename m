Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC186F9ABD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 May 2023 19:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbjEGRxk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 May 2023 13:53:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjEGRxj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 May 2023 13:53:39 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 138352736
        for <linux-arm-msm@vger.kernel.org>; Sun,  7 May 2023 10:53:38 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2ac836f4447so35031431fa.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 May 2023 10:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683482016; x=1686074016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BfjD+nhpwNlgeLxaYqdhE5T1OFGvqPPFvhrWYJ9f1lc=;
        b=Enin1Yq86SSr21WwjrXXnKTANl+Bbo917juyLyLF2mpeBJSDU5KPaxrHcjchVliFID
         dCgMNsHYRBAwrSFUu+10EZ1BBlJTtO8E001V2ogMRcNVZIbiBKgJaAmJfNT/aHa8aTQh
         9mPSG69Pq/gKo5ct7n08EMhU6b1xF5vVOSOuIPtJ7rpxvPpEZ9tyryOgSWa2x6ppn8EX
         +Rc6M1BwWepZLqYe0v7/jvb137/1OnRHiaVb/TZGWGtHBkqKvWw6ssRgNu5k/oOJOXHL
         w4bZ1xL9JvsQLCD81HzjchzQyg2Glch70GetQ8LiJtyf1p0/Nx1JGLNcK99p+LWRoepT
         Hc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683482016; x=1686074016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BfjD+nhpwNlgeLxaYqdhE5T1OFGvqPPFvhrWYJ9f1lc=;
        b=U/9n9DNlWibWwsTRHsgDgqe0EMIz7cNIlLBEpUe3IfarqtR7KRhoxBbsfPXZDnXZHu
         VdaCFiHSgNdn4nAvTqUpcrJt45b/WLiYL5Xa3R1839Q4ZXrAknsdl9zrX8HLkptacrqJ
         vvUYf+cMo8U59FaBlHlgFAEL1WTRt6PcXVRjKkAE23d9D1YJ/qNaT7BxN2VmkWmFlBAS
         MrS/1YatU4MKAa8Cvy83tM6G3depdWoiVq2tdVdqcErDdCq64SFAZMdAzm4xgTIZBg6k
         sDw6HBvbVhHUH8/vE/P42spbvyc5JQjwCGxTocbbNNzAf95/o8dngytx9ksBhOiMRwVn
         FAGQ==
X-Gm-Message-State: AC+VfDyDQOzr+Dl8/A6vsqBSVG49FwrvyQ5hYWtoW2vpaBExQzrOrmZZ
        oeSLHFctmcHFAbkYIbcj5Fz2ig==
X-Google-Smtp-Source: ACHHUZ5WTuEFXd09rjrEA3r6HUKx0bUzbhV88Honm2eb1pIyFFx/J6O1o2CaH3LPo3RwIKgdFFzyGA==
X-Received: by 2002:a05:651c:1032:b0:2ac:8283:b67d with SMTP id w18-20020a05651c103200b002ac8283b67dmr2317372ljm.25.1683482016320;
        Sun, 07 May 2023 10:53:36 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::ab2])
        by smtp.gmail.com with ESMTPSA id e16-20020a2e9850000000b002ac8e6d54b7sm883616ljj.42.2023.05.07.10.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 10:53:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: qcom: mmcc-msm8974: use clk_rcg2_shared_ops for mdp_clk_src clock
Date:   Sun,  7 May 2023 20:53:34 +0300
Message-Id: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The mdp_clk_src clock should not be turned off. Instead it should be
'parked' to the XO, as most of other mdp_clk_src clocks. Fix that by
using the clk_rcg2_shared_ops.

Fixes: d8b212014e69 ("clk: qcom: Add support for MSM8974's multimedia clock controller (MMCC)")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8974.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
index 4273fce9a4a4..aa29c79fcd55 100644
--- a/drivers/clk/qcom/mmcc-msm8974.c
+++ b/drivers/clk/qcom/mmcc-msm8974.c
@@ -485,7 +485,7 @@ static struct clk_rcg2 mdp_clk_src = {
 		.name = "mdp_clk_src",
 		.parent_data = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
-- 
2.39.2

