Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8385C6696A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 13:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241163AbjAMMNb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 07:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230335AbjAMMMn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 07:12:43 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C2580616
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:13 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id d30so27916675lfv.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 04:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MFNWqBH1dgb33/SbdMGGUOEJxNRoxoxCAjFOGyypZg=;
        b=kyLCDm9JNzTCeJGrVZHp00qlEnRZxXSldgnU3XXFI0M9yWaamRhCONX56rCX937nUy
         AAmCBQLD0KtJyDH341zw2m63S+E3Zpgv2HyG6vAX+jg1DHVWVNoToPXlU4UPsDFlwobx
         i9JtRlMu9Rs9ib36VVbi5ZUC2AB5vZncizRNaXTKgiWiJ4EZbCi00LEyB3oy9C6f4T9m
         //nOr2Zx4Sb6DfkD0W7NHJNGSuJH7YEVo02hbVF04/rOVkrev7h8TwrIeQhDjZSYr4VG
         Ze7RnpC3HOyFp2M2ZZc3y6waeYfvEIrEBhZLw35wajBr0oeiXBYVPO4Hz8xyvefz5Bu8
         U5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MFNWqBH1dgb33/SbdMGGUOEJxNRoxoxCAjFOGyypZg=;
        b=m9Y1IVoaq0aZbzeLTYyaXe1ykSGKHzz26Ql23ZwdIqvQJSZrMMMFVi7v98xJjYsuVJ
         /Tkf2cpgiby2fDcFTOMhDt0e2RuByvbx2nHzPX4JLPuWP0xZ3dVhxFa94FuK7FowokSY
         RF7rxsn5koBtMLcxJ7GJ4TFVOb8IjmIjKir13xQDkEo7coNFj4xqP3HT9aiTx9VDCtnE
         IvKkIr0FbezQo2VB0ke9fZNfqidb5rq00GBYZizdFqePClfxqcL74B4mSnbR4Hx5uYMc
         FoAAC9XV9wpfeixORqCAaEmBqkdsbZbbndKWjFusAKpAnGLu5e5wZPbru+QZ89oVHrim
         PcEQ==
X-Gm-Message-State: AFqh2kr9VP3WjtMob5SjVe+o+3Y4qDKthLT67WgbXDpZrEwNwE+Uj1yc
        AU3s/wyQfGeuIXeif1Wttmwhfg==
X-Google-Smtp-Source: AMrXdXt21JqeKEr+uWTyS6Z1xXpwSoJ7QyfhSDktRj0WOAE8E2K3dzU8EStFOUSXwVWnrcziPfX73A==
X-Received: by 2002:ac2:5b41:0:b0:4a4:68b9:66dd with SMTP id i1-20020ac25b41000000b004a468b966ddmr22188001lfp.40.1673611631699;
        Fri, 13 Jan 2023 04:07:11 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.170.82.205])
        by smtp.gmail.com with ESMTPSA id i7-20020ac25227000000b004ac6a444b26sm3806290lfl.141.2023.01.13.04.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 04:07:11 -0800 (PST)
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
Subject: [PATCH v3 07/14] clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
Date:   Fri, 13 Jan 2023 14:05:37 +0200
Message-Id: <20230113120544.59320-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
References: <20230113120544.59320-1-dmitry.baryshkov@linaro.org>
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

- Do not use the Alt PLL completely. Switch to smux when necessary to
  prevent overvolting
- Restore the parent in case the rate change aborts for some reason
- Do not duplicate resetting the parent in set_parent operation.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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
2.39.0

