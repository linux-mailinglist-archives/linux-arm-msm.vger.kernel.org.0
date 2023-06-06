Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88FAD724617
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 16:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237937AbjFFOcr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 10:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237959AbjFFOcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 10:32:23 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54DEB10D9
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 07:32:07 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3f7a8089709so25535345e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 07:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686061926; x=1688653926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AAHo2Ft1e4SvLLm6iTKloBaUK4EchMGqUU8Wjhy/k70=;
        b=i7rKKYAWjtux0sW8cNhrKOwcwFUPxVcbo/0SjSgImMZjkSaffUeTyAQYXhRPJc1gZl
         AUl/HK4V1nU+4UAT/Q3XFtiDKQHgAvHSw4Y0INDupYdTUCYtbnl7IUiTHjmp60bW+JiH
         68uBJJr76114iRVOYdaCBA0mq5KkTjJ6Hm23mNIO/K3xtyKNQsXiNACkguJ56p0QfOQK
         Ir7qYx7p6+9sCEUjRG0/iEbju382qlUY/Ps84PxuqbUegtZRwABk7rZfosQJ5Ol0I8m2
         mHgX2ZcmLgs5StnCzANrCAqU2y3cu5I6Y3G01toV32miX0r35p2f8F0bv24yZGDQAZhR
         zgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686061926; x=1688653926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAHo2Ft1e4SvLLm6iTKloBaUK4EchMGqUU8Wjhy/k70=;
        b=Ikvnq9LUa+DOZuSyaZ/mx0zLi2utT3cpsU3/fIkLVvdnAoUvm0SI8KnwybwpLfmHSz
         qjx6hCz3NSI3QXgCT6yhqzL97J9aYfO2FrS2efIGtrwGT83QEPGgCUzK6LzhcoAYnPCF
         ngrgNt/Tz/Ze74zqBjC6nPRfUWeJD73zU7EBBMQq899UbNW3SnG16a3HibA4qxDxgANY
         rj6wmw2aXljXBdJLZ20A2tdKpk83Z49Vcr+bNnLltlZdSFAgFymYS878Hge7ofZPnd2U
         YE2Rf3G78aA5VuyxxS9TNsxoL+V9laaufigJ88UbIENZgP/jmWsVIr8wdDsvr/EV21M9
         yN1A==
X-Gm-Message-State: AC+VfDwYAngh9aonlQH9814x/zVkdydft55SaDFbDZehWy9LvIPLIvlb
        7v9/pPZTz2M8qlnjwu/pFmod9A==
X-Google-Smtp-Source: ACHHUZ65Rt0pJyezM2Tl8YuCIG2oNvDJONeF0pQC1k3stBKHW6YpNweuacyHAcVHvem4ha8kuDcTYA==
X-Received: by 2002:a05:600c:b45:b0:3f4:d18f:b2fb with SMTP id k5-20020a05600c0b4500b003f4d18fb2fbmr2481431wmr.8.1686061925651;
        Tue, 06 Jun 2023 07:32:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id fc14-20020a05600c524e00b003f61177faffsm3883600wmb.0.2023.06.06.07.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 07:32:05 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue, 06 Jun 2023 16:31:59 +0200
Subject: [PATCH RFC 4/4] input: touchscreen: add SPI support for Goodix
 Berlin Touchscreen IC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230606-topic-goodix-berlin-upstream-initial-v1-4-4a0741b8aefd@linaro.org>
References: <20230606-topic-goodix-berlin-upstream-initial-v1-0-4a0741b8aefd@linaro.org>
In-Reply-To: <20230606-topic-goodix-berlin-upstream-initial-v1-0-4a0741b8aefd@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrik Rydberg <rydberg@bitmath.org>
Cc:     linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7697;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=vn7duBP7sfXMbumxh4swTtaBAVKnUxfLgRt1So/mze8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkf0Ng06P6FQgdVTW3g+9T+7UF1C2g0KM+3+N0Zltm
 QPbDh/2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZH9DYAAKCRB33NvayMhJ0YjhEA
 C6nwIRpZK0MNlYr4k7ypGtVDu4d1S4ESVBQ4+4z9/GVYV/XfGPn1uE1gSG7XWYrdoK4xzoC34dxDAz
 crMw8S83+OLAF2lGMpBqWX4tZMpyE/2NuZR2hLlV8PpqUYK5YohbCAoHOOVhh4aaic9h3HYhvciqGK
 JPd27nq2mvNEME76uId3mvcZCTkOBcr7Tk3LQXBQXOQoML/79xIZWWC4MLld9pHLJ5NAfZgdUSym/A
 zAOH795HyLMK6ShMPcclujqrIW8LjScuEXhgGyXLP+Tp3xP47XO5gv5NmXW7uZh8Z7LcbwDJWE7LrT
 LMajy8rMmsQGbnx1EIl3x8Ls3EAXD5FxCFm0alAMduMWaPRE5xG5sbCNiJkt44H2K7OCJhb2ji2dRA
 idjd0gXbOKyAqT03/uKlUV2Y6vcf8nVPJ/nvXgum8oMNFQHtzQ9//74J9oe6raK5UM/Pwa9v36mE74
 QAMejwwVgUjXgAP0zGGaTdDcH1hWbltQrVeUrnLF37is7tX5EgTWN/qtlxwY1V987aHnUVaEJycxql
 cG+pxpgUEb3Vhoxo6Op5l0ZkijGZbqvxAen/kCAcsdh7fgXtQ28rVm/OpdbwmZQm3RtETgMn8i1e+N
 aEjp7f3uqw00eklQdojjwBN1BwnHh7rSN74Bei9EayVj52XQnL7/9JOM4XSg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add initial support for the new Goodix "Berlin" touchscreen ICs
over the SPI interface.

The driver doesn't use the regmap_spi code since the SPI messages
needs to be prefixed, thus this custom regmap code.

This initial driver is derived from the Goodix goodix_ts_berlin
available at [1] and [2] and only supports the GT9916 IC
present on the Qualcomm SM8550 MTP & QRD touch panel.

The current implementation only supports BerlinD, aka GT9916.

[1] https://github.com/goodix/goodix_ts_berlin
[2] https://git.codelinaro.org/clo/la/platform/vendor/opensource/touch-drivers

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/input/touchscreen/Kconfig             |  14 ++
 drivers/input/touchscreen/Makefile            |   1 +
 drivers/input/touchscreen/goodix_berlin_spi.c | 183 ++++++++++++++++++++++++++
 3 files changed, 198 insertions(+)

diff --git a/drivers/input/touchscreen/Kconfig b/drivers/input/touchscreen/Kconfig
index da6d5d75c42d..ffe0c0a4cd15 100644
--- a/drivers/input/touchscreen/Kconfig
+++ b/drivers/input/touchscreen/Kconfig
@@ -435,6 +435,20 @@ config TOUCHSCREEN_GOODIX_BERLIN_I2C
 	  To compile this driver as a module, choose M here: the
 	  module will be called goodix_berlin_i2c.
 
+config TOUCHSCREEN_GOODIX_BERLIN_SPI
+	tristate "Goodix Berlin SPI touchscreen"
+	depends on SPI_MASTER
+	depends on REGMAP
+	select TOUCHSCREEN_GOODIX_BERLIN_CORE
+	help
+	  Say Y here if you have the a touchscreen connected to your
+	  system using the Goodix Berlin IC connection via SPI.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called goodix_berlin_spi.
+
 config TOUCHSCREEN_HIDEEP
 	tristate "HiDeep Touch IC"
 	depends on I2C
diff --git a/drivers/input/touchscreen/Makefile b/drivers/input/touchscreen/Makefile
index 921a2da0c2be..29524e8a83db 100644
--- a/drivers/input/touchscreen/Makefile
+++ b/drivers/input/touchscreen/Makefile
@@ -49,6 +49,7 @@ obj-$(CONFIG_TOUCHSCREEN_FUJITSU)	+= fujitsu_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX)	+= goodix_ts.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_CORE)	+= goodix_berlin_core.o
 obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_I2C)	+= goodix_berlin_i2c.o
+obj-$(CONFIG_TOUCHSCREEN_GOODIX_BERLIN_SPI)	+= goodix_berlin_spi.o
 obj-$(CONFIG_TOUCHSCREEN_HIDEEP)	+= hideep.o
 obj-$(CONFIG_TOUCHSCREEN_HYNITRON_CSTXXX)	+= hynitron_cstxxx.o
 obj-$(CONFIG_TOUCHSCREEN_ILI210X)	+= ili210x.o
diff --git a/drivers/input/touchscreen/goodix_berlin_spi.c b/drivers/input/touchscreen/goodix_berlin_spi.c
new file mode 100644
index 000000000000..0f4f650fdf3f
--- /dev/null
+++ b/drivers/input/touchscreen/goodix_berlin_spi.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Goodix Berlin Touchscreen Driver
+ *
+ * Copyright (C) 2020 - 2021 Goodix, Inc.
+ * Copyright (C) 2023 Linaro Ltd.
+ *
+ * Based on goodix_ts_berlin driver.
+ */
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spi/spi.h>
+#include <linux/regmap.h>
+#include <asm/unaligned.h>
+
+#include "goodix_berlin.h"
+
+#define SPI_TRANS_PREFIX_LEN	1
+#define REGISTER_WIDTH		4
+#define SPI_READ_DUMMY_LEN	3
+#define SPI_READ_PREFIX_LEN	(SPI_TRANS_PREFIX_LEN + REGISTER_WIDTH + SPI_READ_DUMMY_LEN)
+#define SPI_WRITE_PREFIX_LEN	(SPI_TRANS_PREFIX_LEN + REGISTER_WIDTH)
+
+#define SPI_WRITE_FLAG		0xF0
+#define SPI_READ_FLAG		0xF1
+
+static int goodix_berlin_spi_read(void *context, const void *reg_buf,
+				  size_t reg_size, void *val_buf,
+				  size_t val_size)
+{
+	struct spi_device *spi = context;
+	struct spi_transfer xfers;
+	struct spi_message spi_msg;
+	const u32 *reg = reg_buf; /* reg is stored as native u32 at start of buffer */
+	u8 *buf = NULL;
+	int ret = 0;
+
+	if (reg_size != REGISTER_WIDTH)
+		return -EINVAL;
+
+	buf = kzalloc(SPI_READ_PREFIX_LEN + val_size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	spi_message_init(&spi_msg);
+	memset(&xfers, 0, sizeof(xfers));
+
+	/* buffer format: 0xF1 + addr(4bytes) + dummy(3bytes) + data */
+	buf[0] = SPI_READ_FLAG;
+	put_unaligned_be32(*reg, buf + SPI_TRANS_PREFIX_LEN);
+	memset(buf + SPI_TRANS_PREFIX_LEN + REGISTER_WIDTH, 0xff,
+	       SPI_READ_DUMMY_LEN);
+
+	xfers.tx_buf = buf;
+	xfers.rx_buf = buf;
+	xfers.len = SPI_READ_PREFIX_LEN + val_size;
+	xfers.cs_change = 0;
+	spi_message_add_tail(&xfers, &spi_msg);
+
+	ret = spi_sync(spi, &spi_msg);
+	if (ret < 0) {
+		dev_err(&spi->dev, "transfer error:%d", ret);
+		goto exit;
+	}
+
+	memcpy(val_buf, buf + SPI_READ_PREFIX_LEN, val_size);
+exit:
+	kfree(buf);
+	return ret;
+}
+
+static int goodix_berlin_spi_write(void *context, const void *data,
+				   size_t count)
+{
+	unsigned int len = count - REGISTER_WIDTH;
+	struct spi_device *spi = context;
+	struct spi_transfer xfers;
+	struct spi_message spi_msg;
+	const u32 *reg = data; /* reg is stored as native u32 at start of buffer */
+	u8 *buf = NULL;
+	int ret = 0;
+
+	buf = kzalloc(SPI_WRITE_PREFIX_LEN + len, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	spi_message_init(&spi_msg);
+	memset(&xfers, 0, sizeof(xfers));
+
+	buf[0] = SPI_WRITE_FLAG;
+	put_unaligned_be32(*reg, buf + SPI_TRANS_PREFIX_LEN);
+	memcpy(buf + SPI_WRITE_PREFIX_LEN, data + REGISTER_WIDTH, len);
+
+	xfers.tx_buf = buf;
+	xfers.len = SPI_WRITE_PREFIX_LEN + len;
+	xfers.cs_change = 0;
+	spi_message_add_tail(&xfers, &spi_msg);
+
+	ret = spi_sync(spi, &spi_msg);
+	if (ret < 0)
+		dev_err(&spi->dev, "transfer error:%d", ret);
+
+	kfree(buf);
+	return ret;
+}
+
+static const struct regmap_config goodix_berlin_spi_regmap_conf = {
+	.reg_bits = 32,
+	.val_bits = 8,
+	.read = goodix_berlin_spi_read,
+	.write = goodix_berlin_spi_write,
+};
+
+static const struct input_id goodix_berlin_spi_input_id = {
+	.bustype = BUS_SPI,
+	.vendor = 0x0416,
+	.product = 0x1001,
+};
+
+static int goodix_berlin_spi_probe(struct spi_device *spi)
+{
+	struct regmap_config *cfg;
+	struct regmap *map;
+	size_t max_size;
+	int ret = 0;
+
+	cfg = devm_kmemdup(&spi->dev, &goodix_berlin_spi_regmap_conf,
+			   sizeof(*cfg), GFP_KERNEL);
+	if (!cfg)
+		return -ENOMEM;
+
+	spi->mode = SPI_MODE_0;
+	spi->bits_per_word = 8;
+	ret = spi_setup(spi);
+	if (ret)
+		return ret;
+
+	max_size = spi_max_transfer_size(spi);
+	cfg->max_raw_read = max_size - SPI_READ_PREFIX_LEN;
+	cfg->max_raw_write = max_size - SPI_WRITE_PREFIX_LEN;
+
+	map = devm_regmap_init(&spi->dev, NULL, spi, cfg);
+	if (IS_ERR(map))
+		return PTR_ERR(map);
+
+	return goodix_berlin_probe(&spi->dev, spi->irq,
+				   &goodix_berlin_spi_input_id, map);
+}
+
+static void goodix_berlin_spi_remove(struct spi_device *spi)
+{
+	goodix_berlin_remove(&spi->dev);
+}
+
+static const struct of_device_id goodix_berlin_spi_of_match[] = {
+	{
+		.compatible = "goodix,gt9916",
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, goodix_berlin_spi_of_match);
+
+static const struct spi_device_id goodix_berlin_spi_ids[] = {
+	{ "gt9916" },
+	{ },
+};
+MODULE_DEVICE_TABLE(spi, goodix_berlin_spi_ids);
+
+static struct spi_driver goodix_berlin_spi_driver = {
+	.driver = {
+		.name = "goodix-berlin-spi",
+		.of_match_table = goodix_berlin_spi_of_match,
+		.pm = pm_sleep_ptr(&goodix_berlin_pm_ops),
+	},
+	.id_table = goodix_berlin_spi_ids,
+	.probe = goodix_berlin_spi_probe,
+	.remove = goodix_berlin_spi_remove,
+};
+module_spi_driver(goodix_berlin_spi_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Goodix Berlin SPI Touchscreen driver");
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");

-- 
2.34.1

