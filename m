Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1FC44D3D2B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Mar 2022 23:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238791AbiCIWk4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Mar 2022 17:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238795AbiCIWk4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Mar 2022 17:40:56 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36C0F120F7A
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Mar 2022 14:39:56 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id h14so6288493lfk.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Mar 2022 14:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MHH5JWeg/tYAzKBUll2JAEsUSxgBB41qjFt+SHg4XS8=;
        b=O/mDOkszGi5FSBY13cfdOw1b2c6QOT/tZcgjcABlWA135imqMRU+yML6HYsSvC+h8m
         +CICPFzrmtHfZSVkM03cF1mfthaq1Lz/IQ4pfNZmst4AkauNoSe62pgYavE6FX1N3PMz
         8rLK07OxgBZ2OofjzDpNxP2Unp7nsralrw5psM5lY18oiBSF+It1BKxxeFzgKg3r4KwW
         BLT4+g9TDlLyXbjkHNF78DovU1k6QgT9Jf9dUYnrlZr5QjP1iOAKC4UtmNHqhS0L4YdE
         OyNXSfX0L7hkJ6YldmSN0/fwdiPyevw9QTdrstHcRfUq5oig4piIA9ZB+DIbayq9ifZ/
         SOEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MHH5JWeg/tYAzKBUll2JAEsUSxgBB41qjFt+SHg4XS8=;
        b=ZZWPnEUnh8TtaOf5tXks2KlkEk2BfNMHWYNZD2b3Ids8Z50AcZAqN8aj/6y6smIFET
         x7GwVyp6nPqh7x7H4TZNQ+SxpZtacoeLG2nF+UDyeXTsGUEiX8fSOlhmQOXUuxZK+PBR
         Smae0jCJKixZJSE3v0rLA710VAqLo2bknBKlm//NQeEEo+WgdVImVVR6vgVlD/TBjIDW
         PbUBJn0ux15wQk8XpUdxu76ZZ0yTLIbxbPCQ1KbIvIykJhaj4Vwc8s0FMAc8T8KueS02
         ff3UbE6P3m1P/eA2PVkSCXIl1NcN50OGt2976xEvqkuYeEA+vhChrmcph07TyfSVO4Hg
         +2kA==
X-Gm-Message-State: AOAM532NUL+X7/I5un0saFygpryvGqxhL7KtO5DypaDNbj8LlgnNvpWC
        J94j0BuNsqjpijEnVZnaIxaIqw==
X-Google-Smtp-Source: ABdhPJyH3GcwJs7l8MCIwzNvO92pfZ9PABSEdKgnUldBEk5mDqcD+b3OdFOwPgbd+oibqiJ4GNsk5g==
X-Received: by 2002:a05:6512:2347:b0:448:2744:26f7 with SMTP id p7-20020a056512234700b00448274426f7mr1146804lfu.683.1646865594563;
        Wed, 09 Mar 2022 14:39:54 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b24-20020a196458000000b004483734e0afsm621036lfj.12.2022.03.09.14.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 14:39:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@gmail.com>
Subject: [PATCH v2 4/4] cpufreq: qcom-hw: provide online/offline operations
Date:   Thu, 10 Mar 2022 01:39:38 +0300
Message-Id: <20220309223938.3819715-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220309223938.3819715-1-dmitry.baryshkov@linaro.org>
References: <20220309223938.3819715-1-dmitry.baryshkov@linaro.org>
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

Provide lightweight online and offline operations. This saves us from
parsing all the resources each time the CPU is put online.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 39 +++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 7 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index fe638e141003..d38b1552ec13 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -403,11 +403,12 @@ static const struct of_device_id qcom_cpufreq_hw_match[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_cpufreq_hw_match);
 
+static int qcom_cpufreq_hw_lmh_online(struct cpufreq_policy *policy);
+
 static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
 {
 	struct qcom_cpufreq_data *data = policy->driver_data;
 	struct platform_device *pdev = cpufreq_get_driver_data();
-	int ret;
 
 	/*
 	 * Look for LMh interrupt. If no interrupt line is specified /
@@ -419,12 +420,21 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
 	if (data->throttle_irq < 0)
 		return data->throttle_irq;
 
-	data->cancel_throttle = false;
-	data->policy = policy;
-
 	mutex_init(&data->throttle_lock);
 	INIT_DEFERRABLE_WORK(&data->throttle_work, qcom_lmh_dcvs_poll);
 
+	return qcom_cpufreq_hw_lmh_online(policy);
+}
+
+static int qcom_cpufreq_hw_lmh_online(struct cpufreq_policy *policy)
+{
+	struct qcom_cpufreq_data *data = policy->driver_data;
+	struct platform_device *pdev = cpufreq_get_driver_data();
+	int ret;
+
+	data->cancel_throttle = false;
+	data->policy = policy;
+
 	snprintf(data->irq_name, sizeof(data->irq_name), "dcvsh-irq-%u", policy->cpu);
 	ret = request_threaded_irq(data->throttle_irq, NULL, qcom_lmh_dcvs_handle_irq,
 				   IRQF_ONESHOT | IRQF_NO_AUTOEN, data->irq_name, data);
@@ -441,10 +451,12 @@ static int qcom_cpufreq_hw_lmh_init(struct cpufreq_policy *policy, int index)
 	return 0;
 }
 
-static void qcom_cpufreq_hw_lmh_exit(struct qcom_cpufreq_data *data)
+static int qcom_cpufreq_hw_lmh_offline(struct cpufreq_policy *policy)
 {
+	struct qcom_cpufreq_data *data = policy->driver_data;
+
 	if (data->throttle_irq <= 0)
-		return;
+		return 0;
 
 	mutex_lock(&data->throttle_lock);
 	data->cancel_throttle = true;
@@ -453,6 +465,8 @@ static void qcom_cpufreq_hw_lmh_exit(struct qcom_cpufreq_data *data)
 	cancel_delayed_work_sync(&data->throttle_work);
 	irq_set_affinity_hint(data->throttle_irq, NULL);
 	free_irq(data->throttle_irq, data);
+
+	return 0;
 }
 
 static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
@@ -567,6 +581,16 @@ static int qcom_cpufreq_hw_cpu_init(struct cpufreq_policy *policy)
 	return ret;
 }
 
+static int qcom_cpufreq_hw_cpu_online(struct cpufreq_policy *policy)
+{
+	return qcom_cpufreq_hw_lmh_online(policy);
+}
+
+static int qcom_cpufreq_hw_cpu_offline(struct cpufreq_policy *policy)
+{
+	return qcom_cpufreq_hw_lmh_offline(policy);
+}
+
 static int qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 {
 	struct device *cpu_dev = get_cpu_device(policy->cpu);
@@ -576,7 +600,6 @@ static int qcom_cpufreq_hw_cpu_exit(struct cpufreq_policy *policy)
 
 	dev_pm_opp_remove_all_dynamic(cpu_dev);
 	dev_pm_opp_of_cpumask_remove_table(policy->related_cpus);
-	qcom_cpufreq_hw_lmh_exit(data);
 	kfree(policy->freq_table);
 	kfree(data);
 	iounmap(base);
@@ -608,6 +631,8 @@ static struct cpufreq_driver cpufreq_qcom_hw_driver = {
 	.get		= qcom_cpufreq_hw_get,
 	.init		= qcom_cpufreq_hw_cpu_init,
 	.exit		= qcom_cpufreq_hw_cpu_exit,
+	.online		= qcom_cpufreq_hw_cpu_online,
+	.offline	= qcom_cpufreq_hw_cpu_offline,
 	.register_em	= cpufreq_register_em_with_opp,
 	.fast_switch    = qcom_cpufreq_hw_fast_switch,
 	.name		= "qcom-cpufreq-hw",
-- 
2.34.1

