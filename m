Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C625E6486F1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbiLIQtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:49:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbiLIQtO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:49:14 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16788950C9
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:49:11 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id g14so1526647ljh.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dncop9G/qyMmJS9xqvaysOBAwHf89coS/wvIHPgRuts=;
        b=sPIA4PZrEA4+/AZi8OhGB7FkqjCUVTMx38u7lLor9JM+01A7iFtfzrk7aTvTRBOSR/
         AP/t0bXAq1RC3yMY+nXvMe08RQzUZSyx7Js7s5kWvuttgThsAtzVAJtgSToMdWvRj3f9
         Hfqx/6uD7RNW+CXhV+cWML4BQJ7Gnwrn74Q64VtWGmhpGlfC2WtWHgm5BaAgbPPR37II
         z40sDGktQvWvmrN30wJxjBOy/zl3+OUsmzgT9TzQahsBFTNa+39sH3jGP2iYEBO3ThnJ
         5RNj3pSVovdVWgNhJoYYkeiC9sWBVZ2VwiAY/kBh6+9XPc4AwKhRdFQ1ihp6oPJtcoxM
         SP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dncop9G/qyMmJS9xqvaysOBAwHf89coS/wvIHPgRuts=;
        b=zaR9R1joR5t9M+kyEgbziq/Ds6j8Pr3SLP688bMxoCqj1gyFuZaVmIFn4Awc67Fl7y
         XGNiXa2hABlLyeYNPoPdKzNkH/P333XGN5qw0bsoYoBj5d/UP9/r9htPg0QY6jE9SOn2
         j2Id6UvngplAYmAVqflkFgQ8UsDMxU9wg0f1Jy1GOusFnfUlHalFoMo8ge8D71UiCoGl
         VyztQviGDKAxk1QD5P5Eo8PKBnVDmNaiSu2jRWaHuhwYQJqzLY/q/ILDBFuyX7wv3ULx
         tbx6yLik4NLcIs3f5wVwFepGY5ttcF7F3SfVkrl7LHBd5T7H3hQ6IOEll88pg2UFOtf1
         t/jA==
X-Gm-Message-State: ANoB5pm0EhPREBxNtE/4Sguk4BAbvyonNLu24K0PyQ25d8Ml6Nq+MEdg
        etZJ8pSH2KJAySKTaMvCQ6OjiA==
X-Google-Smtp-Source: AA0mqf6VXmHaOp2Bhe05WKSAS35c5WNDIxAby7v39iZWlGjp28ghOJTzm0wS4v/6LspcZaE7KVxyjw==
X-Received: by 2002:a05:651c:381:b0:277:3c85:3cd5 with SMTP id e1-20020a05651c038100b002773c853cd5mr1674314ljp.22.1670604550664;
        Fri, 09 Dec 2022 08:49:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:10 -0800 (PST)
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
Subject: [PATCH v3 17/19] clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
Date:   Fri,  9 Dec 2022 18:48:53 +0200
Message-Id: <20221209164855.128798-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
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

Rename the qcm2290_rf_clk3 clocks adding 38m4 prefix to distinguish it
from the common (19.2 MHz) rf_clk3. The system (and userspace) name of
these clocks remains intact.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 8963ade901ea..4db92d2d91b8 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -133,6 +133,12 @@
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(_platform, _prefix, _name, r_id, r) \
+		__DEFINE_CLK_SMD_RPM_BRANCH_PREFIX(_platform, _prefix,	      \
+		_name, _name##_a,					      \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
+		QCOM_RPM_KEY_SOFTWARE_ENABLE)
+
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name, r_id, r)	      \
 		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name, r_id, r);      \
 		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _name##_pin,	      \
@@ -480,7 +486,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, 5, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, 6, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, 8, 19200000);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, 6, 38400000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(qcm2290, 38m4_, rf_clk3, 6, 38400000);
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, 1, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, 2, 19200000);
@@ -1170,8 +1176,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_QDSS_A_CLK] = &sm6125_branch_qdss_a_clk,
 	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
 	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
-	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
-	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
+	[RPM_SMD_RF_CLK3] = &qcm2290_38m4_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &qcm2290_38m4_rf_clk3_a,
 	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
 	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
-- 
2.35.1

