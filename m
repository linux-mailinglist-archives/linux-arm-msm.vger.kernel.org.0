Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5868C3AF882
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 00:32:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232361AbhFUWeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 18:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbhFUWeF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 18:34:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE132C0617AE
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:49 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id x24so32693040lfr.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UfaTXgDF4vMyaJzGI+Ia8CfRX0d1Tnl83CcZoFAKsfc=;
        b=MgVjuyU64KYro8Dh10oMm4sKvsTqIT5s0jM0f4y3Wmuu6SR/cB+YwflEcHwmetf1Pw
         a7eH8yz9Ae8VMGRr4mWxOodhMdFWo+FWdVGVK842LgNW6iTfE7qt+nfQwNCnkY75hRjW
         +bsjaiRBqfye9ZVaoPLA3mEwTreWf15Y6P00/3gsegidP0rBM/ENZBVcz5jhFPsaHU5D
         Kqi9UhHjEuwqEkf74BH2otnNTHaeq9ewmEa0nlZxITh4TxM9R5RxzhlH8wk5piU0+8lj
         ap3JrX6qE0c6IiGOWBdufYPcahPoj5XIiSJP2wu2LXa+NcnzLNm9Pc0pWQRZ/54vqbDs
         pf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UfaTXgDF4vMyaJzGI+Ia8CfRX0d1Tnl83CcZoFAKsfc=;
        b=rHpWms2wFkKdmVvXmt7A0OzZREjg/jo+6Ts+zRIX3/vzpkUcDmAoncFASvOAuQ9iX5
         PJ7Dwrx3kA5P6uzFpxB+CCCMuzTnU9W5OXyrSy6t2gKVkA81jwMr0I9cD+hokGiy9z2d
         XRlZel5g3xSYJ6br9eccswwNlf+Q8sHZXwmQXbOk49uSSjSCkS5IGa/CS0IjolyBXshh
         RNVAocZyjAS0tFsLj6CCm90S1LJY0uB7LG1PTSSOuF4Frmcqp2+vAsUUAxpxxkvcIkCY
         krgpPP85Y81F/dWs/c2LkOt9ElQEZRdt5AyKSQI30aj1fFn/hdrJPWE+gW6SFX6ffpDX
         fHAg==
X-Gm-Message-State: AOAM532lNAqCPMa+ozLoxtzA2XiEFTvXwf9hH2PdMhL2ECC3LBlY8QAI
        EZQ+vlYZ5S+w+AxC/woD6pIGmg==
X-Google-Smtp-Source: ABdhPJwJkpZL7XXRKnMB+hiz9rs9619dCIDpP90WydOc8iLjYpF8G/z6pF0arDZ1vc9s2NfBWXctLw==
X-Received: by 2002:a19:6907:: with SMTP id e7mr390137lfc.660.1624314708120;
        Mon, 21 Jun 2021 15:31:48 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b10sm2516025ljf.72.2021.06.21.15.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 15:31:47 -0700 (PDT)
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
Subject: [PATCH v3 5/7] Bluetooth: hci_qca: merge wcn & non-wcn code paths
Date:   Tue, 22 Jun 2021 01:31:39 +0300
Message-Id: <20210621223141.1638189-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to add power sequencer support to qca6390, merge wcnxxxx
and non-wcn codepaths.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 152 +++++++++++++++++-------------------
 1 file changed, 71 insertions(+), 81 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 9cc8a9153d76..bb04da08468a 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -84,6 +84,7 @@ enum qca_flags {
 enum qca_capabilities {
 	QCA_CAP_WIDEBAND_SPEECH = BIT(0),
 	QCA_CAP_VALID_LE_STATES = BIT(1),
+	QCA_CAP_NEEDS_BT_ENABLE = BIT(2),
 };
 
 /* HCI_IBS transmit side sleep protocol states */
@@ -203,6 +204,7 @@ struct qca_device_data {
 	struct qca_vreg *vregs;
 	size_t num_vregs;
 	uint32_t capabilities;
+	const char *name;
 };
 
 /*
@@ -220,6 +222,7 @@ struct qca_serdev {
 	u32 init_speed;
 	u32 oper_speed;
 	const char *firmware_name;
+	const char *name;
 };
 
 static int qca_regulator_enable(struct qca_serdev *qcadev);
@@ -254,6 +257,17 @@ static const char *qca_get_firmware_name(struct hci_uart *hu)
 	}
 }
 
+static const char *qca_soc_name(struct hci_uart *hu)
+{
+	if (hu->serdev) {
+		struct qca_serdev *qsd = serdev_device_get_drvdata(hu->serdev);
+
+		return qsd->name;
+	} else {
+		return "ROME";
+	}
+}
+
 static void __serial_clock_on(struct tty_struct *tty)
 {
 	/* TODO: Some chipset requires to enable UART clock on client
@@ -1623,14 +1637,16 @@ static int qca_regulator_init(struct hci_uart *hu)
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(50);
 		gpiod_set_value_cansleep(qcadev->bt_en, 1);
-		msleep(50);
+		msleep(150);
 		if (qcadev->sw_ctrl) {
 			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
 			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
 		}
 	}
 
-	qca_set_speed(hu, QCA_INIT_SPEED);
+	if (qca_is_wcn399x(soc_type) ||
+	    qca_is_wcn6750(soc_type))
+		qca_set_speed(hu, QCA_INIT_SPEED);
 
 	if (qca_is_wcn399x(soc_type)) {
 		ret = qca_send_power_pulse(hu, true);
@@ -1650,7 +1666,9 @@ static int qca_regulator_init(struct hci_uart *hu)
 		return ret;
 	}
 
-	hci_uart_set_flow_control(hu, false);
+	if (qca_is_wcn399x(soc_type) ||
+	    qca_is_wcn6750(soc_type))
+		hci_uart_set_flow_control(hu, false);
 
 	return 0;
 }
@@ -1658,8 +1676,6 @@ static int qca_regulator_init(struct hci_uart *hu)
 static int qca_power_on(struct hci_dev *hdev)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
-	enum qca_btsoc_type soc_type = qca_soc_type(hu);
-	struct qca_serdev *qcadev;
 	struct qca_data *qca = hu->priv;
 	int ret = 0;
 
@@ -1669,17 +1685,7 @@ static int qca_power_on(struct hci_dev *hdev)
 	if (!hu->serdev)
 		return 0;
 
-	if (qca_is_wcn399x(soc_type) ||
-	    qca_is_wcn6750(soc_type)) {
-		ret = qca_regulator_init(hu);
-	} else {
-		qcadev = serdev_device_get_drvdata(hu->serdev);
-		if (qcadev->bt_en) {
-			gpiod_set_value_cansleep(qcadev->bt_en, 1);
-			/* Controller needs time to bootup. */
-			msleep(150);
-		}
-	}
+	ret = qca_regulator_init(hu);
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
 	return ret;
@@ -1709,9 +1715,7 @@ static int qca_setup(struct hci_uart *hu)
 	 */
 	set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
 
-	bt_dev_info(hdev, "setting up %s",
-		qca_is_wcn399x(soc_type) ? "wcn399x" :
-		(soc_type == QCA_WCN6750) ? "wcn6750" : "ROME/QCA6390");
+	bt_dev_info(hdev, "setting up %s", qca_soc_name(hu));
 
 	qca->memdump_state = QCA_MEMDUMP_IDLE;
 
@@ -1822,6 +1826,7 @@ static const struct qca_device_data qca_soc_data_wcn3990 = {
 		{ "vddch0", 450000 },
 	},
 	.num_vregs = 4,
+	.name = "wcn3990",
 };
 
 static const struct qca_device_data qca_soc_data_wcn3991 = {
@@ -1834,6 +1839,7 @@ static const struct qca_device_data qca_soc_data_wcn3991 = {
 	},
 	.num_vregs = 4,
 	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+	.name = "wcn3991",
 };
 
 static const struct qca_device_data qca_soc_data_wcn3998 = {
@@ -1845,11 +1851,14 @@ static const struct qca_device_data qca_soc_data_wcn3998 = {
 		{ "vddch0", 450000 },
 	},
 	.num_vregs = 4,
+	.name = "wcn3998",
 };
 
 static const struct qca_device_data qca_soc_data_qca6390 = {
 	.soc_type = QCA_QCA6390,
 	.num_vregs = 0,
+	.capabilities = QCA_CAP_NEEDS_BT_ENABLE,
+	.name = "qca6390",
 };
 
 static const struct qca_device_data qca_soc_data_wcn6750 = {
@@ -1866,12 +1875,15 @@ static const struct qca_device_data qca_soc_data_wcn6750 = {
 		{ "vddasd", 200 },
 	},
 	.num_vregs = 9,
-	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES,
+	.capabilities = QCA_CAP_WIDEBAND_SPEECH | QCA_CAP_VALID_LE_STATES | QCA_CAP_NEEDS_BT_ENABLE,
+	.name = "wcn6750",
 };
 
 static const struct qca_device_data qca_soc_data_default = {
 	.soc_type = QCA_ROME,
 	.num_vregs = 0,
+	.capabilities = QCA_CAP_NEEDS_BT_ENABLE,
+	.name = "ROME",
 };
 
 static void qca_power_shutdown(struct hci_uart *hu)
@@ -1903,7 +1915,7 @@ static void qca_power_shutdown(struct hci_uart *hu)
 		host_set_baudrate(hu, 2400);
 		qca_send_power_pulse(hu, false);
 		qca_regulator_disable(qcadev);
-	} else if (soc_type == QCA_WCN6750) {
+	} else if (qcadev->bt_en) {
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 		msleep(100);
 		qca_regulator_disable(qcadev);
@@ -1911,8 +1923,6 @@ static void qca_power_shutdown(struct hci_uart *hu)
 			sw_ctrl_state = gpiod_get_value_cansleep(qcadev->sw_ctrl);
 			bt_dev_dbg(hu->hdev, "SW_CTRL is %d", sw_ctrl_state);
 		}
-	} else if (qcadev->bt_en) {
-		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 	}
 
 	set_bit(QCA_BT_OFF, &qca->flags);
@@ -2034,71 +2044,51 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	if (!qcadev->oper_speed)
 		BT_DBG("UART will pick default operating speed");
 
-	if ((qca_is_wcn399x(data->soc_type) ||
-	     qca_is_wcn6750(data->soc_type))) {
-		qcadev->btsoc_type = data->soc_type;
-
-		err = qca_init_regulators(&serdev->dev, qcadev, data->vregs,
-					  data->num_vregs);
-		if (err) {
-			BT_ERR("Failed to init regulators:%d", err);
-			return err;
-		}
+	qcadev->name = data->name;
+	qcadev->btsoc_type = data->soc_type;
 
-		qcadev->vregs_on = false;
-
-		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
-					       GPIOD_OUT_LOW);
-		if (!qcadev->bt_en && data->soc_type == QCA_WCN6750) {
-			dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
-			power_ctrl_enabled = false;
-		}
+	err = qca_init_regulators(&serdev->dev, qcadev, data->vregs,
+				  data->num_vregs);
+	if (err) {
+		BT_ERR("Failed to init regulators:%d", err);
+		return err;
+	}
 
-		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
-					       GPIOD_IN);
-		if (!qcadev->sw_ctrl && data->soc_type == QCA_WCN6750)
-			dev_warn(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
+	qcadev->vregs_on = false;
 
-		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
-		if (IS_ERR(qcadev->susclk)) {
-			dev_err(&serdev->dev, "failed to acquire clk\n");
-			return PTR_ERR(qcadev->susclk);
-		}
+	qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
+						GPIOD_OUT_LOW);
+	if (!qcadev->bt_en && (data->capabilities & QCA_CAP_NEEDS_BT_ENABLE)) {
+		dev_err(&serdev->dev, "failed to acquire BT_EN gpio\n");
+		power_ctrl_enabled = false;
+	}
 
-		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
-		if (err) {
-			BT_ERR("wcn3990 serdev registration failed");
-			return err;
-		}
-	} else {
-		qcadev->btsoc_type = data->soc_type;
+	qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
+						  GPIOD_IN);
+	if (!qcadev->sw_ctrl && data->soc_type == QCA_WCN6750)
+		dev_warn(&serdev->dev, "failed to acquire SW_CTRL gpio\n");
 
-		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
-					       GPIOD_OUT_LOW);
-		if (!qcadev->bt_en) {
-			dev_warn(&serdev->dev, "failed to acquire enable gpio\n");
-			power_ctrl_enabled = false;
-		}
+	qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
+	if (IS_ERR(qcadev->susclk)) {
+		dev_err(&serdev->dev, "failed to acquire clk\n");
+		return PTR_ERR(qcadev->susclk);
+	}
 
-		qcadev->susclk = devm_clk_get_optional(&serdev->dev, NULL);
-		if (IS_ERR(qcadev->susclk)) {
-			dev_warn(&serdev->dev, "failed to acquire clk\n");
-			return PTR_ERR(qcadev->susclk);
-		}
-		err = clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);
-		if (err)
-			return err;
+	err = clk_set_rate(qcadev->susclk, SUSCLK_RATE_32KHZ);
+	if (err)
+		return err;
 
+	if (!qca_is_wcn399x(qcadev->btsoc_type) &&
+	    !qca_is_wcn6750(qcadev->btsoc_type)) {
 		err = clk_prepare_enable(qcadev->susclk);
 		if (err)
 			return err;
+	}
 
-		err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
-		if (err) {
-			BT_ERR("Rome serdev registration failed");
-			clk_disable_unprepare(qcadev->susclk);
-			return err;
-		}
+	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
+	if (err) {
+		BT_ERR("%s serdev registration failed", qcadev->name);
+		return err;
 	}
 
 	hdev = qcadev->serdev_hu.hdev;
@@ -2127,11 +2117,11 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
 
-	if ((qca_is_wcn399x(qcadev->btsoc_type) ||
-	     qca_is_wcn6750(qcadev->btsoc_type)) &&
-	     qcadev->vregs_on)
+	if (qcadev->vregs_on)
 		qca_power_shutdown(&qcadev->serdev_hu);
-	else if (qcadev->susclk)
+
+	if (!qca_is_wcn399x(qcadev->btsoc_type) &&
+	    !qca_is_wcn6750(qcadev->btsoc_type))
 		clk_disable_unprepare(qcadev->susclk);
 
 	hci_uart_unregister_device(&qcadev->serdev_hu);
-- 
2.30.2

