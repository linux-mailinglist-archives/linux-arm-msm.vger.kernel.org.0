Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A115C615E96
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 10:01:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbiKBJBH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 05:01:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbiKBJA5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 05:00:57 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED94427FD8
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 02:00:55 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id b5so15687028pgb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 02:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+9klCMfCtlwSDu8IssCNi2V+YH/l+jRl6TW+nponcw=;
        b=VNXGSjTd4iulS7vgWrJEpL/PcmlPXoe5GjctycTC0nsxFvQLr/JoqXw13/X9s3QKQ1
         tF1AurKRPEcmgTjypvh5lDUoarDWsPtoqMMpa90jLYdoJ/1iE+1Fjb2yWE7ZfHYwlkAk
         uPKynRKKn1pizM+ckGKtEq4mGZjx8hZnivVyOXytpbDVWGZLnPQwn4x77DzhzObeOMZm
         goj+TO+IGm/XIRTEAdy+xyCx4YGlYCG9hn5imZHY64EH+ilNjc3zkETQld9Ch0R3dK1I
         vi1OZqhv5yap/AsZbU7kEAoyEkzpmVlZs1S1BWziNqPy4Qa5nUxJyXNMThaTfpzON1y/
         IpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+9klCMfCtlwSDu8IssCNi2V+YH/l+jRl6TW+nponcw=;
        b=VDbOpNkfO45u7OZ9+7AUnnWDGvTZkbNEWC/CGYZZJGHAiZ0j+SAEfdW4yzlf85alyv
         Juo/pcZ01pJD/iRg9BTe6Gf0fkGEULRIpdbUMWwNsboqsc7tUm2mHbJd4MAYlZcJj5N9
         bpiMPVFEbQzyY8dlGWpnfEJ1DxpxjJvL02MfyXpJAJIhaZcCexQz9Ypkrxbj9AggGBUC
         Z6cPwDr2Hbj4vjbwykgP5nNoGHGcD/7aIerB0e0p2BCp4E86enzMtUe5Bekvy0xE+/6s
         Qjut7BikeGxTchBgCpsQHKWnF9/O00pyEEKMj9t3UQ9WqRMUsn1Tn/S8dhHPlK5EGeAl
         7FjA==
X-Gm-Message-State: ACrzQf1Wv2yA/tjGhfHRnZANnLDYddaUtfqpLHWQ/s9G/UOwu2UMZ4b2
        P0ZZeSYjcQnbMLnFYI5mbCgS
X-Google-Smtp-Source: AMsMyM4Qg7xu+k9vYdNVTqkjUMbAKMeBT/psyGpFtL4qJRp2RmgBYQPnqb4V8wq7VPySeXQQWEBcVw==
X-Received: by 2002:a63:e153:0:b0:439:2fa3:74d1 with SMTP id h19-20020a63e153000000b004392fa374d1mr20474631pgk.85.1667379655404;
        Wed, 02 Nov 2022 02:00:55 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.178])
        by smtp.gmail.com with ESMTPSA id z10-20020a63d00a000000b0046f7b0f504esm7136389pgf.58.2022.11.02.02.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 02:00:54 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, viresh.kumar@linaro.org, rafael@kernel.org
Cc:     johan@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/3] cpufreq: qcom-hw: Allocate qcom_cpufreq_data during probe
Date:   Wed,  2 Nov 2022 14:30:36 +0530
Message-Id: <20221102090038.64541-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102090038.64541-1-manivannan.sadhasivam@linaro.org>
References: <20221102090038.64541-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

qcom_cpufreq_data is allocated based on the number of frequency domains
defined in DT which is static and won't change during runtime. There is
no real reason to allocate it during the CPU init() callback and deallocate
it during exit(). Hence, move the allocation to probe() and use the
allocated memory during init().

This also allows us to use devm_platform_get_and_ioremap_resource() helper
for acquiring the freq-domain resources from DT.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 86 +++++++++++++------------------
 1 file changed, 37 insertions(+), 49 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 61850d75e82f..25951a32b9d5 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -61,6 +61,10 @@ struct qcom_cpufreq_data {
 	struct freq_qos_request throttle_freq_req;
 };
 
+static struct {
+	struct qcom_cpufreq_data *data;
+} qcom_cpufreq;
+
 static unsigned long cpu_hw_rate, xo_rate;
 static bool icc_scaling_enabled;
 
@@ -503,8 +507,6 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	struct of_phandle_args args;
 	struct device_node *cpu_np;
 	struct device *cpu_dev;
-	struct resource *res;
-	void __iomem *base;
 	struct qcom_cpufreq_data *data;
 	int ret, index;
 
@@ -526,43 +528,16 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 		return ret;
 
 	index = args.args[0];
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	if (!res) {
-		dev_err(dev, "failed to get mem resource %d\n", index);
-		return -ENODEV;
-	}
-
-	if (!request_mem_region(res->start, resource_size(res), res->name)) {
-		dev_err(dev, "failed to request resource %pR\n", res);
-		return -EBUSY;
-	}
-
-	base = ioremap(res->start, resource_size(res));
-	if (!base) {
-		dev_err(dev, "failed to map resource %pR\n", res);
-		ret = -ENOMEM;
-		goto release_region;
-	}
-
-	data = kzalloc(sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		ret = -ENOMEM;
-		goto unmap_base;
-	}
-
 	data->soc_data = of_device_get_match_data(&pdev->dev);
-	data->base = base;
-	data->res = res;
+	data = &qcom_cpufreq.data[index];
 
 	/* HW should be in enabled state to proceed */
-	if (!(readl_relaxed(base + data->soc_data->reg_enable) & 0x1)) {
+	if (!(readl_relaxed(data->base + data->soc_data->reg_enable) & 0x1)) {
 		dev_err(dev, "Domain-%d cpufreq hardware not enabled\n", index);
-		ret = -ENODEV;
-		goto error;
+		return -ENODEV;
 	}
 
-	if (readl_relaxed(base + data->soc_data->reg_dcvs_ctrl) & 0x1)
+	if (readl_relaxed(data->base + data->soc_data->reg_dcvs_ctrl) & 0x1)
 		data->per_core_dcvs = true;
 
 	qcom_get_related_cpus(index, policy->cpus);
@@ -573,14 +548,13 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	ret = qcom_cpufreq_hw_read_lut(cpu_dev, policy);
 	if (ret) {
 		dev_err(dev, "Domain-%d failed to read LUT\n", index);
-		goto error;
+		return ret;
 	}
 
 	ret = dev_pm_opp_get_opp_count(cpu_dev);
 	if (ret <= 0) {
 		dev_err(cpu_dev, "Failed to add OPPs\n");
-		ret = -ENODEV;
-		goto error;
+		return -ENODEV;
 	}
 
 	if (policy_has_boost_freq(policy)) {
@@ -589,18 +563,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 			dev_warn(cpu_dev, "failed to enable boost: %d\n", ret);
 	}
 
-	ret = qcom_cpufreq_hw_lmh_init(policy, index);
-	if (ret)
-		goto error;
-
-	return 0;
-error:
-	kfree(data);
-unmap_base:
-	iounmap(base);
-release_region:
-	release_mem_region(res->start, resource_size(res));
-	return ret;
+	return qcom_cpufreq_hw_lmh_init(policy, index);
 }
 
 static int qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
@@ -657,7 +620,7 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 {
 	struct device *cpu_dev;
 	struct clk *clk;
-	int ret;
+	int ret, i, num_domains;
 
 	clk = clk_get(&pdev->dev, "xo");
 	if (IS_ERR(clk))
@@ -684,6 +647,31 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Allocate qcom_cpufreq_data based on the available frequency domains in DT */
+	num_domains = of_property_count_elems_of_size(pdev->dev.of_node, "reg", sizeof(u32) * 4);
+	if (num_domains <= 0)
+		return num_domains;
+
+	qcom_cpufreq.data = devm_kzalloc(&pdev->dev, sizeof(struct qcom_cpufreq_data) * num_domains,
+					 GFP_KERNEL);
+	if (!qcom_cpufreq.data)
+		return -ENOMEM;
+
+	for (i = 0; i < num_domains; i++) {
+		struct qcom_cpufreq_data *data = &qcom_cpufreq.data[i];
+		struct resource *res;
+		void __iomem *base;
+
+		base = devm_platform_get_and_ioremap_resource(pdev, i, &res);
+		if (IS_ERR(base)) {
+			dev_err(&pdev->dev, "Failed to map resource %pR\n", res);
+			return PTR_ERR(base);
+		}
+
+		data->base = base;
+		data->res = res;
+	}
+
 	ret = cpufreq_register_driver(&cpufreq_qcom_hw_driver);
 	if (ret)
 		dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
-- 
2.25.1

