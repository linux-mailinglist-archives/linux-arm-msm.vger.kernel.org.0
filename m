Return-Path: <linux-arm-msm+bounces-29922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C52963E41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D10BF285EA0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 08:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BC2118C353;
	Thu, 29 Aug 2024 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rGhs1Edu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32AF18C325
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724919682; cv=none; b=fioDq3FvQmPeTiGsCpNl/f/aH264slVo/fDme3035XsKJyUgTFHOsvACY+nQtfFCvIiuesi6DOSBXwLGNvm4L1wvVT0YuKmKND0QJB2NfdzCciMb4+O5mHu0bYKQaDBqz6jPH8KNTXBLK9XBnnpXsxZAlRmHESYEyTa7q6M/T7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724919682; c=relaxed/simple;
	bh=D945pissAzYJ1WSZ4r3fmdjGbNimiMhFB6YLYYkLGPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aJkg4ZuKik/AznzDWkbh/G+soO+Qmf+ro3/bTAzb88A6pT3T/4QPJ8ggWc6ApoXrv1doNirqAhkZN1LP4u8vYpSuPBqhhYGKjBG1AqlcQ9XX/1ZSn9s1M6ORBV54byMwIgp86OeyRuGnrt/9tAhWS8obb+wJs6JcUjzsCOLy1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rGhs1Edu; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-533de5a88f8so398308e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724919678; x=1725524478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4vkvoTso6h1gNffXtkAXfIEyKfOljt6J/EQ+f9eh4k=;
        b=rGhs1EduQInRqQlHgN+R/iEaO67j3BjjOwYx6Rq+iNivrielhtt8y3rsOpgywYL3tr
         A2dwPtr3kU345Z15pZ37qMGu+uAAaB6I28QKJvOY3yn9AyrrGhvS8L9lDJs+E2VDBctE
         DmZ/h/bdkdEnOYWPqF8z1q5NJUywlQF5GuUfItu5wPS0Y4FJa9V/Vilje2LurdAlg1S6
         nUminPONDBlmE8WVNgRN6daCnmKXBF8DQvKJXBKRRIdZ7Rdk98oful+42wlO/a+PiZqU
         +b2wHzfdFEuwNZty/SF5rZyzDM10Qdq9nwyiXio2AoETpKr31GpQf8RGVsRuRP1JBJCa
         iSYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724919678; x=1725524478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l4vkvoTso6h1gNffXtkAXfIEyKfOljt6J/EQ+f9eh4k=;
        b=RXtaAPX+XkdKP+vs2cjMMJaJjADL5TZOHi73pNJyJu2KoRUNZz58U2NcZhrp7i28/H
         7E0eKIHM8cfSNmPcJjTZYSPrYF0Iw2lT7ZPeIee6CR0X+Rv+rn2JlCBTXm53+nwKafUh
         G0XEgGa3h+YtSMHvTfRB6fkP+I5/Eyd1jsT7l4hisE8LXRCrre473iihiUnTIwyR4Vdb
         4tDjLCY8NqDhu8bKQj2YxkPjaszrN42W2KD7hsRNtFyselulGpO99X+LqzSldb/waJ5C
         p1/ZWL42DOuRHeAKIonAWBIW4f1TK182U285hYWACEmqiJKA6iWWCzCefYMlZiDzbgDe
         +KSA==
X-Forwarded-Encrypted: i=1; AJvYcCWjd3fX+hYyRyGCcx89pufApQvAL2VMfXU1N7VpwsLvXlMnQi7uR8sBFaXV703HwY7dj+RjcHEElGm5bGM0@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/NowBSXu6G61HT3gaSeLaJ3kBdmfITqD6bX6gJW6DWgv5ahfk
	6ZiTHcmUCn9zGVH3ZB2prc4YCmUdCJPFZTGbJBueYclt5vmJ5PKIvDeTx8M5uUY=
X-Google-Smtp-Source: AGHT+IE29xdrMuG56sjGZ0HIT6/edkCuXIp0/EK146elrMyoVzNezfgtU6FXrZp8xyU6P6Ohzvmgow==
X-Received: by 2002:a05:6512:3084:b0:530:c323:46a8 with SMTP id 2adb3069b0e04-5353e56935emr1131789e87.23.1724919677229;
        Thu, 29 Aug 2024 01:21:17 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-535407ac333sm90243e87.70.2024.08.29.01.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:21:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 11:21:14 +0300
Subject: [PATCH 2/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-nxp-ptn3222-v1-2-46906bc4747a@linaro.org>
References: <20240829-nxp-ptn3222-v1-0-46906bc4747a@linaro.org>
In-Reply-To: <20240829-nxp-ptn3222-v1-0-46906bc4747a@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5103;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=D945pissAzYJ1WSZ4r3fmdjGbNimiMhFB6YLYYkLGPU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm0C96yL9zJFlSohV/brIn5g/vjD2TJHC0kAhFW
 jYzqRi5OTCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtAvegAKCRCLPIo+Aiko
 1Vm3B/wJ/0cuoDCWshKIwTvNfPHBhzR0GbOXGUMhB/IwUwxTi8GSEfG6IBQXeV++iccQuMUP4H5
 g5gvY7gXht9cWO/4kQuwz29pVs76HUOubsW5Mp2al5Wcp16KdfcGIMqeuOKu8LUCjL6Mde0+rYX
 7mW22OkDaP3H3dWjs3b1srd1Zw6WTmwC6SpfJChgVIc+XxCDXhWL8E1RZZKawx65drhCCMGX/j/
 0BrIsW9zyGvnPfSfQFZoZ6fcmeO30dXzD9Jyg8ZKNjN1ySDT2zTPDTo0GtSFKzI0wytcixMZtrd
 ygP+tZIE4nUpscxhIr0AjAHh8ubBVnKAaS2rq2XPwnW7UoNf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
translation between eUSB2 and USB2 signalling schemes. It supports all
three data rates: Low Speed, Full Speed and High Speed.

The reset state enables autonegotiation of the PHY role and of the data
rate, so no additional programming is required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/Kconfig           |  11 ++++
 drivers/phy/Makefile          |   1 +
 drivers/phy/phy-nxp-ptn3222.c | 119 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 131 insertions(+)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index dfab1c66b3e5..cb06a7f79740 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -82,6 +82,17 @@ config PHY_AIROHA_PCIE
 	  This driver create the basic PHY instance and provides initialize
 	  callback for PCIe GEN3 port.
 
+config PHY_NXP_PTN3222
+	tristate "NXP PTN3222 1-port eUSB2 to USB2 redriver"
+	depends on I2C
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Enable this to support NXP PTN3222 1-port eUSB2 to USB2 Redriver.
+	  This redriver performs translation between eUSB2 and USB2 signalling
+	  schemes. It supports all three USB 2.0 data rates: Low Speed, Full
+	  Speed and High Speed.
+
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/broadcom/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index 5fcbce5f9ab1..b64247046575 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
+obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
 obj-y					+= allwinner/	\
 					   amlogic/	\
 					   broadcom/	\
diff --git a/drivers/phy/phy-nxp-ptn3222.c b/drivers/phy/phy-nxp-ptn3222.c
new file mode 100644
index 000000000000..429a91910f14
--- /dev/null
+++ b/drivers/phy/phy-nxp-ptn3222.c
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+
+#define NUM_SUPPLIES 2
+
+struct ptn3222 {
+	struct i2c_client *client;
+	struct phy *phy;
+	struct gpio_desc *reset_gpio;
+	struct regulator_bulk_data supplies[NUM_SUPPLIES];
+};
+
+static int ptn3222_init(struct phy *phy)
+{
+	struct ptn3222 *ptn3222 = phy_get_drvdata(phy);
+	int ret;
+
+	ret = regulator_bulk_enable(NUM_SUPPLIES, ptn3222->supplies);
+	if (ret)
+		return ret;
+
+	gpiod_set_value_cansleep(ptn3222->reset_gpio, 0);
+
+	return 0;
+}
+
+static int ptn3222_exit(struct phy *phy)
+{
+	struct ptn3222 *ptn3222 = phy_get_drvdata(phy);
+
+	gpiod_set_value_cansleep(ptn3222->reset_gpio, 1);
+
+	return regulator_bulk_disable(NUM_SUPPLIES, ptn3222->supplies);
+}
+
+static const struct phy_ops ptn3222_ops = {
+	.init		= ptn3222_init,
+	.exit		= ptn3222_exit,
+	.owner		= THIS_MODULE,
+};
+
+static int ptn3222_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct phy_provider *phy_provider;
+	struct ptn3222 *ptn3222;
+	int ret;
+
+	ptn3222 = devm_kzalloc(dev, sizeof(*ptn3222), GFP_KERNEL);
+	if (!ptn3222)
+		return -ENOMEM;
+
+	ptn3222->client = client;
+
+	ptn3222->reset_gpio = devm_gpiod_get_optional(dev, "reset",
+						      GPIOD_OUT_HIGH);
+	if (IS_ERR(ptn3222->reset_gpio))
+		return dev_err_probe(dev, PTR_ERR(ptn3222->reset_gpio),
+				     "unable to acquire reset gpio\n");
+
+	ptn3222->supplies[0].supply = "vdd3v3";
+	ptn3222->supplies[0].init_load_uA = 11000;
+	ptn3222->supplies[1].supply = "vdd1v8";
+	ptn3222->supplies[1].init_load_uA = 55000;
+
+	ret = devm_regulator_bulk_get(dev,
+				      NUM_SUPPLIES,
+				      ptn3222->supplies);
+	if (ret)
+		return ret;
+
+	ptn3222->phy = devm_phy_create(dev, dev->of_node, &ptn3222_ops);
+	if (IS_ERR(ptn3222->phy)) {
+		dev_err(dev, "failed to create PHY: %d\n", ret);
+		return PTR_ERR(ptn3222->phy);
+	}
+
+	phy_set_drvdata(ptn3222->phy, ptn3222);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(phy_provider);
+}
+
+static const struct i2c_device_id ptn3222_table[] = {
+	{ "ptn3222" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ptn3222_table);
+
+static const struct of_device_id ptn3222_of_table[] = {
+	{ .compatible = "nxp,ptn3222" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ptn3222_of_table);
+
+static struct i2c_driver ptn3222_driver = {
+	.driver = {
+		.name = "ptn3222",
+		.of_match_table = ptn3222_of_table,
+	},
+	.probe = ptn3222_probe,
+	.id_table = ptn3222_table,
+};
+
+module_i2c_driver(ptn3222_driver);
+
+MODULE_DESCRIPTION("NXP PTN3222 eUSB2 Redriver driver");
+MODULE_LICENSE("GPL");

-- 
2.39.2


