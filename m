Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621E943975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388323AbfFMPNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:13:55 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43625 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388321AbfFMPNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 11:13:32 -0400
Received: by mail-lj1-f194.google.com with SMTP id 16so18887052ljv.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dRI8LDhDHsCIBwRwhlloOvstxSjM1RSSiRjkI92mIwE=;
        b=lw9r6PmYqD6Hr6/QsZ4lrEvBdxFID2BWPlv5zGEqC2q4tn0gcugk6NoiBpWGanvPSk
         JkLHblUCjamoh6ksDlc984j2B6BDqfQ62H0JM9arLAsy9IIViFWbT/xECmmmy2alFall
         x+ShbQD3H7qXdZkMtsqyj2MY+2b9hf7Ad3Ep9jW870noVKVx3yHf50fh/SvWbhCQn7Iq
         +x1+BlINFAKM2Vvpyb/Mvt9QHbMxUkcF/ttPxEZvAdyITyuqa2D+zIfBI3HyOwUhdAjg
         hKSmxJfgGojr5ptDsyaVWbNBDI4ULaWEj9XEGiItVLe6CGL9YXfbjNAfw2CzCB94Oiuf
         o0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dRI8LDhDHsCIBwRwhlloOvstxSjM1RSSiRjkI92mIwE=;
        b=qBpKRh7HPKOcYP6k2ZYhMiHvY00eBJcI1df4ajzgJHxUfaIqYZCGelhcH+2V/yeuXw
         URZoMBige5TrK8tDbORpQDPWbZ+XDW690bwQiWfz0olTlL0Xu4Da+5JXsCkzgQX7cs0y
         E00IJHZdo/VKwM6nWS0mGUw1dbLHOLNDqTF7B9/XkoFaAul0el3onq52QyQaAYRfM5s+
         wt5azaSmGVDajedH2ryZw5OkGsV4Qxk+5e/j4GkJZBtCiHgmaU8IKiwLwnwrFXozAo0i
         5yRjITOTQl5vU6zBqbFRg4M21quPqiqtBFJPsBPi2ZnyXkX6qDugg4vw+f86JxJO04Gw
         cM+A==
X-Gm-Message-State: APjAAAWtmz6bEiTACGnf5xMUox7U9pHrJKZ1aFnM8kgY23VBaGTYeYQx
        EFEo2yPlBfGM4RT1tDGatpSiTQ==
X-Google-Smtp-Source: APXvYqx7wNrLFi0m5/Yi88xJohB5YbNMobsiwsr84qXDiMDYAXa4ox+tC8tybloJNYCW32CsHQpBMQ==
X-Received: by 2002:a2e:91c5:: with SMTP id u5mr8390657ljg.65.1560438810181;
        Thu, 13 Jun 2019 08:13:30 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id k4sm42923ljj.41.2019.06.13.08.13.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 13 Jun 2019 08:13:29 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        georgi.djakov@linaro.org
Cc:     vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 2/5] soc: qcom: smd-rpm: Create RPM interconnect proxy child device
Date:   Thu, 13 Jun 2019 18:13:20 +0300
Message-Id: <20190613151323.10850-3-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613151323.10850-1-georgi.djakov@linaro.org>
References: <20190613151323.10850-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register a platform device to handle the communication of bus bandwidth
requests with the remote processor. The interconnect proxy device is part
of this remote processor (RPM) hardware. Let's create a icc-smd-rpm proxy
child device to represent the bus throughput functionality that is provided
by the RPM.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---

v4:
- Return error if platform_device_register_data() fails
- Remove platform_set_drvdata() on the child device.

v3:
- New patch.

 drivers/soc/qcom/smd-rpm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index fa9dd12b5e39..34cdd638a6c1 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -19,12 +19,14 @@
 /**
  * struct qcom_smd_rpm - state of the rpm device driver
  * @rpm_channel:	reference to the smd channel
+ * @icc:		interconnect proxy device
  * @ack:		completion for acks
  * @lock:		mutual exclusion around the send/complete pair
  * @ack_status:		result of the rpm request
  */
 struct qcom_smd_rpm {
 	struct rpmsg_endpoint *rpm_channel;
+	struct platform_device *icc;
 	struct device *dev;
 
 	struct completion ack;
@@ -193,6 +195,7 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
 static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
 {
 	struct qcom_smd_rpm *rpm;
+	int ret;
 
 	rpm = devm_kzalloc(&rpdev->dev, sizeof(*rpm), GFP_KERNEL);
 	if (!rpm)
@@ -205,11 +208,23 @@ static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
 	rpm->rpm_channel = rpdev->ept;
 	dev_set_drvdata(&rpdev->dev, rpm);
 
-	return of_platform_populate(rpdev->dev.of_node, NULL, NULL, &rpdev->dev);
+	rpm->icc = platform_device_register_data(&rpdev->dev, "icc_smd_rpm", -1,
+						 NULL, 0);
+	if (IS_ERR(rpm->icc))
+		return PTR_ERR(rpm->icc);
+
+	ret = of_platform_populate(rpdev->dev.of_node, NULL, NULL, &rpdev->dev);
+	if (ret)
+		platform_device_unregister(rpm->icc);
+
+	return ret;
 }
 
 static void qcom_smd_rpm_remove(struct rpmsg_device *rpdev)
 {
+	struct qcom_smd_rpm *rpm = dev_get_drvdata(&rpdev->dev);
+
+	platform_device_unregister(rpm->icc);
 	of_platform_depopulate(&rpdev->dev);
 }
 
