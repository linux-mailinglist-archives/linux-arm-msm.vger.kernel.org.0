Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCD84666388
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 20:20:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjAKTUV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 14:20:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234831AbjAKTUN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 14:20:13 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4A8D16586
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:11 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id bn6so17040349ljb.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 11:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRtL6Eef4RVgyfHAkdoUF1I7EUT/FswJ9g5onTCIfoQ=;
        b=hhLFIE8mcq9jQntC6JKJYrzOWorc0tkPXXeghVqmKf+tK5KMecdQlacVW8jxqIPNXk
         Dcq7j5q602MMahelnW0Lb/bjS75CR/MCOZJSs5YbB8ARelab8Rn3I8AnW3IZXqJLkzM0
         aspaywfNlRnqT3laWvposvhfro0C+z8X7iMlXbR9IleaAMGKN4pZjIKK/fVPSuwYvrUL
         7P1ihnx2J5ECEnyPO/H/95tzaWN/ec5eABaXBtuZOTSM4RHdV4XxR1zje6xGJiUocJTG
         NUGf6U7A/Ywf9Uvb4DewL0FTdUQdWNUCfpWZuFqcfjkynNjmMO+PZNwEcMOGmvQ68M+V
         URtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRtL6Eef4RVgyfHAkdoUF1I7EUT/FswJ9g5onTCIfoQ=;
        b=wHBORUxjzr/x0BCfe2Kpbd/nLH6mCH4UEn0zKdU3sAWcCYNdeNsmpPLjrQticKJx55
         wc1jdEJ3DxsQc394TNje693ls+4ObMhxXe5MQe+Jgj99ZVIG7K8otLgOeVjQNFTVpfoT
         YjwwvYklE4pPUhtdp23ezlXbO5XBF9BnsucIQsgr+pGYNqb1db8OLIDgHm8yux4pM9fH
         eUCJcHptie4kk7oU2GIc8oTrreoxgqCYE6ZgkR9Z7NZ7UP0iwZlq8JaxS/6CZJXHmQBa
         CUP44M8+1bUvM4s7ROYY5MDNqtcYF84EmVAWSh/aLjKjCA0IsgC115UJMeqGdZqHG/pL
         xsGw==
X-Gm-Message-State: AFqh2krt2y5Y9GAUBFzMY1POxMuzaZoctPtpkAyNV3se4Pv3mSQe50ck
        BPFTdL0F9+jxLzRj/y+FRsxLUw==
X-Google-Smtp-Source: AMrXdXvCBIkAEZGDbN/ZqLtvndgjBWGXqt3p/tDjEf4UH4lqYIbGvE+PTCzH+rfOp05DrRSehw+yfw==
X-Received: by 2002:a05:651c:2004:b0:27f:ff67:91cb with SMTP id s4-20020a05651c200400b0027fff6791cbmr6924851ljo.12.1673464811513;
        Wed, 11 Jan 2023 11:20:11 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:11 -0800 (PST)
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
        devicetree@vger.kernel.org
Subject: [PATCH 06/13] clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
Date:   Wed, 11 Jan 2023 22:19:57 +0300
Message-Id: <20230111192004.2509750-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
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

- Do not use the Alt PLL completely. Switch to smux when necessary to
  prevent overvolting
- Restore the parent in case the rate change aborts for some reason
- Do not duplicate resetting the parent in set_parent operation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 7e5246ca7e7f..ee7e18b37832 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -506,27 +506,34 @@ static int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 {
 	struct clk_cpu_8996_pmux *cpuclk = to_clk_cpu_8996_pmux_nb(nb);
 	struct clk_notifier_data *cnd = data;
-	int ret;
 
 	switch (event) {
 	case PRE_RATE_CHANGE:
-		ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ALT_INDEX);
 		qcom_cpu_clk_msm8996_acd_init(base);
+
+		/*
+		 * Avoid overvolting. clk_core_set_rate_nolock() walks from top
+		 * to bottom, so it will change the rate of the PLL before
+		 * chaging the parent of PMUX. This can result in pmux getting
+		 * clocked twice the expected rate.
+		 *
+		 * Manually switch to PLL/2 here.
+		 */
+		if (cnd->new_rate < DIV_2_THRESHOLD &&
+		    cnd->old_rate > DIV_2_THRESHOLD)
+			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, SMUX_INDEX);
+
 		break;
-	case POST_RATE_CHANGE:
-		if (cnd->new_rate < DIV_2_THRESHOLD)
-			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
-							   SMUX_INDEX);
-		else
-			ret = clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw,
-							   ACD_INDEX);
-		break;
+	case ABORT_RATE_CHANGE:
+		/* Revert manual change */
+		if (cnd->new_rate < DIV_2_THRESHOLD &&
+		    cnd->old_rate > DIV_2_THRESHOLD)
+			clk_cpu_8996_pmux_set_parent(&cpuclk->clkr.hw, ACD_INDEX);
 	default:
-		ret = 0;
 		break;
 	}
 
-	return notifier_from_errno(ret);
+	return NOTIFY_OK;
 };
 
 static int qcom_cpu_clk_msm8996_driver_probe(struct platform_device *pdev)
-- 
2.30.2

