Return-Path: <linux-arm-msm+bounces-30182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A83B6965A11
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 364741F24971
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:21:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48A5116DC01;
	Fri, 30 Aug 2024 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FLg5oXlv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A6816B38B
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725006054; cv=none; b=LboKFgndl74O7Yl7iS5Yj+mkWKn2bca+fu2rJjAOmhrvE+iDCW4e5HquHnPiaq3ZFYmy4C8jPavpsW0PK8CUzbEIJGOIZp/oDoNpez3+k87MaghZnhL8pHI01lc0D8xaeJvWJP88112iOM20dp6VL0OWEebdXyH6ptNXeG+hJyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725006054; c=relaxed/simple;
	bh=uSYp1Bgqx34Q5SjTseJvUt270be+S/EYojDVhNGuWlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TZXRUCfTSEIKwuNKStGo4j9cJjgQKv28mIZ95WqF8hW1lFaX3cfRQd0Scrq15JKEDK5iBEIFdApMn7DHHvzpx+cOxV77j2Vyi7kriIOaUr/PzA02VCpR0eZvDNJumlccjEbF4GxWNZeOuKNMsF4Zev93BhSRSAg54ygmawxSvnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FLg5oXlv; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5334fdabefbso2291007e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725006050; x=1725610850; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoaODkYOEyaemv+peV2Lk7usu4P7Fb4c6U5XdS7bZmQ=;
        b=FLg5oXlvziLP7O/xlquAS0BnG2mieVUKnV9T//3ekRA5UziSY0GGNOt42J4zU14SDa
         +S4f5z8kz/k8ny3FWOCPavIl+aN3j8MfQKg+u6DlB7aH/32b6kNlFaQLMPc2gsjsOhbz
         3Z5VtZ4mhIz682sFFmdsEpGgGUIZB4HIJiY3DwONQwSLwOAVv22W8KfcPsHnVtS1aTDn
         6MBKxCnJsAmz5y9yRptruAaqVWAaX5y0ydB49/Izd66rT4sE8Lj292yl0XVUjTomtGMy
         1IDRO3CXPaTodVgDy1RFCNyGTpmN4+lBJIC53HUnfmG2UQYPO/HBxeIxa2iRdsFwoYpT
         G0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725006050; x=1725610850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MoaODkYOEyaemv+peV2Lk7usu4P7Fb4c6U5XdS7bZmQ=;
        b=BvMfn/OjJc3MbGVCZZl8DYQCcet1AkRdTcm7Pr/XeVaExG0UWyp010b2S/7qFQcM79
         Ui53uMWzEG87cdxACs0i8F6EMEvETjIiFUD3L/gqlDWG+yQjfXULhjtVaWMVr9Opqgsu
         vdPsL2Wt19FRrRVaoeuoSvgaCFD0poW+ZrImBaJ6r5fZ+Bg9llKHQ0BeSpAO2oLnMp/L
         UuRgW2r98VfNahbGaZ1xLE7PhGzNUd9loxLGhS1ofvzfd20ITWjnnzv92j/Eqorc4uYM
         m0czlvPAfc2/LMDIGNDIe+E1fwn8uRjX4hRmyyfS4yp1cBo8Z3JpHNNVzyd0XLWgh3X/
         iJbA==
X-Forwarded-Encrypted: i=1; AJvYcCV1z788wY2jFlnisHfg5kTlzfP/sxFZdagl/YxBx2i0wuiywLcqd8i6GqL7RPMxhrzcvt4c3rsI04HBcQ31@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg+8lKWXMfk+x/tBGIJXz1eJZqE7w4eL5WEOCt1LD/WNjxPtCf
	beikqxVLVxHkuVDZhFu3JDKOWA/FtCvGct5M+2tY04aAkQycLdL39GaKwVVSTcg=
X-Google-Smtp-Source: AGHT+IGmSgunJBFWoiGmNhpvhGutjro+tqb45pwPrnBZXSo69PM3+98+jAV4SnI7qqstTV4etV5vBA==
X-Received: by 2002:a05:6512:234a:b0:534:53d7:c97f with SMTP id 2adb3069b0e04-5353ebdb303mr1831310e87.23.1725006049693;
        Fri, 30 Aug 2024 01:20:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354084e00asm482623e87.271.2024.08.30.01.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 01:20:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 30 Aug 2024 11:20:46 +0300
Subject: [PATCH v2 2/2] phy: add NXP PTN3222 eUSB2 to USB2 redriver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240830-nxp-ptn3222-v2-2-4c6d8535cf6c@linaro.org>
References: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
In-Reply-To: <20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5234;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uSYp1Bgqx34Q5SjTseJvUt270be+S/EYojDVhNGuWlg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm0YDfjo9lAZn1sSEvdM1GmdSFgLHhs2U/YaOSk
 eTdelaxzk2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtGA3wAKCRCLPIo+Aiko
 1S11B/9oXHKLCYMEAVsVuXLN5oo9juZzLvViEyCe+usH/16ZKAHTUX6DVZXUJfag53AVfyk7pM8
 +ilarO20hEUqLb9+pKCwPy8jZREUrpafDkmdK1gg8Ed/jaZKQD9nxv9FYdtGbkQoXv3hoip/eyW
 RruyRxjlD0lAU81pV9lR2HwhVCAipiAqed3xf+hr99GfFnqBqFwVe9HkdLNvacgSHlxlw4+t6Aa
 /2+q1O+nT1Q1vdloGjXoh71VHmGgT/TsrOQq/bwMOjd/dSIxGRfxfh+N2ct/001roVTXUDZKhc8
 KYcI3loRRcpgDArOH7JZy2IwR+rPH2OmR3oIrZhpeprsjwN3
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The NXP PTN3222 is the single-port eUSB2 to USB2 redriver that performs
translation between eUSB2 and USB2 signalling schemes. It supports all
three data rates: Low Speed, Full Speed and High Speed.

The reset state enables autonegotiation of the PHY role and of the data
rate, so no additional programming is required.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/phy/Kconfig           |  11 ++++
 drivers/phy/Makefile          |   1 +
 drivers/phy/phy-nxp-ptn3222.c | 123 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 135 insertions(+)

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
index 000000000000..c6179d8701e6
--- /dev/null
+++ b/drivers/phy/phy-nxp-ptn3222.c
@@ -0,0 +1,123 @@
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
+	struct regulator_bulk_data *supplies;
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
+static const struct regulator_bulk_data ptn3222_supplies[NUM_SUPPLIES] = {
+	{
+		.supply = "vdd3v3",
+		.init_load_uA = 11000,
+	}, {
+		.supply = "vdd1v8",
+		.init_load_uA = 55000,
+	}
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
+	ret = devm_regulator_bulk_get_const(dev, NUM_SUPPLIES, ptn3222_supplies,
+					    &ptn3222->supplies);
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


