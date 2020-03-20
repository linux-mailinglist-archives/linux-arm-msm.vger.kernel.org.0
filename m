Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A608718D46A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2020 17:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbgCTQaP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Mar 2020 12:30:15 -0400
Received: from mga05.intel.com ([192.55.52.43]:35562 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727163AbgCTQaO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Mar 2020 12:30:14 -0400
IronPort-SDR: UxNr/+BQwWDja+XHPWa9O7ofdZulAnRL+mfFWYGeE8UpMTwK/p+bg4LvZ9CWoUTwHAMgUR0wje
 3vhJzdxORDOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2020 09:30:14 -0700
IronPort-SDR: 1RdwOJHtbORknmyS8KOFa5msMi5CRhKOKFYH0s1q+wEUF7yI8iNnWW5j+E5q9AqVs7JP4EKCu8
 qfJ0m2hs121w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,285,1580803200"; 
   d="scan'208";a="248931006"
Received: from manallet-mobl.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.255.34.12])
  by orsmga006.jf.intel.com with ESMTP; 20 Mar 2020 09:30:09 -0700
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
Subject: [PATCH 4/5] soundwire: qcom: fix error handling in probe
Date:   Fri, 20 Mar 2020 11:29:46 -0500
Message-Id: <20200320162947.17663-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
References: <20200320162947.17663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make sure all error cases are properly handled and all resources freed.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/qcom.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 1c6c6a2e0def..77783ae4b71d 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -756,12 +756,16 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 	}
 
 	ctrl->irq = of_irq_get(dev->of_node, 0);
-	if (ctrl->irq < 0)
-		return ctrl->irq;
+	if (ctrl->irq < 0) {
+		ret = ctrl->irq;
+		goto err_init;
+	}
 
 	ctrl->hclk = devm_clk_get(dev, "iface");
-	if (IS_ERR(ctrl->hclk))
-		return PTR_ERR(ctrl->hclk);
+	if (IS_ERR(ctrl->hclk)) {
+		ret = PTR_ERR(ctrl->hclk);
+		goto err_init;
+	}
 
 	clk_prepare_enable(ctrl->hclk);
 
@@ -778,7 +782,7 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 
 	ret = qcom_swrm_get_port_config(ctrl);
 	if (ret)
-		return ret;
+		goto err_clk;
 
 	params = &ctrl->bus.params;
 	params->max_dr_freq = DEFAULT_CLK_FREQ;
@@ -805,28 +809,32 @@ static int qcom_swrm_probe(struct platform_device *pdev)
 					"soundwire", ctrl);
 	if (ret) {
 		dev_err(dev, "Failed to request soundwire irq\n");
-		goto err;
+		goto err_clk;
 	}
 
 	ret = sdw_add_bus_master(&ctrl->bus);
 	if (ret) {
 		dev_err(dev, "Failed to register Soundwire controller (%d)\n",
 			ret);
-		goto err;
+		goto err_clk;
 	}
 
 	qcom_swrm_init(ctrl);
 	ret = qcom_swrm_register_dais(ctrl);
 	if (ret)
-		goto err;
+		goto err_master_add;
 
 	dev_info(dev, "Qualcomm Soundwire controller v%x.%x.%x Registered\n",
 		 (ctrl->version >> 24) & 0xff, (ctrl->version >> 16) & 0xff,
 		 ctrl->version & 0xffff);
 
 	return 0;
-err:
+
+err_master_add:
+	sdw_delete_bus_master(&ctrl->bus);
+err_clk:
 	clk_disable_unprepare(ctrl->hclk);
+err_init:
 	return ret;
 }
 
-- 
2.20.1

