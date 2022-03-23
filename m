Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42D1A4E4EA3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 09:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242995AbiCWIvv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 04:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242969AbiCWIvs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 04:51:48 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6998B7561E
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 01:50:15 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id g24so881992lja.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Mar 2022 01:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3m7sD5DReLGuXAEizIRitWnlXHp9Kn3L0qq2hxmokpc=;
        b=gv9gcPlHQ35G9R6MWJXTwf0cGkoBwsLehTQsndz59t01evyNDJF5UrpJT2BcNu8OyX
         I+OooxIhJSXZhbAU84NvqSuzUuGD37pZQNSH30RT3xBfDaXEaXkBeJhB7+JmiHen2EAA
         3X1b1xS3jj2yn4cT7rDWvFXpWDudayGtu/6Fey9G8Nk81/151t4hD8n8lGRSeuZkSTdS
         b20JVBL+/RpxZQRpTl1V62CnosEGj2NQqidLJR4Ll/h5/5bGuNPq8NHckgocdSPhqhu3
         6DK3Mxbxlu5FHAI4pCEiSFyzHw5s3AXRmyH22rw7jAQTXg23FytFK7Yg/Gw72TXMpvUf
         ZLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3m7sD5DReLGuXAEizIRitWnlXHp9Kn3L0qq2hxmokpc=;
        b=0yK8MIey/vWcFQpg7SDy/TtKnJhJO+N648Wgjz18GCSwqrW8PqJ2IXe0Ghl0TSB9uz
         +FXcKy/8fIYRKx7Rs6XX7H3WwVtZoy+S7FYVodKSBvX3K49mGBbyBi2sNik/ilRc5+yV
         pRJHF6+Nx080kAaGVXLyqI1vPL+is49YaWQOTUNUpWQhW5dQLkfvMI2udvAMMAGmjwaZ
         gDRUvUUO0deiLkDyfJwaU9QpR0YgOmGkJt6ZRqPeVf32d+CCrlYwooYeITj7jY20kRiH
         nqhOdm4LNpQkRirAqxqvQPdCZYnwKJ1mqmXSU94B8ss28Ddwpk2FezZ+qITIc+l8r+3o
         Q3fw==
X-Gm-Message-State: AOAM5305BHeynJ8Ei+G9qRMYE/HOhVLNPJ9UDz8oNbLuwSI+kWjNFEB7
        bT1CQFd38dWES7bmSZ/4VjcRLm6bCdTA3g==
X-Google-Smtp-Source: ABdhPJy1vlu6yxy06uWNWZ48yM4MosclnzEQBTVrPPCqlL7MPEExEmPACb/jv15/v0LmctoyviJRsA==
X-Received: by 2002:a2e:87c4:0:b0:249:2cdf:da53 with SMTP id v4-20020a2e87c4000000b002492cdfda53mr23163574ljj.161.1648025413622;
        Wed, 23 Mar 2022 01:50:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c40-20020a05651223a800b0044a1edf823dsm1376140lfv.150.2022.03.23.01.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 01:50:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc:     Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pci@vger.kernel.org
Subject: [PATCH v1 2/5] clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
Date:   Wed, 23 Mar 2022 11:50:07 +0300
Message-Id: <20220323085010.1753493-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
References: <20220323085010.1753493-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use newly defined clk_regmap_mux_safe_ops for PCIe pipe clocks to let
the clock framework automatically park the clock when the clock is
switched off and restore the parent when the clock is switched on.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 593a195467ff..fb6decd3df49 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -243,13 +243,14 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x7b060,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_4,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
 			.parent_data = gcc_parent_data_4,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_4),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
@@ -273,13 +274,14 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x9d064,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
 	.parent_map = gcc_parent_map_6,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
 			.parent_data = gcc_parent_data_6,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
-- 
2.35.1

