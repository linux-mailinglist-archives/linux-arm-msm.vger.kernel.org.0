Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C4782FBC25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Jan 2021 17:14:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728534AbhASQMJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Jan 2021 11:12:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:35162 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392020AbhASQLc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Jan 2021 11:11:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3EFBA2311C;
        Tue, 19 Jan 2021 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611072651;
        bh=m+FSqXlvV3JjPMmUcXvwZL6Fu9L0fgTghhQI30bmy2k=;
        h=From:To:Cc:Subject:Date:From;
        b=Scv8LoYDdqSEF/O9EjJoFkntp6r0fkQ3IRKXeELmMo38FnVPXRiIS39TVlZDRohld
         srTYmPQI3Ztdp3A5LP34We/EhbtQvyIDDjF+jQx3+GwEJ3GyQPUIfKKnhP227bRNFR
         H0wirINUXiOaG6GVfOuRxmBfb7qvrmI5rg+lmzv5CKG86sdUFsFAYouZCrrT4GQ3Yi
         2VvKfb4rqW0c8UY6FfAORXMpD3WSutS8cYRo/p7R7U+IMVMkz1CNj90xag5/cNLJFn
         1yzWXcUgi8f83MC3BO3onXOSwRw3q6Rv5SGi9BqMX+S8s8iMNTPGHCUeTAgCrAbGhF
         WHQxdyDwBqyAA==
Received: by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1l1tai-0012bT-Nj; Tue, 19 Jan 2021 17:10:48 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Colin Ian King <colin.king@canonical.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mayulong <mayulong1@huawei.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
        YueHaibing <yuehaibing@huawei.com>, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/21] Move Hisilicon 6421v600 SPMI driver set out of staging
Date:   Tue, 19 Jan 2021 17:10:26 +0100
Message-Id: <cover.1611072387.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark/Lee,

This patch series finish addressing support for Hikey 970
SPMI controller, PMIC and regulators.

I removed some unrelated DT patches from this series,
plus the Hikey 970 PHY USB3 code from it, in order to avoid
mixing different stuff on this series[1].

[1] Those unrelated patches were submitted last week on
separate series.

The entire patchset is on this branch:

	https://git.linuxtv.org/mchehab/experimental.git/log/?h=hikey970-destage-usb

In order to make easier for review, this series was generated
with --no-renames. So, you don't need to take a look at the
staging patches, as the entire code will be there on patches 9-11.

The last two patches on this series will likely require that other
patch series to get merged first. It probably makes sense to be
merged via DT tree. 

Regards,
Mauro

v4:
- use regmap for mfd and spmi drivers;
- a few minor cleanups at the mfd driver.

v3:
- fixed a bug with eco-mode at get_optimum_mode;
- changed the sleep logic when enabling/disabling a power line;
- additional cleanups, as requested by Mark.

v2:

- this driver's probe routine is very similar to the one at the non-SPMI
  variant of Hisilicon 6421;
- The register/voltage data were moved from DT into the driver itself;
- It doesn't have anymore any static data;
- All debug messages got removed;
- Addressed a few be32 warnings from sparse.




Mauro Carvalho Chehab (21):
  staging: hikey9xx: hisilicon,hisi-spmi-controller.yaml fix bindings
  staging: hikey9xx: hisilicon,hi6421-spmi-pmic.yaml: simplify props
  staging: hikey9xx: hisi-spmi-controller: clean sparse warnings
  staging: hikey9xx: hi6421v600-regulator: do some cleanups
  staging: hikey9xx: hi6421v600-regulator: move LDO config from DT
  staging: hikey9xx: hi6421v600-regulator: cleanup debug msgs
  staging: hikey9xx: hi6421v600-regulator: get rid of an static data
  staging: hikey9xx: hi6421v600-regulator: do some cleanups
  staging: hikey9xx: hi6421v600-regulator: update copyright
  staging: hikey9xx: hi6421v600-regulator: fix delay logic
  staging: hikey9xx: hi6421v600-regulator: cleanup comments
  staging: hikey9xx: hi6421v600-regulator: fix get_optimum_mode
  staging: hikey9xx: hisilicon,hi6421-spmi-pmic.yaml: cleanup a warning
  staging: hikey9xx: spmi driver: convert to regmap
  staging: hikey9xx: hi6421-spmi-pmic: update copyright
  staging: hikey9xx: simplify includes
  spmi: hisi-spmi-controller: move driver from staging
  mfd: hi6421-spmi-pmic: move driver from staging
  regulator: hi6421v600-regulator: move it from staging
  dts: hisilicon: add support for USB3 on Hikey 970
  dts: hisilicon: add support for the PMIC found on Hikey 970

 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 135 +++++
 .../spmi/hisilicon,hisi-spmi-controller.yaml  |  75 +++
 MAINTAINERS                                   |  15 +-
 .../boot/dts/hisilicon/hi3670-hikey970.dts    | 124 ++++-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |  58 +++
 .../boot/dts/hisilicon/hikey970-pmic.dtsi     |  87 ++++
 drivers/mfd/Kconfig                           |  15 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/hi6421-spmi-pmic.c                | 281 ++++++++++
 drivers/regulator/Kconfig                     |   8 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/hi6421v600-regulator.c      | 338 +++++++++++++
 drivers/spmi/Kconfig                          |   9 +
 drivers/spmi/Makefile                         |   1 +
 drivers/spmi/hisi-spmi-controller.c           | 358 +++++++++++++
 drivers/staging/Kconfig                       |   2 -
 drivers/staging/Makefile                      |   1 -
 drivers/staging/hikey9xx/Kconfig              |  38 --
 drivers/staging/hikey9xx/Makefile             |   5 -
 drivers/staging/hikey9xx/TODO                 |   5 -
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c   | 342 -------------
 .../staging/hikey9xx/hi6421v600-regulator.c   | 478 ------------------
 .../staging/hikey9xx/hisi-spmi-controller.c   | 358 -------------
 .../hikey9xx/hisilicon,hi6421-spmi-pmic.yaml  | 159 ------
 .../hisilicon,hisi-spmi-controller.yaml       |  62 ---
 include/linux/mfd/hi6421-spmi-pmic.h          |   8 +-
 26 files changed, 1486 insertions(+), 1478 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
 create mode 100644 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
 create mode 100644 drivers/mfd/hi6421-spmi-pmic.c
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

-- 
2.29.2


