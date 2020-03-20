Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8616018D46C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 17:30:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727617AbgCTQaT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 12:30:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:35562 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727613AbgCTQaT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 12:30:19 -0400
IronPort-SDR: 3KSECaQX35Qp9j3LgDG8sfAlTaM8HUGt0DBC+o7GLmSm9npvN4PrZv7oDRssESvvFDtrmCKs/e
 yRbHisAQR+Gg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 09:30:19 -0700
IronPort-SDR: HyPVTzu48bSrw0HptvLFMfL9uQXSceqJNE9LnB9ATdLMEQHyo8G6P9U6+F9IdMTyE/rcHoAux1
 CJW/2SsmrquA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; 
   d="scan'208";a="248931040"
Received: from manallet-mobl.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.255.34.12])
  by orsmga006.jf.intel.com with ESMTP; 20 Mar 2020 09:30:14 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     alsa-devel@alsa-project.org
Cc:     linux-kernel@vger.kernel.org, tiwai@suse.de, broonie@kernel.org,
        vkoul@kernel.org, gregkh@linuxfoundation.org, jank@cadence.com,
        srinivas.kandagatla@linaro.org, slawomir.blauciak@intel.com,
        Bard liao <yung-chuan.liao@linux.intel.com>,
        Rander Wang <rander.wang@linux.intel.com>,
        Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
        Hui Wang <hui.wang@canonical.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sanyog Kale <sanyog.r.kale@intel.com>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH 5/5] soundwire: qcom: add sdw_master_device support
Date:   Fri, 20 Mar 2020 11:29:47 -0500
Message-Id: <20200320162947.17663-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add new device as a child of the platform device, following the
following hierarchy:

platform_device
    sdw_master_device
        sdw_slave0
	...
	sdw_slaveN

For the Qualcomm implementation no sdw_master_driver is registered so
the dais have to be registered using the platform_device and likely
all power management is handled at the platform device level.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/qcom.c | 29 +++++++++++++++++++++++++----
 1 file changed, 25 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 77783ae4b71d..86b46415e50b 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -89,6 +89,7 @@ struct qcom_swrm_port_config {
 struct qcom_swrm_ctrl {
 	struct sdw_bus bus;
 	struct device *dev;
+	struct sdw_master_device *md;
 	struct regmap *regmap;
 	struct completion *comp;
 	struct work_struct slave_work;
@@ -775,14 +776,31 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	mutex_init(&ctrl->port_lock);
 	INIT_WORK(&ctrl->slave_work, qcom_swrm_slave_wq);
 
-	ctrl->bus.dev = dev;
+	/*
+	 * add sdw_master_device.
+	 * For the Qualcomm implementation there is no driver.
+	 */
+	ctrl->md = sdw_master_device_add(NULL,	/* no driver name */
+					 dev,	/* platform device is parent */
+					 dev->fwnode,
+					 0,	/* only one link supported */
+					 NULL);	/* no context */
+	if (IS_ERR(ctrl->md)) {
+		dev_err(dev, "Could not create sdw_master_device\n");
+		ret = PTR_ERR(ctrl->md);
+		goto err_clk;
+	}
+
+	/* the bus uses the sdw_master_device, not the platform device */
+	ctrl->bus.dev = &ctrl->md->dev;
+
 	ctrl->bus.ops = &qcom_swrm_ops;
 	ctrl->bus.port_ops = &qcom_swrm_port_ops;
 	ctrl->bus.compute_params = &qcom_swrm_compute_params;
 
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
-		goto err_clk;
+		goto err_md;
 
 	params = &ctrl->bus.params;
 	params->max_dr_freq = DEFAULT_CLK_FREQ;
@@ -809,14 +827,14 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 					"soundwire", ctrl);
 	if (ret) {
 		dev_err(dev, "Failed to request soundwire irq\n");
-		goto err_clk;
+		goto err_md;
 	}
 
 	ret = sdw_add_bus_master(&ctrl->bus);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
 			ret);
-		goto err_clk;
+		goto err_md;
 	}
 
 	qcom_swrm_init(ctrl);
@@ -832,6 +850,8 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 err_master_add:
 	sdw_delete_bus_master(&ctrl->bus);
+err_md:
+	device_unregister(&ctrl->md->dev);
 err_clk:
 	clk_disable_unprepare(ctrl->hclk);
 err_init:
@@ -843,6 +863,7 @@ static int qcom_swrm_remove(struct platform_device *pdev)
 	struct qcom_swrm_ctrl *ctrl = dev_get_drvdata(&pdev->dev);
 
 	sdw_delete_bus_master(&ctrl->bus);
+	device_unregister(&ctrl->md->dev);
 	clk_disable_unprepare(ctrl->hclk);
 
 	return 0;
-- 
2.20.1

