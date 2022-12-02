Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E349564106A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 23:13:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234837AbiLBWM7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 17:12:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbiLBWMt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 17:12:49 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73BB01DF3D
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 14:12:44 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id g7so2674254ile.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 14:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MZRQ27iiIlmC3Mofd++eqe24lVJKTTth6Ng6tJK9AsA=;
        b=qOLSu1CwE7LSryMVEdLpxMcW2u2rN8DJ2Y0evJB9pQ6GNkz3YF+yUdNLUg61fnjeYK
         bbgwmb0i2+h2jsPKY3/sKTqpNwpwRcsAJo92O3xXcktEZ+lwz6celntYxHJ9LzDpgPy2
         ujUiBhEPGmcP8cnsNgBwBoCDZtV2tXMhAI7eLeIWcvkcxlzr/WgtLkVz5Eo3eSoAOSqx
         dLMss4s6xlI/IjEDEge1hAgk5kt7d9vQ7ah6xX94RRlTwLfLpkUCxzZkMdjv7AB2pErj
         J4KtBxtcBN1oy1/MOQl9p4QiVHcSy5Z2wPKs6O9BMXFSvafw2PmyGacdxWBmT5OOVI+j
         z7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MZRQ27iiIlmC3Mofd++eqe24lVJKTTth6Ng6tJK9AsA=;
        b=1+15QxToo+j4QaxYPosR+QHEKujcQf/jwYtPT8gilrI4s84hcZzyvq1WcSbO1iJxf5
         e1hTgCOWF40D/ppFMdn55goHrWQNFXowFk/8NzlIVrZhdPwZqLjJ9GVax9Prhr1OUkfJ
         JpKAs89bEy4pMMFnab4Hnh3rQOhBRNbNUS3XZy4T/KgtpplFOm9rzLp2ZWcOsSfbpkeu
         5dezzKD8pOd/G2WdUloF0hYCuXGztwvdTBGgbg8i9K/GZdmXsII7V1QM3z8e6Kswl6UL
         /k11+igqxqEC/OuXAF7/Zc4pErLP9v5qG6cBo2ksp7J4UF3GaWQ3Jvp9zhRxkqIWzi+o
         08hw==
X-Gm-Message-State: ANoB5plexESg5olXuBhBGnxHMSULtr2P6j7HavbSSJZyWFkbx1lroxde
        XwwcZXioWwCuBM1VgmTtmGfkUQ==
X-Google-Smtp-Source: AA0mqf7NKDHBCcqWsoB1rFTu+fH2wPlTnoaZdsz+IBreYBWOuQssiA+mjnuS6vQqA48/SHCp9hujpA==
X-Received: by 2002:a05:6e02:dc5:b0:302:e604:f814 with SMTP id l5-20020a056e020dc500b00302e604f814mr21154766ilj.113.1670019163812;
        Fri, 02 Dec 2022 14:12:43 -0800 (PST)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id r26-20020a02aa1a000000b003633848da58sm3162404jam.41.2022.12.02.14.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 14:12:43 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, agross@kernel.org
Cc:     Luca Weiss <luca.weiss@fairphone.com>, dmitry.baryshkov@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: qcom: rpmh: add support for SM6350 rpmh IPA clock
Date:   Fri,  2 Dec 2022 16:12:40 -0600
Message-Id: <20221202221240.225720-1-elder@linaro.org>
X-Mailer: git-send-email 2.34.1
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

From: Luca Weiss <luca.weiss@fairphone.com>

The IPA core clock is required for SM6350.  Define it.

[elder@linaro.org: rebased with Dmitry's changes]
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
v2: This is now based on qualcomm/for-next.

 drivers/clk/qcom/clk-rpmh.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 2c2ef4b6d130e..586a810c682ca 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -606,6 +606,7 @@ static struct clk_hw *sm6350_rpmh_clocks[] = {
 	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_g4_ao.hw,
 	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink_div4.hw,
 	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_div4_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
-- 
2.34.1

