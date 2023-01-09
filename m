Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1920661B86
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 01:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbjAIA35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 8 Jan 2023 19:29:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230166AbjAIA3r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 8 Jan 2023 19:29:47 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4EB10FD1
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Jan 2023 16:29:46 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id j17so10632748lfr.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Jan 2023 16:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb4Hmw0ivnJsVO8PIbi88m0ZabNr+OPDmkSoxgPdTJc=;
        b=kfA0sN/szPqeUnMr6kvcQTrgmwZrO+ZhLuvfLeFgJ4oLmb2U0aEkYE5Yurc6tasULk
         QMfQuWmiJ+QldJ9q0BpE+B6Um0GOOLZG+xsrzTwZlcMnSAiJsq7iESTCSF6yuDLW6Pua
         XJg9yovoBUkaZIx5mfmbHnEr2Wm2LUqot+ogjKeyCa1JJ+EyczUYbUjl31WacyujvUuD
         exzWUiK+XPJEx/1y+IXVHej7c/vAqEU6uHRC76JElNRuIBIAmWHhNPD9Cz9dpN5uRv1Y
         o0+hR9jMKtqxFko/Up6uua2bkklQhIKglSKqPGo3wVwzplFxZyI8TbusBDzoeH8im7+D
         05kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb4Hmw0ivnJsVO8PIbi88m0ZabNr+OPDmkSoxgPdTJc=;
        b=GsPNo/G0RWg7UpInc1XhQ+Ij5KTLXHcrtfHqyVneMU3vLc+ZkOC+7HREITPUWWhEii
         RqQMwkfTpHbzOHFdV92XF+A9oRUel8B9d0uyM+PoFvzd4HG4EEK7XXII0KmNHFtP95Cs
         QluZEGRgV5e7/0g8mEVJObDM0xrscr5QQQvqxZUkjoFBQzog3ZvWKieXJUpw9vvnnUI8
         Ooxs4gtxAzyem1Ijeo/3Uu67b9KiXF1YaJFufgc9yOgxuDML6tBhJhHBYovEWrRm3Irv
         VvveufFpu1oOTuQ8E4TvsTqY6q1yMnAoEzDvDRib1aZYh8mU6DH+cKFjgLjt/azwHM7q
         19Nw==
X-Gm-Message-State: AFqh2krt6hIZRVq2+0Y3h6xbAMftHlPTvxSl6DYfaWB9TNYexKk/T8Au
        1v4avSag2JXd88vEz1S+CV8vaQ==
X-Google-Smtp-Source: AMrXdXsAMmHtU/nYMUvA+nFtJod6ijOnt2kZOEg0ludb0KI+AXAy0MdF8wCg7iQtuF1/q2wazJpM0A==
X-Received: by 2002:a05:6512:1307:b0:4cb:3d40:93ff with SMTP id x7-20020a056512130700b004cb3d4093ffmr7907463lfu.58.1673224184965;
        Sun, 08 Jan 2023 16:29:44 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020a2e9816000000b0027fc54f8bf0sm706626ljj.35.2023.01.08.16.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 16:29:44 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     Georgi Djakov <djakov@kernel.org>, Alex Elder <elder@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 10/12] clk: qcom: rpmh: define IPA clocks where required
Date:   Mon,  9 Jan 2023 02:29:33 +0200
Message-Id: <20230109002935.244320-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
References: <20230109002935.244320-1-dmitry.baryshkov@linaro.org>
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

Follow the example of sc7180 and sdx55 and implement IP0 resource as
clocks rather than interconnects.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 7db5a53d73f0..05940e51b261 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -455,6 +455,7 @@ static struct clk_hw *sm8150_rpmh_clocks[] = {
 	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
@@ -494,6 +495,7 @@ static struct clk_hw *sc8180x_rpmh_clocks[] = {
 	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
@@ -514,6 +516,7 @@ static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
@@ -556,6 +559,7 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
-- 
2.39.0

