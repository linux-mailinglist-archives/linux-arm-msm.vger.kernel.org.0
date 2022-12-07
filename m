Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC25645021
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:15:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229701AbiLGAPU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:15:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbiLGAPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:15:10 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CF0A4B997
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:15:09 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id f20so5919902lja.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RTP1NRUDSX5225KiuwC45k5TpOV1gR8oKoLR/7vo90U=;
        b=bk8ugj5Qz1qy7mPNsviDC9NeuDALHIfUZ4+BOWgW8h/V8X/Oh5S1EnIuHjiPoejhmQ
         3/s8mhsxIgXl/qqELDxOkNcrCPjypt7j0tPKu4CHKZJsXzhMLgQWwz+i4u9dgi0MDPOD
         /M/ejo9tiCJ5jifgJxy6ovTj2swbjuiRfyjmwEd6jRrkddM0VvIOXIYMJhM+/XRFe/MB
         EYmYS5pcVLBTtNaMLoB8GYM0i/LEALyri1lpST4K8ibdmdCd5uMYTs2TrZLa9T9BMKqF
         cx3aSzPOC/SjatCRy34w5AaPW5Lo8sxVt5odyiqDRBhDNtV0nMA49Scq3Jeh4IlgOXzF
         SXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RTP1NRUDSX5225KiuwC45k5TpOV1gR8oKoLR/7vo90U=;
        b=Wg5MahFKkaHqXJMvuvj+lSltCWTeC8EPwiQfYm5QvFQgn1JQyrr7lTsLSjnBmGVhy4
         1KzEHbau174uifobvHAe3z5qFxr8IIEJq+g/uya03PTFpoYrD3Wpf8v1LvEicsXqxNhk
         jNvPQjfUY+7wKmAZ6h9T4QN58/WeJY14XUkT81QqsSYeoOcwh9I1q/WgQ2oMIP/J6gwG
         aE2F+0NbYkgmZXXk7QvhTo5ELXHV5blHM37ci+wAl8lr1T5aFNCoV/jMOpf/BEcOf52+
         7HgxoU6lHhQJuacaelamA18gsSBC+dNOrkxaxJ03Sh0xWR3P1MG7oFwDJ+eradcNKeYD
         7NAw==
X-Gm-Message-State: ANoB5pmy3diPAAoV9d5+PD6YJJRHjL1e54vCjuz66N98tRlTMhTmzhJW
        aUaiI0kF+yn8GUCaG38JeZlX/g==
X-Google-Smtp-Source: AA0mqf5MPTZMBxcqEuA9orGguuJaYXrYvUA9n+hONYvIOQ3ePqTAmH/3cl/MfEEcO66GP5vazpnvRg==
X-Received: by 2002:a2e:6e03:0:b0:279:97a4:35da with SMTP id j3-20020a2e6e03000000b0027997a435damr16112855ljc.363.1670372107810;
        Tue, 06 Dec 2022 16:15:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 05/18] clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
Date:   Wed,  7 Dec 2022 02:14:50 +0200
Message-Id: <20221207001503.93790-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
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

