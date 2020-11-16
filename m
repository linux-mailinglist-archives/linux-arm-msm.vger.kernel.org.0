Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858DA2B4426
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 14:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728141AbgKPM7k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 07:59:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:54160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727499AbgKPM7j (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 07:59:39 -0500
Received: from mail.kernel.org (ip5f5ad5de.dynamic.kabel-deutschland.de [95.90.213.222])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4BFE3222B9;
        Mon, 16 Nov 2020 12:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605531578;
        bh=qlGwSgPikpE0U2qe95ULJqOtEF/mssjj88IwK283zys=;
        h=From:To:Cc:Subject:Date:From;
        b=Cra0GlFHnGWBIw8P+Eo5um/rPlgQajX3XpgA4m579zA9pS9i0U56l2W7peRzrVxGn
         lvgGHNVVXjrQvNEdFh23spGNcWKrICz/xyj3aiSk+duMQmID3VtgPreHa5yX5Y65mq
         6niplTwvF9l15lWFaAJaPKWz17NznY+3bIdvVxlA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kee6Z-00FyfU-F1; Mon, 16 Nov 2020 13:59:35 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Mayulong <mayulong1@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Wei Xu <xuwei5@hisilicon.com>, Yu Chen <chenyu56@huawei.com>,
        YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Move Hikey 970 USB support out of staging and add DT
Date:   Mon, 16 Nov 2020 13:59:26 +0100
Message-Id: <cover.1605530560.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series finish addressing support for Hikey 970
USB.

It moves the power management and USB3 drivers out of
staging, adding the device tree changes required for USB3
to work on Hikey 970.

Mauro Carvalho Chehab (8):
  phy: phy-hi3670-usb3: move driver from staging into phy
  spmi: hi6421-spmi-pmic: move driver from staging
  mfd: hi6421-spmi-pmic: move driver from staging
  regulator: hi6421v600-regulator: move it from staging
  arm64: dts: hisilicon: hi3670.dtsi: add I2C settings
  arm64: dts: hikey970-pinctrl.dtsi: add missing pinctrl settings
  dts: hisilicon: add support for USB3 on Hikey 970
  dts: hisilicon: add support for the PMIC found on Hikey 970

 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 159 +++++
 .../bindings/phy/phy-hi3670-usb3.yaml         |  72 ++
 .../spmi/hisilicon,hisi-spmi-controller.yaml  |  62 ++
 MAINTAINERS                                   |  24 +-
 .../boot/dts/hisilicon/hi3670-hikey970.dts    | 124 +++-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     | 135 ++++
 .../boot/dts/hisilicon/hikey970-pinctrl.dtsi  | 548 +++++++++++++-
 .../boot/dts/hisilicon/hikey970-pmic.dtsi     | 197 +++++
 drivers/mfd/Kconfig                           |  15 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/hi6421-spmi-pmic.c                | 342 +++++++++
 drivers/phy/hisilicon/Kconfig                 |  10 +
 drivers/phy/hisilicon/Makefile                |   1 +
 drivers/phy/hisilicon/phy-hi3670-usb3.c       | 671 ++++++++++++++++++
 drivers/regulator/Kconfig                     |   9 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/hi6421v600-regulator.c      | 478 +++++++++++++
 drivers/spmi/Kconfig                          |   9 +
 drivers/spmi/Makefile                         |   1 +
 drivers/spmi/hisi-spmi-controller.c           | 358 ++++++++++
 drivers/staging/Kconfig                       |   2 -
 drivers/staging/Makefile                      |   1 -
 drivers/staging/hikey9xx/Kconfig              |  49 --
 drivers/staging/hikey9xx/Makefile             |   7 -
 drivers/staging/hikey9xx/TODO                 |   5 -
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 342 ---------
 .../staging/hikey9xx/hi6421v600-regulator.c   | 478 -------------
 .../staging/hikey9xx/hisi-spmi-controller.c   | 358 ----------
 .../hikey9xx/hisilicon,hi6421-spmi-pmic.yaml  | 159 -----
 .../hisilicon,hisi-spmi-controller.yaml       |  62 --
 drivers/staging/hikey9xx/phy-hi3670-usb3.c    | 671 ------------------
 drivers/staging/hikey9xx/phy-hi3670-usb3.yaml |  72 --
 32 files changed, 3183 insertions(+), 2240 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/phy-hi3670-usb3.yaml
 create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
 create mode 100644 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
 create mode 100644 drivers/mfd/hi6421-spmi-pmic.c
 create mode 100644 drivers/phy/hisilicon/phy-hi3670-usb3.c
 create mode 100644 drivers/regulator/hi6421v600-regulator.c
 create mode 100644 drivers/spmi/hisi-spmi-controller.c
 delete mode 100644 drivers/staging/hikey9xx/Kconfig
 delete mode 100644 drivers/staging/hikey9xx/Makefile
 delete mode 100644 drivers/staging/hikey9xx/TODO
 delete mode 100644 drivers/staging/hikey9xx/hi6421-spmi-pmic.c
 delete mode 100644 drivers/staging/hikey9xx/hi6421v600-regulator.c
 delete mode 100644 drivers/staging/hikey9xx/hisi-spmi-controller.c
 delete mode 100644 drivers/staging/hikey9xx/hisilicon,hi6421-spmi-pmic.yaml
 delete mode 100644 drivers/staging/hikey9xx/hisilicon,hisi-spmi-controller.yaml
 delete mode 100644 drivers/staging/hikey9xx/phy-hi3670-usb3.c
 delete mode 100644 drivers/staging/hikey9xx/phy-hi3670-usb3.yaml

-- 
2.28.0


