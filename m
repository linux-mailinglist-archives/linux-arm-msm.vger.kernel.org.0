Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D85F64184E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 18:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiLCR6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Dec 2022 12:58:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbiLCR6X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Dec 2022 12:58:23 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AE0D120
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 09:58:22 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id r8so8846403ljn.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 09:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q390N5ZyhCbKOnL/UhN4gXSVTlkcMjFB8IqMB4Tw7+8=;
        b=APguY0t+gOFcs53tvaMltNS37vEltrUyn2KOj8wjR2RpIwwVXqYudRyEwywyUD66O3
         GdzmNdpsfFzcGklZPUwkjoL+wMgizFRTqEiMVy1eOP+5pjnpqxJYGX3hVWHaSW4/z3YY
         SkxGFqb2L1U83/fqtFlRsv4hbpQKEhjB4OiVszpfdaHLgViopcWCDLwi6WiliDv+iCw6
         bWW6gu06vLM4KeinMgx+AQH1IqQ6MFHDXkiGaInsRYkH77U0tyGZFlMHwHFWj6mdLgxq
         bLnlxAnRk/SAGEmh0J9algWoNoleyZJeZfdMFSApDrA7rjfe+9goRL9pQZMhGyebAkyF
         7yNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q390N5ZyhCbKOnL/UhN4gXSVTlkcMjFB8IqMB4Tw7+8=;
        b=aEQ+n8xX7J8vwzEGu8jLW8crdzVCqF6HS/FybtHK2LdF+62ur6epJF7L3TmhsGrUYq
         CMJk3fxi6AKora7Kr5/PyfpyrR/DJVKabehcEKyGBFYz0fndMUgZPhM/pIIGPz/siyPb
         P/PijxOmvbcEBPgzOwlK7mNTOZGeuJB0vk43y9XFpQG5Ojw2dheFKyhiHNu62cPgnrnd
         ryFaPKDxf92/5CGNGHdsBCqyFxJBI9gQwNJ8cjxbo5a+AK8EZFUXfA1Dnr+e+KIesR3j
         7ekfvmkLUNd+7hT59OrSS3e1NtCZJZdffcKndqEeSCoj7h0Pq11NYiJrJ4GRB9FopyWz
         0gkQ==
X-Gm-Message-State: ANoB5pn3300jxmmC5FU4j/6pqcYrLFeWYgQdCwHxVTnapKLN8xu/ZqTh
        6sjv5MnhkpJXVSkcG8ZfjtRihw==
X-Google-Smtp-Source: AA0mqf7pP+WxBIqTgKSfAcSuK/RuSSXLfJSn4AO6BK6/qKNumTmZ1RsN9Z8hxBAd1acWd40HrtlmJQ==
X-Received: by 2002:a2e:b954:0:b0:279:e157:a63a with SMTP id 20-20020a2eb954000000b00279e157a63amr2179785ljs.208.1670090301878;
        Sat, 03 Dec 2022 09:58:21 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:21 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 14/16] clk: qcom: smd-rpm: rename the qcm2290 rf_clk3 clocks
Date:   Sat,  3 Dec 2022 19:58:06 +0200
Message-Id: <20221203175808.859067-15-dmitry.baryshkov@linaro.org>
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

Rename the qcm2290_rf_clk3 clocks adding 38m4 prefix to distinguish it
form the common (19.2 MHz) rf_clk3. The system (and userspace) name of
these clocks remains intact.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 8dcaa63b0623..f407acb3c6d3 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -125,6 +125,11 @@
 		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
 		QCOM_RPM_KEY_SOFTWARE_ENABLE)
 
+#define DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(_platform, _prefix, _name, r_id, r)	      \
+		__DEFINE_CLK_SMD_RPM_BRANCH(_platform, _prefix, _name, _name##_a,    \
+		QCOM_SMD_RPM_CLK_BUF_A, r_id, r,			      \
+		QCOM_RPM_KEY_SOFTWARE_ENABLE)
+
 #define DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(_platform, _name,		      \
 					     r_id, r)			      \
 		DEFINE_CLK_SMD_RPM_XO_BUFFER(_platform, _name,		      \
@@ -474,7 +479,7 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8916, rf_clk2, 5, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, rf_clk3, 6, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk, 8, 19200000);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, 6, 38400000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PREFIX(qcm2290, 38m4_, rf_clk3, 6, 38400000);
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d0, 1, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_d1, 2, 19200000);
@@ -1164,8 +1169,8 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
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

