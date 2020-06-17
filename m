Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1FF1FCFFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 16:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgFQOv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 10:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726879AbgFQOvz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 10:51:55 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49155C061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:51:55 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id j1so1256701pfe.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kxhvYcomuJJ2qNOT4x3YCOj8Xes733Hr3tyRgLeyyfk=;
        b=PTmPC/MsjdhuhnZZC2To2GIdlPY881Th2FqdqJ9ueriL1HUwTOdtSI5pFxV78kb6cl
         XMY/J6yRpnMlERREey75dE2MQ23JZN7cWvDto5wq++gOn5CI0zXpW50+Nu1dHbMolHRv
         G6APyqiu+wa8oUIF6ddO/1csGSaAdj4U/z4fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxhvYcomuJJ2qNOT4x3YCOj8Xes733Hr3tyRgLeyyfk=;
        b=Hg7fhKHhwPVLnOnlw1fhpG+FmeOv6xhlsdLEu0EsXRHPniYjEcJ6sgtJd0FHjmAT+9
         NJi6M2YNeDlXuE2F5vTRN131qrb/pWfARDQVjlyRNEOQfaXZdXPZLR9fbejxw/yERxLx
         PuxV67RyLv64fir/t7GWIVMWMlfHIUZsyGduaIxmmvAd1FUE6/X6fnTlL9QxCaQ9nK+p
         aEgKc/i9q81lRRAMK8j1CaB5kOgXDBPr36sYgRuM+AdSMPmxmKfNSmLWYFCuKlBtr+V2
         E0ubG9OILkZ2pyW+y32N4GGaduLAbmmu9FrhKwRzaSTrXcF2MyRR2iNNN2YL77uo5neT
         najw==
X-Gm-Message-State: AOAM533wFPjGCTnO3dLPS9SvEZe3OU9eHTh2+sXjfQa3BrJkbBw1KerK
        5apje2uTjcOhSbIANMV5lg5ShQ==
X-Google-Smtp-Source: ABdhPJwG+7vHW0E3jcojxKTU3FIRbypmK5GrBCVsXbsxPNx3E9zt1F6FJE3L5H44f9aywokgO4Ye4Q==
X-Received: by 2002:a63:5d04:: with SMTP id r4mr5060175pgb.15.1592405514503;
        Wed, 17 Jun 2020 07:51:54 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id k18sm147040pfp.208.2020.06.17.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 07:51:54 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] nvmem: qfprom: Add fuse blowing support
Date:   Wed, 17 Jun 2020 07:51:15 -0700
Message-Id: <20200617074930.v3.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200617145116.247432-1-dianders@chromium.org>
References: <20200617145116.247432-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ravi Kumar Bokka <rbokka@codeaurora.org>

This patch adds support for blowing fuses to the qfprom driver if the
required properties are defined in the device tree.

Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Please double-check that I got the major/minor version logic right
here.  I don't have documentation for this, but Srinivas mentioned
that it was at address 0x6000 and I happened to find an "8" and a "7"
on sc7180 so I assumed that was the major and minor version.

Changes in v3:
- Don't provide "reset" value for things; just save/restore.
- Use the major/minor version read from 0x6000.
- Reading should still read "corrected", not "raw".
- Added a sysfs knob to allow you to read "raw" instead of "corrected"
- Simplified the SoC data structure.
- No need for quite so many levels of abstraction for clocks/regulator.
- Don't set regulator voltage.  Rely on device tree to make sure it's right.
- Properly undo things in the case of failure.
- Don't just keep enabling the regulator over and over again.
- Enable / disable the clock each time
- Polling every 100 us but timing out in 10 us didn't make sense; swap.
- No reason for 100 us to be SoC specific.
- No need for reg-names.
- We shouldn't be creating two separate nvmem devices.

 drivers/nvmem/qfprom.c | 314 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 303 insertions(+), 11 deletions(-)

diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index 8a91717600be..486202860f84 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -3,57 +3,349 @@
  * Copyright (C) 2015 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
  */
 
+#include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
-#include <linux/io.h>
 #include <linux/nvmem-provider.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+
+/* Blow timer clock frequency in Mhz */
+#define QFPROM_BLOW_TIMER_OFFSET 0x03c
+
+/* Amount of time required to hold charge to blow fuse in micro-seconds */
+#define QFPROM_FUSE_BLOW_POLL_US	10
+#define QFPROM_FUSE_BLOW_TIMEOUT_US	100
+
+#define QFPROM_BLOW_STATUS_OFFSET	0x048
+#define QFPROM_BLOW_STATUS_BUSY		0x1
+#define QFPROM_BLOW_STATUS_READY	0x0
+
+#define QFPROM_ACCEL_OFFSET		0x044
+
+#define QFPROM_VERSION_OFFSET		0x0
+#define QFPROM_MAJOR_VERSION_SHIFT	28
+#define QFPROM_MAJOR_VERSION_MASK	0xf
+#define QFPROM_MINOR_VERSION_SHIFT	16
+#define QFPROM_MINOR_VERSION_MASK	0xf
+
+static bool read_raw_data;
+module_param(read_raw_data, bool, 0644);
+MODULE_PARM_DESC(read_raw_data, "Read raw instead of corrected data");
 
+/**
+ * struct qfprom_soc_data - config that varies from SoC to SoC.
+ *
+ * @accel_value:             Should contain qfprom accel value.
+ * @qfprom_blow_timer_value: The timer value of qfprom when doing efuse blow.
+ * @qfprom_blow_set_freq:    The frequency required to set when we start the
+ *                           fuse blowing.
+ */
+struct qfprom_soc_data {
+	u32 accel_value;
+	u32 qfprom_blow_timer_value;
+	u32 qfprom_blow_set_freq;
+};
+
+/**
+ * struct qfprom_priv - structure holding qfprom attributes
+ *
+ * @qfpraw:       iomapped memory space for qfprom-efuse raw address space.
+ * @qfpconf:      iomapped memory space for qfprom-efuse configuration address
+ *                space.
+ * @qfpcorrected: iomapped memory space for qfprom corrected address space.
+ * @qfpsecurity:  iomapped memory space for qfprom security control space.
+ * @dev:          qfprom device structure.
+ * @secclk:       Clock supply.
+ * @vcc:          Regulator supply.
+ * @soc_data:     Data that for things that varies from SoC to SoC.
+ */
 struct qfprom_priv {
-	void __iomem *base;
+	void __iomem *qfpraw;
+	void __iomem *qfpconf;
+	void __iomem *qfpcorrected;
+	void __iomem *qfpsecurity;
+	struct device *dev;
+	struct clk *secclk;
+	struct regulator *vcc;
+	const struct qfprom_soc_data *soc_data;
+};
+
+/**
+ * struct qfprom_touched_values - saved values to restore after blowing
+ *
+ * @clk_rate: The rate the clock was at before blowing.
+ * @accel_val: The value of the accel reg before blowing.
+ * @timer_val: The value of the timer before blowing.
+ */
+struct qfprom_touched_values {
+	unsigned long clk_rate;
+	u32 accel_val;
+	u32 timer_val;
 };
 
+/**
+ * qfprom_disable_fuse_blowing() - Undo enabling of fuse blowing.
+ * @priv: Our driver data.
+ * @old:  The data that was stashed from before fuse blowing.
+ *
+ * Resets the value of the blow timer, accel register and the clock
+ * and voltage settings.
+ *
+ * Prints messages if there are errors but doesn't return an error code
+ * since there's not much we can do upon failure.
+ */
+static void qfprom_disable_fuse_blowing(const struct qfprom_priv *priv,
+					const struct qfprom_touched_values *old)
+{
+	int ret;
+
+	ret = regulator_disable(priv->vcc);
+	if (ret)
+		dev_warn(priv->dev, "Failed to disable regulator (ignoring)\n");
+
+	ret = clk_set_rate(priv->secclk, old->clk_rate);
+	if (ret)
+		dev_warn(priv->dev,
+			 "Failed to set clock rate for disable (ignoring)\n");
+
+	clk_disable_unprepare(priv->secclk);
+
+	writel(old->timer_val, priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
+	writel(old->accel_val, priv->qfpconf + QFPROM_ACCEL_OFFSET);
+}
+
+/**
+ * qfprom_enable_fuse_blowing() - Enable fuse blowing.
+ * @priv: Our driver data.
+ * @old:  We'll stash stuff here to use when disabling.
+ *
+ * Sets the value of the blow timer, accel register and the clock
+ * and voltage settings.
+ *
+ * Prints messages if there are errors so caller doesn't need to.
+ *
+ * Return: 0 or -err.
+ */
+static int qfprom_enable_fuse_blowing(const struct qfprom_priv *priv,
+				      struct qfprom_touched_values *old)
+{
+	int ret;
+
+	ret = clk_prepare_enable(priv->secclk);
+	if (ret) {
+		dev_err(priv->dev, "Failed to enable clock\n");
+		return ret;
+	}
+
+	old->clk_rate = clk_get_rate(priv->secclk);
+	ret = clk_set_rate(priv->secclk, priv->soc_data->qfprom_blow_set_freq);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set clock rate for enable\n");
+		goto err_clk_prepared;
+	}
+
+	ret = regulator_enable(priv->vcc);
+	if (ret) {
+		dev_err(priv->dev, "Failed to enable regulator\n");
+		goto err_clk_rate_set;
+	}
+
+	old->timer_val = readl(priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
+	old->accel_val = readl(priv->qfpconf + QFPROM_ACCEL_OFFSET);
+	writel(priv->soc_data->qfprom_blow_timer_value,
+	       priv->qfpconf + QFPROM_BLOW_TIMER_OFFSET);
+	writel(priv->soc_data->accel_value,
+	       priv->qfpconf + QFPROM_ACCEL_OFFSET);
+
+	return 0;
+
+err_clk_rate_set:
+	clk_set_rate(priv->secclk, old->clk_rate);
+err_clk_prepared:
+	clk_disable_unprepare(priv->secclk);
+	return ret;
+}
+
+/**
+ * qfprom_efuse_reg_write() - Write to fuses.
+ * @context: Our driver data.
+ * @reg:     The offset to write at.
+ * @_val:    Pointer to data to write.
+ * @bytes:   The number of bytes to write.
+ *
+ * Writes to fuses.  WARNING: THIS IS PERMANENT.
+ *
+ * Return: 0 or -err.
+ */
+static int qfprom_reg_write(void *context, unsigned int reg, void *_val,
+			    size_t bytes)
+{
+	struct qfprom_priv *priv = context;
+	struct qfprom_touched_values old;
+	int words = bytes / 4;
+	u32 *value = _val;
+	u32 blow_status;
+	int ret;
+	int i;
+
+	dev_dbg(priv->dev,
+		"Writing to raw qfprom region : %#010x of size: %zu\n",
+		reg, bytes);
+
+	/*
+	 * The hardware only allows us to write word at a time, but we can
+	 * read byte at a time.  Until the nvmem framework allows a separate
+	 * word_size and stride for reading vs. writing, we'll enforce here.
+	 */
+	if (bytes % 4) {
+		dev_err(priv->dev,
+			"%zu is not an integral number of words\n", bytes);
+		return -EINVAL;
+	}
+	if (reg % 4) {
+		dev_err(priv->dev,
+			"Invalid offset: %#x.  Must be word aligned\n", reg);
+		return -EINVAL;
+	}
+
+	ret = qfprom_enable_fuse_blowing(priv, &old);
+	if (ret)
+		return ret;
+
+	ret = readl_relaxed_poll_timeout(
+		priv->qfpconf + QFPROM_BLOW_STATUS_OFFSET,
+		blow_status, blow_status == QFPROM_BLOW_STATUS_READY,
+		QFPROM_FUSE_BLOW_POLL_US, QFPROM_FUSE_BLOW_TIMEOUT_US);
+
+	if (ret) {
+		dev_err(priv->dev,
+			"Timeout waiting for initial ready; aborting.\n");
+		goto exit_enabled_fuse_blowing;
+	}
+
+	for (i = 0; i < words; i++)
+		writel(value[i], priv->qfpraw + reg + (i * 4));
+
+	ret = readl_relaxed_poll_timeout(
+		priv->qfpconf + QFPROM_BLOW_STATUS_OFFSET,
+		blow_status, blow_status == QFPROM_BLOW_STATUS_READY,
+		QFPROM_FUSE_BLOW_POLL_US, QFPROM_FUSE_BLOW_TIMEOUT_US);
+
+	/* Give an error, but not much we can do in this case */
+	if (ret)
+		dev_err(priv->dev, "Timeout waiting for finish.\n");
+
+exit_enabled_fuse_blowing:
+	qfprom_disable_fuse_blowing(priv, &old);
+
+	return ret;
+}
+
 static int qfprom_reg_read(void *context,
 			unsigned int reg, void *_val, size_t bytes)
 {
 	struct qfprom_priv *priv = context;
 	u8 *val = _val;
 	int i = 0, words = bytes;
+	void __iomem *base = priv->qfpcorrected;
+
+	if (read_raw_data && priv->qfpraw)
+		base = priv->qfpraw;
 
 	while (words--)
-		*val++ = readb(priv->base + reg + i++);
+		*val++ = readb(base + reg + i++);
 
 	return 0;
 }
 
-static struct nvmem_config econfig = {
-	.name = "qfprom",
-	.stride = 1,
-	.word_size = 1,
-	.reg_read = qfprom_reg_read,
+static const struct qfprom_soc_data qfprom_7_8_data = {
+	.accel_value = 0xD10,
+	.qfprom_blow_timer_value = 25,
+	.qfprom_blow_set_freq = 4800000,
 };
 
 static int qfprom_probe(struct platform_device *pdev)
 {
+	struct nvmem_config econfig = {
+		.name = "qfprom",
+		.stride = 1,
+		.word_size = 1,
+		.reg_read = qfprom_reg_read,
+	};
 	struct device *dev = &pdev->dev;
 	struct resource *res;
 	struct nvmem_device *nvmem;
 	struct qfprom_priv *priv;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
+	/* The corrected section is always provided */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(priv->base))
-		return PTR_ERR(priv->base);
+	priv->qfpcorrected = devm_ioremap_resource(dev, res);
+	if (IS_ERR(priv->qfpcorrected))
+		return PTR_ERR(priv->qfpcorrected);
 
 	econfig.size = resource_size(res);
 	econfig.dev = dev;
 	econfig.priv = priv;
 
+	priv->dev = dev;
+
+	/*
+	 * If more than one region is provided then the OS has the ability
+	 * to write.
+	 */
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
+	if (res) {
+		u32 version;
+		int major_version, minor_version;
+
+		priv->qfpraw = devm_ioremap_resource(dev, res);
+		if (IS_ERR(priv->qfpraw))
+			return PTR_ERR(priv->qfpraw);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
+		priv->qfpconf = devm_ioremap_resource(dev, res);
+		if (IS_ERR(priv->qfpconf))
+			return PTR_ERR(priv->qfpconf);
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
+		priv->qfpsecurity = devm_ioremap_resource(dev, res);
+		if (IS_ERR(priv->qfpsecurity))
+			return PTR_ERR(priv->qfpsecurity);
+
+		version = readl(priv->qfpsecurity + QFPROM_VERSION_OFFSET);
+		major_version = (version >> QFPROM_MAJOR_VERSION_SHIFT) &
+				QFPROM_MAJOR_VERSION_MASK;
+		minor_version = (version >> QFPROM_MINOR_VERSION_SHIFT) &
+				QFPROM_MINOR_VERSION_MASK;
+
+		if (major_version == 7 && minor_version == 8)
+			priv->soc_data = &qfprom_7_8_data;
+
+		/* Only enable writing if we have SoC data. */
+		if (priv->soc_data)
+			econfig.reg_write = qfprom_reg_write;
+	}
+
+	priv->vcc = devm_regulator_get(&pdev->dev, "vcc");
+	if (IS_ERR(priv->vcc))
+		return PTR_ERR(priv->vcc);
+
+	priv->secclk = devm_clk_get_optional(dev, "sec");
+	if (IS_ERR(priv->secclk)) {
+		ret = PTR_ERR(priv->secclk);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "sec error getting : %d\n", ret);
+		return ret;
+	}
+
 	nvmem = devm_nvmem_register(dev, &econfig);
 
 	return PTR_ERR_OR_ZERO(nvmem);
-- 
2.27.0.290.gba653c62da-goog

