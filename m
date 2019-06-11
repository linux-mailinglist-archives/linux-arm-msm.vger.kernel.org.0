Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 728B63D2B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jun 2019 18:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405691AbfFKQmM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jun 2019 12:42:12 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41792 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405684AbfFKQmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jun 2019 12:42:12 -0400
Received: by mail-lf1-f65.google.com with SMTP id 136so9819229lfa.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jun 2019 09:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Pak0Fz+ivsUMISCYvXiNgzc4zSj7ni2jXbYXr+vJo9I=;
        b=QUOwYzEs8DVdq6op4LPEIgugx6VhCqOo2nqsuCeAV5G0uoVOFiZdS1kdNoFDGFX2Fd
         hC/6s0B9qCM52OBOts7uH7dCBtbIyG5QlbG58U3n0vFNF2ie4yXfDkWyrRoH7kAjrwdg
         7LxW3dMF/OJvVN5bDhWU8NaFSh2aEqZWp7lFnk5leBBVVHS0C0v/3cXwVA9wVgxhSOCC
         cffZo6KWPRwe6VJtCQb2/aO6J759bGBoSmd6lKAVznc0UySzgb9YIXVVBpy/JQNjtuEH
         iNQfEnX4LfWWSABrPKkjZDiI/eARpFAInjtVDby14KO77JMp7wDkTkAGHoRHrlGLGmwA
         9E7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Pak0Fz+ivsUMISCYvXiNgzc4zSj7ni2jXbYXr+vJo9I=;
        b=craoHFMxP5bYwdC8/uIfa/CoKXFT92RDq9UZrTSglPXI4BVNZjPsu/uvsIViOjEith
         oLwMnjORM8wG409FqceNfXUn5uIlEekyKOESUbjFZQsK6druLM1gilTT8lyV4soSZ9FR
         UngzKnCf6TiKW7Zjkb/W23VyobJ45oJ5T3lksbJg8T3HreILdVRbxUZybm0FJxMLxDKD
         FPBBQQhx7Mnm6OS9W1LJsw/bQZD0cIED5x9hcu4jkHpy9j0NEesiy9vjQOwhm4jUESeA
         2RVKCLVLTJ2I2NSEE9CUPXgBXmsPSPmCtCZCeeirdhiZ7Ehr+PUK9sxIUWyA+635+5zd
         FmeQ==
X-Gm-Message-State: APjAAAWEXHXD+iwrvf23Eg4XYLi9sF8W6q570mqw7ijLmwCaLZoLQT+7
        +fWwMRKkh1lpLuNkJvFDfAwDJw==
X-Google-Smtp-Source: APXvYqyZShWK9c5ivBay92VM4WIu6To73MA8vU/AmEcCOZuSClP8unC7iElKpVZWeeLr0ofTI/KYBQ==
X-Received: by 2002:ac2:4252:: with SMTP id m18mr13728876lfl.100.1560271330385;
        Tue, 11 Jun 2019 09:42:10 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id r14sm2616772lff.44.2019.06.11.09.42.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 11 Jun 2019 09:42:09 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        georgi.djakov@linaro.org
Cc:     vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/5] soc: qcom: smd-rpm: Create RPM interconnect proxy child device
Date:   Tue, 11 Jun 2019 19:41:55 +0300
Message-Id: <20190611164157.24656-4-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190611164157.24656-1-georgi.djakov@linaro.org>
References: <20190611164157.24656-1-georgi.djakov@linaro.org>
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

v3:
- New patch.

 drivers/soc/qcom/smd-rpm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index 9956bb2c63f2..a028250737ec 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -27,12 +27,14 @@
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
@@ -201,6 +203,7 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
 static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
 {
 	struct qcom_smd_rpm *rpm;
+	int ret;
 
 	rpm = devm_kzalloc(&rpdev->dev, sizeof(*rpm), GFP_KERNEL);
 	if (!rpm)
@@ -213,11 +216,23 @@ static int qcom_smd_rpm_probe(struct rpmsg_device *rpdev)
 	rpm->rpm_channel = rpdev->ept;
 	dev_set_drvdata(&rpdev->dev, rpm);
 
-	return of_platform_populate(rpdev->dev.of_node, NULL, NULL, &rpdev->dev);
+	rpm->icc = platform_device_register_data(&rpdev->dev, "icc_smd_rpm", -1,
+						 NULL, 0);
+	if (!IS_ERR(rpm->icc))
+		platform_set_drvdata(rpm->icc, rpm);
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
 
