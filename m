Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE565BDA3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 04:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbiITCh1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 22:37:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiITCh0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 22:37:26 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFA2D46231;
        Mon, 19 Sep 2022 19:37:25 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id g6so685718ild.6;
        Mon, 19 Sep 2022 19:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=P1/PWyZC7cH6dybv83f3MjBvFzTbkhJTNLgRxtu1aIA=;
        b=FZ5dSx8ihzsVAheNEgOv3NgjP7xNmlAAZzyIclGFKdW4zzVkGVo2C10jzlpZiwh5v4
         UHeomiiPjdxgm6+ZrncIKsDaJthTKCuhte+QGOpuvyBCHORXqv32ZjWRMLVoeJiXi887
         dAgw0x/0KAF3bFTifUhsdWU2RbRQfZCwCXGo76DaYAUNSmDIEn6p5+az+ee/DE4mhFpo
         p/sUkZEs8T3XIjwJRUODCiz3El3/gO7gJth0LMHDXqYHkkQqZwdVDHyyWGTJX0Iz7EtB
         5Mbf1bPfHn0kKqxxeiR0SQ5BnzYOBmXp2JsmY74ttgw2/a7sJEw1kciDv2yA36huWOc/
         hxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=P1/PWyZC7cH6dybv83f3MjBvFzTbkhJTNLgRxtu1aIA=;
        b=gYT2PZW7T5Gl6yhA3FHhQgOLEkd2Bmvr8Xe8P6nI/Fm0hw85+nXxCx/q9+9+de5n9X
         OZN1D1K77klOQlSZEYTs5vN4cmY+r+aC1+j4g/xMPAEJWmbIQ3hqhxHRmLGent9xo87m
         0kZIELM4injMEnY8Yb8lIoCFxe2Z7pCliET9F8uzCTW3/DBwo/OZTRmUUI8Fo1UF6Kov
         BadaBFdGL6lpBXEXdW1Ri1fahuvcBDtQo4KwWZhUCdbaQ1kY2Hu2JQ+1y4Eky9PXN5Oe
         Yp7i9F5uxBh0OYoEcyON7P74N541EmVXYSyDmstgCeqysP2KVwwftibi+p21tyTUlgBC
         f5Sg==
X-Gm-Message-State: ACrzQf1oeg8SYtgBx+OTEXxbOXDWsaXYqBqELwXOWxxzDgnp8Sahw/Pu
        KyBm9qqYsdW2LGZxJxAkEN2aMbHp8p0=
X-Google-Smtp-Source: AMsMyM4q6NzEVmH4wSVhGVzZfBL0trXYkdZUb5qpcrUPC8AAxr/0T05xrtIaF9QAV1BcKQJBfWIQtQ==
X-Received: by 2002:a05:6e02:1074:b0:2f6:15d9:4719 with SMTP id q20-20020a056e02107400b002f615d94719mr1761756ilj.123.1663641444930;
        Mon, 19 Sep 2022 19:37:24 -0700 (PDT)
Received: from localhost ([2607:fea8:a2e2:2d00::58d4])
        by smtp.gmail.com with UTF8SMTPSA id x14-20020a02908e000000b00349c8fe9109sm141060jaf.174.2022.09.19.19.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 19:37:24 -0700 (PDT)
From:   Richard Acayan <mailingradian@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] clk: qcom: rpmhcc: add sdm670 clocks
Date:   Mon, 19 Sep 2022 22:37:09 -0400
Message-Id: <20220920023709.4865-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220920023709.4865-1-mailingradian@gmail.com>
References: <20220920023709.4865-1-mailingradian@gmail.com>
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

Link: https://android.googlesource.com/kernel/msm/+/444bd8d6e2cf54698234c752e6de97b4b8a528bd%5E%21/#F7
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/clk/qcom/clk-rpmh.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 9739aab0fe82..0471bab82464 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -378,6 +378,26 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
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
@@ -711,6 +731,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
+	{ .compatible = "qcom,sdm670-rpmh-clk", .data = &clk_rpmh_sdm670},
 	{ .compatible = "qcom,sdx55-rpmh-clk",  .data = &clk_rpmh_sdx55},
 	{ .compatible = "qcom,sdx65-rpmh-clk",  .data = &clk_rpmh_sdx65},
 	{ .compatible = "qcom,sm6350-rpmh-clk", .data = &clk_rpmh_sm6350},
-- 
2.37.3

