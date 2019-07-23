Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEF6A71A37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 16:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388158AbfGWOXt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 10:23:49 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33338 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388165AbfGWOXs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 10:23:48 -0400
Received: by mail-lf1-f66.google.com with SMTP id x3so29584811lfc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2019 07:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FbVR62JVrWT5p1YV/PXTQMK7g7u1TZfSbRIPAQh2zmI=;
        b=pqjy30NaHFnw6pcJ57wAnzko3t4O4huqM2mhHodrJ9jmdvgIfV9Xwgo3+TI4xeE5zz
         EO5h3MH9wLBV26uraJyi7ZHXlNWSElGcbmJJ2NWpEAL/lUyrxus7e7gGMT74MjAEYGAd
         RkBfV9FPdETMqbGMNxilpx4IkRHXPqifArGJx3hRJTjrZaX4Ue9Z2n0hhGKl655gLaX3
         hIwyFeuakmEQDACmmXaUOqs1Dv2FaeVv+RcOvEzhTpk1wIe+OO5/fSldby78OhcY36A5
         4gYgp7pFqPNs7Qy8eRw2O9NN7gGESjem2m11n9aAuq/hpqsOPsDyAX9pgehNlcwBBEqB
         ScCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FbVR62JVrWT5p1YV/PXTQMK7g7u1TZfSbRIPAQh2zmI=;
        b=MsTmqxAb3BDahDVjJjhBQByw7q1tf7I6NXnb7QLC33XCO8gc2wSyMAARlBGvMVgwi1
         PJUsC3g94daH1LfYCrOPPjL6TN1Rj6ZUkr682gs/xESz+sYKOsZkm/wUta3MvWaQHvN0
         nZYDMeAbCn90WkSBZWCwgoNJPo5RgmcyvRhyTr049YHPblUPhEXp3JCzvmMPbT1zZGLe
         OZXP4HcTmD9UGqyWBiEE3cAACgfN06fZOWrQ0fO2B5hwiE8LuOI5kpj1/YiM+4vewBtH
         ePV9k9IWWGn0zZat1rBw+YFDj/4MO6/R9waxEmYeRS9GL04Z2upaiOc57qixsQ2wnMkp
         3iyg==
X-Gm-Message-State: APjAAAVtjVFoW6cNGHdVAktIGmK4Zsfo0BIdm1YgfVhGONZIuHygL03Q
        LVTolppSIav9nBbQZEh+WshBlA==
X-Google-Smtp-Source: APXvYqzm+0Y9jK/2eyE68QAnKnkn1PVf9JjRcCwYx8qimmf8Y88Rd6on9ttMUmDIXcorbmpWOlMtLA==
X-Received: by 2002:a19:1d1:: with SMTP id 200mr35295422lfb.8.1563891827036;
        Tue, 23 Jul 2019 07:23:47 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id z17sm8048519ljc.37.2019.07.23.07.23.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 23 Jul 2019 07:23:46 -0700 (PDT)
From:   Georgi Djakov <georgi.djakov@linaro.org>
To:     robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        georgi.djakov@linaro.org
Cc:     vkoul@kernel.org, evgreen@chromium.org, daidavid1@codeaurora.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 2/5] soc: qcom: smd-rpm: Create RPM interconnect proxy child device
Date:   Tue, 23 Jul 2019 17:23:36 +0300
Message-Id: <20190723142339.27772-3-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190723142339.27772-1-georgi.djakov@linaro.org>
References: <20190723142339.27772-1-georgi.djakov@linaro.org>
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

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---

v5:
- Picked Bjorn's r-b. 

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
 
