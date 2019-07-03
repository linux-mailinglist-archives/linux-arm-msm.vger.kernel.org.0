Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AF845EEC4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2019 23:45:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726902AbfGCVpQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 17:45:16 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41020 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726821AbfGCVpQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 17:45:16 -0400
Received: by mail-pf1-f194.google.com with SMTP id m30so1893451pff.8;
        Wed, 03 Jul 2019 14:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rblKGIlJDkSzRoKjZR0ET2T3JOcuW5SkJJUuNM12yX4=;
        b=XOB4vVcYBhzEHCUq87ZYRWQIOXEMrLuy250Kzgu+UOWDM4Qj3EMhvKXiAIQMvezsV1
         tTlvp2W/AJaPQuzPDD7K8vH1H+yHsUEfUEZPj0qExIR/HrLFXrQCssEZj4abmJ6EBlJp
         6SUNWUXL8cnY2Y0qYAue60xyhK7PRnjwunXwdjbnrVggsbfW1VkOTNCraDV0WUxnhS1m
         V6B1ZK62xyCeohV7kPa4aQVKC/AdOQr9x6ZICa8GMI+CBMLzerypxLBF+PG+Z44fwoMD
         JlPYcZWgpUnfi4Sri+cAm+qQXQu9V0Imiu4JpNpdkyYPctK1ZTCwR5NaYzN79Pd7BVaZ
         0bbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rblKGIlJDkSzRoKjZR0ET2T3JOcuW5SkJJUuNM12yX4=;
        b=P3A8oZjX8TX6O3hRQ2i5uZyHDhuInYFvAIKZFirQa7SHKmtsCLt4sfOD1O2Vq/8eUw
         etscgw2taq+QhB35KccJDs3Fr/sUsIPCmd4UPcErihdYDG3J9VVPeqvI/YglYLvfHGLB
         0cs2Jq7q487t6HVzjHqsqqD8pueMZuzXp/ahLEb51cIg/tEZezn7ZoNrBqje4NIC0jT8
         2hAhU01hEZBupr688xFZQ6NggxuM7GVJRo/wGHFZK0NV9ximf/gmCFnTuAgX/85Zw7hE
         2MAcP+sAhxsK8IV8LXBaNTvqZeay9oc3ge5hl0YuFWQTotlOJ/JKi50/2jP3exYYPvCJ
         gqSg==
X-Gm-Message-State: APjAAAXMhhJqUznVj9hhr/2DEn/KnHvu8QCxgOcxg47szHnlqyTl9GjE
        3gwohd752mzot5t9hmqRsgI=
X-Google-Smtp-Source: APXvYqziW6uz8kvYxiLE8i06vq1Y2XLf9uMisxKM0llLNGE8dLv+QCJtNMLwxKg8jzpKrGeCHGMrrA==
X-Received: by 2002:a63:545c:: with SMTP id e28mr40705619pgm.374.1562190315688;
        Wed, 03 Jul 2019 14:45:15 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id o14sm2895434pjp.29.2019.07.03.14.45.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 14:45:15 -0700 (PDT)
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To:     broonie@kernel.org
Cc:     a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com,
        airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
        bjorn.andersson@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: [PATCH 1/2] regmap: Add DSI bus support
Date:   Wed,  3 Jul 2019 14:45:12 -0700
Message-Id: <20190703214512.41319-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
References: <20190703214326.41269-1-jeffrey.l.hugo@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add basic support with a simple implementation that utilizes the generic
read/write commands to allow device registers to be configured.

Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
---
 drivers/base/regmap/Kconfig      |  6 +++-
 drivers/base/regmap/Makefile     |  1 +
 drivers/base/regmap/regmap-dsi.c | 62 ++++++++++++++++++++++++++++++++
 include/linux/regmap.h           | 37 +++++++++++++++++++
 4 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 drivers/base/regmap/regmap-dsi.c

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index c8bbf5322720..27669afa9d95 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -4,7 +4,7 @@
 # subsystems should select the appropriate symbols.
 
 config REGMAP
-	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_I3C)
+	default y if (REGMAP_I2C || REGMAP_SPI || REGMAP_SPMI || REGMAP_W1 || REGMAP_AC97 || REGMAP_MMIO || REGMAP_IRQ || REGMAP_I3C || REGMAP_DSI)
 	select IRQ_DOMAIN if REGMAP_IRQ
 	bool
 
@@ -53,3 +53,7 @@ config REGMAP_SCCB
 config REGMAP_I3C
 	tristate
 	depends on I3C
+
+config REGMAP_DSI
+	tristate
+	depends on DRM_MIPI_DSI
diff --git a/drivers/base/regmap/Makefile b/drivers/base/regmap/Makefile
index ff6c7d8ec1cd..c1cc81f3986f 100644
--- a/drivers/base/regmap/Makefile
+++ b/drivers/base/regmap/Makefile
@@ -17,3 +17,4 @@ obj-$(CONFIG_REGMAP_W1) += regmap-w1.o
 obj-$(CONFIG_REGMAP_SOUNDWIRE) += regmap-sdw.o
 obj-$(CONFIG_REGMAP_SCCB) += regmap-sccb.o
 obj-$(CONFIG_REGMAP_I3C) += regmap-i3c.o
+obj-$(CONFIG_REGMAP_DSI) += regmap-dsi.o
diff --git a/drivers/base/regmap/regmap-dsi.c b/drivers/base/regmap/regmap-dsi.c
new file mode 100644
index 000000000000..0c2900e2fee0
--- /dev/null
+++ b/drivers/base/regmap/regmap-dsi.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Register map access API - DSI support
+//
+// Copyright (c) 2019 Jeffrey Hugo
+
+#include <drm/drm_mipi_dsi.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+
+#include "internal.h"
+
+static int dsi_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct device *dev = context;
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
+	char payload[2];
+	int ret;
+
+	payload[0] = (char)reg;
+	payload[1] = (char)val;
+
+	ret = mipi_dsi_generic_write(dsi, payload, 2);
+	return ret < 0 ? ret : 0;
+}
+
+static int dsi_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct device *dev = context;
+	struct mipi_dsi_device *dsi = to_mipi_dsi_device(dev);
+	int ret;
+
+	ret = mipi_dsi_generic_read(dsi, &reg, 1, val, 1);
+	return ret < 0 ? ret : 0;
+}
+
+static struct regmap_bus dsi_bus = {
+	.reg_write = dsi_reg_write,
+	.reg_read = dsi_reg_read,
+};
+
+struct regmap *__regmap_init_dsi(struct mipi_dsi_device *dsi,
+				 const struct regmap_config *config,
+				 struct lock_class_key *lock_key,
+				 const char *lock_name)
+{
+	return __regmap_init(&dsi->dev, &dsi_bus, &dsi->dev, config,
+			     lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__regmap_init_dsi);
+
+struct regmap *__devm_regmap_init_dsi(struct mipi_dsi_device *dsi,
+				      const struct regmap_config *config,
+				      struct lock_class_key *lock_key,
+				      const char *lock_name)
+{
+	return __devm_regmap_init(&dsi->dev, &dsi_bus, &dsi->dev, config,
+				  lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__devm_regmap_init_dsi);
+
+MODULE_LICENSE("GPL");
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index dfe493ac692d..858239f7859f 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -32,6 +32,7 @@ struct regmap_range_cfg;
 struct regmap_field;
 struct snd_ac97;
 struct sdw_slave;
+struct mipi_dsi_device;
 
 /* An enum of all the supported cache types */
 enum regcache_type {
@@ -573,6 +574,10 @@ struct regmap *__regmap_init_sdw(struct sdw_slave *sdw,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
+struct regmap *__regmap_init_dsi(struct mipi_dsi_device *dsi,
+				 const struct regmap_config *config,
+				 struct lock_class_key *lock_key,
+				 const char *lock_name);
 
 struct regmap *__devm_regmap_init(struct device *dev,
 				  const struct regmap_bus *bus,
@@ -626,6 +631,10 @@ struct regmap *__devm_regmap_init_i3c(struct i3c_device *i3c,
 				 const struct regmap_config *config,
 				 struct lock_class_key *lock_key,
 				 const char *lock_name);
+struct regmap *__devm_regmap_init_dsi(struct mipi_dsi_device *dsi,
+				 const struct regmap_config *config,
+				 struct lock_class_key *lock_key,
+				 const char *lock_name);
 /*
  * Wrapper for regmap_init macros to include a unique lockdep key and name
  * for each call. No-op if CONFIG_LOCKDEP is not set.
@@ -812,6 +821,19 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
 	__regmap_lockdep_wrapper(__regmap_init_sdw, #config,		\
 				sdw, config)
 
+/**
+ * regmap_init_dsi() - Initialise register map
+ *
+ * @dsi: Device that will be interacted with
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer to
+ * a struct regmap.
+ */
+#define regmap_init_dsi(dsi, config)					\
+	__regmap_lockdep_wrapper(__regmap_init_dsi, #config,		\
+				dsi, config)
+
 
 /**
  * devm_regmap_init() - Initialise managed register map
@@ -999,6 +1021,21 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
 	__regmap_lockdep_wrapper(__devm_regmap_init_i3c, #config,	\
 				i3c, config)
 
+/**
+ * devm_regmap_init_dsi() - Initialise managed register map
+ *
+ * @dsi: Device that will be interacted with
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer
+ * to a struct regmap. The regmap will be automatically freed by the
+ * device management code.
+ */
+#define devm_regmap_init_dsi(dsi, config)				\
+	__regmap_lockdep_wrapper(__devm_regmap_init_dsi, #config,       \
+				dsi, config)
+
+
 int regmap_mmio_attach_clk(struct regmap *map, struct clk *clk);
 void regmap_mmio_detach_clk(struct regmap *map);
 void regmap_exit(struct regmap *map);
-- 
2.17.1

