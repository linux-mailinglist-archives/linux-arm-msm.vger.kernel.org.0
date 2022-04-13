Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68DB5002AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Apr 2022 01:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbiDMXeQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Apr 2022 19:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239064AbiDMXeO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Apr 2022 19:34:14 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCC2C2496B
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:31:51 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id k5so6216046lfg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Apr 2022 16:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=l7tvPO+r4DEdHAKP0egbgE+NnfMTJeTDsezOzMtIzpA=;
        b=mN1AOH0sg75dSFAv6rfF/0EIKYYhPc0Q5ujg+4X7zylYGLfFTFkkMkm6fNDk84gUgn
         J/7EJAemSrHtjPi5Gdz0sGv8rnkc3l731lb75EIuqBQTEQ6PT7NYo10b6jG/7778qX5t
         6z20dFPW2T9W8DV3iN3js0zptcJhpMUqUQj2+N1cKUWeJz+/8z382gIkz3dlXJwnIOKP
         nRa2P2wLW0U4u4JLY50lDdA6UXDUh4cTkG5NB73+N0yUbkgzk+W/pWyCDp4u/gEjipr4
         AAK490NIHfD5gd3e40kIDaWIQIg7EIOHNOEXwkEZpxmUVEiavrW7a7j4s9Wcf9K8CoNl
         zzwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=l7tvPO+r4DEdHAKP0egbgE+NnfMTJeTDsezOzMtIzpA=;
        b=NTSvG7KE/k1uPwLvVoxswdzVoadQSZd9kbchJNffigE5RZjAcB+lRdo0Gt/bLCPMub
         FSTFobCYg6uiZC+imE3FoUjYCi6lVpVlZebn4ETrhSn/afD5LelU/Kqw8Y+HbvnPGvqY
         9S2XanPFjh3Gx0H4cQU6U/9c/viCAMIJImdot1WTtiFRQid8xAE7LeRt06dji7P2OE0d
         xB8pZPduETwJUVPpFAO1pIyXsHOAb55vRZBHVafFiMOhGrGdZpsXbL9Zb60dzhqDLY8X
         K4TBLO/jrIwN3c79YVFMySi2CEc+8+nMVIbzdH5TaBK3WSXdRUJjuxOEDFAlQbDGdACy
         yhrw==
X-Gm-Message-State: AOAM531N2vaZR5ekr0X0fcdITSho2p04m8QtmkUpTRc21QjdxA0jbFgd
        Sg0/hxtn85qh1/Wy1TSZ0pibrA==
X-Google-Smtp-Source: ABdhPJxr0+dwf5HxsLru210nKplEKyyefNZeioAJbtiFJBfNVeIP8EMmHYzcgeN4kMbuh79cScynnw==
X-Received: by 2002:a05:6512:3243:b0:445:79a1:b589 with SMTP id c3-20020a056512324300b0044579a1b589mr44298lfr.191.1649892709994;
        Wed, 13 Apr 2022 16:31:49 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m5-20020a0565120a8500b0044a2963700fsm40982lfu.70.2022.04.13.16.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 16:31:49 -0700 (PDT)
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
Subject: [PATCH v3 4/6] clk: qcom: gcc-sc7280: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
Date:   Thu, 14 Apr 2022 02:31:42 +0300
Message-Id: <20220413233144.275926-5-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/gcc-sc7280.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 423627d49719..e1ce3e635236 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -373,13 +373,15 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x6b054,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
+	.stored_parent = P_PCIE_0_PIPE_CLK,
 	.parent_map = gcc_parent_map_6,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk_src",
 			.parent_data = gcc_parent_data_6,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_6),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
@@ -388,13 +390,15 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x8d054,
 	.shift = 0,
 	.width = 2,
+	.safe_src_parent = P_BI_TCXO,
+	.stored_parent = P_PCIE_1_PIPE_CLK,
 	.parent_map = gcc_parent_map_7,
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_1_pipe_clk_src",
 			.parent_data = gcc_parent_data_7,
 			.num_parents = ARRAY_SIZE(gcc_parent_data_7),
-			.ops = &clk_regmap_mux_closest_ops,
+			.ops = &clk_regmap_mux_safe_ops,
 		},
 	},
 };
-- 
2.35.1

