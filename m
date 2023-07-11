Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E152974F707
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 19:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbjGKRVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 13:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbjGKRV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 13:21:26 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5655A1BDF
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689096050; x=1720632050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AaJS6i6oBeO9EHp15z+Qk/kBsYr58o4Zqaz8k2QQyPM=;
  b=besFF63/1ldIjzdrAqaHEJ2vQzRUpbBNVgUjObl/Ual8GXkkxByn1kw5
   gx4JcmmV2Cv0Sz7YAgYMG69kgDNKkElAwNcdhq/wy5K167IZsDE+5hKJa
   7FsDow4UTwhgiDjhNGs2g7b401pUrynWQbKkaBlQbNMVRJvD0Jc4zeoml
   YzNczKL6kl697DFvnh1Oa6lky+y1FVBaqbQFN4js5kvTK10px3B+ITIsh
   ZlpApT6jmPoLiivH9KIZ6BS+o7RteXTO75SNqdv2tVbxQRTqRsEmo1WJO
   omITVe58iknMXE1pCMu9OclD2VlMXdZAdVsq79nSlhnpmwLi8fpbSUKDX
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148794"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="362148794"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240843"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="715240843"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:17:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4C9884BD; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>,
        Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amit Kumar Mahapatra via Alsa-devel 
        <alsa-devel@alsa-project.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-riscv@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc:     Sanjay R Mehta <sanju.mehta@amd.com>,
        Radu Pirea <radu_nicolae.pirea@upb.ro>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 04/14] spi: Remove code duplication in spi_add_device*()
Date:   Tue, 11 Jul 2023 20:17:46 +0300
Message-Id: <20230711171756.86736-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
References: <20230711171756.86736-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The commit 0c79378c0199 ("spi: add ancillary device support")
added a dozen of duplicating lines of code. We may move them
to the __spi_add_device(). Note, that the code may be called
under the mutex.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 6d74218cf38e..876d40d2c708 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -631,6 +631,16 @@ static int __spi_add_device(struct spi_device *spi)
 	struct device *dev = ctlr->dev.parent;
 	int status;
 
+	/* Chipselects are numbered 0..max; validate. */
+	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
+		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
+			ctlr->num_chipselect);
+		return -EINVAL;
+	}
+
+	/* Set the bus ID string */
+	spi_dev_set_name(spi);
+
 	/*
 	 * We need to make sure there's no other device with this
 	 * chipselect **BEFORE** we call setup(), else we'll trash
@@ -689,19 +699,8 @@ static int __spi_add_device(struct spi_device *spi)
 int spi_add_device(struct spi_device *spi)
 {
 	struct spi_controller *ctlr = spi->controller;
-	struct device *dev = ctlr->dev.parent;
 	int status;
 
-	/* Chipselects are numbered 0..max; validate. */
-	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
-		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
-			ctlr->num_chipselect);
-		return -EINVAL;
-	}
-
-	/* Set the bus ID string */
-	spi_dev_set_name(spi);
-
 	mutex_lock(&ctlr->add_lock);
 	status = __spi_add_device(spi);
 	mutex_unlock(&ctlr->add_lock);
@@ -712,17 +711,6 @@ EXPORT_SYMBOL_GPL(spi_add_device);
 static int spi_add_device_locked(struct spi_device *spi)
 {
 	struct spi_controller *ctlr = spi->controller;
-	struct device *dev = ctlr->dev.parent;
-
-	/* Chipselects are numbered 0..max; validate. */
-	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
-		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
-			ctlr->num_chipselect);
-		return -EINVAL;
-	}
-
-	/* Set the bus ID string */
-	spi_dev_set_name(spi);
 
 	WARN_ON(!mutex_is_locked(&ctlr->add_lock));
 	return __spi_add_device(spi);
-- 
2.40.0.1.gaa8946217a0b

