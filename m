Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBBF336A38
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 03:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbhCKClv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Mar 2021 21:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhCKClZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Mar 2021 21:41:25 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61967C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 18:41:14 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id n17so5931704plc.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Mar 2021 18:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=NYHDYFL+H/8F51c0dOyRB4szn9MeyLhVvErIv4frmL4=;
        b=YMn9Nx0xz/M94fr8Pmuu8CTrwz9Fgfgq1wqlPgE4zrDUJJwlXn1RK4nPnwOBEMith5
         EFXhlOw7q40AmZ1oNuatFxLqAT8VnG0RdDY7I0+WaC1C3zXXs0Vv5NBejG7J8zdRZWnq
         XOhv68X/KgF/8ysmoLfnjGoKaotoYUiZXhnMqVnej1x55YM07W1QsvXzx3RQs1bWGruX
         G3tYaFKgLyhQDMeX7NXirZ2U+hLjGn8Cp8By9S/4eb9ReKimF/Qq+pxWG9wSkTcdvVtW
         YCm948i8oHDqJpA59nhLTfiog0QwLk0SNm14enjmog/5kfiTMFe9FtzeuVfE5YmRDCtx
         sAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NYHDYFL+H/8F51c0dOyRB4szn9MeyLhVvErIv4frmL4=;
        b=mUQrANjAGN/kqIu8lfnzOCN50z+W9cY6RBiYdyGbkTdCnK11baDfp9AjskNgIv/n/a
         Z07vdBT9PxF5VlrG/0EFEwuX2FczRi8pA2sP21NfaUqPx5cDpV+NzdC9EcBykCSSs992
         FIWdZQ6ujsJ2I/6nGY5CA3VyFJ66HzDwzUPiKYT1hW2RnI0m8a5r6bS+PGsxKDm209Mg
         eFvYkcQxDTTxxMKaghl689NIkXpsmhcZKUMEtIPVJBKeR+bfyYMLJ95z3c/tZMgxQqCu
         vGPaA6+ejP6dSsNjbDNcgOlsT+Y/Qi00DrNrQkwSaGLphItWetIf7wU8xKnbv/Nr25X8
         JcFQ==
X-Gm-Message-State: AOAM532G0i5S4JTGgr9wKvS1zMipuBwZ6P/RqFC72D21jwJhEPabyk2P
        QRNhoydeKqbYsQh5i5TcaYRiOQ==
X-Google-Smtp-Source: ABdhPJxnJSalfeeaSx6g5TnB3lZW3oytlMC7hPLROGgoH8GgR+2A7u8iOT/wdqUNQ66d548uMLRHMA==
X-Received: by 2002:a17:90a:9103:: with SMTP id k3mr6901840pjo.157.1615430473898;
        Wed, 10 Mar 2021 18:41:13 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id v27sm741885pfi.89.2021.03.10.18.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 18:41:13 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v5] pinctrl: qcom: sc8180x: add ACPI probe support
Date:   Thu, 11 Mar 2021 10:41:02 +0800
Message-Id: <20210311024102.15450-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It adds ACPI probe support for pinctrl-sc8180x driver.  We have one
problem with ACPI table, i.e. GIO0 (TLMM) block has one single memory
resource to cover 3 tiles defined by SC8180X.  To follow the hardware
layout of 3 tiles which is already supported DT probe, it adds one
function to replace the original single memory resource with 3 named
ones for tiles.  With that, We can map memory for ACPI in the same way
as DT.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
Changes for v5:
- Keep .ngpios number as 190 to match SoC spec.
- Add comments for sc8180x_pinctrl_add_tile_resources().
- Drop redundant error message.

Changes for v4:
- Add sc8180x_pinctrl_add_tile_resources() to massage memory resource
  for ACPI probe.

Changes for v3:
- Remove the use of tiles completely.
- Drop unneed include of acpi.h.

Changes for v2:
- Pass soc_data pointer via .driver_data.
- Drop use of CONFIG_ACPI and ACPI_PTR().
- Add comment for sc8180x_acpi_reserved_gpios[] terminator.

 drivers/pinctrl/qcom/Kconfig           |   2 +-
 drivers/pinctrl/qcom/pinctrl-sc8180x.c | 123 ++++++++++++++++++++++++-
 2 files changed, 122 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 6853a896c476..9f0218c4f9b3 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -222,7 +222,7 @@ config PINCTRL_SC7280
 
 config PINCTRL_SC8180X
 	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
-	depends on GPIOLIB && OF
+	depends on GPIOLIB && (OF || ACPI)
 	select PINCTRL_MSM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
index b765bf667574..0d9654b4ab60 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
@@ -23,6 +23,21 @@ enum {
 	WEST
 };
 
+/*
+ * ACPI DSDT has one single memory resource for TLMM.  The offsets below are
+ * used to locate different tiles for ACPI probe.
+ */
+struct tile_info {
+	u32 offset;
+	u32 size;
+};
+
+static const struct tile_info sc8180x_tile_info[] = {
+	{ 0x00d00000, 0x00300000, },
+	{ 0x00500000, 0x00700000, },
+	{ 0x00100000, 0x00300000, },
+};
+
 #define FUNCTION(fname)					\
 	[msm_mux_##fname] = {				\
 		.name = #fname,				\
@@ -1557,6 +1572,13 @@ static const struct msm_pingroup sc8180x_groups[] = {
 	[193] = SDC_QDSD_PINGROUP(sdc2_data, 0x4b2000, 9, 0),
 };
 
+static const int sc8180x_acpi_reserved_gpios[] = {
+	0, 1, 2, 3,
+	47, 48, 49, 50,
+	126, 127, 128, 129,
+	-1 /* terminator */
+};
+
 static const struct msm_gpio_wakeirq_map sc8180x_pdc_map[] = {
 	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 }, { 12, 104 },
 	{ 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 }, { 30, 39 }, { 36, 43 },
@@ -1588,13 +1610,109 @@ static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
 	.nwakeirq_map = ARRAY_SIZE(sc8180x_pdc_map),
 };
 
+static const struct msm_pinctrl_soc_data sc8180x_acpi_pinctrl = {
+	.tiles = sc8180x_tiles,
+	.ntiles = ARRAY_SIZE(sc8180x_tiles),
+	.pins = sc8180x_pins,
+	.npins = ARRAY_SIZE(sc8180x_pins),
+	.groups = sc8180x_groups,
+	.ngroups = ARRAY_SIZE(sc8180x_groups),
+	.reserved_gpios = sc8180x_acpi_reserved_gpios,
+	.ngpios = 190,
+};
+
+/*
+ * ACPI DSDT has one single memory resource for TLMM, which voilates the
+ * hardware layout of 3 sepearte tiles.  Let's split the memory resource into
+ * 3 named ones, so that msm_pinctrl_probe() can map memory for ACPI in the
+ * same way as for DT probe.
+ */
+static int sc8180x_pinctrl_add_tile_resources(struct platform_device *pdev)
+{
+	int nres_num = pdev->num_resources + ARRAY_SIZE(sc8180x_tiles) - 1;
+	struct resource *mres, *nres, *res;
+	int i, ret;
+
+	/*
+	 * DT already has tiles defined properly, so nothing needs to be done
+	 * for DT probe.
+	 */
+	if (pdev->dev.of_node)
+		return 0;
+
+	/* Allocate for new resources */
+	nres = devm_kzalloc(&pdev->dev, sizeof(*nres) * nres_num, GFP_KERNEL);
+	if (!nres)
+		return -ENOMEM;
+
+	res = nres;
+
+	for (i = 0; i < pdev->num_resources; i++) {
+		struct resource *r = &pdev->resource[i];
+
+		/* Save memory resource and copy others */
+		if (resource_type(r) == IORESOURCE_MEM)
+			mres = r;
+		else
+			*res++ = *r;
+	}
+
+	/* Append tile memory resources */
+	for (i = 0; i < ARRAY_SIZE(sc8180x_tiles); i++, res++) {
+		const struct tile_info *info = &sc8180x_tile_info[i];
+
+		res->start = mres->start + info->offset;
+		res->end = mres->start + info->offset + info->size - 1;
+		res->flags = mres->flags;
+		res->name = sc8180x_tiles[i];
+
+		/* Add new MEM to resource tree */
+		insert_resource(mres->parent, res);
+	}
+
+	/* Remove old MEM from resource tree */
+	remove_resource(mres);
+
+	/* Free old resources and install new ones */
+	ret = platform_device_add_resources(pdev, nres, nres_num);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to add new resources: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int sc8180x_pinctrl_probe(struct platform_device *pdev)
 {
-	return msm_pinctrl_probe(pdev, &sc8180x_pinctrl);
+	const struct msm_pinctrl_soc_data *soc_data;
+	int ret;
+
+	soc_data = device_get_match_data(&pdev->dev);
+	if (!soc_data)
+		return -EINVAL;
+
+	ret = sc8180x_pinctrl_add_tile_resources(pdev);
+	if (ret)
+		return ret;
+
+	return msm_pinctrl_probe(pdev, soc_data);
 }
 
+static const struct acpi_device_id sc8180x_pinctrl_acpi_match[] = {
+	{
+		.id = "QCOM040D",
+		.driver_data = (kernel_ulong_t) &sc8180x_acpi_pinctrl,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, sc8180x_pinctrl_acpi_match);
+
 static const struct of_device_id sc8180x_pinctrl_of_match[] = {
-	{ .compatible = "qcom,sc8180x-tlmm", },
+	{
+		.compatible = "qcom,sc8180x-tlmm",
+		.data = &sc8180x_pinctrl,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, sc8180x_pinctrl_of_match);
@@ -1603,6 +1721,7 @@ static struct platform_driver sc8180x_pinctrl_driver = {
 	.driver = {
 		.name = "sc8180x-pinctrl",
 		.of_match_table = sc8180x_pinctrl_of_match,
+		.acpi_match_table = sc8180x_pinctrl_acpi_match,
 	},
 	.probe = sc8180x_pinctrl_probe,
 	.remove = msm_pinctrl_remove,
-- 
2.17.1

