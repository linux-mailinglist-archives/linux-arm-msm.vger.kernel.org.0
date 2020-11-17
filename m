Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F35E62B6483
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 14:47:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387710AbgKQNro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 08:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732800AbgKQNrV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 08:47:21 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EB6C061A4B
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 05:47:19 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id a13so1281331qkl.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 05:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bSmgo4rQ5O0fX8LYI85JiwQBIWbes3kZEYBAYwb9WP4=;
        b=pADkLWn3Qaa/5GwfpL3hT5/lWoignlAcveK+X397LauWuhBnOiMq/ILZKtqAWfe1KO
         TtA2TDvPwJFR+f8jX5dOIHRmw792c1hQM594gnsBCohcpy3ODIia7JpbYxXF+DXLW/hf
         rJ8nhw2blGDt+ivDTOU1eGl1U40D9Xuu7dqrHySUzsa8N/NAM3GeQoiawpsACrxeas0P
         JUh8DJ1CfQhmPyhU5p9MsurK5JnwbTUONlqIWYtrTvNAVaY9aUjLZ7tSdw/qXz3RKzLm
         mOGA0jVPoeiznkTX5eUTf207QvbNFHPT5S17yPK5FHQSGvgMrc7Y29RwnFp6j79g1VSn
         kWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bSmgo4rQ5O0fX8LYI85JiwQBIWbes3kZEYBAYwb9WP4=;
        b=PghcJwyGagt0ljjlQPWJMdrsT4mdM5I/ax8c3MVjJIlyglwc9dWaIiUW5iIWM70eKS
         hIVNZmoiwswfPMLJ9MtJNqTymomPramwHSCrtMfOZJSb2SGpsq4OT2XfCvI0EffF4Qez
         W59TTeXsuepS+EYKQDfE+gyM/15fMQrZ/wntBTQVP46NfWDZsSkiPLmGGdcIFKcii6HI
         E8EGrgGfy52Drr7IJttQ2pqeL/6hdAExuugvAA3cEGWd30Bf3BpDvigYhlJtY3j0Aqnc
         VBaMKnZpXQgwC4pDnOenPaoD+nOtwkbHZgZnqXsbew5IAZha5rL/K/mhcmHLqSNoskBC
         b09A==
X-Gm-Message-State: AOAM530yBKVszNEwb8/hsSStsLVSJMAaypVsQj39mVr1QjFzCVaFiOx1
        UdRMG68iXMZYLqPxdM6jP1QQRw==
X-Google-Smtp-Source: ABdhPJxZtI6Mq2GWjbvPL6wQ5zSPvGk2zzdCa0OsPopCnS8G45403JlJFrwj2mT9Rk+LrGbO3gKTmQ==
X-Received: by 2002:a37:4897:: with SMTP id v145mr19613184qka.134.1605620838558;
        Tue, 17 Nov 2020 05:47:18 -0800 (PST)
Received: from pop-os.fios-router.home (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.googlemail.com with ESMTPSA id t133sm14607355qke.82.2020.11.17.05.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 05:47:18 -0800 (PST)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        robh+dt@kernel.org, sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/6] clk:qcom:rpmh: Add CE clock on sdm845.
Date:   Tue, 17 Nov 2020 08:47:10 -0500
Message-Id: <20201117134714.3456446-3-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117134714.3456446-1-thara.gopinath@linaro.org>
References: <20201117134714.3456446-1-thara.gopinath@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm CE clock resource that is managed by BCM is required
by crypto driver to access the core clock.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index e2c669b08aff..7e2a4a9b9bf6 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -349,6 +349,7 @@ DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
 DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
 DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
+DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
 
 static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
@@ -364,6 +365,7 @@ static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
 	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
 	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+	[RPMH_CE_CLK]		= &sdm845_ce.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
-- 
2.25.1

