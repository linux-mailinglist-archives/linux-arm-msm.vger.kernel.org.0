Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27DCE6607CF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 21:11:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230032AbjAFULM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 15:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236200AbjAFUKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 15:10:40 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1DEA84096
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 12:10:38 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bu8so3534153lfb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Jan 2023 12:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmoHH6Hgcnax4siMasK0u+Npv8V2UvkY+nngddvtueY=;
        b=p57rjAp7lL4U0Yiv3/b2rQb72TkoTWnx/81x9BBdcG10iTsMkHd7j7ZC48O+IZnRh9
         uuvp7LLq+nZvMlKwiv2Yt01ZanM48OUj7aL6ga1ooGzHDbrq2GvAq1diyDo0qXL/naQM
         SLywR1Z5n3RUATTQruSsinNtN2x1EQKlxedCyyIABful73gcSA0uUwdVzD07N5dMXjyv
         9bMDpgoCiWLCd/KsuzYh2+4+LOoyYG598N0URsN0OtxUAGbNGMCWpIkixKQtWu+TYmN9
         ONe3fDFewOwZtQ+brv3Imylx/A/bjGyBZRN/m9ua7g8NPUasYndgFxc4gJT/9pi/rD32
         A8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RmoHH6Hgcnax4siMasK0u+Npv8V2UvkY+nngddvtueY=;
        b=beVNhfqPfesCITxT7iDicWidNlJ9hC5gSj/iYn7EgT5O2hTfUHcAu2Nt4xw0NtmBwV
         BuxDsRUyHZddHiUDUeNeoJB0PDAAmw3yStp3BhXPLhwDI9qIm23jK3/6FiT1BHiVL4sI
         t3f2bl8QIqOC/60pIwIGteKjd6L9G8ELiMscbr0tb/Ois64p1lpSX7HCl+Z0RUajSZ4y
         cbG62dxciITOgT4w0xTCVaw3GAV1zulcpQvf0GsMoIEY1/E5URBFbBF1APuAZbDDW9mp
         Ck8WmM1nGFOmB1ww+RN//H2OK3MwhRY3fzEcRQXee5OiJh2MJ5mp9gOBVFGR2V2oHRp3
         1MiQ==
X-Gm-Message-State: AFqh2kor4tULf2CC+8DuRzM1ADjm1uyhitma4H9Ng4I+/vp0idzYrdOz
        i5WQK0CA5fCimOUQzs1pwcuAZg==
X-Google-Smtp-Source: AMrXdXvzNENdbm35qnG4EAUyzRBiu68z9wGV++yc9vltA2yHxWGn2FKCYPRdR1kXH1WkYUdKutrviA==
X-Received: by 2002:ac2:5f6d:0:b0:4b5:830d:12b7 with SMTP id c13-20020ac25f6d000000b004b5830d12b7mr13082099lfc.41.1673035838237;
        Fri, 06 Jan 2023 12:10:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f14-20020a0565123b0e00b004b7033da2d7sm260875lfv.128.2023.01.06.12.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 12:10:37 -0800 (PST)
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
Subject: [PATCH v2 09/11] clk: qcom: rpmh: define IPA clocks where required
Date:   Fri,  6 Jan 2023 22:10:26 +0200
Message-Id: <20230106201028.1809541-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230106201028.1809541-1-dmitry.baryshkov@linaro.org>
References: <20230106201028.1809541-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
index 586a810c682c..5f914cf36b10 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -445,6 +445,7 @@ static struct clk_hw *sm8150_rpmh_clocks[] = {
 	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
@@ -484,6 +485,7 @@ static struct clk_hw *sc8180x_rpmh_clocks[] = {
 	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
@@ -504,6 +506,7 @@ static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
 	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
 	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
@@ -546,6 +549,7 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
-- 
2.39.0

