Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE1C83AF880
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 00:32:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhFUWeK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 18:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232238AbhFUWeF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 18:34:05 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C1EC0617A8
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:49 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id q23so16931808ljh.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 15:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ukWhQOxLOpxSvkJ4rfmDp3fy2HM1MfYh2tdn88Ftg5E=;
        b=VsuftyXn5YyO84VyBnyEtcDKOlj+mqTE01Zu1frR9+Xmt7y6pAb7622LulHEQlqzdp
         O3Sz70gm78HBiDGewZYgaTD1kUw2qO3SphcR1t1dCWYQJ82BKY8dQ4f6tu8VGtvTS2DT
         rrFDt/3ZfSgoeSzhw95vn4R3Aitrzp7qqGCxgsvUNE/6ORmfWqJncJ4tUD+2aoRcSg61
         KzETSwJoOBf+vLgia+cWVeTeNKIO06E0loiz4+DIvWA8t7vyDPcIyiMwkUpAU/fL5lKL
         uvBrin0+jDbPn3J18Gpx695PPeoecwKEPV9sxToveWgGUD4+T4TxRIU5ZXOx/SVhHO5q
         MJRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ukWhQOxLOpxSvkJ4rfmDp3fy2HM1MfYh2tdn88Ftg5E=;
        b=tdlHX3cp03g1CBdvIZGHyAoJ2yT/nmIwixF0/ccSEHoJ88vlnE5i5LKeoxhVbVa9qP
         4eYqy9Xnz6P7B0vVBCA7ErV7FAfpfvYuoKtM9BFTc/JlBDdCUExCw/yGagP0CWtHgxVc
         8Ga1dFSYcqxIaTmy5GICRAljkp5ZNox+KgwuUJwhZdA9VngmKyV3a1kjvZLPq9rghA2r
         YnkCAyv/Tph5h/TcnpVkUVjCB7vVU+H9LnI4T2lY6lJMxqCMeoOm5HWDe/nDDWshS1oG
         lmZhMBOfW3nSX/BT2J1t24/AdS415+cwmMw2RnCC5RtGRrY7XYzpbRtkYrrZOls3p80T
         6bWg==
X-Gm-Message-State: AOAM5332gzGXt80+a4JhXOiarogNw25OJajUYTKO2g9NrQh82C4AEnvg
        G9uDOFKsMtwPvg9+1yZjYI5T8A==
X-Google-Smtp-Source: ABdhPJySSnmLQ/ptVnLFlFHOlPAEuSLyWcSpV/6DMXtByw/clqZKSyV9E6KeKzBYGYmNuhAGG1KJ/g==
X-Received: by 2002:a2e:9d86:: with SMTP id c6mr383244ljj.75.1624314707441;
        Mon, 21 Jun 2021 15:31:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b10sm2516025ljf.72.2021.06.21.15.31.46
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
Subject: [PATCH v3 4/7] Bluetooth: hci_qca: merge qca_power into qca_serdev
Date:   Tue, 22 Jun 2021 01:31:38 +0300
Message-Id: <20210621223141.1638189-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
References: <20210621223141.1638189-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no need to allocate separate structure for handling regulators
used by QCA chips, we gain nothing from it. Move all used data fields
directly to struct qca_serdev.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 58 ++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 36 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 3704dbadba1d..9cc8a9153d76 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -208,20 +208,15 @@ struct qca_device_data {
 /*
  * Platform data for the QCA Bluetooth power driver.
  */
-struct qca_power {
-	struct device *dev;
-	struct regulator_bulk_data *vreg_bulk;
-	int num_vregs;
-	bool vregs_on;
-};
-
 struct qca_serdev {
 	struct hci_uart	 serdev_hu;
 	struct gpio_desc *bt_en;
 	struct gpio_desc *sw_ctrl;
 	struct clk	 *susclk;
 	enum qca_btsoc_type btsoc_type;
-	struct qca_power *bt_power;
+	struct regulator_bulk_data *vreg_bulk;
+	int num_vregs;
+	bool vregs_on;
 	u32 init_speed;
 	u32 oper_speed;
 	const char *firmware_name;
@@ -1602,7 +1597,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 * off the voltage regulator.
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
-	if (!qcadev->bt_power->vregs_on) {
+	if (!qcadev->vregs_on) {
 		serdev_device_close(hu->serdev);
 		ret = qca_regulator_enable(qcadev);
 		if (ret)
@@ -1945,20 +1940,19 @@ static int qca_power_off(struct hci_dev *hdev)
 
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power = qcadev->bt_power;
 	int ret;
 
 	/* Already enabled */
-	if (power->vregs_on)
+	if (qcadev->vregs_on)
 		return 0;
 
-	BT_DBG("enabling %d regulators)", power->num_vregs);
+	BT_DBG("enabling %d regulators)", qcadev->num_vregs);
 
-	ret = regulator_bulk_enable(power->num_vregs, power->vreg_bulk);
+	ret = regulator_bulk_enable(qcadev->num_vregs, qcadev->vreg_bulk);
 	if (ret)
 		return ret;
 
-	power->vregs_on = true;
+	qcadev->vregs_on = true;
 
 	ret = clk_prepare_enable(qcadev->susclk);
 	if (ret)
@@ -1969,38 +1963,37 @@ static int qca_regulator_enable(struct qca_serdev *qcadev)
 
 static void qca_regulator_disable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power;
-
 	if (!qcadev)
 		return;
 
-	power = qcadev->bt_power;
-
 	/* Already disabled? */
-	if (!power->vregs_on)
+	if (!qcadev->vregs_on)
 		return;
 
-	regulator_bulk_disable(power->num_vregs, power->vreg_bulk);
-	power->vregs_on = false;
+	regulator_bulk_disable(qcadev->num_vregs, qcadev->vreg_bulk);
+	qcadev->vregs_on = false;
 
 	clk_disable_unprepare(qcadev->susclk);
 }
 
-static int qca_init_regulators(struct qca_power *qca,
-				const struct qca_vreg *vregs, size_t num_vregs)
+static int qca_init_regulators(struct device *dev, struct qca_serdev *qca,
+			       const struct qca_vreg *vregs, size_t num_vregs)
 {
 	struct regulator_bulk_data *bulk;
 	int ret;
 	int i;
 
-	bulk = devm_kcalloc(qca->dev, num_vregs, sizeof(*bulk), GFP_KERNEL);
+	if (!num_vregs)
+		return 0;
+
+	bulk = devm_kcalloc(dev, num_vregs, sizeof(*bulk), GFP_KERNEL);
 	if (!bulk)
 		return -ENOMEM;
 
 	for (i = 0; i < num_vregs; i++)
 		bulk[i].supply = vregs[i].name;
 
-	ret = devm_regulator_bulk_get(qca->dev, num_vregs, bulk);
+	ret = devm_regulator_bulk_get(dev, num_vregs, bulk);
 	if (ret < 0)
 		return ret;
 
@@ -2044,21 +2037,15 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	if ((qca_is_wcn399x(data->soc_type) ||
 	     qca_is_wcn6750(data->soc_type))) {
 		qcadev->btsoc_type = data->soc_type;
-		qcadev->bt_power = devm_kzalloc(&serdev->dev,
-						sizeof(struct qca_power),
-						GFP_KERNEL);
-		if (!qcadev->bt_power)
-			return -ENOMEM;
-
-		qcadev->bt_power->dev = &serdev->dev;
-		err = qca_init_regulators(qcadev->bt_power, data->vregs,
+
+		err = qca_init_regulators(&serdev->dev, qcadev, data->vregs,
 					  data->num_vregs);
 		if (err) {
 			BT_ERR("Failed to init regulators:%d", err);
 			return err;
 		}
 
-		qcadev->bt_power->vregs_on = false;
+		qcadev->vregs_on = false;
 
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
@@ -2139,11 +2126,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
-	struct qca_power *power = qcadev->bt_power;
 
 	if ((qca_is_wcn399x(qcadev->btsoc_type) ||
 	     qca_is_wcn6750(qcadev->btsoc_type)) &&
-	     power->vregs_on)
+	     qcadev->vregs_on)
 		qca_power_shutdown(&qcadev->serdev_hu);
 	else if (qcadev->susclk)
 		clk_disable_unprepare(qcadev->susclk);
-- 
2.30.2

