Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FABE572E85
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 08:53:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234464AbiGMGxe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 02:53:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234410AbiGMGxX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 02:53:23 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ACDCE0F44
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 23:53:22 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so2086761pjr.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jul 2022 23:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5aHj0ytiZKEihSrnp2qhb1SrtEXktEv4KFaJGbiz9Pg=;
        b=XpO8/rsXcCanKBtKBiXpGSOJNSKUxBckuKYfiauHh7cekCe5w5giJy+0jd37kwxvV9
         fOKQWXAFLdr/qhca2r5bBTzIyptlS/7ZaSd7RYK/8447lRDiLjTHUi0N1/rYdUQ7H7/H
         iikBOdAC9AG511iY6fdnKCyK1dKAYW6BlU3rjGwnCCbAHpvcUoVzN0w5lyBIZ6uIqM1q
         k7Uv/QUUte0e9L04w/XsaX43GiKzeTAV/O7kaZPNEpsFpcCM8ztVSgga+E3WBtJfIadO
         vYKiL0t6Ttm6l6T6U1uKmeOCRrbPVTDQFlzosE+KNmvZXgsotbFb2Xvk+3G6GuH1EXKU
         9WnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5aHj0ytiZKEihSrnp2qhb1SrtEXktEv4KFaJGbiz9Pg=;
        b=AxVW/fsstYqmh5l9gFrKsFBo0v1bI7MTeXjIlihIo1n4tlnQTxyx4J+qnxNYnkjtJ5
         ckx/MjCrS+3M3hNB/aIMU18yJYNeUbLmN6hK83fZxEeQwoSUIO5Q3pOszvtpslFqc190
         bBqI5Si8vpdkWPBFzXPEV5GlykUHIU9B9czM3S4SjS/aMVp1ASosTUF4mkoINarjCPyP
         qJl3M40OGMUqQvbAKbMvJp+OpLiRV0BrcqZ6tTpb/ho92tPJHKii2dns1/168UrkWVjo
         DlUYjsvqcWqlc882KAiQVvh7srxV6d0+ameZ2v3MwsyDtdsnhgyl1GOE6+jwya3ZVCBZ
         yOXQ==
X-Gm-Message-State: AJIora9G5xiNzDZgnKP5oXYbKzZbFtc2AIzPU02xmT7346DOJaBi5jOg
        1V3a2uZeY7ENy+iEJcSln/YsXw==
X-Google-Smtp-Source: AGRyM1vFcCu6q1QE5BBd8h7B9QNugS3320PZsRU8m3bDS02OPXUAexxyu0eK2eiOq2n4JddEBfBDYw==
X-Received: by 2002:a17:90a:7784:b0:1ef:c0fe:968c with SMTP id v4-20020a17090a778400b001efc0fe968cmr8513271pjk.26.1657695202115;
        Tue, 12 Jul 2022 23:53:22 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id w185-20020a6362c2000000b0041292b732fdsm7245998pgb.38.2022.07.12.23.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 23:53:21 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Vincent Guittot <vincent.guittot@linaro.org>,
        Johan Hovold <johan@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/4] cpufreq: qcom-cpufreq-hw: Register config_clks helper
Date:   Wed, 13 Jul 2022 12:22:59 +0530
Message-Id: <5f8db633c179608214c5e17a6927715f7acda993.1657695140.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1657695140.git.viresh.kumar@linaro.org>
References: <cover.1657695140.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a corner case with Qcom, where we want to skip clk
configuration that happens via dev_pm_opp_set_opp(), but still want the
OPP core to read the "opp-hz" property so we can find the right OPP via
freq finding helpers.

The OPP core provides support for the platforms to provide config_clks
helpers now, lets use that to provide an empty callback to skip clock
configuration.

The "table" wasn't getting freed properly on error, fix it as well which
we are updating the code.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 32 ++++++++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index 05fce4a559ca..8d055a5f6575 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -59,6 +59,7 @@ struct qcom_cpufreq_data {
 	bool per_core_dcvs;
 	unsigned long cpu_hw_rate;
 	unsigned long xo_rate;
+	int opp_token;
 };
 
 static bool icc_scaling_enabled;
@@ -162,6 +163,15 @@ static unsigned int qcom_cpufreq_hw_fast_switch(struct cpufreq_policy *policy,
 	return policy->freq_table[index].frequency;
 }
 
+static int qcom_cpufreq_hw_config_clks_nop(struct device *dev,
+					   struct opp_table *opp_table,
+					   struct dev_pm_opp *opp, void *data,
+					   bool scaling_down)
+{
+	/* We want to skip clk configuration via dev_pm_opp_set_opp() */
+	return 0;
+}
+
 static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 				    struct cpufreq_policy *policy)
 {
@@ -173,11 +183,23 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 	int ret;
 	struct qcom_cpufreq_data *drv_data = policy->driver_data;
 	const struct qcom_cpufreq_soc_data *soc_data = drv_data->soc_data;
+	const char * const clk_names[] = { "xo", NULL };
+	struct dev_pm_opp_config config = {
+		.clk_names = clk_names,
+		.config_clks = qcom_cpufreq_hw_config_clks_nop,
+	};
 
 	table = kcalloc(LUT_MAX_ENTRIES + 1, sizeof(*table), GFP_KERNEL);
 	if (!table)
 		return -ENOMEM;
 
+	ret = dev_pm_opp_set_config(cpu_dev, &config);
+	if (ret < 0) {
+		dev_err(cpu_dev, "Failed to set OPP config: %d\n", ret);
+		goto free_table;
+	}
+	drv_data->opp_token = ret;
+
 	ret = dev_pm_opp_of_add_table(cpu_dev);
 	if (!ret) {
 		/* Disable all opps and cross-validate against LUT later */
@@ -192,7 +214,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 		}
 	} else if (ret != -ENODEV) {
 		dev_err(cpu_dev, "Invalid opp table in device tree\n");
-		return ret;
+		goto clear_config;
 	} else {
 		policy->fast_switch_possible = true;
 		icc_scaling_enabled = false;
@@ -260,6 +282,13 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 	dev_pm_opp_set_sharing_cpus(cpu_dev, policy->cpus);
 
 	return 0;
+
+clear_config:
+	dev_pm_opp_clear_config(drv_data->opp_token);
+
+free_table:
+	kfree(table);
+	return ret;
 }
 
 static void qcom_get_related_cpus(int index, struct cpumask *m)
@@ -614,6 +643,7 @@ static int qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 	dev_pm_opp_remove_all_dynamic(cpu_dev);
 	dev_pm_opp_of_cpumask_remove_table(policy->related_cpus);
 	qcom_cpufreq_hw_lmh_exit(data);
+	dev_pm_opp_clear_config(data->opp_token);
 	kfree(policy->freq_table);
 	kfree(data);
 	iounmap(base);
-- 
2.31.1.272.g89b43f80a514

