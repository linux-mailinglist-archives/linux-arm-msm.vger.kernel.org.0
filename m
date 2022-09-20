Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC4F5BF044
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Sep 2022 00:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbiITWh5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 18:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiITWh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 18:37:56 -0400
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 126E663F2E;
        Tue, 20 Sep 2022 15:37:56 -0700 (PDT)
Received: by mail-io1-xd36.google.com with SMTP id y141so3624222iof.5;
        Tue, 20 Sep 2022 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=olqWFVURdQf7V9m+uUlMOAxJ+sPwMXU6J9O7ggIg0TI=;
        b=S1/k7sSlb2AEhqTx17RIHj1IksksttkuNBhaxgPJiXGbGAMxcvitG68sXbowpgzEMR
         TQzmDJU5gwhPERS3D+bXe9u6oA3Y6trO+5OzCqglT/HbMrtZXt3eR7z7txSmUGOKT/oo
         kNNYzahW2F7iTKMvZKGfS1Gb705LsXs2l+g4QFWPCjaDtLRLM/AWF2Q5J+sxLXQrYvaG
         iw/m/VnlS3dZioL/k9sNnxhlM2IzEReOuLOvH184jwD67/69M4zyH8CtZ4Xr9o3tEigc
         c61uobL9kBBz67IRe4f/uMAIpVRwnBG26xuOmleWJmeSZ/YW07IFnjty7MzteT9CNXfv
         Z8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=olqWFVURdQf7V9m+uUlMOAxJ+sPwMXU6J9O7ggIg0TI=;
        b=ZtHgNelGZq7qTcOFh8HdzHkjYBo9JiXTB6PI3Bf9IStx5FyOLFXU/sZkJiPjqGKppC
         +heW5YBti/HvtM4p0pyJusdzmOrRt1RpKBzA6IMY86d5ZL/W/XzjAe5CNejCqtbG+0fw
         /EFh9cOjTzEcxKGkUlZx9QaXDCf1SVCijrygxVAX5b1bcJmrQc9ltCj6O8w/uOHQkiPv
         qRYNks/WMza/kaCJiruMYZDxtoM5+GJYQVOp+zt0zC7gsfsOoxz0DS8RgyVrJvX/n7y/
         dojro04kGAHxTv7ma1jz7nzNGkrUWOseDIqXrtONgY34HguhomRD4bcDN7XywY19eBsw
         6G6A==
X-Gm-Message-State: ACrzQf3nDZc/9aYjXE6czO2QnYn7ASAKI2xjjX7dEJBTqD1m3n9cwJls
        HWpm6JcT9tHeoodLfYZz79orbZ8gD4s=
X-Google-Smtp-Source: AMsMyM7BsEfmYnXbJv2GGrSCugMTdrJJYvB3IVbAyB2k6UfuuEXFGuxfuwkzdciUUvCnhiZP9C/2KQ==
X-Received: by 2002:a05:6602:4191:b0:68a:144c:82dd with SMTP id bx17-20020a056602419100b0068a144c82ddmr10477801iob.33.1663713475092;
        Tue, 20 Sep 2022 15:37:55 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::a533])
        by smtp.gmail.com with UTF8SMTPSA id a14-20020a056602148e00b006a0d1a30684sm420501iow.33.2022.09.20.15.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Sep 2022 15:37:54 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 2/2] clk: qcom: rpmhcc: add sdm670 clocks
Date:   Tue, 20 Sep 2022 18:37:34 -0400
Message-Id: <20220920223734.151135-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920223734.151135-1-mailingradian@gmail.com>
References: <20220920223734.151135-1-mailingradian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Snapdragon 670 uses the RPMh mailbox for most of the clocks used in
SDM845 but omits two. Add clock data for SDM670 so the driver doesn't fail
to resolve a clock.

Link: https://android.googlesource.com/kernel/msm/+/443bd8d6e2cf54698234c752e6de97b4b8a528bd%5E%21/#F7
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/clk/qcom/clk-rpmh.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index c07cab6905cb..82d87a0602fe 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -382,6 +382,26 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
 	.num_clks = ARRAY_SIZE(sdm845_rpmh_clocks),
 };
 
+static struct clk_hw *sdm670_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
+	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+	[RPMH_CE_CLK]		= &sdm845_ce.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
+	.clks = sdm670_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sdm670_rpmh_clocks),
+};
+
 DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
 DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
 DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
@@ -715,6 +735,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
+	{ .compatible = "qcom,sdm670-rpmh-clk", .data = &clk_rpmh_sdm670},
 	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
 	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
-- 
2.37.3

