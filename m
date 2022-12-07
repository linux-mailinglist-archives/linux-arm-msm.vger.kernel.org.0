Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1853645038
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:15:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229806AbiLGAPd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:15:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229888AbiLGAP0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:15:26 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E54E74D5E2
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:15:17 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id 1so12605871lfz.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:15:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dncop9G/qyMmJS9xqvaysOBAwHf89coS/wvIHPgRuts=;
        b=hha66+YrIT+NNWetdlmEzIlvNnTNOw3EIForQte8ngYrIaHreP2jbpudZZpPb50KBH
         UtctOHhm9ZVJHKeGFUKTuumX0dTLzxg2rvu+PqcnvewKaYIdfJGCuLOhoXcubyyX5KuD
         TJpWy7qcogEaWxFmY9n9G4nGdpJ/DeanY2WPFRgUj3G70kY8s3SUODsPHt7tXlNeZLnZ
         uqvzrEw6YessZFCSHvggHhr/y2dluyKq/MtOQAHLBFKjYKOqnDdiQ0ypPEjq6tx7D9yQ
         yfbaHCXZnVImNPEOic2wsfJq8HNVcWNkx7+GwfKSldKmnObQEIjWyEVxLiLipWj3j3si
         xPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dncop9G/qyMmJS9xqvaysOBAwHf89coS/wvIHPgRuts=;
        b=Y9bbTEiTZwYc0U+raoaMlTvr0ljuNF7RuIS2r2XmRPH+qBBw9sMuyAlipgZS97nD/4
         l17PiZLapeu5GLZRudYIM4gFShAxncVsZKe/PlCjOitTaU/r7AuKQEhpdTYc9506g2yf
         /Wp3pg9Z9wla21gx80y7KVzdSeu0A97FbxwDhIVMAtm18SukA7woxqBX581MsN1sjAxZ
         z3VFM6XmlY08Csc7l7LeA+cjy62S9AHxJPT875sODeFCa9QOt+8MSWownOJ0fR5jVGti
         IS/ZA/T+O9V6a+r2Es92Ci7y84tAMdLAB5wW3M3zUikyh6WrwlHTpLLeZ2/HDoC8eVNP
         vJ0w==
X-Gm-Message-State: ANoB5pnUsSqanA7fvJ74oYXQcEZayDa5i9D6zTjC75UtUyHRqvBB/Flz
        FWE1v9qURsr6bTaZVY1jOj8gEw==
X-Google-Smtp-Source: AA0mqf5jKsA/iZiytih+WownDKusrN8A+ihka+Q7GpDv+a8nFaYLI/XbdHeDPmK0010tuEnmSWsqTg==
X-Received: by 2002:a05:6512:3690:b0:4b5:6683:e491 with SMTP id d16-20020a056512369000b004b56683e491mr5251068lfs.313.1670372116189;
        Tue, 06 Dec 2022 16:15:16 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:15 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 16/18] clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
Date:   Wed,  7 Dec 2022 02:15:01 +0200
Message-Id: <20221207001503.93790-17-dmitry.baryshkov@linaro.org>
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

