Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A16A63AF87E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 00:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbhFUWeJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 18:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbhFUWeE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 18:34:04 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707ABC0617A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:48 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id r5so32768414lfr.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mMcsAXLjdzqmXTrqYecRXzkTaTpEAvP3tlWseu3ox9A=;
        b=QqQsgPb8dWBwxyeGmtUH5SsMbqq91ExfilXUZD49aAn/O8PypCkqXVt+EYWPqpHYv0
         y91K7G2eh7AZH7potCOxSb/HsR2WU50nzQeDG5L07Jw603Fyv751Rvygq9XQlOx6Px13
         8Ns6aYLSrYTLnL1Ucm6YFcoJuE1zfWkSd7Jj/ezs9Ac8Ko4miQYyq/VdzBW+gQSD/77C
         SNz182xmjUuhcLOC4jLoc+9sI5GrGqE/RMxdHG4lJCqRgOsuWpztbWuk2ye2XZSzhQGq
         Td/RKxqq6ljPwy/K+UuVX4eeKrU0PkEyK7KKfmq+Ef8tOqm4GnbS+C8lAHPSlvAYELGT
         /Imw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mMcsAXLjdzqmXTrqYecRXzkTaTpEAvP3tlWseu3ox9A=;
        b=OSz+DB0JAHVXJuuJ+wwr5G6DUbnNY64CW4pqU/O9S5lbcVzgNLUzemzblur/CARyxU
         Hq7CzSMJa7OIqrc/Y0ejjVDdPSlyOZvBkYtc2au8LzXbTZw4STQ3m8j4iPAo52am8WJr
         fQ+E1Tbmmhi3Yau5cpwrO2x1ayPiHOr/T7oKm4AdBSpmT/DSOivCA5erHToSFJ1Z8Thm
         tGZJIKcfa2DYtqA+98uphn3AeBNTAzWN/ZFwa19G/eTIUrj/+hT2g84DunirhLRLZA5u
         5pyMyC3dPF7ws/VOq93qH3IorkR/yAn0d595jy5UWcA3VXYAXRv26mZ3xdOy4I9nDS5M
         Ie3A==
X-Gm-Message-State: AOAM532pmYRwM1dHNZfA7Q41RqmcVTycGEaZGZgXZn4yE15+IiG1hZur
        UsyL5SeMwWawGLJqzS8EzusDfA==
X-Google-Smtp-Source: ABdhPJxX2SsWbrezVXFUCUiuN/os9Imqkqpa9rUCOCi96yLUvaUo2Yfnn9+i3EeWNb22kXYbZLT5yQ==
X-Received: by 2002:a05:6512:4d0:: with SMTP id w16mr420221lfq.44.1624314706695;
        Mon, 21 Jun 2021 15:31:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b10sm2516025ljf.72.2021.06.21.15.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 15:31:46 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org
Subject: [PATCH v3 3/7] Bluetooth: hci_qca: provide default device data
Date:   Tue, 22 Jun 2021 01:31:37 +0300
Message-Id: <20210621223141.1638189-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to simplify probe function provide default device data. This
removes the rest of if (data) checks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 53deea2eb7b4..3704dbadba1d 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1874,6 +1874,11 @@ static const struct qca_device_data qca_soc_data_wcn6750 = {
 	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
 };
 
+static const struct qca_device_data qca_soc_data_default = {
+	.soc_type = QCA_ROME,
+	.num_vregs = 0,
+};
+
 static void qca_power_shutdown(struct hci_uart *hu)
 {
 	struct qca_serdev *qcadev;
@@ -2019,12 +2024,15 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	int err;
 	bool power_ctrl_enabled = true;
 
+	data = device_get_match_data(&serdev->dev);
+	if (!data)
+		return -EINVAL;
+
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
 		return -ENOMEM;
 
 	qcadev->serdev_hu.serdev = serdev;
-	data = device_get_match_data(&serdev->dev);
 	serdev_device_set_drvdata(serdev, qcadev);
 	device_property_read_string(&serdev->dev, "firmware-name",
 					 &qcadev->firmware_name);
@@ -2033,9 +2041,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	if (!qcadev->oper_speed)
 		BT_DBG("UART will pick default operating speed");
 
-	if (data &&
-	    (qca_is_wcn399x(data->soc_type) ||
-	    qca_is_wcn6750(data->soc_type))) {
+	if ((qca_is_wcn399x(data->soc_type) ||
+	     qca_is_wcn6750(data->soc_type))) {
 		qcadev->btsoc_type = data->soc_type;
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
@@ -2077,10 +2084,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return err;
 		}
 	} else {
-		if (data)
-			qcadev->btsoc_type = data->soc_type;
-		else
-			qcadev->btsoc_type = QCA_ROME;
+		qcadev->btsoc_type = data->soc_type;
 
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
@@ -2309,9 +2313,9 @@ static SIMPLE_DEV_PM_OPS(qca_pm_ops, qca_suspend, qca_resume);
 
 #ifdef CONFIG_OF
 static const struct of_device_id qca_bluetooth_of_match[] = {
-	{ .compatible = "qcom,qca6174-bt" },
+	{ .compatible = "qcom,qca6174-bt", .data = &qca_soc_data_default},
 	{ .compatible = "qcom,qca6390-bt", .data = &qca_soc_data_qca6390},
-	{ .compatible = "qcom,qca9377-bt" },
+	{ .compatible = "qcom,qca9377-bt", .data = &qca_soc_data_default},
 	{ .compatible = "qcom,wcn3990-bt", .data = &qca_soc_data_wcn3990},
 	{ .compatible = "qcom,wcn3991-bt", .data = &qca_soc_data_wcn3991},
 	{ .compatible = "qcom,wcn3998-bt", .data = &qca_soc_data_wcn3998},
-- 
2.30.2

