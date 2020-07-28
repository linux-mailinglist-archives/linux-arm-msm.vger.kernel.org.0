Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81C122304A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jul 2020 09:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727798AbgG1HvT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Jul 2020 03:51:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:26121 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727815AbgG1HvQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Jul 2020 03:51:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595922675; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=JDnW6dI05vIWs23wbae5CWIRSyAcGFN7fPLyddDzIPY=; b=Yan7HwaTmF8pB0vlB57ojTrQq46TTE/ZiFz1duQ8+YpmKGHPUforF6B4DAmK3oxSJHb1v6mH
 2TLm48cv1KiZdCQfsTd1eybjqBJ9McVC6rpgZNTZQEnS83AXOXA0TL9+28QAgI0egfGwqu0C
 KyQykOdRURzozalX33x25unbvRU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-east-1.postgun.com with SMTP id
 5f1fd8f27ab15087eb525932 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Jul 2020 07:51:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CEFCDC4339C; Tue, 28 Jul 2020 07:51:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5003BC433C9;
        Tue, 28 Jul 2020 07:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5003BC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv2] coresight: etm4x: Fix etm4_count race by moving cpuhp callbacks to init
Date:   Tue, 28 Jul 2020 13:21:02 +0530
Message-Id: <20200728075102.30807-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

etm4_count keeps track of number of ETMv4 registered and on some systems,
a race is observed on etm4_count variable which can lead to multiple calls
to cpuhp_setup_state_nocalls_cpuslocked(). This function internally calls
cpuhp_store_callbacks() which prevents multiple registrations of callbacks
for a given state and due to this race, it returns -EBUSY leading to ETM
probe failures like below.

 coresight-etm4x: probe of 7040000.etm failed with error -16

This race can easily be triggered with async probe by setting probe type
as PROBE_PREFER_ASYNCHRONOUS and with ETM power management property
"arm,coresight-loses-context-with-cpu".

Prevent this race by moving cpuhp callbacks to etm driver init since the
cpuhp callbacks doesn't have to depend on the etm4_count and can be once
setup during driver init. Similarly we move cpu_pm notifier registration
to driver init and completely remove etm4_count usage.

Fixes: 9b6a3f3633a5 ("coresight: etmv4: Fix CPU power management setup in probe() function")
Fixes: 58eb457be028 ("hwtracing/coresight-etm4x: Convert to hotplug state machine")
Suggested-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---

Changes in v2:
 * Rearrange cpuhp callbacks and move them to driver init (Suzuki K Poulose)

---
 drivers/hwtracing/coresight/coresight-etm4x.c | 51 ++++++++++---------
 1 file changed, 27 insertions(+), 24 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c b/drivers/hwtracing/coresight/coresight-etm4x.c
index 6d7d2169bfb2..adb71987a1e3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x.c
@@ -48,8 +48,6 @@ module_param(pm_save_enable, int, 0444);
 MODULE_PARM_DESC(pm_save_enable,
 	"Save/restore state on power down: 1 = never, 2 = self-hosted");
 
-/* The number of ETMv4 currently registered */
-static int etm4_count;
 static struct etmv4_drvdata *etmdrvdata[NR_CPUS];
 static void etm4_set_default_config(struct etmv4_config *config);
 static int etm4_set_event_filters(struct etmv4_drvdata *drvdata,
@@ -1403,12 +1401,9 @@ static int etm4_pm_setup_cpuslocked(void)
 {
 	int ret;
 
-	if (etm4_count++)
-		return 0;
-
 	ret = cpu_pm_register_notifier(&etm4_cpu_pm_nb);
 	if (ret)
-		goto reduce_count;
+		return ret;
 
 	ret = cpuhp_setup_state_nocalls_cpuslocked(CPUHP_AP_ARM_CORESIGHT_STARTING,
 						   "arm/coresight4:starting",
@@ -1432,17 +1427,11 @@ static int etm4_pm_setup_cpuslocked(void)
 
 unregister_notifier:
 	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
-
-reduce_count:
-	--etm4_count;
 	return ret;
 }
 
 static void etm4_pm_clear(void)
 {
-	if (--etm4_count != 0)
-		return;
-
 	cpu_pm_unregister_notifier(&etm4_cpu_pm_nb);
 	cpuhp_remove_state_nocalls(CPUHP_AP_ARM_CORESIGHT_STARTING);
 	if (hp_online) {
@@ -1498,22 +1487,12 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
 	if (!desc.name)
 		return -ENOMEM;
 
-	cpus_read_lock();
 	etmdrvdata[drvdata->cpu] = drvdata;
 
 	if (smp_call_function_single(drvdata->cpu,
 				etm4_init_arch_data,  drvdata, 1))
 		dev_err(dev, "ETM arch init failed\n");
 
-	ret = etm4_pm_setup_cpuslocked();
-	cpus_read_unlock();
-
-	/* etm4_pm_setup_cpuslocked() does its own cleanup - exit on error */
-	if (ret) {
-		etmdrvdata[drvdata->cpu] = NULL;
-		return ret;
-	}
-
 	if (etm4_arch_supported(drvdata->arch) == false) {
 		ret = -EINVAL;
 		goto err_arch_supported;
@@ -1560,7 +1539,6 @@ static int etm4_probe(struct amba_device *adev, const struct amba_id *id)
 
 err_arch_supported:
 	etmdrvdata[drvdata->cpu] = NULL;
-	etm4_pm_clear();
 	return ret;
 }
 
@@ -1598,4 +1576,29 @@ static struct amba_driver etm4x_driver = {
 	.probe		= etm4_probe,
 	.id_table	= etm4_ids,
 };
-builtin_amba_driver(etm4x_driver);
+
+static int __init etm4x_init(void)
+{
+	int ret;
+
+	cpus_read_lock();
+	ret = etm4_pm_setup_cpuslocked();
+	cpus_read_unlock();
+
+	/* etm4_pm_setup_cpuslocked() does its own cleanup - exit on error */
+	if (ret)
+		return ret;
+
+	ret = amba_driver_register(&etm4x_driver);
+	if (ret) {
+		pr_info("Error registering etm4x driver\n");
+		goto err_init;
+	}
+
+	return ret;
+
+err_init:
+	etm4_pm_clear();
+	return ret;
+}
+module_init(etm4x_init);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

