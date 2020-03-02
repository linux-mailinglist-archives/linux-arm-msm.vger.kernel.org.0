Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6A1176328
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 19:48:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727663AbgCBSsK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 13:48:10 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59513 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727632AbgCBSsJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 13:48:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583174889; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ATLSST5U5N2wxPUJMUb2Dp7ZBQ67ti5E/YadENEoLR4=; b=YnAUWa/1mVnTXkxu/BAJg53Yy6D3YJpKMSYei3Bcyq6Hy/+TYXIkmmdG+swPf7KUe2c3910B
 yPADf4eO9ZmZkbQrrPgA8QKf0nznovZc7+NcUk14GncQ1RBTulabCApmPo00WvEPvq8J7cye
 di3YVMNLYo84osRFfeW9yI10mOU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5d54d8.7fae2c92e7a0-smtp-out-n01;
 Mon, 02 Mar 2020 18:47:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E18C4C4479D; Mon,  2 Mar 2020 18:47:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4456CC4479C;
        Mon,  2 Mar 2020 18:47:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4456CC4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        tsoni@codeaurora.org, vnkgutta@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v5 3/3] soc: qcom: apr: Add avs/audio tracking functionality
Date:   Tue,  3 Mar 2020 00:17:23 +0530
Message-Id: <20200302184723.16420-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200302184723.16420-1-sibis@codeaurora.org>
References: <20200302184723.16420-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use PDR helper functions to track the protection domains that the apr
services are dependent upon on SDM845 SoC, specifically the "avs/audio"
service running on ADSP Q6.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V5:
 * Picked up Bjorn's R-b

 drivers/soc/qcom/Kconfig     |   1 +
 drivers/soc/qcom/apr.c       | 123 ++++++++++++++++++++++++++++++++---
 include/linux/soc/qcom/apr.h |   1 +
 3 files changed, 116 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 945609005cedd..e2c364d86a838 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -201,6 +201,7 @@ config QCOM_APR
 	tristate "Qualcomm APR Bus (Asynchronous Packet Router)"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
+	select QCOM_PDR_HELPERS
 	help
 	  Enable APR IPC protocol support between
 	  application processor and QDSP6. APR is
diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 4fcc32420c474..1f35b097c6356 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -11,6 +11,7 @@
 #include <linux/workqueue.h>
 #include <linux/of_device.h>
 #include <linux/soc/qcom/apr.h>
+#include <linux/soc/qcom/pdr.h>
 #include <linux/rpmsg.h>
 #include <linux/of.h>
 
@@ -21,6 +22,7 @@ struct apr {
 	spinlock_t rx_lock;
 	struct idr svcs_idr;
 	int dest_domain_id;
+	struct pdr_handle *pdr;
 	struct workqueue_struct *rxwq;
 	struct work_struct rx_work;
 	struct list_head rx_list;
@@ -289,6 +291,9 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 		  id->svc_id + 1, GFP_ATOMIC);
 	spin_unlock(&apr->svcs_lock);
 
+	of_property_read_string_index(np, "qcom,protection-domain",
+				      1, &adev->service_path);
+
 	dev_info(dev, "Adding APR dev: %s\n", dev_name(&adev->dev));
 
 	ret = device_register(&adev->dev);
@@ -300,14 +305,75 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 	return ret;
 }
 
-static void of_register_apr_devices(struct device *dev)
+static int of_apr_add_pd_lookups(struct device *dev)
+{
+	const char *service_name, *service_path;
+	struct apr *apr = dev_get_drvdata(dev);
+	struct device_node *node;
+	struct pdr_service *pds;
+	int ret;
+
+	for_each_child_of_node(dev->of_node, node) {
+		ret = of_property_read_string_index(node, "qcom,protection-domain",
+						    0, &service_name);
+		if (ret < 0)
+			continue;
+
+		ret = of_property_read_string_index(node, "qcom,protection-domain",
+						    1, &service_path);
+		if (ret < 0) {
+			dev_err(dev, "pdr service path missing: %d\n", ret);
+			return ret;
+		}
+
+		pds = pdr_add_lookup(apr->pdr, service_name, service_path);
+		if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
+			dev_err(dev, "pdr add lookup failed: %d\n", ret);
+			return PTR_ERR(pds);
+		}
+	}
+
+	return 0;
+}
+
+static void of_register_apr_devices(struct device *dev, const char *svc_path)
 {
 	struct apr *apr = dev_get_drvdata(dev);
 	struct device_node *node;
+	const char *service_path;
+	int ret;
 
 	for_each_child_of_node(dev->of_node, node) {
 		struct apr_device_id id = { {0} };
 
+		/*
+		 * This function is called with svc_path NULL during
+		 * apr_probe(), in which case we register any apr devices
+		 * without a qcom,protection-domain specified.
+		 *
+		 * Then as the protection domains becomes available
+		 * (if applicable) this function is again called, but with
+		 * svc_path representing the service becoming available. In
+		 * this case we register any apr devices with a matching
+		 * qcom,protection-domain.
+		 */
+
+		ret = of_property_read_string_index(node, "qcom,protection-domain",
+						    1, &service_path);
+		if (svc_path) {
+			/* skip APR services that are PD independent */
+			if (ret)
+				continue;
+
+			/* skip APR services whose PD paths don't match */
+			if (strcmp(service_path, svc_path))
+				continue;
+		} else {
+			/* skip APR services whose PD lookups are registered */
+			if (ret == 0)
+				continue;
+		}
+
 		if (of_property_read_u32(node, "reg", &id.svc_id))
 			continue;
 
@@ -318,6 +384,34 @@ static void of_register_apr_devices(struct device *dev)
 	}
 }
 
+static int apr_remove_device(struct device *dev, void *svc_path)
+{
+	struct apr_device *adev = to_apr_device(dev);
+
+	if (svc_path && adev->service_path) {
+		if (!strcmp(adev->service_path, (char *)svc_path))
+			device_unregister(&adev->dev);
+	} else {
+		device_unregister(&adev->dev);
+	}
+
+	return 0;
+}
+
+static void apr_pd_status(int state, char *svc_path, void *priv)
+{
+	struct apr *apr = (struct apr *)priv;
+
+	switch (state) {
+	case SERVREG_SERVICE_STATE_UP:
+		of_register_apr_devices(apr->dev, svc_path);
+		break;
+	case SERVREG_SERVICE_STATE_DOWN:
+		device_for_each_child(apr->dev, svc_path, apr_remove_device);
+		break;
+	}
+}
+
 static int apr_probe(struct rpmsg_device *rpdev)
 {
 	struct device *dev = &rpdev->dev;
@@ -343,28 +437,39 @@ static int apr_probe(struct rpmsg_device *rpdev)
 		return -ENOMEM;
 	}
 	INIT_WORK(&apr->rx_work, apr_rxwq);
+
+	apr->pdr = pdr_handle_alloc(apr_pd_status, apr);
+	if (IS_ERR(apr->pdr)) {
+		dev_err(dev, "Failed to init PDR handle\n");
+		ret = PTR_ERR(apr->pdr);
+		goto destroy_wq;
+	}
+
 	INIT_LIST_HEAD(&apr->rx_list);
 	spin_lock_init(&apr->rx_lock);
 	spin_lock_init(&apr->svcs_lock);
 	idr_init(&apr->svcs_idr);
-	of_register_apr_devices(dev);
-
-	return 0;
-}
 
-static int apr_remove_device(struct device *dev, void *null)
-{
-	struct apr_device *adev = to_apr_device(dev);
+	ret = of_apr_add_pd_lookups(dev);
+	if (ret)
+		goto handle_release;
 
-	device_unregister(&adev->dev);
+	of_register_apr_devices(dev, NULL);
 
 	return 0;
+
+handle_release:
+	pdr_handle_release(apr->pdr);
+destroy_wq:
+	destroy_workqueue(apr->rxwq);
+	return ret;
 }
 
 static void apr_remove(struct rpmsg_device *rpdev)
 {
 	struct apr *apr = dev_get_drvdata(&rpdev->dev);
 
+	pdr_handle_release(apr->pdr);
 	device_for_each_child(&rpdev->dev, NULL, apr_remove_device);
 	flush_workqueue(apr->rxwq);
 	destroy_workqueue(apr->rxwq);
diff --git a/include/linux/soc/qcom/apr.h b/include/linux/soc/qcom/apr.h
index c5d52e2cb275f..7f0bc3cf4d610 100644
--- a/include/linux/soc/qcom/apr.h
+++ b/include/linux/soc/qcom/apr.h
@@ -85,6 +85,7 @@ struct apr_device {
 	uint16_t	domain_id;
 	uint32_t	version;
 	char name[APR_NAME_SIZE];
+	const char *service_path;
 	spinlock_t	lock;
 	struct list_head node;
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
