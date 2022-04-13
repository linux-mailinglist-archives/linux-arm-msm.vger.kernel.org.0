Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB3A15002A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 01:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238968AbiDMXeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 19:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238852AbiDMXeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 19:34:13 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB19255BA
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:31:50 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id bq30so6245144lfb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yElKZdIr+Sts5560dnzVEAbEuPMH/3r6ShsAUOIE11o=;
        b=ojSCDCTQVIBJJuGsTqvIHDw9xBvIjoJ2YlPrlURYDU5j41sQpnjOThm94Q3mkuyf00
         zEnkIeCYUtBoSRlHJSYjIDtM15oG29P6Cxw0tTGzquADNa8sev+iyINGqhBLo+uEfF+h
         tEOKSG/CbXUT769YvyJlBf3cLPTn/3ZQvfqljl6Axi/m9NoWT6Bw8nRCiiNxO5goz25T
         TVCU1RJAYlPosssJLvdJDMgON/zAepI22qK0pFQL1TzTbjcleiqyMwDrrpY4Hp5JZwc0
         Pf0HXmg2hIGWWH1yRnoJXZaRH8pxKX9fzBa8F8gMoQx1Ej9Ppz5Z0wJDveQNypFNXCaH
         khtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yElKZdIr+Sts5560dnzVEAbEuPMH/3r6ShsAUOIE11o=;
        b=crJ/QVlJRqNpjq4cQ0jwWUJnnoG2GtUNiqLWPq+CZ5Jq3HgxODutnS8ik1xyj08Viw
         m59GONVETR5KG8CTFZWOsOy5Rv49RgvYjLbBaPQDONZ/q+2zWGo7M3O4rYfZLtqf1RPF
         jgNYyB/WXE1fBivxT3UKOG1EYVgWMRgoMS6Zyvq+H6Js23CyqyOWFhVVxjY5+eij9p5Q
         L+zuwD5AHlNMCsKj9lBcU89npBo45dfSR3w7VS0+QW9EeTpAzAsYeol+1cVinACvUgRw
         znv3+vDzAX4cSuTMSJVSErd5V1D/6bThDf5Qv46HEyoueI3VkWYAG+22nDJvybl4tb28
         Kb8w==
X-Gm-Message-State: AOAM532c1HHEWQTUsk5OtHESRS6U7c5b4wlzhLLgdaZL0T7mI36fYQdW
        Xs4/sj+Au8aXWufzrayJl1DVEQ==
X-Google-Smtp-Source: ABdhPJwWMhepp0cpYLoJk21tPn+fPV71+4feUuLyN+GDvzGN1pyly1JMPmQiySA4r8sEO+4b7zPEcg==
X-Received: by 2002:a05:6512:10c2:b0:44a:a117:6ec1 with SMTP id k2-20020a05651210c200b0044aa1176ec1mr73407lfg.76.1649892709081;
        Wed, 13 Apr 2022 16:31:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m5-20020a0565120a8500b0044a2963700fsm40982lfu.70.2022.04.13.16.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 16:31:48 -0700 (PDT)
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
Subject: [PATCH v3 3/6] clk: qcom: gcc-sm8450: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
Date:   Thu, 14 Apr 2022 02:31:41 +0300
Message-Id: <20220413233144.275926-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220413233144.275926-1-dmitry.baryshkov@linaro.org>
References: <20220413233144.275926-1-dmitry.baryshkov@linaro.org>
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

Use newly defined clk_regmap_mux_safe_ops for PCIe pipe clocks to let
the clock framework automatically park the clock when the clock is
switched off and restore the parent when the clock is switched on.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 593a195467ff..4636ae05ba1e 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -243,13 +243,15 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x7b060,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
+	.stored_parent = P_PCIE_0_PIPE_CLK,
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
@@ -273,13 +275,15 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x9d064,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
+	.stored_parent = P_PCIE_1_PIPE_CLK,
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

