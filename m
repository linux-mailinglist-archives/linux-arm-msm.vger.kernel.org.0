Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC53B3CF394
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 06:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348228AbhGTEBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 00:01:12 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30094 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348236AbhGTD6Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 23:58:24 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626755938; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Rm54wQEKlrARkXFXuTVbJ1EcMJAfYTBRSTdgLJNyi1I=; b=PiVPBkuBiK0xlGtXr7PYONj+bVtVRklXSytSZMmJkiK4ue294v+FTWgwdfPSzRl7w5w1/a9C
 Fxq/ULEl3SpzImxPuGIWVwPeCDW8Gxg4kc3jHBSDg1mlr+aeTRafS8Hr5zMaO5ADhYrUKDfJ
 qS4tbffk/ZX7+ExyeMZpGxvLUS8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60f6534fc923fb7e09ed1c6c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Jul 2021 04:38:39
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2CEFC43143; Tue, 20 Jul 2021 04:38:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFE98C433F1;
        Tue, 20 Jul 2021 04:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFE98C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     mka@chromium.org, swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org
Cc:     ulf.hansson@linaro.org, rjw@rjwysocki.net, agross@kernel.org,
        ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v4 11/13] soc: qcom: aoss: Drop power domain support
Date:   Tue, 20 Jul 2021 10:06:45 +0530
Message-Id: <1626755807-11865-12-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Strip out the load state power-domain support from the driver since the
low power mode signalling for the co-processors is now accessible through
the direct qmp message send interface.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

v4:
 * Commit message change and drop incorrect cleanup on cooling
   device probe failures. [Matthias]

 drivers/soc/qcom/qcom_aoss.c | 107 -------------------------------------------
 1 file changed, 107 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 3f588921a7b1..dccc5d96fe0a 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -2,7 +2,6 @@
 /*
  * Copyright (c) 2019, Linaro Ltd
  */
-#include <dt-bindings/power/qcom-aoss-qmp.h>
 #include <linux/clk-provider.h>
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
@@ -11,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
-#include <linux/pm_domain.h>
 #include <linux/thermal.h>
 #include <linux/slab.h>
 #include <linux/soc/qcom/qcom_aoss.h>
@@ -68,7 +66,6 @@ struct qmp_cooling_device {
  * @event: wait_queue for synchronization with the IRQ
  * @tx_lock: provides synchronization between multiple callers of qmp_send()
  * @qdss_clk: QDSS clock hw struct
- * @pd_data: genpd data
  * @cooling_devs: thermal cooling devices
  */
 struct qmp {
@@ -88,20 +85,12 @@ struct qmp {
 	struct mutex tx_lock;
 
 	struct clk_hw qdss_clk;
-	struct genpd_onecell_data pd_data;
 	struct qmp_cooling_device *cooling_devs;
 #if IS_ENABLED(CONFIG_DEBUG_FS)
 	struct dentry *debugfs_file;
 #endif /* CONFIG_DEBUG_FS */
 };
 
-struct qmp_pd {
-	struct qmp *qmp;
-	struct generic_pm_domain pd;
-};
-
-#define to_qmp_pd_resource(res) container_of(res, struct qmp_pd, pd)
-
 static void qmp_kick(struct qmp *qmp)
 {
 	mbox_send_message(qmp->mbox_chan, NULL);
@@ -330,95 +319,6 @@ static void qmp_qdss_clk_remove(struct qmp *qmp)
 	clk_hw_unregister(&qmp->qdss_clk);
 }
 
-static int qmp_pd_power_toggle(struct qmp_pd *res, bool enable)
-{
-	char buf[QMP_MSG_LEN] = {};
-
-	snprintf(buf, sizeof(buf),
-		 "{class: image, res: load_state, name: %s, val: %s}",
-		 res->pd.name, enable ? "on" : "off");
-	return qmp_send(res->qmp, buf, sizeof(buf));
-}
-
-static int qmp_pd_power_on(struct generic_pm_domain *domain)
-{
-	return qmp_pd_power_toggle(to_qmp_pd_resource(domain), true);
-}
-
-static int qmp_pd_power_off(struct generic_pm_domain *domain)
-{
-	return qmp_pd_power_toggle(to_qmp_pd_resource(domain), false);
-}
-
-static const char * const sdm845_resources[] = {
-	[AOSS_QMP_LS_CDSP] = "cdsp",
-	[AOSS_QMP_LS_LPASS] = "adsp",
-	[AOSS_QMP_LS_MODEM] = "modem",
-	[AOSS_QMP_LS_SLPI] = "slpi",
-	[AOSS_QMP_LS_SPSS] = "spss",
-	[AOSS_QMP_LS_VENUS] = "venus",
-};
-
-static int qmp_pd_add(struct qmp *qmp)
-{
-	struct genpd_onecell_data *data = &qmp->pd_data;
-	struct device *dev = qmp->dev;
-	struct qmp_pd *res;
-	size_t num = ARRAY_SIZE(sdm845_resources);
-	int ret;
-	int i;
-
-	res = devm_kcalloc(dev, num, sizeof(*res), GFP_KERNEL);
-	if (!res)
-		return -ENOMEM;
-
-	data->domains = devm_kcalloc(dev, num, sizeof(*data->domains),
-				     GFP_KERNEL);
-	if (!data->domains)
-		return -ENOMEM;
-
-	for (i = 0; i < num; i++) {
-		res[i].qmp = qmp;
-		res[i].pd.name = sdm845_resources[i];
-		res[i].pd.power_on = qmp_pd_power_on;
-		res[i].pd.power_off = qmp_pd_power_off;
-
-		ret = pm_genpd_init(&res[i].pd, NULL, true);
-		if (ret < 0) {
-			dev_err(dev, "failed to init genpd\n");
-			goto unroll_genpds;
-		}
-
-		data->domains[i] = &res[i].pd;
-	}
-
-	data->num_domains = i;
-
-	ret = of_genpd_add_provider_onecell(dev->of_node, data);
-	if (ret < 0)
-		goto unroll_genpds;
-
-	return 0;
-
-unroll_genpds:
-	for (i--; i >= 0; i--)
-		pm_genpd_remove(data->domains[i]);
-
-	return ret;
-}
-
-static void qmp_pd_remove(struct qmp *qmp)
-{
-	struct genpd_onecell_data *data = &qmp->pd_data;
-	struct device *dev = qmp->dev;
-	int i;
-
-	of_genpd_del_provider(dev->of_node);
-
-	for (i = 0; i < data->num_domains; i++)
-		pm_genpd_remove(data->domains[i]);
-}
-
 static int qmp_cdev_get_max_state(struct thermal_cooling_device *cdev,
 				  unsigned long *state)
 {
@@ -650,10 +550,6 @@ static int qmp_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_close_qmp;
 
-	ret = qmp_pd_add(qmp);
-	if (ret)
-		goto err_remove_qdss_clk;
-
 	ret = qmp_cooling_devices_register(qmp);
 	if (ret)
 		dev_err(&pdev->dev, "failed to register aoss cooling devices\n");
@@ -669,8 +565,6 @@ static int qmp_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_remove_qdss_clk:
-	qmp_qdss_clk_remove(qmp);
 err_close_qmp:
 	qmp_close(qmp);
 err_free_mbox:
@@ -689,7 +583,6 @@ static int qmp_remove(struct platform_device *pdev)
 #endif /* CONFIG_DEBUG_FS */
 
 	qmp_qdss_clk_remove(qmp);
-	qmp_pd_remove(qmp);
 	qmp_cooling_devices_remove(qmp);
 
 	qmp_close(qmp);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

