Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA9E7374AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jun 2023 20:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbjFTSzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jun 2023 14:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230213AbjFTSzJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jun 2023 14:55:09 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B099C1712
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 11:55:05 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so6724902e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jun 2023 11:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687287304; x=1689879304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aHWhWGxI+gIWrgxdsIEoKDAbK3764Y8ia34V6xPpSZ8=;
        b=Zdmxr2BWekZ+o27AOP9dolQpYQxC4bAFXbhwPHvW80URY06BETFu8tgVie4+dajRCW
         5RupB34sETrjljyoIZfnmhYZfitgoYATq2Qly75rgyoCFPPNnJgdD0jXIX9DNrCEkJhj
         qOmt/kbkbYjr/pMCXJdEjkEK6YD4OeC6tPO82XkCz+Q+/R0/ImHFq3lVOFPd8p2J8IkF
         L7iJwOgFNutOC/m6wZ264XxHeJPje0mkFsOEFIq4c/baFYvzxnB3X7m1V4gFXTjFXipU
         axfdSbDlJ6ty8i3kigJ3SkBfGcaQ84eBNDVYQGY8B1B341fmQnhKEz+yantknIiv4Tg+
         KEkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687287304; x=1689879304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aHWhWGxI+gIWrgxdsIEoKDAbK3764Y8ia34V6xPpSZ8=;
        b=FU8dGIgkuiEBaj/gucAKmWLBRpbXref54wIMx7+xMwRMCDGk3uiNijsz3fDmOMYw2Q
         yrij2Mo13LVPRxAFvClTKFL3U/71AkFc5+ResbRl1X+2J9lDGpC/2/cbKgtIDiob90vO
         PY4eeaqaFFT14Zotla54cXRo4EcWZXYY0RFEgxyJ5F7NAaF4xH35Xop+d/h1JTQ7637/
         optVqA/IgBTd3ridSXJj4mW4aE7cTCBm0bLdPfARj56qWqaDQeraZTnyATBvi+R5v3ZI
         CGx1C8tgHMMdNZlINROrIY90Kg/uK9pAhOzETicMjPuGlbUbupX/5XeEy2j4ZSfDXJre
         cI6A==
X-Gm-Message-State: AC+VfDwIIy67k18C6vq7ogfuV5ip90uvw8IYqIpNKVpJ5FkwSvQ2DHIL
        8U16WIep2UeK4nU/JaPSBQlCqA==
X-Google-Smtp-Source: ACHHUZ40k2QvW5jpRPAY2cL/F543ANbvKXMi7c/pd3P5fsoECo1YdSpn8yxRE5uD4WZPeCzaJlGo7w==
X-Received: by 2002:a19:7108:0:b0:4ef:f11c:f5b0 with SMTP id m8-20020a197108000000b004eff11cf5b0mr7396017lfc.54.1687287303979;
        Tue, 20 Jun 2023 11:55:03 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
        by smtp.gmail.com with ESMTPSA id v1-20020ac25921000000b004f867f8d157sm463899lfi.124.2023.06.20.11.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 11:55:03 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Tue, 20 Jun 2023 20:55:00 +0200
Subject: [PATCH 3/3] clk: qcom: gcc-sc8280xp: Add missing GDSCs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-sc8280_gccgdsc-v1-3-0fd91a942bda@linaro.org>
References: <20230620-topic-sc8280_gccgdsc-v1-0-0fd91a942bda@linaro.org>
In-Reply-To: <20230620-topic-sc8280_gccgdsc-v1-0-0fd91a942bda@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687287298; l=3796;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=UpWmAPr/HPOctqmlcpw284qW29dCVKn9J2MOK2Err1E=;
 b=nyJGHDOyzmKntivEByH56F5Fz8sy1mETEgpXQOJMHvkopLccQhqqmFH/x/YiLcfPIjOp4MVY+
 u4pddd3PmNtD4EwvjxjxPIky+dcWF9oJLblEq7tHI51K7Uwc6lRE5it
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are 10 more GDSCs that we've not been caring about, and by extension
(and perhaps even more importantly), not putting to sleep. Add them.

Fixes: d65d005f9a6c ("clk: qcom: add sc8280xp GCC driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 100 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 80bc741ee75a..910d4f08af89 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -6896,6 +6896,96 @@ static struct gdsc emac_1_gdsc = {
 	.flags = HW_CTRL | RETAIN_FF_ENABLE,
 };
 
+static struct gdsc usb4_1_gdsc = {
+	.gdscr = 0xb8004,
+	.pd = {
+		.name = "usb4_1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc usb4_gdsc = {
+	.gdscr = 0x2a004,
+	.pd = {
+		.name = "usb4_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL | RETAIN_FF_ENABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc = {
+	.gdscr = 0x7d050,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc = {
+	.gdscr = 0x7d058,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc = {
+	.gdscr = 0x7d054,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc = {
+	.gdscr = 0x7d06c,
+	.pd = {
+		.name = "hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_turing_mmu_tbu0_gdsc = {
+	.gdscr = 0x7d05c,
+	.pd = {
+		.name = "hlos1_vote_turing_mmu_tbu0_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_turing_mmu_tbu1_gdsc = {
+	.gdscr = 0x7d060,
+	.pd = {
+		.name = "hlos1_vote_turing_mmu_tbu1_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_turing_mmu_tbu2_gdsc = {
+	.gdscr = 0x7d0a0,
+	.pd = {
+		.name = "hlos1_vote_turing_mmu_tbu2_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc hlos1_vote_turing_mmu_tbu3_gdsc = {
+	.gdscr = 0x7d0a4,
+	.pd = {
+		.name = "hlos1_vote_turing_mmu_tbu3_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
 static struct clk_regmap *gcc_sc8280xp_clocks[] = {
 	[GCC_AGGRE_NOC_PCIE0_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie0_tunnel_axi_clk.clkr,
 	[GCC_AGGRE_NOC_PCIE1_TUNNEL_AXI_CLK] = &gcc_aggre_noc_pcie1_tunnel_axi_clk.clkr,
@@ -7376,6 +7466,16 @@ static struct gdsc *gcc_sc8280xp_gdscs[] = {
 	[USB30_SEC_GDSC] = &usb30_sec_gdsc,
 	[EMAC_0_GDSC] = &emac_0_gdsc,
 	[EMAC_1_GDSC] = &emac_1_gdsc,
+	[USB4_1_GDSC] = &usb4_1_gdsc,
+	[USB4_GDSC] = &usb4_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_hf0_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_hf1_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_sf0_gdsc,
+	[HLOS1_VOTE_MMNOC_MMU_TBU_SF1_GDSC] = &hlos1_vote_mmnoc_mmu_tbu_sf1_gdsc,
+	[HLOS1_VOTE_TURING_MMU_TBU0_GDSC] = &hlos1_vote_turing_mmu_tbu0_gdsc,
+	[HLOS1_VOTE_TURING_MMU_TBU1_GDSC] = &hlos1_vote_turing_mmu_tbu1_gdsc,
+	[HLOS1_VOTE_TURING_MMU_TBU2_GDSC] = &hlos1_vote_turing_mmu_tbu2_gdsc,
+	[HLOS1_VOTE_TURING_MMU_TBU3_GDSC] = &hlos1_vote_turing_mmu_tbu3_gdsc,
 };
 
 static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {

-- 
2.41.0

