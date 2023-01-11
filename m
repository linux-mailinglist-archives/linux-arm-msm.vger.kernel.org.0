Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2DC666379
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:20:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235030AbjAKTUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:20:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232785AbjAKTUI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:20:08 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B6E82BDB
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:07 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id f20so17056976lja.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1uDJixWMEWwAoquEM2fmrMSD+ELeFhPO7LIvd7FIubM=;
        b=wPTgABILq+rVIZTmOuPsw51kX9ndLddw8fbuBjnL2rxg2l8/UUlp0oc04OfbNvx2Vt
         dqQZFmKb3AWMb8R/sZNraXcW0SLP9eMZzEeEBbcegUv3z9egaYAGiYlSym6HT1jjMDcN
         1BKuhVomw3w5T3OKyje8KngMd/4+IPElRXuQaAb3b1Uy4v8GHkh5kgpgIXE7wdS83ikA
         FEOGBwdNXdjwx3n6i9k/uiuD4u0jZJubMX/acRz9tdEd4t6kfk/Ky18Z6+Y788uhL3RZ
         13tIGv+9LJW2uPknFOzLekRf5uhJxjQBBkqdOHQiEvjfJIzk0Cp77SZit6VzSSW9qJ8N
         z+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1uDJixWMEWwAoquEM2fmrMSD+ELeFhPO7LIvd7FIubM=;
        b=y3aHODRS0PrJHQ3IFvitOdJLkGroNlYlUhn8cxP/JFvyma6xKfJVD+Fs2tt6B9vguB
         16ouWMgcOGHMtav73GG4uJybuU0Ew884/LPqNNQSz9HINuwE2XTiqOZOGoTlzDtbwl6Q
         iTgaCqtQLYN/ZK4HBHHYDPoU1mRcNiABgUVBwnFo0rvFchJdCh5NdyhcndFgqMb2HeXd
         tDybudqlnzC+BJzMeC1wXWPnte2tCCrTSIqxmwpBgkNZ2zf5PBJ3YG2Dink6ZYUkxVBF
         g2Q/z1ySnPPEOCbS6v2d0FYrFsUWcWsSLv3kuUp1Sc+TEIdJiUXzdRgkyx9rouAqsy1v
         zVVQ==
X-Gm-Message-State: AFqh2kpYZ5L7dOBrnM9y86kaEII4Fn/ukYGPMjFHf5bhQ7fHHF3TY4dt
        g6rKYivK2xTm158T0m0s5EbdHQ==
X-Google-Smtp-Source: AMrXdXt2PHcLY8epkmSi6PqKZ6g67Mx5P/psEIT9ncqRTSSRnxODmnonjdnag1XUOTeBMOHgrOULsQ==
X-Received: by 2002:a2e:9007:0:b0:27f:c11c:315e with SMTP id h7-20020a2e9007000000b0027fc11c315emr15551960ljg.31.1673464805720;
        Wed, 11 Jan 2023 11:20:05 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:05 -0800 (PST)
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
Subject: [PATCH 01/13] clk: qcom: clk-alpha-pll: program PLL_TEST/PLL_TEST_U if required
Date:   Wed, 11 Jan 2023 22:19:52 +0300
Message-Id: <20230111192004.2509750-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
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

Program PLL_TEST and PLL_TEST_U registers if required by the pll
configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index f9e4cfd7261c..e266379427f2 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -358,6 +358,11 @@ void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 	regmap_update_bits(regmap, PLL_USER_CTL(pll), mask, val);
 
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll),
+						config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll),
+						config->test_ctl_hi_val);
+
 	if (pll->flags & SUPPORTS_FSM_MODE)
 		qcom_pll_set_fsm_mode(regmap, PLL_MODE(pll), 6, 0);
 }
-- 
2.30.2

