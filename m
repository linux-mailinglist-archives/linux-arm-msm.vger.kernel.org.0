Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61F14D71B8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Mar 2022 01:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233137AbiCMAJn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 12 Mar 2022 19:09:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233128AbiCMAJm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 12 Mar 2022 19:09:42 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD92C286CD
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Mar 2022 16:08:35 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id w12so21159785lfr.9
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Mar 2022 16:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p14xuP8Gc3uFDSUAz1O3S3h7eUAHORjNNAV6XqKIT4c=;
        b=skLMdfRwx+wnn4okAXelBaPkUXpJc2+GJx+AD+CJ+ZEVvpVUbUU9SMAI9heV3hJrfw
         LOUSTj3LBgzr7255WNRg89Zuy3JdH9NIB+KTFCAIaW9b30Y6RUJzqLWF0StNFA2J7+TO
         aCgGmYmkdn9/wSGwFyyz1Fjzf4EdbJnJjBm5W8nyDHrxIIiZBZYTyaATbjhRmxCT0XIj
         qBhA5JCt6HhcFLhRuwVNCLYT2JwzR1McOh/+UTG7KKev17E1n9vrSpfW9OpNX2RrkOy/
         GCYrMy5BzhZZ7JMkiLsWW0FRel2Q26+MKMNhJHJS/zvT+qlSHOzU+/mVmw0Iv3TrRs2h
         7i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p14xuP8Gc3uFDSUAz1O3S3h7eUAHORjNNAV6XqKIT4c=;
        b=z40hG+497fdXTMEs1uwIzpHIpD5wEa8d8Hlcz0Jk5/C5V6qCvt5PDhKCLCOmRer0kg
         0QmADtQrTqT8qUfzugtj5fDz4uORqoLbEywmKCbdy+/SkAXeVCDieUao00jXtBR7d2Jr
         mLVyP5tDeFY1S6CDAeTEcrSWlW29znJ3HdjA4Ur1Zs2VGtbFQhB24IcsedBpBDfSNQHi
         nPzGJ0lkABxrK89SUKmHV/U+C+duHxKLliql/eCdr9bHWadA35Uaqfpm/jq26AplOF8T
         v4+89ZLi2o9iugazPTpaVBExdKEgnro9vBRkYCEUfolktLZkV8s4GmwLVLGVPq9nX79j
         ZD0g==
X-Gm-Message-State: AOAM531mAU5QVEQ5mjCAuIzdPgz7vC0FV0MwPErlT4n+9bR5Vs3tE1Hz
        ohtbpxZCzZQtM5dOv+tRmtts3w==
X-Google-Smtp-Source: ABdhPJzWJJUCYK25kKIFRjkGbKAwx8Ewc1Ax9JquwBpG6M/S/edq1eggXTZeOitoUhckDkTs9/688w==
X-Received: by 2002:ac2:5491:0:b0:448:7bcb:4278 with SMTP id t17-20020ac25491000000b004487bcb4278mr4286575lfk.450.1647130114147;
        Sat, 12 Mar 2022 16:08:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (pppoe.178-66-158-48.dynamic.avangarddsl.ru. [178.66.158.48])
        by smtp.gmail.com with ESMTPSA id e7-20020a05651c038700b00247dbb3e476sm2776017ljp.40.2022.03.12.16.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 16:08:33 -0800 (PST)
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
Subject: [RFC PATCH 3/5] clk: qcom: gcc-sc7280: use new clk_regmap_mux_safe_ops for PCIe pipe clocks
Date:   Sun, 13 Mar 2022 03:08:22 +0300
Message-Id: <20220313000824.229405-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220313000824.229405-1-dmitry.baryshkov@linaro.org>
References: <20220313000824.229405-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-sc7280.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7280.c b/drivers/clk/qcom/gcc-sc7280.c
index 423627d49719..69887e45d02f 100644
--- a/drivers/clk/qcom/gcc-sc7280.c
+++ b/drivers/clk/qcom/gcc-sc7280.c
@@ -373,13 +373,14 @@ static struct clk_regmap_mux gcc_pcie_0_pipe_clk_src = {
 	.reg = 0x6b054,
 	.shift = 0,
 	.width = 2,
+	.safe_src_index = 2,
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
@@ -388,13 +389,14 @@ static struct clk_regmap_mux gcc_pcie_1_pipe_clk_src = {
 	.reg = 0x8d054,
 	.shift = 0,
 	.width = 2,
+	.safe_src_index = 2,
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
2.34.1

