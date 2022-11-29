Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA65663B633
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 01:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234840AbiK2AAy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Nov 2022 19:00:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234785AbiK2AAx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Nov 2022 19:00:53 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900DE5FC1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 16:00:52 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id n188so8903461iof.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Nov 2022 16:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hhfYdg/3GZik1IMOmAbhjnBOvfz8Tbl2fRiogYFz6Ec=;
        b=B1K8iVpwgNKycprzKMVupGt5aU3/YPZoE3ne8dVcDjdWV49CsomNWXyocSa3LSVOzY
         y0VeWqruxwa2dFxPn9Le4BKYckcCT1piWPp07YLttD/d00iAOE4WkHWi3XfanR9acWby
         VwLnp5rNVcqdnzWJQeJGjyDoYMvfJBkmcwersQBSR3XeiEifLEHf8xI27/pcmia/kqvS
         QYf7Hz8qm2XmCojHgwCpUnUrxD0tEny0eT0eT1BpskOwwf+oNrAJ40EdRzv5G5UJu50M
         hryVptODwnMZ7I8mXHW+rWy/xD6w7NqFe/uRShkE0fMftpJKSiVEeqluQ9y83p39vphL
         u7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhfYdg/3GZik1IMOmAbhjnBOvfz8Tbl2fRiogYFz6Ec=;
        b=DvHIXhijJ9szRWRSrgFwwjlTsA94A71WgTscR0zVsDLs1XhOnJmOqM73N+WFMiSuLv
         Xb/mSfQjKzVOKPchZpTbrdu0N61gi7fwQ+Y6LbxHXSNRLF2/E/V9S4tdNykg1TtHVlA/
         Rxp813scfXUVtsM/4t5MS9ZCHIPJTU350N7bxzYQH9Sse6sv965cVn4OHmFEAG6mM/c0
         w0bl9klNrlb8/hrGJWNJrwS/a6rw0jvIwGbTTkX81Qmwv+f9aC6u088MSumw53aeXFho
         2+IWrOrBUXDjXmppfPjPuFQWmFdmYa7d6qEujsmTfxKodj6+9nmYRxYqh0d0+ZGZYB6S
         HTdQ==
X-Gm-Message-State: ANoB5pmn9R+6v39e5vUATJ3X4d8S9JkBTYA0b7UsvD4OgJRAEEIpOkUV
        28XbneNVYhPABY/X7j+HXx1p7A==
X-Google-Smtp-Source: AA0mqf7DA4USSvm8KHAP2sWWiM6AxLdfxFxR0kIOpEUl8QFNby1SQ6cUuW6Xh7+oF0bcd5Uj4eGv0Q==
X-Received: by 2002:a05:6602:887:b0:6bc:1103:f36b with SMTP id f7-20020a056602088700b006bc1103f36bmr15104317ioz.205.1669680051850;
        Mon, 28 Nov 2022 16:00:51 -0800 (PST)
Received: from localhost.localdomain ([98.61.227.136])
        by smtp.gmail.com with ESMTPSA id ay10-20020a5d9d8a000000b006de38ee994esm4969314iob.47.2022.11.28.16.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 16:00:51 -0800 (PST)
From:   Alex Elder <elder@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, andersson@kernel.org,
        konrad.dybcio@linaro.org, agross@kernel.org
Cc:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: rpmh: add support for SM6350 rpmh IPA clock
Date:   Mon, 28 Nov 2022 18:00:47 -0600
Message-Id: <20221129000047.697089-1-elder@linaro.org>
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

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/clk-rpmh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 0471bab824642..6a5887aae21a4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -603,6 +603,7 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
 DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
 DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
+DEFINE_CLK_RPMH_BCM(sm6350, ipa, "IP0");
 
 static struct clk_hw *sm6350_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
@@ -613,6 +614,7 @@ static struct clk_hw *sm6350_rpmh_clocks[] = {
 	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
 	[RPMH_QLINK_CLK]	= &sm6350_qlink.hw,
 	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_ao.hw,
+	[RPMH_IPA_CLK]		= &sm6350_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
-- 
2.34.1

