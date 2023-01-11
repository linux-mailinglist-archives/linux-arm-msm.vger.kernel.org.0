Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E2F066646A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jan 2023 21:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239664AbjAKUF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Jan 2023 15:05:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236061AbjAKUFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Jan 2023 15:05:02 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 896D443D95
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:34 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id v25so25161478lfe.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jan 2023 12:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRtL6Eef4RVgyfHAkdoUF1I7EUT/FswJ9g5onTCIfoQ=;
        b=B60J/tdeO6o1ZRU66WuhSl9u4sKQBsIIa2BtOTK9yB1PFdmlnZzCXoohSh/IVTM2x3
         qKuf9Opf+Jbya0omBI7tSNbW9nPtOWkJKw0qjCys+104vZTLBGBiRBJs6Zo4ndn3ksUT
         y8ObdXw12IZV+wNVULRwI1vHQHsdqiF0/5RWwH3+/Z7UhJl/5PwlmYUqvuJO4sbLmlWF
         /ZKs+UA4Fr3c5Pi4Ux6h0aID6vYYoQ7w31VwYQR/qnP9EsLvIr/zj15mM7UmBU6KweKf
         nkbMBmudUQ6qYxA4MQA9Wo+FRQNsgnIGr2z2n2815ISlCIffvuQLXcVMHC3jM5+3q3qs
         g/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lRtL6Eef4RVgyfHAkdoUF1I7EUT/FswJ9g5onTCIfoQ=;
        b=d+moccW+y1Mq0IrmJj25PmWOvmGKSb73yqv7MTY4g60LQDqHZpDs4/eW+jiygaDeAZ
         s2TjMQJ0AozKfAFMXxK8+GKihbt3W02nc2zmioPIkFgZPrTRVx1uQs8aQowXMdUJEeHh
         j8YHxCIV2BZRj+Lwz5R3aRAQYuTi1ldBv3RxTdNNtHQuTEr0hw3MNIJch07ti9fD7lYA
         2e4/E3ye+2GWGD5QYlOBaW684amMJyD0mNhLF6IVOOtvzq89Ublo3J0z844T8C9gYftK
         g/BSylozSCsE1juzVqY6krOts36MPF623vdLJ5XvFB+aJfT36llmIEy1D6Kxep1uxszz
         sZwg==
X-Gm-Message-State: AFqh2kqdwivJzcqUkoNT2fkson8OB1HwPlK/CBIc1OIrRXD1XO9a8WGo
        lchyN0kh7U/xTMTQ9q2CTOf3e6AjGbJOb5o2
X-Google-Smtp-Source: AMrXdXueGG6BNj6l5pGNwP+Vs5F3LVy5XAaOe8aKfTZw2fxTt/oL7T9W1RBuidEYAPCP5oO4iY3CQg==
X-Received: by 2002:a05:6512:2805:b0:4b7:1cc:ed56 with SMTP id cf5-20020a056512280500b004b701cced56mr3285370lfb.35.1673467293950;
        Wed, 11 Jan 2023 12:01:33 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v20-20020a05651203b400b004b4e6dab30esm2881437lfp.222.2023.01.11.12.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 12:01:33 -0800 (PST)
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
Subject: [PATCH v2 07/14] clk: qcom: cpu-8996: simplify the cpu_clk_notifier_cb
Date:   Wed, 11 Jan 2023 23:01:21 +0300
Message-Id: <20230111200128.2593359-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
References: <20230111200128.2593359-1-dmitry.baryshkov@linaro.org>
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

