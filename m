Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5D5574A0A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:04:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237858AbiGNKER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237673AbiGNKD7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:03:59 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A48DF9B
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:58 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bp17so1978061lfb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YqQw+hyZrOSvmDZjue9kde/HY6butVNaHprEEy1Lvvs=;
        b=yEXH5JSEEmuCje6GpBhQX95NQ+K/ECEoI/mIj7PJDK0z6LI/cNmhK2cv8IbwV/B1Hb
         0kY7bQXObD1eo3eFGp8IlQP0PLkM+RBCy/CZF9Y/ZH/rUMzDJiWo+ydlel4xP4DeP8bE
         E31+weZEyXSuvDwYJuceOH9SdZ2CexRnL2yHf75zvq7o+tw5vtRkLTTcIu+/IV6tfpcp
         D+lhxMJJHuHT7qX5xMf+Z28+rinkd9iutST+nMoFP3+L9NTIMTpBsk6FesojRzHL6oEK
         UZ1wT226gGVO0E5dq6F4w15HTzCd5IxlRNGDA1q+VhXa6+TmUy4IaEj4+ldkTZp7sx9q
         NdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YqQw+hyZrOSvmDZjue9kde/HY6butVNaHprEEy1Lvvs=;
        b=aB+7exHC92ubjjnkYIt6o7SfYqOmb6enf5gAVS0EGAjTX7Ysw40GVjRXJS78sWJ+wD
         sDtfbg67nk4URMmoErb1dTXVv1X2nCXG83jMxDUz8mxz8FBJzxaiezhZExJqHibVVBTb
         KDRrTR5QCLyMYRRtVyxrFbRhyTNQfwX17Qv2Ev982Y1+JWYOCzRyHxcbbNJu2F8bz9N9
         Wzt++aRXyl+dDmCv6EnaQwSH4jJFXGCCyKix9/470Hb4hUFupeGrPU8PSx6kvPv5zO4d
         UYaRVmvgYeK94nH7Uzxytavcs3pEKSltwJwngGlK+W1djuk/dezqZ81Ca86OjJ2zthhV
         ch/g==
X-Gm-Message-State: AJIora/QpgoUt4wZ63uOEHkEgy8129mFqMmHxFSJ4+ycrdTObnhMTv99
        xoWeWZrYyXaTj1Kn8/+ww30zGQ==
X-Google-Smtp-Source: AGRyM1u3UowzkELPYriWql+Kw5rsqUcTow48EopecVCSSsFRtxVaO8JJtQpLsVro0WsrsPKJ1os02w==
X-Received: by 2002:ac2:5389:0:b0:48a:1070:775d with SMTP id g9-20020ac25389000000b0048a1070775dmr3179089lfh.266.1657793036327;
        Thu, 14 Jul 2022 03:03:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:55 -0700 (PDT)
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
        Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH 4/6] clk: qcom: cpu-8996: move ACD logic to clk_cpu_8996_pmux_determine_rate
Date:   Thu, 14 Jul 2022 13:03:49 +0300
Message-Id: <20220714100351.1834711-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
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

Rather than telling everybody that we are using PLL as a parent (and
using ACD clock instead) properly select ACD as a pmux parent clock.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 3dd6efdef82d..5c5adcb533ce 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -284,9 +284,6 @@ static int clk_cpu_8996_pmux_set_parent(struct clk_hw *hw, u8 index)
 	u32 val;
 
 	val = index;
-	/* We always want ACD when using the primary PLL */
-	if (val == PLL_INDEX)
-		val = ACD_INDEX;
 	val <<= cpuclk->shift;
 
 	return regmap_update_bits(clkr->regmap, cpuclk->reg, mask, val);
@@ -371,7 +368,7 @@ static struct clk_cpu_8996_pmux pwrcl_pmux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 0,
 	.width = 2,
-	.pll = &pwrcl_pll.clkr.hw,
+	.pll = &pwrcl_pll_acd.clkr.hw,
 	.pll_div_2 = &pwrcl_smux.clkr.hw,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
@@ -388,7 +385,7 @@ static struct clk_cpu_8996_pmux perfcl_pmux = {
 	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 0,
 	.width = 2,
-	.pll = &perfcl_pll.clkr.hw,
+	.pll = &perfcl_pll_acd.clkr.hw,
 	.pll_div_2 = &perfcl_smux.clkr.hw,
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
-- 
2.35.1

