Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED595699136
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Feb 2023 11:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjBPKaX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Feb 2023 05:30:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjBPKaV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Feb 2023 05:30:21 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33AD14DE08
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:30:02 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j17so2213039lfr.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Feb 2023 02:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AIiSyw9cDcFKGu9JiEWZhqoDuiISHZ5PB5xSHIIzqMI=;
        b=Y+C1NRwyCeSwP2pWEBIAFBwKnvarVgwxp+NowE9shA8W18j5YmMnMJNmiWltbEBEFb
         DXYsOb7nWHlVMfRNgNyA1R34RISlYa+77UP0wW/jhdZPnzUC6Dh6jCeZZniMvgh3RSVj
         L3GyhVZFZlCl5q1+GWpPrC3tzscRcQZ2EhfklETZiyhMuVLBPuIgC5ZtQaweI4f6QnKj
         66QjY91fT6NB3Fk6/BRf1ZBFE+fH3wZ/3hpf00NxfSwb3rzshX4OstmUkDE1QliJE+LA
         Oa9UOyABzlm/6xHuC77g0KaX9Y16ahd5RuqomuVFyK8tpxbyfVwlmfjBAQefhxNbsF63
         8uOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AIiSyw9cDcFKGu9JiEWZhqoDuiISHZ5PB5xSHIIzqMI=;
        b=nmtqFekXl35loW/Z4EeFTVk6hXkYsiS2JpD3Xdo+Q4Ap6h2BgCxUbbmetPFzn9dckX
         OswlD+P2Dru+tGDRa+XFR6BeJueoFMTwYSsNOOqWhkzMBYEJN7oAIO0A1YiLfoFQowt+
         irGdzl+rqFqON9d3eP5HfwD8jOYHCFTh/IWwCh6FT1naLg+3wyhszpOQhzPWAxvvomoZ
         Z1JiRDy+P/Wc7XShKI2ypQHWjQxlXkw3DTUmK3UdSOE8WqqXL3hjU2vsNhnF6Ez0vqnF
         rJQeQPypwjoxYHLcjgMsVX6utIh2avwq7J8hBkdSyqAkF+zutE8Jx9d3kmCiiFkn+tMG
         JRAg==
X-Gm-Message-State: AO0yUKXk5A+6H10J5jgX9z/H6Cr5FgrzNGQGXBET4u5VD6Bm75M53Yx1
        wguatXO/iO6GAWU9VwA+W78mH7WJuH8ojPPX
X-Google-Smtp-Source: AK7set+AsBrPxK/iLXBU4CBCQGE5gMYcTd4JVJtj8eimPknD2U5P1kWnppbLIOylyikXZJ6IlAh6eA==
X-Received: by 2002:ac2:4439:0:b0:4d8:6a30:fbd7 with SMTP id w25-20020ac24439000000b004d86a30fbd7mr1498333lfl.67.1676543399248;
        Thu, 16 Feb 2023 02:29:59 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id p2-20020a19f002000000b0048a9e899693sm248308lfc.16.2023.02.16.02.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 02:29:58 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: qcom-hw: Simplify counting frequency domains
Date:   Thu, 16 Feb 2023 11:29:56 +0100
Message-Id: <20230216102956.3933639-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
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

For quite some time, this driver has been doing performing some
quite low-level DT operations. Simplify that using
platform_get_resource.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 2f581d2d617d..023a18c0886f 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -29,6 +29,8 @@
 
 #define GT_IRQ_STATUS			BIT(2)
 
+#define MAX_FREQ_DOMAINS		3
+
 struct qcom_cpufreq_soc_data {
 	u32 reg_enable;
 	u32 reg_domain_state;
@@ -651,10 +653,9 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 {
 	struct clk_hw_onecell_data *clk_data;
 	struct device *dev = &pdev->dev;
-	struct device_node *soc_node;
 	struct device *cpu_dev;
 	struct clk *clk;
-	int ret, i, num_domains, reg_sz;
+	int ret, i, num_domains;
 
 	clk = clk_get(dev, "xo");
 	if (IS_ERR(clk))
@@ -681,24 +682,9 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Allocate qcom_cpufreq_data based on the available frequency domains in DT */
-	soc_node = of_get_parent(dev->of_node);
-	if (!soc_node)
-		return -EINVAL;
-
-	ret = of_property_read_u32(soc_node, "#address-cells", &reg_sz);
-	if (ret)
-		goto of_exit;
-
-	ret = of_property_read_u32(soc_node, "#size-cells", &i);
-	if (ret)
-		goto of_exit;
-
-	reg_sz += i;
-
-	num_domains = of_property_count_elems_of_size(dev->of_node, "reg", sizeof(u32) * reg_sz);
-	if (num_domains <= 0)
-		return num_domains;
+	for (num_domains = 0; num_domains < MAX_FREQ_DOMAINS; num_domains++)
+		if (!platform_get_resource(pdev, IORESOURCE_MEM, num_domains))
+			break;
 
 	qcom_cpufreq.data = devm_kzalloc(dev, sizeof(struct qcom_cpufreq_data) * num_domains,
 					 GFP_KERNEL);
@@ -762,8 +748,6 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 	else
 		dev_dbg(dev, "QCOM CPUFreq HW driver initialized\n");
 
-of_exit:
-	of_node_put(soc_node);
 
 	return ret;
 }
-- 
2.39.1

