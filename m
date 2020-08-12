Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBDC2242C6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 17:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbgHLP5B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 11:57:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:45426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726150AbgHLP5A (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 11:57:00 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 47FC120838;
        Wed, 12 Aug 2020 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597247819;
        bh=qGFs9JrB+b04B2G3TVM5XfHPg3jI3+wg5+FVNEksffE=;
        h=From:To:Cc:Subject:Date:From;
        b=TzdBsEB9byzsy6EPq+XQIImU+5yJfJMUWKP5jxM/oOsLe8KPTj9Oo3TfWjVAOFuZ0
         VnDtAkyr/zyr04JBj3ZMcZOS63rN1LjU1H+tN8XpflmEQM31S9OXb4i7Byk+fObFwj
         b8SXaSi8qZAuVVYq6PDsY5GITY28+xCc1TyV/Bv4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5t7Z-005t5W-4R; Wed, 12 Aug 2020 17:56:57 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wei Xu <xuwei5@hisilicon.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devel@driverdev.osuosl.org,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH 00/44] SPMI patches needed by Hikey 970
Date:   Wed, 12 Aug 2020 17:56:10 +0200
Message-Id: <cover.1597247164.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Greg,

This patch series is part of a work I'm doing in order to be able to support
a HiKey 970 board that I recently got on my hands.

I received some freedback from Mark and from Jonathan on a first
attempt I made to upstream this.

I'm opting to submit it via staging, because I had to start from the
patch that originally added this driver on a 4.9 Kernel tree:

	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9

In order to preserve the original SOB from the driver's author.

The patches following it are on the standard way: one patch per
logical change.

This is part of a bigger work whose goal is to have upstream support
for USB and DRM/KMS on such boards. 

I suspect that, maybe except for the DT part, those 3 specific drivers
are more or less ready to be moved from staging, but the other
drivers that are also part of this attempt aren't ready. Specially the
DRM driver has some bugs that came from the OOT version.

So, my current plan is to submit those drivers to staging for 5.9
and move the ones that are ok out of staging on Kernel 5.10.

Regards,
Mauro.

Mauro Carvalho Chehab (41):
  staging: spmi: hisi-spmi-controller: coding style fixup
  staging: spmi: hisi-spmi-controller: fix it to probe successfully
  staging: spmi: hisi-spmi-controller: fix a typo
  staging: spmi: hisi-spmi-controller: adjust whitespaces at defines
  staging: spmi: hisi-spmi-controller: use le32 macros where needed
  staging: spmi: hisi-spmi-controller: add debug when values are
    read/write
  staging: spmi: hisi-spmi-controller: fix the dev_foo() logic
  staging: spmi: hisi-spmi-controller: add it to the building system
  staging: spmi: hisi-spmi-controller: do some code cleanups
  staging: mfd: hi6421-spmi-pmic: get rid of unused code
  staging: mfd: hi6421-spmi-pmic: deal with non-static functions
  staging: mfd: hi6421-spmi-pmic: get rid of the static vars
  staging: mfd: hi6421-spmi-pmic: cleanup hi6421-spmi-pmic.h header
  staging: mfd: hi6421-spmi-pmic: change the binding logic
  staging: mfd: hi6421-spmi-pmic: get rid of unused OF properties
  staging: mfd: hi6421-spmi-pmic: cleanup OF properties
  staging: mfd: hi6421-spmi-pmic: change namespace on its functions
  staging: mfd: hi6421-spmi-pmic: fix some coding style issues
  staging: mfd: hi6421-spmi-pmic: add it to the building system
  staging: mfd: hi6421-spmi-pmic: cleanup the code
  staging: regulator: hi6421v600-regulator: get rid of unused code
  staging: regulator: hi6421v600-regulator: port it to upstream
  staging: regulator: hi6421v600-regulator: coding style fixups
  staging: regulator: hi6421v600-regulator: change the binding logic
  staging: regulator: hi6421v600-regulator: cleanup struct
    hisi_regulator
  staging: regulator: hi6421v600-regulator: cleanup debug messages
  staging: regulator: hi6421v600-regulator: use shorter names for OF
    properties
  staging: regulator: hi6421v600-regulator: better handle modes
  staging: regulator: hi6421v600-regulator: change namespace
  staging: regulator: hi6421v600-regulator: convert to use get/set
    voltage_sel
  staging: regulator: hi6421v600-regulator: don't use usleep_range for
    off_on_delay
  staging: regulator: hi6421v600-regulator: add a driver-specific debug
    macro
  staging: regulator: hi6421v600-regulator: initialize ramp_delay
  staging: regulator: hi6421v600-regulator: cleanup DT settings
  staging: regulator: hi6421v600-regulator: fix some coding style issues
  staging: regulator: hi6421v600-regulator: add it to the building
    system
  staging: regulator: hi6421v600-regulator: code cleanup
  staging: hikey9xx: add a TODO list
  MAINTAINERS: add an entry for HiSilicon 6421v600 drivers
  dt: document HiSilicon SPMI controller and mfd/regulator properties
  dt: hisilicon: add support for the PMIC found on Hikey 970

Mayulong (3):
  staging: spmi: add Hikey 970 SPMI controller driver
  staging: mfd: add a PMIC driver for HiSilicon 6421 SPMI version
  staging: regulator: add a regulator driver for HiSilicon 6421v600 SPMI
    PMIC

 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 182 +++++++
 .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++
 MAINTAINERS                                   |   6 +
 .../boot/dts/hisilicon/hi3670-hikey970.dts    |  16 +-
 .../boot/dts/hisilicon/hikey970-pmic.dtsi     | 200 ++++++++
 drivers/staging/Kconfig                       |   2 +
 drivers/staging/Makefile                      |   1 +
 drivers/staging/hikey9xx/Kconfig              |  35 ++
 drivers/staging/hikey9xx/Makefile             |   5 +
 drivers/staging/hikey9xx/TODO                 |   5 +
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 381 ++++++++++++++
 .../staging/hikey9xx/hi6421v600-regulator.c   | 479 ++++++++++++++++++
 .../staging/hikey9xx/hisi-spmi-controller.c   | 351 +++++++++++++
 include/linux/mfd/hi6421-spmi-pmic.h          |  68 +++
 14 files changed, 1773 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
 create mode 100644 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
 create mode 100644 drivers/staging/hikey9xx/Kconfig
 create mode 100644 drivers/staging/hikey9xx/Makefile
 create mode 100644 drivers/staging/hikey9xx/TODO
 create mode 100644 drivers/staging/hikey9xx/hi6421-spmi-pmic.c
 create mode 100644 drivers/staging/hikey9xx/hi6421v600-regulator.c
 create mode 100644 drivers/staging/hikey9xx/hisi-spmi-controller.c
 create mode 100644 include/linux/mfd/hi6421-spmi-pmic.h

-- 
2.26.2


