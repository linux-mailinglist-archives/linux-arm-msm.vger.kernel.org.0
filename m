Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75DD374F70F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Jul 2023 19:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbjGKRW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Jul 2023 13:22:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232766AbjGKRWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Jul 2023 13:22:05 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84ABF1986
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Jul 2023 10:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689096094; x=1720632094;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u9L8bC8uc7avplPhBiWwS/Uu0Hqr1Wth57luzKoKJGU=;
  b=BlsRuKcDnc4RzLH6EdStICbnjZ48IX+ww9JgzMnWoc3fiyYEIrQ1ZltY
   4U1kom8+mKuDEWI4i8slQCEoCfdoZ0ZotgBRenxSlIp1p1HGYxfBN6xfA
   rddC0Zer2JBrcVFGfcf7m+aG0/IDRnlKTz/xt2F0ibWJ5+BAVbDJwfqIz
   n1zjjBMucCcEXuHUxuWdRj10Cmdt5zloWCZ75fb37v62uOMPtXEkhIGsM
   iQ8RioavVBjjlHImKplQwCPJQLHKoNjooxBoSrhMspDGrI+wXDjVJgTKQ
   5khWUcZdi0j9GxJDVvJL8D3ymiO72j58mqMf2tLPRbM/XGN3dLZaXs87Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="362148925"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="362148925"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 10:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715240913"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="715240913"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 10:18:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 896E669F; Tue, 11 Jul 2023 20:17:59 +0300 (EEST)
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
Subject: [PATCH v3 08/14] spi: Sort headers alphabetically
Date:   Tue, 11 Jul 2023 20:17:50 +0300
Message-Id: <20230711171756.86736-9-andriy.shevchenko@linux.intel.com>
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

Sorting headers alphabetically helps locating duplicates, and
make it easier to figure out where to insert new headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/spi/spi.c       | 42 ++++++++++++++++++++---------------------
 include/linux/spi/spi.h | 14 +++++++-------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 0259516a6943..9b096cbc9926 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -4,36 +4,36 @@
 // Copyright (C) 2005 David Brownell
 // Copyright (C) 2008 Secret Lab Technologies Ltd.
 
-#include <linux/kernel.h>
-#include <linux/device.h>
-#include <linux/init.h>
+#include <linux/acpi.h>
 #include <linux/cache.h>
-#include <linux/dma-mapping.h>
+#include <linux/clk/clk-conf.h>
+#include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <linux/export.h>
+#include <linux/gpio/consumer.h>
+#include <linux/highmem.h>
+#include <linux/idr.h>
+#include <linux/init.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/kthread.h>
+#include <linux/mod_devicetable.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 #include <linux/of_irq.h>
-#include <linux/clk/clk-conf.h>
-#include <linux/slab.h>
-#include <linux/mod_devicetable.h>
-#include <linux/spi/spi.h>
-#include <linux/spi/spi-mem.h>
-#include <linux/gpio/consumer.h>
-#include <linux/pm_runtime.h>
+#include <linux/percpu.h>
+#include <linux/platform_data/x86/apple.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
-#include <linux/export.h>
+#include <linux/ptp_clock_kernel.h>
 #include <linux/sched/rt.h>
+#include <linux/slab.h>
+#include <linux/spi/spi.h>
+#include <linux/spi/spi-mem.h>
 #include <uapi/linux/sched/types.h>
-#include <linux/delay.h>
-#include <linux/kthread.h>
-#include <linux/ioport.h>
-#include <linux/acpi.h>
-#include <linux/highmem.h>
-#include <linux/idr.h>
-#include <linux/platform_data/x86/apple.h>
-#include <linux/ptp_clock_kernel.h>
-#include <linux/percpu.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/spi.h>
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 32c94eae8926..21b77bdfac29 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -6,19 +6,19 @@
 #ifndef __LINUX_SPI_H
 #define __LINUX_SPI_H
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/completion.h>
 #include <linux/device.h>
-#include <linux/mod_devicetable.h>
-#include <linux/slab.h>
+#include <linux/gpio/consumer.h>
 #include <linux/kthread.h>
-#include <linux/completion.h>
+#include <linux/mod_devicetable.h>
 #include <linux/scatterlist.h>
-#include <linux/gpio/consumer.h>
-
-#include <uapi/linux/spi/spi.h>
-#include <linux/acpi.h>
+#include <linux/slab.h>
 #include <linux/u64_stats_sync.h>
 
+#include <uapi/linux/spi/spi.h>
+
 struct dma_chan;
 struct software_node;
 struct ptp_system_timestamp;
-- 
2.40.0.1.gaa8946217a0b

