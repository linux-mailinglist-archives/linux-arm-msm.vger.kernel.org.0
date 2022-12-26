Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C02D0655FCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbiLZEWN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbiLZEWD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:22:03 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51D672BE9
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:01 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bp15so14652110lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CY5hvEc0maYUi8zObs7GPyxT+Q3yDiQfjteFiwlPy8A=;
        b=oHbEjs9zYip4ahhhlcp7YMIL+EVsBrdYphfA9G6EhVXKQyamNqnmg64ZwlwKoQ5dfr
         6240i4v5zg3BYfEE/czqWVvClwcVqP2+x10a4Q4To5cdWXuypf5l0WAQpHH2ce5en0kS
         fZbzTlKwvPWCJeYTuxNj4iD2QDxLKiGJnToWRVxM4kSKaYkkKQ55vXpoidAtP1Ah4cFk
         OyQ0pRXr3FByQfSqZFg93DFiFRv6VdVUDJh2zLjKyIcOE0Mbt1IvuL+RxX/0dqJpfYon
         zYqobF3q+zIiVvmn/yyxfPVm9qBA8KTX7tH7S4CFQQUwkzaLQTt92C51BStoIwHRixTx
         bLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CY5hvEc0maYUi8zObs7GPyxT+Q3yDiQfjteFiwlPy8A=;
        b=lHUfejXCw0xHybs00b2SG6TaTbwBCG8fHPTp4lH6ywCq0Amu+RDAwaA4CSMoQE5ksn
         IsWVLxW9pKLV1QVLpuDF3Dvxyx+kd27QU1gGliibP3vMrGfjqPT3Cb/Gv0MbTzzXUd2Z
         FJegK7C2JqoSZLIJjZfr9wvHpw/Fod5MJWfQ1tChHgWzUM+3kGcdv4U/RfmpUWxAMNQ/
         eBEgI1GkE99jCBujjNyO2RBSzTCJpzXQjSxgbqRtvzpZZAqLHPhPpoLsg4AIV58q89sE
         lvftg8fqbASje1n+VaSuhwb29bbTKYB+Lp0bVoBVFnDkgnn//pGuNscXykJC08qoC10B
         p10A==
X-Gm-Message-State: AFqh2kovX0NFNxJH8jZzTHWTxmQU6VZK5L1X9DORbn340K9mMSp2NT5U
        0lPuDhXwdrb+jDVlkoTVjxUytg==
X-Google-Smtp-Source: AMrXdXtAn28SU+6QwnPRBXAHjbQ0HMJ98QTOgW0mgLoxxRpMhPTS7gHLTuYFktJqZlQgpJwko+Z5kA==
X-Received: by 2002:a05:6512:2030:b0:4bc:df73:4459 with SMTP id s16-20020a056512203000b004bcdf734459mr4399684lfs.29.1672028519711;
        Sun, 25 Dec 2022 20:21:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:21:59 -0800 (PST)
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
Subject: [PATCH v2 06/16] clk: qcom: gcc-qcs404: fix names of the DSI clocks used as parents
Date:   Mon, 26 Dec 2022 06:21:44 +0200
Message-Id: <20221226042154.2666748-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QCS404 uses 28nm LPM DSI PHY, which registers dsi0pll and
dsi0pllbyte clocks. Fix all DSI PHY clock names used as parents inside
the GCC driver.

Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 507c42d7f753..67a180d688c3 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -112,7 +112,7 @@ static const struct parent_map gcc_parent_map_5[] = {
 
 static const char * const gcc_parent_names_5[] = {
 	"cxo",
-	"dsi0pll_byteclk_src",
+	"dsi0pllbyte",
 	"core_bi_pll_test_se",
 };
 
@@ -124,7 +124,7 @@ static const struct parent_map gcc_parent_map_6[] = {
 
 static const char * const gcc_parent_names_6[] = {
 	"cxo",
-	"dsi0_phy_pll_out_byteclk",
+	"dsi0pllbyte",
 	"core_bi_pll_test_se",
 };
 
@@ -167,7 +167,7 @@ static const struct parent_map gcc_parent_map_9[] = {
 static const char * const gcc_parent_names_9[] = {
 	"cxo",
 	"gpll0_out_main",
-	"dsi0_phy_pll_out_dsiclk",
+	"dsi0pll",
 	"gpll6_out_aux",
 	"core_bi_pll_test_se",
 };
@@ -204,7 +204,7 @@ static const struct parent_map gcc_parent_map_12[] = {
 
 static const char * const gcc_parent_names_12[] = {
 	"cxo",
-	"dsi0pll_pclk_src",
+	"dsi0pll",
 	"core_bi_pll_test_se",
 };
 
-- 
2.35.1

