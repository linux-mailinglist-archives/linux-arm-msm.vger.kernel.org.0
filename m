Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A50971F01CC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2020 23:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728423AbgFEVeS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Jun 2020 17:34:18 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37290 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728421AbgFEVeS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Jun 2020 17:34:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591392857; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=PwxWFXTJICALJVBJdxUObhiv0l4HEcMqfRoG2q/RhMY=; b=hVAvf/TZxtIn5N4AbD0W90E44mK/NbR7HEEAkMiTNn480vouh9AZFfsQKGj7ELbQ07Pay5tx
 2FfvIs3CZdmrqwEI+UeNESgkY0QhC1jY7foCjjx1RRvZXES1uE+Jwi0zqfDawpMIqPYjwyq7
 4eLr+shETNGBe93W8zjqNTwpVgM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5edaba5444a25e0052b34ed2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Jun 2020 21:34:12
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 66EC8C433A0; Fri,  5 Jun 2020 21:34:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E22D2C4339C;
        Fri,  5 Jun 2020 21:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E22D2C4339C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, saravanak@google.com, mka@chromium.org
Cc:     nm@ti.com, bjorn.andersson@linaro.org, agross@kernel.org,
        rjw@rjwysocki.net, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        dianders@chromium.org, vincent.guittot@linaro.org,
        amit.kucheria@linaro.org, lukasz.luba@arm.com,
        sudeep.holla@arm.com, smasetty@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v6 4/5] cpufreq: qcom: Update the bandwidth levels on frequency change
Date:   Sat,  6 Jun 2020 03:03:31 +0530
Message-Id: <20200605213332.609-5-sibis@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200605213332.609-1-sibis@codeaurora.org>
References: <20200605213332.609-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to parse optional OPP table attached to the cpu node when
the OPP bandwidth values are populated. This allows for scaling of
DDR/L3 bandwidth levels with frequency change.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v6:
 * Add global flag to distinguish between voltage update and opp add.
   Use the same flag before trying to scale ddr/l3 bw [Viresh]
 * Use dev_pm_opp_find_freq_ceil to grab all opps [Viresh] 
 * Move dev_pm_opp_of_find_icc_paths into probe [Viresh]

v5:
 * Use dev_pm_opp_adjust_voltage instead [Viresh]
 * Misc cleanup

v4:
 * Split fast switch disable into another patch [Lukasz]

 drivers/cpufreq/qcom-cpufreq-hw.c | 82 ++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index fc92a8842e252..8fa6ab6e0e4b6 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -6,6 +6,7 @@
 #include <linux/bitfield.h>
 #include <linux/cpufreq.h>
 #include <linux/init.h>
+#include <linux/interconnect.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
@@ -30,6 +31,48 @@
 
 static unsigned long cpu_hw_rate, xo_rate;
 static struct platform_device *global_pdev;
+static bool icc_scaling_enabled;
+
+static int qcom_cpufreq_set_bw(struct cpufreq_policy *policy,
+			       unsigned long freq_khz)
+{
+	unsigned long freq_hz = freq_khz * 1000;
+	struct dev_pm_opp *opp;
+	struct device *dev;
+	int ret;
+
+	dev = get_cpu_device(policy->cpu);
+	if (!dev)
+		return -ENODEV;
+
+	opp = dev_pm_opp_find_freq_exact(dev, freq_hz, true);
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
+
+	ret = dev_pm_opp_set_bw(dev, opp);
+	dev_pm_opp_put(opp);
+	return ret;
+}
+
+static int qcom_cpufreq_update_opp(struct device *cpu_dev,
+				   unsigned long freq_khz,
+				   unsigned long volt)
+{
+	unsigned long freq_hz = freq_khz * 1000;
+	int ret;
+
+	/* Skip voltage update if the opp table is not available */
+	if (!icc_scaling_enabled)
+		return dev_pm_opp_add(cpu_dev, freq_hz, volt);
+
+	ret = dev_pm_opp_adjust_voltage(cpu_dev, freq_hz, volt, volt, volt);
+	if (ret) {
+		dev_err(cpu_dev, "Voltage update failed freq=%ld\n", freq_khz);
+		return ret;
+	}
+
+	return dev_pm_opp_enable(cpu_dev, freq_hz);
+}
 
 static int qcom_cpufreq_hw_target_index(struct cpufreq_policy *policy,
 					unsigned int index)
@@ -39,6 +82,9 @@ static int qcom_cpufreq_hw_target_index(struct cpufreq_policy *policy,
 
 	writel_relaxed(index, perf_state_reg);
 
+	if (icc_scaling_enabled)
+		qcom_cpufreq_set_bw(policy, freq);
+
 	arch_set_freq_scale(policy->related_cpus, freq,
 			    policy->cpuinfo.max_freq);
 	return 0;
@@ -89,11 +135,31 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 	u32 data, src, lval, i, core_count, prev_freq = 0, freq;
 	u32 volt;
 	struct cpufreq_frequency_table	*table;
+	struct dev_pm_opp *opp;
+	unsigned long rate;
+	int ret;
 
 	table = kcalloc(LUT_MAX_ENTRIES + 1, sizeof(*table), GFP_KERNEL);
 	if (!table)
 		return -ENOMEM;
 
+	ret = dev_pm_opp_of_add_table(cpu_dev);
+	if (!ret) {
+		/* Disable all opps and cross-validate against LUT */
+		icc_scaling_enabled = true;
+		for (rate = 0; ; rate++) {
+			opp = dev_pm_opp_find_freq_ceil(cpu_dev, &rate);
+			if (IS_ERR(opp))
+				break;
+
+			dev_pm_opp_put(opp);
+			dev_pm_opp_disable(cpu_dev, rate);
+		}
+	} else if (ret != -ENODEV) {
+		dev_err(cpu_dev, "Invalid opp table in device tree\n");
+		return ret;
+	}
+
 	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
 		data = readl_relaxed(base + REG_FREQ_LUT +
 				      i * LUT_ROW_SIZE);
@@ -112,7 +178,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 
 		if (freq != prev_freq && core_count != LUT_TURBO_IND) {
 			table[i].frequency = freq;
-			dev_pm_opp_add(cpu_dev, freq * 1000, volt);
+			qcom_cpufreq_update_opp(cpu_dev, freq, volt);
 			dev_dbg(cpu_dev, "index=%d freq=%d, core_count %d\n", i,
 				freq, core_count);
 		} else if (core_count == LUT_TURBO_IND) {
@@ -133,7 +199,8 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 			if (prev->frequency == CPUFREQ_ENTRY_INVALID) {
 				prev->frequency = prev_freq;
 				prev->flags = CPUFREQ_BOOST_FREQ;
-				dev_pm_opp_add(cpu_dev,	prev_freq * 1000, volt);
+				qcom_cpufreq_update_opp(cpu_dev, prev_freq,
+							volt);
 			}
 
 			break;
@@ -254,6 +321,7 @@ static int qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 	void __iomem *base = policy->driver_data - REG_PERF_STATE;
 
 	dev_pm_opp_remove_all_dynamic(cpu_dev);
+	dev_pm_opp_of_cpumask_remove_table(policy->related_cpus);
 	kfree(policy->freq_table);
 	devm_iounmap(&global_pdev->dev, base);
 
@@ -282,6 +350,7 @@ static struct cpufreq_driver cpufreq_qcom_hw_driver = {
 
 static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 {
+	struct device *cpu_dev;
 	struct clk *clk;
 	int ret;
 
@@ -301,6 +370,15 @@ static int qcom_cpufreq_hw_driver_probe(struct platform_device *pdev)
 
 	global_pdev = pdev;
 
+	/* Check for optional interconnect paths on CPU0 */
+	cpu_dev = get_cpu_device(0);
+	if (!cpu_dev)
+		return -EPROBE_DEFER;
+
+	ret = dev_pm_opp_of_find_icc_paths(cpu_dev, NULL);
+	if (ret)
+		return ret;
+
 	ret = cpufreq_register_driver(&cpufreq_qcom_hw_driver);
 	if (ret)
 		dev_err(&pdev->dev, "CPUFreq HW driver failed to register\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

