Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0E5C41B1F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 16:20:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241119AbhI1OWL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 10:22:11 -0400
Received: from mx22.baidu.com ([220.181.50.185]:49006 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S241250AbhI1OWL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 10:22:11 -0400
Received: from BJHW-Mail-Ex10.internal.baidu.com (unknown [10.127.64.33])
        by Forcepoint Email with ESMTPS id 02B3954948E5B884FAF2;
        Tue, 28 Sep 2021 22:20:28 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BJHW-Mail-Ex10.internal.baidu.com (10.127.64.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 28 Sep 2021 22:20:27 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Tue, 28 Sep 2021 22:20:26 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        "Neil Armstrong" <narmstrong@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>
Subject: [PATCH v3 5/9] iio: adc: max1241: Make use of the helper function dev_err_probe()
Date:   Tue, 28 Sep 2021 22:19:51 +0800
Message-ID: <20210928141956.2148-5-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210928141956.2148-1-caihuoqing@baidu.com>
References: <20210928141956.2148-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BJHW-Mail-Ex13.internal.baidu.com (10.127.64.36) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
X-Baidu-BdMsfe-DateCheck: 1_BJHW-Mail-Ex10_2021-09-28 22:20:27:974
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/iio/adc/max1241.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/adc/max1241.c b/drivers/iio/adc/max1241.c
index b60f8448f21a..130ca8dc6fa0 100644
--- a/drivers/iio/adc/max1241.c
+++ b/drivers/iio/adc/max1241.c
@@ -148,10 +148,9 @@ static int max1241_probe(struct spi_device *spi)
 	mutex_init(&adc->lock);
 
 	adc->vdd = devm_regulator_get(dev, "vdd");
-	if (IS_ERR(adc->vdd)) {
-		dev_err(dev, "failed to get vdd regulator\n");
-		return PTR_ERR(adc->vdd);
-	}
+	if (IS_ERR(adc->vdd))
+		return dev_err_probe(dev, PTR_ERR(adc->vdd),
+				     "failed to get vdd regulator\n");
 
 	ret = regulator_enable(adc->vdd);
 	if (ret)
@@ -164,10 +163,9 @@ static int max1241_probe(struct spi_device *spi)
 	}
 
 	adc->vref = devm_regulator_get(dev, "vref");
-	if (IS_ERR(adc->vref)) {
-		dev_err(dev, "failed to get vref regulator\n");
-		return PTR_ERR(adc->vref);
-	}
+	if (IS_ERR(adc->vref))
+		return dev_err_probe(dev, PTR_ERR(adc->vref),
+				     "failed to get vref regulator\n");
 
 	ret = regulator_enable(adc->vref);
 	if (ret)
-- 
2.25.1

