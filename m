Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E700C6A1763
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Feb 2023 08:39:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjBXHjq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Feb 2023 02:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjBXHjo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Feb 2023 02:39:44 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDA55507D;
        Thu, 23 Feb 2023 23:39:06 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s26so51366323edw.11;
        Thu, 23 Feb 2023 23:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m/Cxoh6V+BgcmchZ+10xr/6oU7fU3F9s3pEwnrYxX0A=;
        b=eVK2ynhIpTGqiEAlBOej0FWvBN5smLlVmVZ+pWu7JvvCg6UulQB0KgZlQTjcoKCrAh
         oRjmkC4mCWtwKxsFkTxjxgQA+Ej6n6k0y/Tz++2QSdGOK2KI0y++ajwpJHqGCug/tVOk
         1mHahMWkHzsO5jvDg7ZHWUg5dCEVVbZoi+80L84AG/3TX7pLM1sCBFXzi9fdINZjbktc
         uiJU7MRok2IaGIfusCQ18RPkbEveIXu4Wv7yYRJ4fjIxlG/FbwS3DGJyVlTz4pq1fIh9
         5KU3AJ8QooP7uK0M3bqXsh0jrZGQEXX9j8iNZDZF5DlQF7SpinRPlbEm6WOZlx50Jkjd
         LSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m/Cxoh6V+BgcmchZ+10xr/6oU7fU3F9s3pEwnrYxX0A=;
        b=mHu5U4/mTZoTU1q9thu5qfQWWi/XFE6gH5zMtgnnuWblVWjAfBbT1GgdM+c5cd2Egf
         fgFQ3Fvxc6qzQAl4cRBqDEoLdGjig61jVNkP+q5+ANzWvG1RZFGXc2HIwGqX1PyisxcB
         zg7jZXSpYZw19QqLDEI2NQ1yFTF5xWgE7sgKhX1atRnC4cF4H3jirp6ELW5y73nBAU7X
         F3SIGOKEiQ8ui1e6d3HUQcBeddrCmqZ7NEKtPnHlbs6tSom7CaPVx4y+UntLsxzF+HZt
         Jod0CW8ufA1rIvJXGCP3Wpr5mSTZ3PMbJ1NPnHFUMveOAq67+Gxbi86+6X+Cox+yNMBd
         2fog==
X-Gm-Message-State: AO0yUKVF2hUrxQCRyJfB4viuo42y/h8aL+SmH1w+jO7h6TGP/4DpQc6a
        qNo3pXE4mgtYpuHpai4Bml4PMOtqSukK3w==
X-Google-Smtp-Source: AK7set/Ibo1grGw27G8ZssjK/q0QmJczYwyRA6AUAZG1VKg4S3qwR2gPUxHO86Ix5iGu10EYUuh1KQ==
X-Received: by 2002:a05:6512:145:b0:4cc:a166:e27f with SMTP id m5-20020a056512014500b004cca166e27fmr4642606lfo.3.1677223754408;
        Thu, 23 Feb 2023 23:29:14 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id v12-20020a056512048c00b004cc9edb0f99sm906082lfq.44.2023.02.23.23.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 23:29:13 -0800 (PST)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vincent Shih <vincent.sunplus@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Evgeniy Polyakov <zbr@ioremap.net>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-rtc@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2] nvmem: add explicit config option to read OF fixed cells
Date:   Fri, 24 Feb 2023 08:29:03 +0100
Message-Id: <20230224072903.20945-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

NVMEM subsystem looks for fixed NVMEM cells (specified in DT) by
default. This behaviour made sense in early days before adding support
for dynamic cells.

With every new supported NVMEM device with dynamic cells current
behaviour becomes non-optimal. It results in unneeded iterating over DT
nodes and may result in false discovery of cells (depending on used DT
properties).

This behaviour has actually caused a problem already with the MTD
subsystem. MTD subpartitions were incorrectly treated as NVMEM cells.

Also with upcoming support for NVMEM layouts no new binding or driver
should support fixed cells defined in device node.

Solve this by modifying drivers for bindings that support specifying
fixed NVMEM cells in DT. Make them explicitly tell NVMEM subsystem to
read cells from DT.

It wasn't clear (to me) if rtc and w1 code actually uses fixed cells. I
enabled them to don't risk any breakage.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
[for drivers/nvmem/meson-{efuse,mx-efuse}.c]
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
V2: Fix stm32-romem.c typo breaking its compilation
    Pick Martin's Acked-by
    Add paragraph about layouts deprecating use_fixed_of_cells
---
 drivers/mtd/mtdcore.c          | 2 ++
 drivers/nvmem/apple-efuses.c   | 1 +
 drivers/nvmem/core.c           | 8 +++++---
 drivers/nvmem/imx-ocotp-scu.c  | 1 +
 drivers/nvmem/imx-ocotp.c      | 1 +
 drivers/nvmem/meson-efuse.c    | 1 +
 drivers/nvmem/meson-mx-efuse.c | 1 +
 drivers/nvmem/microchip-otpc.c | 1 +
 drivers/nvmem/mtk-efuse.c      | 1 +
 drivers/nvmem/qcom-spmi-sdam.c | 1 +
 drivers/nvmem/qfprom.c         | 1 +
 drivers/nvmem/rave-sp-eeprom.c | 1 +
 drivers/nvmem/rockchip-efuse.c | 1 +
 drivers/nvmem/sc27xx-efuse.c   | 1 +
 drivers/nvmem/sprd-efuse.c     | 1 +
 drivers/nvmem/stm32-romem.c    | 1 +
 drivers/nvmem/sunplus-ocotp.c  | 1 +
 drivers/nvmem/sunxi_sid.c      | 1 +
 drivers/nvmem/uniphier-efuse.c | 1 +
 drivers/nvmem/zynqmp_nvmem.c   | 1 +
 drivers/rtc/nvmem.c            | 1 +
 drivers/w1/slaves/w1_ds250x.c  | 1 +
 include/linux/nvmem-provider.h | 2 ++
 23 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0feacb9fbdac..1bb479c0f758 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -523,6 +523,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 	config.dev = &mtd->dev;
 	config.name = dev_name(&mtd->dev);
 	config.owner = THIS_MODULE;
+	config.use_fixed_of_cells = of_device_is_compatible(node, "nvmem-cells");
 	config.reg_read = mtd_nvmem_reg_read;
 	config.size = mtd->size;
 	config.word_size = 1;
@@ -891,6 +892,7 @@ static struct nvmem_device *mtd_otp_nvmem_register(struct mtd_info *mtd,
 	config.name = kasprintf(GFP_KERNEL, "%s-%s", dev_name(&mtd->dev), compatible);
 	config.id = NVMEM_DEVID_NONE;
 	config.owner = THIS_MODULE;
+	config.use_fixed_of_cells = true;
 	config.type = NVMEM_TYPE_OTP;
 	config.root_only = true;
 	config.ignore_wp = true;
diff --git a/drivers/nvmem/apple-efuses.c b/drivers/nvmem/apple-efuses.c
index 9b7c87102104..0119bac43b2c 100644
--- a/drivers/nvmem/apple-efuses.c
+++ b/drivers/nvmem/apple-efuses.c
@@ -36,6 +36,7 @@ static int apple_efuses_probe(struct platform_device *pdev)
 	struct resource *res;
 	struct nvmem_config config = {
 		.dev = &pdev->dev,
+		.use_fixed_of_cells = true,
 		.read_only = true,
 		.reg_read = apple_efuses_read,
 		.stride = sizeof(u32),
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 174ef3574e07..6783cd8478d7 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -844,9 +844,11 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (rval)
 		goto err_remove_cells;
 
-	rval = nvmem_add_cells_from_of(nvmem);
-	if (rval)
-		goto err_remove_cells;
+	if (config->use_fixed_of_cells) {
+		rval = nvmem_add_cells_from_of(nvmem);
+		if (rval)
+			goto err_remove_cells;
+	}
 
 	dev_dbg(&nvmem->dev, "Registering nvmem device %s\n", config->name);
 
diff --git a/drivers/nvmem/imx-ocotp-scu.c b/drivers/nvmem/imx-ocotp-scu.c
index 399e1eb8b4c1..ec5cce7c6697 100644
--- a/drivers/nvmem/imx-ocotp-scu.c
+++ b/drivers/nvmem/imx-ocotp-scu.c
@@ -220,6 +220,7 @@ static int imx_scu_ocotp_write(void *context, unsigned int offset,
 
 static struct nvmem_config imx_scu_ocotp_nvmem_config = {
 	.name = "imx-scu-ocotp",
+	.use_fixed_of_cells = true,
 	.read_only = false,
 	.word_size = 4,
 	.stride = 1,
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index e9b52ecb3f72..e37a82f98ba6 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -616,6 +616,7 @@ static int imx_ocotp_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 
 	priv->params = of_device_get_match_data(&pdev->dev);
+	imx_ocotp_nvmem_config.use_fixed_of_cells = true;
 	imx_ocotp_nvmem_config.size = 4 * priv->params->nregs;
 	imx_ocotp_nvmem_config.dev = dev;
 	imx_ocotp_nvmem_config.priv = priv;
diff --git a/drivers/nvmem/meson-efuse.c b/drivers/nvmem/meson-efuse.c
index d6b533497ce1..657e171d5af3 100644
--- a/drivers/nvmem/meson-efuse.c
+++ b/drivers/nvmem/meson-efuse.c
@@ -93,6 +93,7 @@ static int meson_efuse_probe(struct platform_device *pdev)
 
 	econfig->dev = dev;
 	econfig->name = dev_name(dev);
+	econfig->use_fixed_of_cells = true;
 	econfig->stride = 1;
 	econfig->word_size = 1;
 	econfig->reg_read = meson_efuse_read;
diff --git a/drivers/nvmem/meson-mx-efuse.c b/drivers/nvmem/meson-mx-efuse.c
index 13eb14316f46..7cc51391ec9c 100644
--- a/drivers/nvmem/meson-mx-efuse.c
+++ b/drivers/nvmem/meson-mx-efuse.c
@@ -213,6 +213,7 @@ static int meson_mx_efuse_probe(struct platform_device *pdev)
 	efuse->config.owner = THIS_MODULE;
 	efuse->config.dev = &pdev->dev;
 	efuse->config.priv = efuse;
+	efuse->config.use_fixed_of_cells = true;
 	efuse->config.stride = drvdata->word_size;
 	efuse->config.word_size = drvdata->word_size;
 	efuse->config.size = SZ_512;
diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index 436e0dc4f337..fb920fd7a8fc 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -261,6 +261,7 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 		return ret;
 
 	mchp_nvmem_config.dev = otpc->dev;
+	mchp_nvmem_config.use_fixed_of_cells = true;
 	mchp_nvmem_config.size = size;
 	mchp_nvmem_config.priv = otpc;
 	nvmem = devm_nvmem_register(&pdev->dev, &mchp_nvmem_config);
diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index a08e0aedd21c..1947337a121f 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -45,6 +45,7 @@ static int mtk_efuse_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	econfig.use_fixed_of_cells = true;
 	econfig.stride = 1;
 	econfig.word_size = 1;
 	econfig.reg_read = mtk_reg_read;
diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index f822790db49e..b547def94b5b 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -142,6 +142,7 @@ static int sdam_probe(struct platform_device *pdev)
 	sdam->sdam_config.name = "spmi_sdam";
 	sdam->sdam_config.id = NVMEM_DEVID_AUTO;
 	sdam->sdam_config.owner = THIS_MODULE;
+	sdam->sdam_config.use_fixed_of_cells = true;
 	sdam->sdam_config.stride = 1;
 	sdam->sdam_config.word_size = 1;
 	sdam->sdam_config.reg_read = sdam_read;
diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
index c1e893c8a247..eb126d507561 100644
--- a/drivers/nvmem/qfprom.c
+++ b/drivers/nvmem/qfprom.c
@@ -357,6 +357,7 @@ static int qfprom_probe(struct platform_device *pdev)
 {
 	struct nvmem_config econfig = {
 		.name = "qfprom",
+		.use_fixed_of_cells = true,
 		.stride = 1,
 		.word_size = 1,
 		.id = NVMEM_DEVID_AUTO,
diff --git a/drivers/nvmem/rave-sp-eeprom.c b/drivers/nvmem/rave-sp-eeprom.c
index c456011b75e8..e9b4c7927e37 100644
--- a/drivers/nvmem/rave-sp-eeprom.c
+++ b/drivers/nvmem/rave-sp-eeprom.c
@@ -328,6 +328,7 @@ static int rave_sp_eeprom_probe(struct platform_device *pdev)
 	of_property_read_string(np, "zii,eeprom-name", &config.name);
 	config.priv		= eeprom;
 	config.dev		= dev;
+	config.use_fixed_of_cells	= true;
 	config.size		= size;
 	config.reg_read		= rave_sp_eeprom_reg_read;
 	config.reg_write	= rave_sp_eeprom_reg_write;
diff --git a/drivers/nvmem/rockchip-efuse.c b/drivers/nvmem/rockchip-efuse.c
index e4579de5d014..211f6e7401a9 100644
--- a/drivers/nvmem/rockchip-efuse.c
+++ b/drivers/nvmem/rockchip-efuse.c
@@ -205,6 +205,7 @@ static int rockchip_rk3399_efuse_read(void *context, unsigned int offset,
 
 static struct nvmem_config econfig = {
 	.name = "rockchip-efuse",
+	.use_fixed_of_cells = true,
 	.stride = 1,
 	.word_size = 1,
 	.read_only = true,
diff --git a/drivers/nvmem/sc27xx-efuse.c b/drivers/nvmem/sc27xx-efuse.c
index c825fc902d10..ed5cc4f3e2bc 100644
--- a/drivers/nvmem/sc27xx-efuse.c
+++ b/drivers/nvmem/sc27xx-efuse.c
@@ -248,6 +248,7 @@ static int sc27xx_efuse_probe(struct platform_device *pdev)
 	econfig.reg_read = sc27xx_efuse_read;
 	econfig.priv = efuse;
 	econfig.dev = &pdev->dev;
+	econfig.use_fixed_of_cells = true;
 	nvmem = devm_nvmem_register(&pdev->dev, &econfig);
 	if (IS_ERR(nvmem)) {
 		dev_err(&pdev->dev, "failed to register nvmem config\n");
diff --git a/drivers/nvmem/sprd-efuse.c b/drivers/nvmem/sprd-efuse.c
index 4f1fcbfec394..ef3161645f60 100644
--- a/drivers/nvmem/sprd-efuse.c
+++ b/drivers/nvmem/sprd-efuse.c
@@ -408,6 +408,7 @@ static int sprd_efuse_probe(struct platform_device *pdev)
 	econfig.read_only = false;
 	econfig.name = "sprd-efuse";
 	econfig.size = efuse->data->blk_nums * SPRD_EFUSE_BLOCK_WIDTH;
+	econfig.use_fixed_of_cells = true;
 	econfig.reg_read = sprd_efuse_read;
 	econfig.reg_write = sprd_efuse_write;
 	econfig.priv = efuse;
diff --git a/drivers/nvmem/stm32-romem.c b/drivers/nvmem/stm32-romem.c
index ba779e26937a..a6fc43acb797 100644
--- a/drivers/nvmem/stm32-romem.c
+++ b/drivers/nvmem/stm32-romem.c
@@ -208,6 +208,7 @@ static int stm32_romem_probe(struct platform_device *pdev)
 	priv->cfg.priv = priv;
 	priv->cfg.owner = THIS_MODULE;
 	priv->cfg.type = NVMEM_TYPE_OTP;
+	priv->cfg.use_fixed_of_cells = true;
 
 	priv->lower = 0;
 
diff --git a/drivers/nvmem/sunplus-ocotp.c b/drivers/nvmem/sunplus-ocotp.c
index 52b928a7a6d5..57e3e0833b85 100644
--- a/drivers/nvmem/sunplus-ocotp.c
+++ b/drivers/nvmem/sunplus-ocotp.c
@@ -145,6 +145,7 @@ static int sp_ocotp_read(void *priv, unsigned int offset, void *value, size_t by
 
 static struct nvmem_config sp_ocotp_nvmem_config = {
 	.name = "sp-ocotp",
+	.use_fixed_of_cells = true,
 	.read_only = true,
 	.word_size = 1,
 	.size = QAC628_OTP_SIZE,
diff --git a/drivers/nvmem/sunxi_sid.c b/drivers/nvmem/sunxi_sid.c
index a970f1741cc6..6ab7aa3724a0 100644
--- a/drivers/nvmem/sunxi_sid.c
+++ b/drivers/nvmem/sunxi_sid.c
@@ -156,6 +156,7 @@ static int sunxi_sid_probe(struct platform_device *pdev)
 	nvmem_cfg->dev = dev;
 	nvmem_cfg->name = "sunxi-sid";
 	nvmem_cfg->type = NVMEM_TYPE_OTP;
+	nvmem_cfg->use_fixed_of_cells = true;
 	nvmem_cfg->read_only = true;
 	nvmem_cfg->size = cfg->size;
 	nvmem_cfg->word_size = 1;
diff --git a/drivers/nvmem/uniphier-efuse.c b/drivers/nvmem/uniphier-efuse.c
index aca910b3b6f8..69b9dfe6ab6e 100644
--- a/drivers/nvmem/uniphier-efuse.c
+++ b/drivers/nvmem/uniphier-efuse.c
@@ -53,6 +53,7 @@ static int uniphier_efuse_probe(struct platform_device *pdev)
 	econfig.size = resource_size(res);
 	econfig.priv = priv;
 	econfig.dev = dev;
+	econfig.use_fixed_of_cells = true;
 	nvmem = devm_nvmem_register(dev, &econfig);
 
 	return PTR_ERR_OR_ZERO(nvmem);
diff --git a/drivers/nvmem/zynqmp_nvmem.c b/drivers/nvmem/zynqmp_nvmem.c
index e28d7b133e11..d13750a4c112 100644
--- a/drivers/nvmem/zynqmp_nvmem.c
+++ b/drivers/nvmem/zynqmp_nvmem.c
@@ -58,6 +58,7 @@ static int zynqmp_nvmem_probe(struct platform_device *pdev)
 
 	priv->dev = dev;
 	econfig.dev = dev;
+	econfig.use_fixed_of_cells = true;
 	econfig.reg_read = zynqmp_nvmem_read;
 	econfig.priv = priv;
 
diff --git a/drivers/rtc/nvmem.c b/drivers/rtc/nvmem.c
index 07ede21cee34..5cc039d92257 100644
--- a/drivers/rtc/nvmem.c
+++ b/drivers/rtc/nvmem.c
@@ -21,6 +21,7 @@ int devm_rtc_nvmem_register(struct rtc_device *rtc,
 
 	nvmem_config->dev = dev;
 	nvmem_config->owner = rtc->owner;
+	nvmem_config->use_fixed_of_cells = true;
 	nvmem = devm_nvmem_register(dev, nvmem_config);
 	if (IS_ERR(nvmem))
 		dev_err(dev, "failed to register nvmem device for RTC\n");
diff --git a/drivers/w1/slaves/w1_ds250x.c b/drivers/w1/slaves/w1_ds250x.c
index 7592c7050d1d..538722b41f87 100644
--- a/drivers/w1/slaves/w1_ds250x.c
+++ b/drivers/w1/slaves/w1_ds250x.c
@@ -168,6 +168,7 @@ static int w1_eprom_add_slave(struct w1_slave *sl)
 	struct nvmem_device *nvmem;
 	struct nvmem_config nvmem_cfg = {
 		.dev = &sl->dev,
+		.use_fixed_of_cells = true,
 		.reg_read = w1_nvmem_read,
 		.type = NVMEM_TYPE_OTP,
 		.read_only = true,
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 0262b86194eb..b3c14ce87a65 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -73,6 +73,7 @@ struct nvmem_cell_info {
  * @owner:	Pointer to exporter module. Used for refcounting.
  * @cells:	Optional array of pre-defined NVMEM cells.
  * @ncells:	Number of elements in cells.
+ * @use_fixed_of_cells:	Read fixed NVMEM cells from OF.
  * @keepout:	Optional array of keepout ranges (sorted ascending by start).
  * @nkeepout:	Number of elements in the keepout array.
  * @type:	Type of the nvmem storage
@@ -103,6 +104,7 @@ struct nvmem_config {
 	struct module		*owner;
 	const struct nvmem_cell_info	*cells;
 	int			ncells;
+	bool			use_fixed_of_cells;
 	const struct nvmem_keepout *keepout;
 	unsigned int		nkeepout;
 	enum nvmem_type		type;
-- 
2.34.1

