Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE4EF100765
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2019 15:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbfKRO2H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Nov 2019 09:28:07 -0500
Received: from a27-18.smtp-out.us-west-2.amazonses.com ([54.240.27.18]:52390
        "EHLO a27-18.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727146AbfKRO2G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Nov 2019 09:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574087285;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=KEITsjIAnm101+zmY5kHMW+vXVfB/0Y93JoQUnyZz1Q=;
        b=RH0GsV+YUTOh04x8938+VvdwTRbnfY24CK8GnMi6TJAkJak1/j+3W5f+PO6CHIQc
        Y5k6CquTTcdnUptKHn0/g8xcfw59NgfWC7vLRpZY0/gP//r8KmMIQjlk5EzpPdV8zed
        o+voHsxrXg1FsiiP4PF7XDAU0F4QjiYojZE4vMHs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574087285;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=KEITsjIAnm101+zmY5kHMW+vXVfB/0Y93JoQUnyZz1Q=;
        b=KTofftmz8J3kKDlKAQiGP8eGqwzyWXM8F8BB9+8hyoqCpj0v3rKiTgohchEpsifT
        1Ok4SLANJliv3zYQHSSUKJlvpzZK9E/+eclt/d4/c3AKP6lQ86PUNqhWjbtVXg5A9em
        7Tbh4rRdNyfjxfvJ+zweSw/Ui1rniy0vEmSS8HLo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ACF05C447B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, tsoni@codeaurora.org
Cc:     agross@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        rnayak@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 3/3] soc: qcom: apr: Add avs/audio tracking functionality
Date:   Mon, 18 Nov 2019 14:28:05 +0000
Message-ID: <0101016e7ee9da0b-8abd2e5c-e733-4697-b0da-0e398f205303-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20191118142728.30187-1-sibis@codeaurora.org>
References: <20191118142728.30187-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2019.11.18-54.240.27.18
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use PDR helper functions to track the protection domains that the apr
services are dependent upon on SDM845 SoC, specifically the "avs/audio"
service running on ADSP Q6.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/soc/qcom/Kconfig     |   1 +
 drivers/soc/qcom/apr.c       | 100 +++++++++++++++++++++++++++++++----
 include/linux/soc/qcom/apr.h |   1 +
 3 files changed, 91 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 5c4e76837f59b..cacfed945b275 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -202,6 +202,7 @@ config QCOM_APR
 	tristate "Qualcomm APR Bus (Asynchronous Packet Router)"
 	depends on ARCH_QCOM || COMPILE_TEST
 	depends on RPMSG
+	select QCOM_PDR_HELPERS
 	help
           Enable APR IPC protocol support between
           application processor and QDSP6. APR is
diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 4fcc32420c474..193cee77a9a09 100644
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
+	struct pdr_handle pdr;
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
@@ -300,14 +305,56 @@ static int apr_add_device(struct device *dev, struct device_node *np,
 	return ret;
 }
 
-static void of_register_apr_devices(struct device *dev)
+static void of_apr_add_pd_lookups(struct device *dev)
+{
+	const char *service_name, *service_path;
+	struct apr *apr = dev_get_drvdata(dev);
+	struct device_node *node;
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
+		if (ret < 0)
+			continue;
+
+		ret = pdr_add_lookup(&apr->pdr, service_name, service_path);
+		if (ret && ret != -EALREADY)
+			dev_err(dev, "pdr add lookup failed: %d\n", ret);
+	}
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
+			/* skip APR services whose PD lookups are registered*/
+			if (ret == 0)
+				continue;
+		}
+
 		if (of_property_read_u32(node, "reg", &id.svc_id))
 			continue;
 
@@ -318,6 +365,37 @@ static void of_register_apr_devices(struct device *dev)
 	}
 }
 
+static int apr_remove_device(struct device *dev, void *svc_path)
+{
+	struct apr_device *adev = to_apr_device(dev);
+
+	if (svc_path) {
+		if (!strcmp(adev->service_path, (char *)svc_path))
+			device_unregister(&adev->dev);
+	} else {
+		device_unregister(&adev->dev);
+	}
+
+	return 0;
+}
+
+static int apr_pd_status(struct pdr_handle *pdr, struct pdr_service *pds)
+{
+	struct apr *apr = container_of(pdr, struct apr, pdr);
+
+	switch (pds->state) {
+	case SERVREG_SERVICE_STATE_UP:
+		of_register_apr_devices(apr->dev, pds->service_path);
+		break;
+	case SERVREG_SERVICE_STATE_DOWN:
+		device_for_each_child(apr->dev, pds->service_path,
+				      apr_remove_device);
+		break;
+	}
+
+	return 0;
+}
+
 static int apr_probe(struct rpmsg_device *rpdev)
 {
 	struct device *dev = &rpdev->dev;
@@ -343,20 +421,19 @@ static int apr_probe(struct rpmsg_device *rpdev)
 		return -ENOMEM;
 	}
 	INIT_WORK(&apr->rx_work, apr_rxwq);
+
+	ret = pdr_handle_init(&apr->pdr, apr_pd_status);
+	if (ret) {
+		dev_err(dev, "Failed to init PDR handle\n");
+		return ret;
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
-
-static int apr_remove_device(struct device *dev, void *null)
-{
-	struct apr_device *adev = to_apr_device(dev);
-
-	device_unregister(&adev->dev);
+	of_apr_add_pd_lookups(dev);
+	of_register_apr_devices(dev, NULL);
 
 	return 0;
 }
@@ -365,6 +442,7 @@ static void apr_remove(struct rpmsg_device *rpdev)
 {
 	struct apr *apr = dev_get_drvdata(&rpdev->dev);
 
+	pdr_handle_release(&apr->pdr);
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

