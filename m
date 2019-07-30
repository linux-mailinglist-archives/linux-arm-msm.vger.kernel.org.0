Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D81B7AC3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2019 17:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732279AbfG3PYt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jul 2019 11:24:49 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:37953 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732274AbfG3PYs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jul 2019 11:24:48 -0400
Received: by mail-qt1-f195.google.com with SMTP id n11so63408531qtl.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jul 2019 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yjlVdjPruOMY43BI1raOa3L6IFCLU0ya6RBy0Shy9/M=;
        b=wnFRxdhFzAoVXTk34+7y/goDyY2S2eDHoEPHCxwYLmPhRgwC1D0mW85msH++16qpQ3
         NCTDHTFBWVHqiy9uWd76S/15T4LMqWNRv75vz5fPP5exKYTzIlsE9EF42uKdF9CWNENf
         TUGZqEOYjShTK/Ylx+d/FvwQ828tpDQ6oltmhLbA6nt6oWjjhOQUWexGb2BUnUO37z4/
         45BcHmBklm9KLvA7kAldnGHmIFIu9t01ihKMtLRInd+/O1ECmglGapihQZFQnVmWdidA
         pInv6s5l2ScD/uwgumbzcNs8naueM7GGuyAZGvTQwPboOEr784BPpZOPUp+JYn9U+zgU
         e3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yjlVdjPruOMY43BI1raOa3L6IFCLU0ya6RBy0Shy9/M=;
        b=ZfqDcHVccj/4KKFrCLvWlsEQvHODUVclgDzn7QiqiD2rQgb3Iw9fGXgAuE7j/nYX8f
         SfLMoOpUNejXsKww3XRK8UFhUh7sxUhE3Fv1Uun7l7Sa1Sku4skrFyJs0yjuAFi6ufAF
         gYJxk/XVcGwGOozuffw7mx8uJx0v2lzsU1mRdfaQmhmuQO8qRFOL7GTWFv6Bx8HJPgit
         v7gSAOjEiYd86OrV44i/qZjVPkLQEH0o9zA1joIN+t7lA21buoxc4u0tJJ0pNPGyhaxs
         otZPalc5tZbfWE4umf6Rtf/h09MGwA8O94CiquCyJzCkbSan5X4/8WCGLpoWt2KmoCVS
         Z9iw==
X-Gm-Message-State: APjAAAV27IFTBne58LbPEz+bj8DzbiFFdw3/Zxk1ruXg8oGkxS7T+W1X
        ErB5iWvH482qadLjqTaC7OQudjz2fCo=
X-Google-Smtp-Source: APXvYqwPZyL4xxCTewgV6IZMfeHGwQFgFmTMA4oDV8enxoQLTfJXfwsDS+OvdlRW5Mt7N+p/nNV+eg==
X-Received: by 2002:ac8:3908:: with SMTP id s8mr36552603qtb.224.1564500286674;
        Tue, 30 Jul 2019 08:24:46 -0700 (PDT)
Received: from Thara-Work-Ubuntu.fios-router.home (pool-71-255-245-97.washdc.fios.verizon.net. [71.255.245.97])
        by smtp.googlemail.com with ESMTPSA id r14sm27251082qkm.100.2019.07.30.08.24.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 30 Jul 2019 08:24:46 -0700 (PDT)
From:   Thara Gopinath <thara.gopinath@linaro.org>
To:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        bjorn.andersson@linaro.org, amit.kucheria@linaro.org,
        vinod.koul@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [Patch v2 1/2] soc: qcom: Extend AOSS QMP driver to support resources that are used to wake up the SoC.
Date:   Tue, 30 Jul 2019 11:24:42 -0400
Message-Id: <1564500283-16038-2-git-send-email-thara.gopinath@linaro.org>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1564500283-16038-1-git-send-email-thara.gopinath@linaro.org>
References: <1564500283-16038-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The AOSS QMP driver is extended to communicate with the additional
resources. These resources are then registered as cooling devices
with the thermal framework.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
v1->v2:
        Added back name variable in qmp_cooling_device to fix the 
        compilation error.               
        Other minor naming changes as mentioned in review on the list.

 drivers/soc/qcom/qcom_aoss.c | 131 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 5f88519..dc6201e 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -10,6 +10,8 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
+#include <linux/thermal.h>
+#include <linux/slab.h>
 
 #define QMP_DESC_MAGIC			0x0
 #define QMP_DESC_VERSION		0x4
@@ -40,6 +42,17 @@
 /* 64 bytes is enough to store the requests and provides padding to 4 bytes */
 #define QMP_MSG_LEN			64
 
+#define QMP_NUM_COOLING_RESOURCES	2
+
+static bool qmp_cdev_init_state = 1;
+
+struct qmp_cooling_device {
+	struct thermal_cooling_device *cdev;
+	struct qmp *qmp;
+	char *name;
+	bool state;
+};
+
 /**
  * struct qmp - driver state for QMP implementation
  * @msgram: iomem referencing the message RAM used for communication
@@ -69,6 +82,7 @@ struct qmp {
 
 	struct clk_hw qdss_clk;
 	struct genpd_onecell_data pd_data;
+	struct qmp_cooling_device *cooling_devs;
 };
 
 struct qmp_pd {
@@ -385,6 +399,118 @@ static void qmp_pd_remove(struct qmp *qmp)
 		pm_genpd_remove(data->domains[i]);
 }
 
+static int qmp_cdev_get_max_state(struct thermal_cooling_device *cdev,
+				  unsigned long *state)
+{
+	*state = qmp_cdev_init_state;
+	return 0;
+}
+
+static int qmp_cdev_get_cur_state(struct thermal_cooling_device *cdev,
+				  unsigned long *state)
+{
+	struct qmp_cooling_device *qmp_cdev = cdev->devdata;
+
+	*state = qmp_cdev->state;
+	return 0;
+}
+
+static int qmp_cdev_set_cur_state(struct thermal_cooling_device *cdev,
+				  unsigned long state)
+{
+	struct qmp_cooling_device *qmp_cdev = cdev->devdata;
+	char buf[QMP_MSG_LEN] = {};
+	bool cdev_state;
+	int ret;
+
+	/* Normalize state */
+	cdev_state = !!state;
+
+	if (qmp_cdev->state == state)
+		return 0;
+
+	snprintf(buf, sizeof(buf),
+		 "{class: volt_flr, event:zero_temp, res:%s, value:%s}",
+			qmp_cdev->name,
+			cdev_state ? "off" : "on");
+
+	ret = qmp_send(qmp_cdev->qmp, buf, sizeof(buf));
+
+	if (!ret)
+		qmp_cdev->state = cdev_state;
+
+	return ret;
+}
+
+static struct thermal_cooling_device_ops qmp_cooling_device_ops = {
+	.get_max_state = qmp_cdev_get_max_state,
+	.get_cur_state = qmp_cdev_get_cur_state,
+	.set_cur_state = qmp_cdev_set_cur_state,
+};
+
+static int qmp_cooling_device_add(struct qmp *qmp,
+				  struct qmp_cooling_device *qmp_cdev,
+				  struct device_node *node)
+{
+	char *cdev_name = (char *)node->name;
+
+	qmp_cdev->qmp = qmp;
+	qmp_cdev->state = qmp_cdev_init_state;
+	qmp_cdev->name = cdev_name;
+	qmp_cdev->cdev = devm_thermal_of_cooling_device_register
+				(qmp->dev, node,
+				cdev_name,
+				qmp_cdev, &qmp_cooling_device_ops);
+
+	if (IS_ERR(qmp_cdev->cdev))
+		dev_err(qmp->dev, "unable to register %s cooling device\n",
+			cdev_name);
+
+	return PTR_ERR_OR_ZERO(qmp_cdev->cdev);
+}
+
+static int qmp_cooling_devices_register(struct qmp *qmp)
+{
+	struct device_node *np, *child;
+	int count = QMP_NUM_COOLING_RESOURCES;
+	int ret;
+
+	np = qmp->dev->of_node;
+
+	qmp->cooling_devs = devm_kcalloc(qmp->dev, count,
+					 sizeof(*qmp->cooling_devs),
+					 GFP_KERNEL);
+
+	if (!qmp->cooling_devs)
+		return -ENOMEM;
+
+	for_each_available_child_of_node(np, child) {
+		if (!of_find_property(child, "#cooling-cells", NULL))
+			continue;
+		ret = qmp_cooling_device_add(qmp, &qmp->cooling_devs[count++],
+					     child);
+		if (ret)
+			goto uroll;
+	}
+
+	return 0;
+
+uroll:
+	while (--count >= 0)
+		thermal_cooling_device_unregister
+			(qmp->cooling_devs[count].cdev);
+
+	return ret;
+}
+
+static void qmp_cooling_devices_remove(struct qmp *qmp)
+{
+	int i;
+
+	for (i = 0; i < QMP_NUM_COOLING_RESOURCES; i++)
+		thermal_cooling_device_unregister(qmp->cooling_devs[i].cdev);
+}
+
 static int qmp_probe(struct platform_device *pdev)
 {
 	struct resource *res;
@@ -433,6 +559,10 @@ static int qmp_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_remove_qdss_clk;
 
+	ret = qmp_cooling_devices_register(qmp);
+	if (ret)
+		dev_err(&pdev->dev, "failed to register aoss cooling devices\n");
+
 	platform_set_drvdata(pdev, qmp);
 
 	return 0;
@@ -453,6 +583,7 @@ static int qmp_remove(struct platform_device *pdev)
 
 	qmp_qdss_clk_remove(qmp);
 	qmp_pd_remove(qmp);
+	qmp_cooling_devices_remove(qmp);
 
 	qmp_close(qmp);
 	mbox_free_channel(qmp->mbox_chan);
-- 
2.1.4

