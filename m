Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99C286486D2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:49:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbiLIQtG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:49:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229763AbiLIQtE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:49:04 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A80E294198
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:49:02 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id b3so7941552lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTP1NRUDSX5225KiuwC45k5TpOV1gR8oKoLR/7vo90U=;
        b=rrJ/u17UNNEOMafEIOzZ4XJqd/NAldFZJwKICOO1ka+jbnIRghRBsLsF1ztWmVECBA
         t9daykju/Lgv7pRwwA8mHy7pT/IlMZIpuDf/iMdhbXAIudV0c7rNawvjjcxnMolFL5PL
         2xwpzCV07/uanx4//FgfMW2SAy2/ekpU9zGLAFa5VFO3NRaQ3wsj6sDZnXMQcYygC1A8
         E0vFEV8VWvWPXdDRiWXgqCmRXi/E5YvkpJcENtu9kzBhP+cewK/TEq4ungHqFjFU/Hue
         xSDmIzbQiyzyWJ8hL8pf+KCCpNe2DQtdmnONEe9ieZ+3Rf7Cd6Q2hEP9FQEYjjIAZMw2
         U4fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTP1NRUDSX5225KiuwC45k5TpOV1gR8oKoLR/7vo90U=;
        b=YV9R2jUB08jOiRqxwr1UczO/YLqfUkAc5MGXLc59MvaG1bxuV24a402sU6eGEN9k0Z
         Sr10sd9iJ8XhJMDM/6F2lBM1a2StBxojtXAw+Lmwv/1JYWMaI6qM1e49onOoKAsaNI2R
         wnv5+y6f2Rm8d1N1CPRhTxvZ8qUtEsudqJH/ou9kFZvSPSWYO3H0gLxexh+CNnvUMMw3
         gYG6mB40C6ARMmTrzmV70i+NHD9wIBqZdWNfQNhNVS30saEq27kujvvcJJgVO3QKiRUj
         QdsTDfkQolqWiVymoZwaAeR28j9qFFPgKR2PzHr7tP9KQgsLmJgF+7NFw3iC/Snpps9C
         Zp3Q==
X-Gm-Message-State: ANoB5pnS57jegjvzuKUIZoGHVU92ywQ3E9FpMBIkLHbRCXVBhVw2YD2E
        1cNyYQxCF5Pxuy6j9kK9xUv6Kw==
X-Google-Smtp-Source: AA0mqf5+j6lsj7MFVtxGqywJeFNDokj3nHTORo+8SOYLMTKVbF5oOMvKBMnATxqrO8HHB+qLIajPow==
X-Received: by 2002:ac2:5f4c:0:b0:4b5:7282:868c with SMTP id 12-20020ac25f4c000000b004b57282868cmr1761400lfz.55.1670604541033;
        Fri, 09 Dec 2022 08:49:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:00 -0800 (PST)
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
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 06/19] clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
Date:   Fri,  9 Dec 2022 18:48:42 +0200
Message-Id: <20221209164855.128798-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
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

The qcm2290's ln_bb_clk2 is identical to the freshly added msm8998's
ln_bb_clk2 one. Use the latter and drop the SoC-specific version.

Reviewed-by: Alex Elder <elder@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index a0bf58785921..7dffc30ddb61 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1169,7 +1169,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 };
 
 /* QCM2290 */
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
 
 DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
@@ -1184,8 +1183,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
 	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
 	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
-	[RPM_SMD_LN_BB_CLK2] = &qcm2290_ln_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &qcm2290_ln_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
 	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
 	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
-- 
2.35.1

