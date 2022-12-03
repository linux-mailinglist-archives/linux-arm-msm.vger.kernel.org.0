Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDA3A641834
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 18:58:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiLCR6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Dec 2022 12:58:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiLCR6N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Dec 2022 12:58:13 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F2313E1C
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 09:58:12 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id s8so12217284lfc.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 09:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ELXMeQkBiTBKtpg2nqKzHDNFnx2dHjATzNl3W9JLTRk=;
        b=Bw0TpFtPxRjENjmgzDpHg62KJuhsXSf3u3KBc8B57leav7GarWPG8lBE3IVkOCWkVD
         ElrjHKSBWxrkPo+pxI/PAL8GY+hXoK087SCnN6UOoyXclkXcI8wod640huzKEO45iyHQ
         NoW+fkiNdfMLV+UxkIEDQdsdYKlhRUszjhu3UFzzloj07pOhVbDlo8ssZIADgJfQvO2E
         eHzOxCeWEAx+Yp1N4htLvweZU7I7f0kvjAdrvReO0H4irN0LyAFuAjEudOSwlUS0QBB+
         BEqpvZyUC7VdL6o/rzuDlPLkWONHU0fknGLTenUe/iiI9ZAMfNTmqomqBLjoeTPQFpVS
         Kyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ELXMeQkBiTBKtpg2nqKzHDNFnx2dHjATzNl3W9JLTRk=;
        b=izOh/jRWUrspERH2iqAJQlWXZRXR4ttCTie6PvkeG0z1p6A+5MSQ7cMJP7gkOhxyBT
         ZwZcPENK4uFS78qWQtOmWRe0Q33aUGhBvZphiPhTb2sWDICjYmY7JQ5FIoIfbOcJUon0
         JX2H1l+RxEE1QpaquIqgRysCZ+cqAIdHjc/gR9AAwaRzcR2+Gq+clONQo9Q7oolVVMzO
         MnhfaTNhIQVYEbw64juO6v7EwG6wogblIlPAF1Kn0lw7qCUzxgEj59LObgwLWI0rdhe3
         OkPbOsi2s4Il1kAt0Cx2CSZGE5ynguS3RHXmgci1ckHyqDqE+yGQgjCeeEcao1HB2oya
         c6TA==
X-Gm-Message-State: ANoB5pmVpyTNDcey/AKaeQJj4rwE3DvTvxK5ubVP/A2O41Qc/64tQAYs
        31AhhkB8Ar2+0YlUbF2ZKklDrw==
X-Google-Smtp-Source: AA0mqf42Hrum1uhi4OZiHHdXY2724LZoyxjkjAkFannzjMfqs3vV1bG6/NSqwXX4IqW8ez4lAnr6Tg==
X-Received: by 2002:a05:6512:368c:b0:4b5:611e:ed94 with SMTP id d12-20020a056512368c00b004b5611eed94mr862896lfs.514.1670090290734;
        Sat, 03 Dec 2022 09:58:10 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:10 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 01/16] clk: qcom: smd-rpm: remove duplication between sm6375 and sm6125 clocks
Date:   Sat,  3 Dec 2022 19:57:53 +0200
Message-Id: <20221203175808.859067-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
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

Reuse sm6125's MMAXI clocks for sm6375. Also drop QCOM_SMD_RPM_MMXI_CLK,
which is equal to QCOM_SMD_RPM_MMAXI_CLK.

Fixes: 644c42295592 ("clk: qcom: smd: Add SM6375 clocks")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c   | 10 ++++------
 include/linux/soc/qcom/smd-rpm.h |  1 -
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index fea505876855..077875cf0d80 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1120,8 +1120,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 };
 
 /* SM6375 */
-DEFINE_CLK_SMD_RPM(sm6375, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 0);
-DEFINE_CLK_SMD_RPM(sm6375, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMXI_CLK, 1);
 DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
 DEFINE_CLK_SMD_RPM_BRANCH(sm6375, bimc_freq_log, bimc_freq_log_a, QCOM_SMD_RPM_MISC_CLK, 4, 1);
@@ -1140,10 +1138,10 @@ static struct clk_smd_rpm *sm6375_clks[] = {
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
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 3ab8c07f71c0..82c9d489833a 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -41,7 +41,6 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_HWKM_CLK	0x6d6b7768
 #define QCOM_SMD_RPM_PKA_CLK	0x616b70
 #define QCOM_SMD_RPM_MCFG_CLK	0x6766636d
-#define QCOM_SMD_RPM_MMXI_CLK	0x69786d6d
 
 int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		       int state,
-- 
2.35.1

