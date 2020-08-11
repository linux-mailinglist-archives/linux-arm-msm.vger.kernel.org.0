Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E782241D57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Aug 2020 17:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728982AbgHKPmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Aug 2020 11:42:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728898AbgHKPmE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Aug 2020 11:42:04 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 48F9320855;
        Tue, 11 Aug 2020 15:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597160523;
        bh=tPoZHhl37+KDzQsLP1jIkEQXto6BBR1hNjMIGeZz4Dw=;
        h=From:To:Cc:Subject:Date:From;
        b=sxHyP2EWyPs69/fjastnXyT3M2NxezbheCRHhGv0p5q1UW/5sU9Uoxn4JCbKySUBj
         htoOMN3NKL8O4uuOPy3tswJuaSIkhy7wET8urNWHJ8huHLT48fHPmCfVZFMvAtE+4m
         NBseGIdLi/XX9T06UZUsPK5gsst0mM4r5il+qUAg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1k5WPZ-004bmG-5G; Tue, 11 Aug 2020 17:42:01 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Wei Xu <xuwei5@hisilicon.com>, Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        Mayulong <mayulong1@huawei.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 00/33] Add driver for HiSilicon SPMI PMIC for Hikey 970
Date:   Tue, 11 Aug 2020 17:41:26 +0200
Message-Id: <cover.1597160086.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Hikey 970 board uses a different PMIC than the one found on Hikey 960.

This PMIC uses a SPMI board.

This patch series backport the OOT drivers from the Linaro's official
tree for this board:

	https://github.com/96boards-hikey/linux/tree/hikey970-v4.9
	
Porting them to upstream, cleaning up coding style issues, solving
driver probing order and adding DT documentation.

I opted to not fold all patches into a single one, in order to:

- Preserve the authorship of the original authors;
- Keep a history of changes.

As this could be harder for people to review, I'll be replying to patch 00/32
with all patches folded. This should help reviewers to see the current
code after the entire series is applied.

Mauro Carvalho Chehab (32):
  spmi: get rid of a warning when built with W=1
  spmi: hisi-spmi-controller: coding style fixup
  mfd, regulator: get rid of unused code at HiSilicon SPMI PMIC
  regulator: hisi_regulator_spmi: port it to upstream
  mfd: hisi_pmic_spmi: deal with non-static functions
  mfd: hisi_pmic_spmi: get rid of the static vars
  spmi: hisi-spmi-controller: fix it to probe successfully
  spmi: hisi-spmi-controller: fix a typo
  spmi: hisi-spmi-controller: adjust whitespaces at defines
  spmi: hisi-spmi-controller: use le32 macros where needed
  spmi: hisi-spmi-controller: add debug when values are read/write
  mfd, regulator: coding style fixups at the HiSilicon SPMI PMIC code
  spmi: add hisi-spmi-controller to the building system
  mfd: Kconfig: fix a typo
  spmi: hisi-spmi-controller: fix the dev_foo() logic
  mfd: pmic: add drivers for hi6421v600
  mfd: hi6421-spmi-pmic: get rid of unused OF properties
  spmi: hi6421-spmi-pmic: cleanup OF properties
  regulator: hi6421v600-regulator: cleanup struct hisi_regulator
  regulator: hi6421v600-regulator: cleanup debug messages
  regulator: hi6421v600-regulator: use shorter names for OF properties
  regulator: hi6421v600-regulator: better handle modes
  regulator, mfd: change namespace for HiSilicon SPMI PMIC drivers
  regulator: hi6421v600-regulator:  convert to use get/set voltage_sel
  regulator: hi6421v600-regulator: don't use usleep_range for
    off_on_delay
  regulator: hi6421v600-regulator: add a driver-specific debug macro
  regulator: hi6421v600-regulator: initialize ramp_delay
  regulator: hi6421v600-regulator: cleanup DT settings
  mfd, spmi, regulator: fix some coding style issues at HiSilicon SPMI
    PMIC
  dt: document HiSilicon SPMI controller and mfd/regulator properties
  dt: hisilicon: add support for the PMIC found on Hikey 970
  MAINTAINERS: add an entry for HiSilicon 6421v600 drivers

Mayulong (1):
  spmi, regulator, mfd: add drivers for hikey970 SPMI PMIC

 .../mfd/hisilicon,hi6421-spmi-pmic.yaml       | 175 +++++++
 .../spmi/hisilicon,hisi-spmi-controller.yaml  |  54 ++
 MAINTAINERS                                   |   8 +
 .../boot/dts/hisilicon/hi3670-hikey970.dts    |  16 +-
 .../boot/dts/hisilicon/hikey970-pmic.dtsi     | 200 +++++++
 drivers/mfd/Kconfig                           |  17 +-
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/hi6421-spmi-pmic.c                | 399 ++++++++++++++
 drivers/regulator/Kconfig                     |   8 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/hi6421v600-regulator.c      | 493 ++++++++++++++++++
 drivers/spmi/Kconfig                          |   9 +
 drivers/spmi/Makefile                         |   2 +
 drivers/spmi/hisi-spmi-controller.c           | 384 ++++++++++++++
 drivers/spmi/spmi.c                           |  10 +-
 include/linux/mfd/hi6421-spmi-pmic.h          |  67 +++
 16 files changed, 1826 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/hisilicon,hi6421-spmi-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/spmi/hisilicon,hisi-spmi-controller.yaml
 create mode 100644 arch/arm64/boot/dts/hisilicon/hikey970-pmic.dtsi
 create mode 100644 drivers/mfd/hi6421-spmi-pmic.c
 create mode 100644 drivers/regulator/hi6421v600-regulator.c
 create mode 100644 drivers/spmi/hisi-spmi-controller.c
 create mode 100644 include/linux/mfd/hi6421-spmi-pmic.h

-- 
2.26.2


