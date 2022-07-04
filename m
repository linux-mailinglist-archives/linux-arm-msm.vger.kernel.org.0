Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9EC565CEB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 19:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233644AbiGDRZE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 13:25:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234165AbiGDRZC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 13:25:02 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B3821262E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 10:25:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id i18so16773170lfu.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hizAoMjwKxJKREAmN4CL7akEtHddW9X6jcla5HNJl0s=;
        b=gyzhlqznJoMN1vPAAdlPAEmzfvj3Y/pSf7vtC/sdrIQrDTRxiir44wCrXoUDoJbwGC
         Wyhp1sSr/iU0GIrCMtLev09V6I0SUw9TM68HXppGsluMRwII8Qb2SsmVF4vCZO43eVKF
         1U6nW4O+OBINxj/vIsKDjlkYCHm/wY8KifJVu5FfJR96hl5CwqmHsXCjoY4PpDXIowbh
         MOqlyBwfAwGpgAJzi83cewG71HIT0YVyoMSu/66Cjxh3X7nobqs8o4wQ1YygKlQocnmh
         M8d++l//LvByhr+rWzARWkC5O9JyEJ5NzmaOeAQuYf0nvc7r8cyMqoaNDaCm40vWuZ5P
         xbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hizAoMjwKxJKREAmN4CL7akEtHddW9X6jcla5HNJl0s=;
        b=3EKC+8DN/rOTj1e74mYQpSISmDSp179NQr3GiXXBmwArjfbwUYw6g6oGwI19K13bH0
         +0VjuTlplEf/vKNHtEkoeqz6bFc2F7Yp73UeKixBRvHUAS1Emb1rZdW7rGo/fWIoDyn+
         KfkXE15kkj56O90MOiTgDqvlLfsvy8kJ90yvX3l2rFIur1d6KkDQATfgZUwqxWCZyuWi
         V7adBu6K5tk8MYhu00Wzf1E5ABdV/rqqrPJp8tA8+v8w2otgFWXy0cdeuWNC4C5Md9/4
         0UYeL0K2v3QDcPW38cPd1WPKKE2mHnpezgrLfxLlqECddeJPphOShfW5EAKCkpTUsgKV
         GDSg==
X-Gm-Message-State: AJIora+oRR8mWuGcSfpMzhlCf8Ma4zppM1FGoPJU6YNPQ+GDSdPxdtYe
        f7q1wQUd83vk/T4y9VBrAH1tpw==
X-Google-Smtp-Source: AGRyM1vporwwD6A3vZPQhxry7XRIQaWOKALiJxwsWu49JojQtA7QeY7T+oEy9wZAqzIFR9IOG4KOig==
X-Received: by 2002:a05:6512:30d:b0:47f:699c:ec51 with SMTP id t13-20020a056512030d00b0047f699cec51mr20743468lfp.391.1656955499722;
        Mon, 04 Jul 2022 10:24:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u15-20020ac2518f000000b0048152c51812sm2339596lfi.154.2022.07.04.10.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:24:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 5/7] clk: qcom: gcc-msm8916: move gcc_mss_q6_bimc_axi_clk down
Date:   Mon,  4 Jul 2022 20:24:51 +0300
Message-Id: <20220704172453.838303-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
References: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
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

The gcc_mss_q6_bimc_axi_clk clock depends on the bimc_ddr_clk_src clock.
Move it down in the file to come after the source clock.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 1a6f5eb09d06..f965cde0e8d5 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -2629,23 +2629,6 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 	},
 };
 
-static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
-	.halt_reg = 0x49004,
-	.clkr = {
-		.enable_reg = 0x49004,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gcc_mss_q6_bimc_axi_clk",
-			.parent_names = (const char *[]){
-				"bimc_ddr_clk_src",
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_oxili_ahb_clk = {
 	.halt_reg = 0x59028,
 	.clkr = {
@@ -2812,6 +2795,23 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
+	.halt_reg = 0x49004,
+	.clkr = {
+		.enable_reg = 0x49004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_mss_q6_bimc_axi_clk",
+			.parent_names = (const char *[]){
+				"bimc_ddr_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_apss_tcu_clk = {
 	.halt_reg = 0x12018,
 	.clkr = {
-- 
2.35.1

