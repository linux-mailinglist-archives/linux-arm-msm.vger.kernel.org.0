Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C3D7D0A1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Oct 2023 09:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376515AbjJTH6o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Oct 2023 03:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376534AbjJTH5x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Oct 2023 03:57:53 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43F510C7
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Oct 2023 00:57:34 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtkN5-0003Fj-Un; Fri, 20 Oct 2023 09:56:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtkMx-002yU2-1K; Fri, 20 Oct 2023 09:56:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qtkMw-002OI5-Ky; Fri, 20 Oct 2023 09:56:30 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Corentin Labbe <clabbe.montjoie@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh@kernel.org>, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel@pengutronix.de, Yu Zhe <yuzhe@nfschina.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        linux-amlogic@lists.infradead.org,
        Neal Liu <neal_liu@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        linux-aspeed@lists.ozlabs.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Lars Persson <lars.persson@axis.com>,
        linux-arm-kernel@axis.com, Arnd Bergmann <arnd@arndb.de>,
        =?utf-8?q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
        Pankaj Gupta <pankaj.gupta@nxp.com>,
        Gaurav Jain <gaurav.jain@nxp.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>,
        Gilad Ben-Yossef <gilad@benyossef.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ruan Jinjie <ruanjinjie@huawei.com>,
        Weili Qian <qianweili@huawei.com>,
        Antoine Tenart <atenart@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Prabhjot Khurana <prabhjot.khurana@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Declan Murphy <declan.murphy@intel.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Srujana Challa <schalla@marvell.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org,
        Vladimir Zapolskiy <vz@mleia.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        nicolas.toromanoff@foss.st.com,
        Colin Ian King <colin.i.king@gmail.com>,
        Michal Simek <michal.simek@amd.com>,
        Harsha <harsha.harsha@amd.com>
Subject: [PATCH 00/42] crypto: Convert to platform remove callback returning void
Date:   Fri, 20 Oct 2023 09:55:22 +0200
Message-ID: <20231020075521.2121571-44-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7162; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fYXDo+SwqPnRrSUX87WtTlEzTyWK2MltdNBtAIlvcsY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlMjJpzE2HUlHZs4ihOe48KpSg21c2ql9H8myWo h6r03hLF1qJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZTIyaQAKCRCPgPtYfRL+ TmPfB/9iXQL87/7FycODWMIqK5SyN7m0xz9BefT+JqnVhBolt0QFiitxce7amXYenEA5T/ngM/A ll68RzsV2xXP63v8vRfOT5RbaPxKPxZxDmduVXk25ZHk6KI+l2h0G17x3auG7RXqDXc99l7SAr2 832TuJfCQQkvLcqZSsOTFWkEX9WLeyuyoosSA8EULIPxuxzA/425u2juMif/CGd0x7bbjR8d5jU oyRKkLnq19O1GpKO8tWROFB1t6RiknCXyUaOkYrDIhsNLpQcLjyX9vlm613jQ6XjX3I/WXrRQbD JUWWmh09UWlmgv0bGpXHzPQIlH5OCgKSRf05fwbFndVZySn7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

this series converts all platform drivers below drivers/crypto to use
.remove_new(). Compared to the traditional .remove() callback
.remove_new() returns no value. This is a good thing because the driver
core doesn't (and cannot) cope for errors during remove. The only effect
of a non-zero return value in .remove() is that the driver core emits a
warning. The device is removed anyhow and an early return from .remove()
usually yields resource leaks and/or use-after-free bugs.

There are three drivers that got that wrong and potentially returned an
error code (caam/jr.c, stm32/stm32-crc32.c, stm32/stm32-cryp.c). These
are fixed accordingly. The other drivers could be transformed trivially.

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

There are no interdependencies in this series. As there are still quite
a few drivers to convert, I'm happy about every patch that makes it in.
So even if there is a merge conflict with one patch until you apply (or
a different concern that doesn't apply to all patches), please apply the
remainder of this series anyhow. I'll come back to the part that you
(maybe) skipped at a later point.

Best regards and thanks
Uwe

Uwe Kleine-König (42):
  crypto: sun4i-ss - Convert to platform remove callback returning void
  crypto: sun8i-ce - Convert to platform remove callback returning void
  crypto: sun8i-ss - Convert to platform remove callback returning void
  crypto: amcc/crypto4xx - Convert to platform remove callback returning void
  crypto: amlogic-gxl-core - Convert to platform remove callback returning void
  crypto: aspeed-acry - Convert to platform remove callback returning void
  crypto: aspeed-hace - Convert to platform remove callback returning void
  crypto: atmel-aes - Convert to platform remove callback returning void
  crypto: atmel-sha - Convert to platform remove callback returning void
  crypto: atmel-tdes - Convert to platform remove callback returning void
  crypto: axis/artpec6 - Convert to platform remove callback returning void
  crypto: bcm/cipher - Convert to platform remove callback returning void
  crypto: caam/jr - Convert to platform remove callback returning void
  crypto: ccp/sp - Convert to platform remove callback returning void
  crypto: ccree/cc - Convert to platform remove callback returning void
  crypto: exynos-rng - Convert to platform remove callback returning void
  crypto: gemini/sl3516-ce - Convert to platform remove callback returning void
  crypto: hisilicon/sec - Convert to platform remove callback returning void
  crypto: hisilicon/trng - Convert to platform remove callback returning void
  crypto: img-hash - Convert to platform remove callback returning void
  crypto: inside-secure/safexcel - Convert to platform remove callback returning void
  crypto: intel/ixp4xx-crypto - Convert to platform remove callback returning void
  crypto: intel/keembay-ocs-aes - Convert to platform remove callback returning void
  crypto: intel/keembay-ocs-ecc - Convert to platform remove callback returning void
  crypto: intel/keembay-ocs-hcu - Convert to platform remove callback returning void
  crypto: marvell/cesa - Convert to platform remove callback returning void
  crypto: mxs-dcp - Convert to platform remove callback returning void
  crypto: n2_core - Convert to platform remove callback returning void
  crypto: omap-aes - Convert to platform remove callback returning void
  crypto: omap-des - Convert to platform remove callback returning void
  crypto: omap-sham - Convert to platform remove callback returning void
  crypto: qce - Convert to platform remove callback returning void
  crypto: qcom-rng - Convert to platform remove callback returning void
  crypto: rockchip/rk3288 - Convert to platform remove callback returning void
  crypto: s5p-sss - Convert to platform remove callback returning void
  crypto: sa2ul - Convert to platform remove callback returning void
  crypto: sahara - Convert to platform remove callback returning void
  crypto: stm32/crc32 - Convert to platform remove callback returning void
  crypto: stm32/cryp - Convert to platform remove callback returning void
  crypto: talitos - Convert to platform remove callback returning void
  crypto: xilinx/zynqmp-aes-gcm - Convert to platform remove callback returning void
  crypto: xilinx/zynqmp-sha - Convert to platform remove callback returning void

 .../crypto/allwinner/sun4i-ss/sun4i-ss-core.c |  5 ++---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  5 ++---
 .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  6 ++---
 drivers/crypto/amcc/crypto4xx_core.c          |  6 ++---
 drivers/crypto/amlogic/amlogic-gxl-core.c     |  5 ++---
 drivers/crypto/aspeed/aspeed-acry.c           |  6 ++---
 drivers/crypto/aspeed/aspeed-hace.c           |  6 ++---
 drivers/crypto/atmel-aes.c                    |  6 ++---
 drivers/crypto/atmel-sha.c                    |  6 ++---
 drivers/crypto/atmel-tdes.c                   |  6 ++---
 drivers/crypto/axis/artpec6_crypto.c          |  5 ++---
 drivers/crypto/bcm/cipher.c                   |  5 ++---
 drivers/crypto/caam/jr.c                      | 22 ++++++++-----------
 drivers/crypto/ccp/sp-platform.c              |  6 ++---
 drivers/crypto/ccree/cc_driver.c              |  6 ++---
 drivers/crypto/exynos-rng.c                   |  6 ++---
 drivers/crypto/gemini/sl3516-ce-core.c        |  6 ++---
 drivers/crypto/hisilicon/sec/sec_drv.c        |  6 ++---
 drivers/crypto/hisilicon/trng/trng.c          |  6 ++---
 drivers/crypto/img-hash.c                     |  6 ++---
 drivers/crypto/inside-secure/safexcel.c       |  6 ++---
 drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c   |  6 ++---
 .../intel/keembay/keembay-ocs-aes-core.c      |  6 ++---
 .../crypto/intel/keembay/keembay-ocs-ecc.c    |  6 ++---
 .../intel/keembay/keembay-ocs-hcu-core.c      |  6 ++---
 drivers/crypto/marvell/cesa/cesa.c            |  6 ++---
 drivers/crypto/mxs-dcp.c                      |  6 ++---
 drivers/crypto/n2_core.c                      | 12 ++++------
 drivers/crypto/omap-aes.c                     |  6 ++---
 drivers/crypto/omap-des.c                     |  6 ++---
 drivers/crypto/omap-sham.c                    |  6 ++---
 drivers/crypto/qce/core.c                     |  5 ++---
 drivers/crypto/qcom-rng.c                     |  6 ++---
 drivers/crypto/rockchip/rk3288_crypto.c       |  5 ++---
 drivers/crypto/s5p-sss.c                      |  6 ++---
 drivers/crypto/sa2ul.c                        |  6 ++---
 drivers/crypto/sahara.c                       |  6 ++---
 drivers/crypto/stm32/stm32-crc32.c            | 15 +++++--------
 drivers/crypto/stm32/stm32-cryp.c             | 16 +++++---------
 drivers/crypto/talitos.c                      |  6 ++---
 drivers/crypto/xilinx/zynqmp-aes-gcm.c        |  6 ++---
 drivers/crypto/xilinx/zynqmp-sha.c            |  6 ++---
 42 files changed, 99 insertions(+), 187 deletions(-)

base-commit: 4230ea146b1e64628f11e44290bb4008e391bc24
-- 
2.42.0

