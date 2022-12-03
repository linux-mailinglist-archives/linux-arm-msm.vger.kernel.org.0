Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4351464183C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 18:58:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiLCR6W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Dec 2022 12:58:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbiLCR6Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Dec 2022 12:58:16 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D966B101E4
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 09:58:15 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id z4so8862848ljq.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 09:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LWhm2pPqoK2yxpwds7aSYuOqGn8DG88MfQhW194krYU=;
        b=XYH3Wf8BiEkZwhCYJo+EIYH/K7j5imKMV05vsoL+/2gntZtsdFrvtsJMuvkSaB/Y1k
         l8ahByGDVpzrfjhY2dJk6b6R8OnRIR1GYim7d0/UJzlA+eIMTQFqaeh62WeN3/X8W8X+
         IeE6LnRAe5FinC0InKvvTndc3iCpdjzSNGtmfSbVjdxxi1fFMgAWPSHXg3T3V0JmYDkW
         uG0fnX44Mfl4jzeeMTepXFj6nDofkYhmkBqHxgsvC5mM7T7S+RVFiEp7ctbb5/EozcU4
         NtcKIVUXRBcP+leMHXfdvTGKBmuZwSKD6Y4FT8USmzfkp8b/Y1J5Ik15KbS7EqF3TYlz
         u7dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LWhm2pPqoK2yxpwds7aSYuOqGn8DG88MfQhW194krYU=;
        b=2d1UEjkZB1KdVeTrKmN4io3P4vdzLzGkT797/QeMeanrp+vaql4+r8m3vXmTeUkWBi
         w9TYF3ObrqUuXZ6O5E5vi9LRcuupTyKsqLPxBC4nLc2QnDEag5FrFTctbMgs8/AoZDHc
         mNQQcBiY3c34SydYccbGKqxJ0Vwo11sPlCapnVAeXcBgs3L7KUVgGqrW481fvPxBUxSK
         H/MBW8uCq/CtypBmtvdZitr+5PC79y7jq+KIqjl+gK+BARXD4NfX50kAKrRXJLNYuicc
         hFDHHZMhlA1P+xtqPTmnf65Ry2KCcq0apmasTMUeFU3NlkjJst6G5jT984A3SCLHVyK8
         Et7Q==
X-Gm-Message-State: ANoB5pm4MGF70UJithBKfIS2Z5ZkJ1tI+fXmedynSlzIF2fTHQ+7IVZK
        n4/vpTpExDQh09XcpD1fX3TYIg==
X-Google-Smtp-Source: AA0mqf7H9bNUm7zUPcNlNk/MP9kJcTYSfNNX0Rl38c/N+nkb7EXNBdA3JTzGknmyllumX/a/YdTqfA==
X-Received: by 2002:a05:651c:10a1:b0:26e:a:b5c9 with SMTP id k1-20020a05651c10a100b0026e000ab5c9mr18501590ljn.481.1670090294260;
        Sat, 03 Dec 2022 09:58:14 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:13 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 05/16] clk: qcom: smd-rpm: use msm8998_ln_bb_clk2 for qcm2290 SoC
Date:   Sat,  3 Dec 2022 19:57:57 +0200
Message-Id: <20221203175808.859067-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 42d55bf35a33..6af0753454ea 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1167,7 +1167,6 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
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

