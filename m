Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D8E645022
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiLGAPW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:15:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbiLGAPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:15:20 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028D14B9A8
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:15:11 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id s10so5084663ljg.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8baNdlZOcEa/P1xvM+5WO2chpZyOckq2nTwtl1+5PhE=;
        b=Erzo6PRruMrP/n89Ekv5cnsZ6I7vQ6pZX4ZcSYaVMJ7K5KQWWdk6QFvKr3vVlI3tvM
         HzFbUTvdN84XujEFWEQubQNm28jRM530O5d2xzZA2zirUkaT07uiAxX26qsi0fA4aIIz
         uEwwKwMBg0H5Azh+eXqQCGNlw+uRHsAD5FD/E6Y809PyeAoDqxq24V9fnkr2ozscUyP9
         EbrtZDxn5qIAPR/EP7hqkq6zJ8c0NNRdKVegPcvVf746OoJawUjIJ1XMPMQ7ssIbdYCh
         6L3f02rroe/KM74XE09vF166S6tsBXaH7kP/XOOBJTUwDwlLJnEY3JMyx+Fr2xjEWf1N
         Q9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8baNdlZOcEa/P1xvM+5WO2chpZyOckq2nTwtl1+5PhE=;
        b=AnG5Xp/q7iSGrp5Lk7AOGYT1mI41e/s4//hmsjaxueF5BSR0mJUxkosp473LYKt6UL
         jkhf6crRmQ9pt1ut8frGJW+uQQRBULUHVl5Wp3QHYwHz2REuI6EWewZubcAPaR/JQcTv
         q01lQdjzOxHe4NUg2bQbYyI7vDkbLRIhS/v5uTvujaGdeqvMEsCeUfrK0sJx1jIMFElr
         ie/msH/3fvNWg3B+TFKMEqXoasNiTYZsZYMOmxrmjRG//UcE4ZeOb9IVjRVuXz/mYtQU
         G9BCw64QOAoU05ooZBB5XqkqC6u+ym/XcVhQX/pbA+40e67+RyLhwPUBZgaKORaI9fRJ
         YMdg==
X-Gm-Message-State: ANoB5pm3nQNuBOfzHXRJ5gN017g5vxbYxCa2lrPV73BfwX8Fn3jqO3t8
        rvjF5fxGnB1tkG79ZvhIKn4D1w==
X-Google-Smtp-Source: AA0mqf6gNdD+AnuPghr+Wojbo0T0rF0QiTu6tQlFNohJatmF9bo7CZqGT7QEdVwc003oig7jylNgkA==
X-Received: by 2002:a2e:ab0d:0:b0:279:70c4:1e12 with SMTP id ce13-20020a2eab0d000000b0027970c41e12mr22713130ljb.206.1670372109351;
        Tue, 06 Dec 2022 16:15:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 07/18] clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125 clocks
Date:   Wed,  7 Dec 2022 02:14:52 +0200
Message-Id: <20221207001503.93790-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
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

Reuse sm6125's MMAXI clocks for sm6375.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index add92ecd513d..024665438b62 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1126,8 +1126,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 /* SM6375 */
-DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
 DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
@@ -1146,10 +1144,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
 	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
-	[RPM_SMD_MMRT_CLK] = &sm6375_mmrt_clk,
-	[RPM_SMD_MMRT_A_CLK] = &sm6375_mmrt_a_clk,
-	[RPM_SMD_MMNRT_CLK] = &sm6375_mmnrt_clk,
-	[RPM_SMD_MMNRT_A_CLK] = &sm6375_mmnrt_a_clk,
+	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
 	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
 	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
 	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
-- 
2.35.1

