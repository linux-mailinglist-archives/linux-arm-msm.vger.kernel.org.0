Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCB6B6FFDFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 02:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239672AbjELAcm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 20:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239666AbjELAcl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 20:32:41 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94ED6EB7
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:37 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f13a72ff53so10470688e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851556; x=1686443556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2jRSMDMTdVsO/Mdr/Nh2wzZ9KeAk9092DrEdnm9Eu+w=;
        b=mzpZTt79Kk1TVhOKCzu8CO08OvcUJ7dwuU/OZOIZz3wKTyIJ3zuZjjRQhH5yDUdX+1
         U0QAD/CxfcGODVp743rv+ErlJyj/6i3S+h8w67pp+2deuIPODIPfrdElx7wDo8buos0M
         vBu+DKrH6+u6/iLWoJlLcIn7PiWtdVlCTmBJdsF2jo0Z0oYnyC3+5FhtjUuC2Kn6xFzc
         oPCiXtVWYONJMmFMRhbDMXuq6hzn5mVelpFrwx/8DWJd1rBza8cctL/sSap3DInRwWgr
         YgrXCiAp3UIFczxTwgKeC34oD+HB5+utR6brG5zJv/d2ZxX5TugH58yf0i+ZfhA+XsmZ
         qCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851556; x=1686443556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jRSMDMTdVsO/Mdr/Nh2wzZ9KeAk9092DrEdnm9Eu+w=;
        b=XtHFmxVPMpmiewKjuiuHp+pDvYps+PLo7GiESu2eFPLZOjbU7g7wvyG7EpNYdsGMu2
         14xOVG9eaYjmg3A0RK3OExV9ZC834xr3FnRQUFXG3yrYjTBd18JDc9vIXsnJtJGVLQYy
         Xjy5G9+4ISThJNrQOyfPu4T0eWgMMHt4fPZ0SxNBH4Yr/STK3rFD0aBeJrhr3R58oeuM
         umRGxXA1fJax4vffvBUonqhNuo3qIGhqB3b0tqZ0RZ6lmsruI2xO8rpm0hm1vLtH0ys3
         HU1ioLTOqqFBdOd2TC8kax1V7bkaLSILEb26VVD7WRiWikTl9jgpNl/jSjXFh7UBtPEv
         84tQ==
X-Gm-Message-State: AC+VfDwHBHoFCgBk77dWS7jM+QNmcFXWAWE7qBYNZaOc875KWkpKw3Kz
        J6CpNg379fhtdjoCyjxCC7Ehpg==
X-Google-Smtp-Source: ACHHUZ7VOAFMAPGE2Bdop27K9F3qrc8g2XmJoSRMPQPjISZRgAevSnZNJytnxckylmhnVNuqNg1blA==
X-Received: by 2002:a05:6512:21af:b0:4db:4fe8:fd0f with SMTP id c15-20020a05651221af00b004db4fe8fd0fmr3096821lft.25.1683851556238;
        Thu, 11 May 2023 17:32:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:35 -0700 (PDT)
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
        devicetree@vger.kernel.org, stable@kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 06/10] clk: qcom: gcc-mdm9615: use proper parent for pll0_vote clock
Date:   Fri, 12 May 2023 03:32:26 +0300
Message-Id: <20230512003230.3043284-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The pll0_vote clock definitely should have pll0 as a parent (instead of
pll8).

Fixes: 7792a8d6713c ("clk: mdm9615: Add support for MDM9615 Clock Controllers")
Cc: stable@kernel.org
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index fb5c1244fb97..2f921891008d 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -58,7 +58,7 @@ static struct clk_regmap pll0_vote = {
 	.enable_mask = BIT(0),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll0_vote",
-		.parent_names = (const char *[]){ "pll8" },
+		.parent_names = (const char *[]){ "pll0" },
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
-- 
2.39.2

