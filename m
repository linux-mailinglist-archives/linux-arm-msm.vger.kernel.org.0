Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E618245DBB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Aug 2020 09:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726909AbgHQHOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Aug 2020 03:14:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:57238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726402AbgHQHLR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Aug 2020 03:11:17 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AED44207FB;
        Mon, 17 Aug 2020 07:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597648276;
        bh=kXMV8wukE99rUYUOv+jkANRPnJMhnnypd20U67KLfaM=;
        h=From:To:Cc:Subject:Date:From;
        b=jOAsnPYqqJ4qtBSn87nrOrPbEigb7xFFYFG8QCQ4rp/xTsR2UPFbZGd19UWPCV/vV
         HcskDkPpEiYRvvhpHxz6Q5a1MCnRJNmboj2KF+K7HaLxiqH9IiwAsDEMLnMBPaHjUY
         uYUGXE4Uls0X5F2zdmeiuWsXFDR57VpXqfnWmLIQ=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k7ZIY-00BdjC-MB; Mon, 17 Aug 2020 09:11:14 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        "David S. Miller" <davem@davemloft.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v3 00/44] SPMI patches needed by Hikey 970
Date:   Mon, 17 Aug 2020 09:10:19 +0200
Message-Id: <cover.1597647359.git.mchehab+huawei@kernel.org>
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

Regards,
Mauro.

v1:
   submitted to drivers/{mfd,spmi,regulator}

v2:
  - submitted via staging, mainly to preserve original
    authorship and his SoB;
  - as requested on previous review, patches were split per
    target subsystem.

v3:
  - Some coding style changes, due to reviews from Joe Perches

Patches were tested on a Hikey 970 board.

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
 .../boot/dts/hisilicon/hi3670-hikey970.dts    |  22 +-
 .../boot/dts/hisilicon/hikey970-pmic.dtsi     | 200 ++++++++
 drivers/staging/Kconfig                       |   2 +
 drivers/staging/Makefile                      |   1 +
 drivers/staging/hikey9xx/Kconfig              |  35 ++
 drivers/staging/hikey9xx/Makefile             |   5 +
 drivers/staging/hikey9xx/TODO                 |   5 +
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 382 ++++++++++++++
 .../staging/hikey9xx/hi6421v600-regulator.c   | 479 ++++++++++++++++++
 .../staging/hikey9xx/hisi-spmi-controller.c   | 356 +++++++++++++
 include/linux/mfd/hi6421-spmi-pmic.h          |  68 +++
 14 files changed, 1778 insertions(+), 19 deletions(-)
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


