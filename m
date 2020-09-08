Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DFFF260CFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Sep 2020 10:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728479AbgIHIFI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Sep 2020 04:05:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729940AbgIHH5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Sep 2020 03:57:51 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43BFCC061573
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2020 00:57:51 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id j34so4089303pgi.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2020 00:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=cDupOEGD43zOafkeHwpXvRZFRBLRl6C9wgjA2f07/F0=;
        b=QQYLtPYQds66Aq5sAInDKeb1drvHJt9XVWKwoRjvuCeNkRGx5+rFQiX+dSbfnvmPUQ
         +EdJT883lIKsSbWKYABvFjZ5eK7DhOsF540AZTY3Lh/sCCiSuQ5sE9f71hfSjND1BrYb
         /fRUds+4A7kgOKaPGN6xeDdnBeDpzTIyfwwEuN19BFcyhxX492wBYzXnibWeszqb+k/M
         xNi0n0FYMAm/2j9zF4nudmkX9Ae3RxGQgX62hcWZScGUwk3kY39muYL1NykdmwhEU0cM
         gPvxnLyYSeo9NrzD5eMpuSoYDDRkruY7GDkUxtEyfX7IthGRRkpmCCbiufQhWithfewm
         briw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=cDupOEGD43zOafkeHwpXvRZFRBLRl6C9wgjA2f07/F0=;
        b=LZpm8l7UDXzdUVEIuqYzOomD+P6UGbOoNhmOOlHyQnjS2w9WndgZKXRA4CRNDDcpr2
         xn0Y9hpjehRt2I9V/L32s18z+bUDyJLjtO8BeHQZ3t3VRViQro352KVlSz4f3CXh3g5L
         goSghdqHbJYHiQzhFfY7QIHdjn2sMvX6/YC1fx8pIblLDmK+IXoL4Znqd0dI21H+5XKN
         HcrvmmLJ1PKrCga9cik501H2niXT1Jnn1Z8dro/uPwacnSmf6/5s205AqGDO7Gyj4OjE
         uDURPtq0hLumAZHI4YANHejmGGYzMtsUf8SmFwbLooHAFWDm8R9JK1rDlDzSeP2Gm6Dl
         Vi/Q==
X-Gm-Message-State: AOAM532oqvOt0L5mKQU9QadzrPOEigreJD7ekKrNB2aXAUm7PfS2yDa1
        lcfDPUMAEArPeCxYnuTx5kUD
X-Google-Smtp-Source: ABdhPJxpx0HbYrcj8hGngV6Luqv87IDIEB9wAwcFjrONlar2oFhO8UsTm9X+3KW73Kg2fmgjpV0GGg==
X-Received: by 2002:a63:9d82:: with SMTP id i124mr19186323pgd.336.1599551870736;
        Tue, 08 Sep 2020 00:57:50 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id m21sm7560154pfo.13.2020.09.08.00.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 00:57:50 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     rjw@rjwysocki.net, viresh.kumar@linaro.org, robh+dt@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Cc:     amitk@kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
        tdas@codeaurora.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/7] cpufreq: qcom-hw: Use regmap for accessing hardware registers
Date:   Tue,  8 Sep 2020 13:27:14 +0530
Message-Id: <20200908075716.30357-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
References: <20200908075716.30357-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use regmap for accessing cpufreq registers in hardware.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 55 ++++++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 41853db7c9b8..de816bcafd33 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -12,6 +12,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/pm_opp.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #define LUT_MAX_ENTRIES			40U
@@ -32,6 +33,7 @@ struct qcom_cpufreq_soc_data {
 
 struct qcom_cpufreq_data {
 	void __iomem *base;
+	struct regmap *regmap;
 	const struct qcom_cpufreq_soc_data *soc_data;
 };
 
@@ -85,8 +87,11 @@ static int qcom_cpufreq_hw_target_index(struct cpufreq_policy *policy,
 	struct qcom_cpufreq_data *data = policy->driver_data;
 	const struct qcom_cpufreq_soc_data *soc_data = data->soc_data;
 	unsigned long freq = policy->freq_table[index].frequency;
+	int ret;
 
-	writel_relaxed(index, data->base + soc_data->reg_perf_state);
+	ret = regmap_write(data->regmap, soc_data->reg_perf_state, index);
+	if (ret)
+		return ret;
 
 	if (icc_scaling_enabled)
 		qcom_cpufreq_set_bw(policy, freq);
@@ -102,6 +107,7 @@ static unsigned int qcom_cpufreq_hw_get(unsigned int cpu)
 	const struct qcom_cpufreq_soc_data *soc_data;
 	struct cpufreq_policy *policy;
 	unsigned int index;
+	int ret;
 
 	policy = cpufreq_cpu_get_raw(cpu);
 	if (!policy)
@@ -110,7 +116,10 @@ static unsigned int qcom_cpufreq_hw_get(unsigned int cpu)
 	data = policy->driver_data;
 	soc_data = data->soc_data;
 
-	index = readl_relaxed(data->base + soc_data->reg_perf_state);
+	ret = regmap_read(data->regmap, soc_data->reg_perf_state, &index);
+	if (ret)
+		return 0;
+
 	index = min(index, LUT_MAX_ENTRIES - 1);
 
 	return policy->freq_table[index].frequency;
@@ -123,9 +132,12 @@ static unsigned int qcom_cpufreq_hw_fast_switch(struct cpufreq_policy *policy,
 	const struct qcom_cpufreq_soc_data *soc_data = data->soc_data;
 	unsigned int index;
 	unsigned long freq;
+	int ret;
 
 	index = policy->cached_resolved_idx;
-	writel_relaxed(index, data->base + soc_data->reg_perf_state);
+	ret = regmap_write(data->regmap, soc_data->reg_perf_state, index);
+	if (ret)
+		return 0;
 
 	freq = policy->freq_table[index].frequency;
 	arch_set_freq_scale(policy->related_cpus, freq,
@@ -171,14 +183,24 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 	}
 
 	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
-		data = readl_relaxed(drv_data->base + soc_data->reg_freq_lut +
-				      i * soc_data->lut_row_size);
+		ret = regmap_read(drv_data->regmap, soc_data->reg_freq_lut +
+				  i * soc_data->lut_row_size, &data);
+		if (ret) {
+			kfree(table);
+			return ret;
+		}
+
 		src = FIELD_GET(LUT_SRC, data);
 		lval = FIELD_GET(LUT_L_VAL, data);
 		core_count = FIELD_GET(LUT_CORE_COUNT, data);
 
-		data = readl_relaxed(drv_data->base + soc_data->reg_volt_lut +
-				      i * soc_data->lut_row_size);
+		ret = regmap_read(drv_data->regmap, soc_data->reg_volt_lut +
+				  i * soc_data->lut_row_size, &data);
+		if (ret) {
+			kfree(table);
+			return ret;
+		}
+
 		volt = FIELD_GET(LUT_VOLT, data) * 1000;
 
 		if (src)
@@ -248,6 +270,13 @@ static void qcom_get_related_cpus(int index, struct cpumask *m)
 	}
 }
 
+static struct regmap_config qcom_cpufreq_regmap = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+};
+
 static const struct qcom_cpufreq_soc_data qcom_soc_data = {
 	.reg_enable = 0x0,
 	.reg_freq_lut = 0x110,
@@ -274,6 +303,7 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	struct qcom_cpufreq_data *data;
 	const struct of_device_id *match;
 	int ret, index;
+	u32 val;
 
 	cpu_dev = get_cpu_device(policy->cpu);
 	if (!cpu_dev) {
@@ -316,9 +346,18 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 
 	data->soc_data = match->data;
 	data->base = base;
+	data->regmap = devm_regmap_init_mmio(dev, base, &qcom_cpufreq_regmap);
+	if (IS_ERR(data->regmap)) {
+		ret = PTR_ERR(data->regmap);
+		goto error;
+	}
 
 	/* HW should be in enabled state to proceed */
-	if (!(readl_relaxed(base + data->soc_data->reg_enable) & 0x1)) {
+	ret = regmap_read(data->regmap, data->soc_data->reg_enable, &val);
+	if (ret)
+		goto error;
+
+	if (!(val & 0x1)) {
 		dev_err(dev, "Domain-%d cpufreq hardware not enabled\n", index);
 		ret = -ENODEV;
 		goto error;
-- 
2.17.1

