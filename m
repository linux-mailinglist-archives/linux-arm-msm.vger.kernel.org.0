Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F198F1ED9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 20:34:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727615AbfKFTeI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 14:34:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:33086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727208AbfKFTeI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 14:34:08 -0500
Received: from localhost (mobile-107-92-63-247.mycingular.net [107.92.63.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5A1E9217F9;
        Wed,  6 Nov 2019 19:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573068846;
        bh=niydE8E8tlgbxMzgPkVPuiVBj9Wdqn5HKmXxLh73XmQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tiFWWrH840xpypCQo+Y9E+A6OJCOeqSrWLI0IQtYZ5NsIRjUpEl2QIc3UOxCvRBQl
         kpDW78Wbditu1ot/rtfAUlUdyGjsbAFY5LuQIIlJggiBu8fRlPbKrOUBqFCBB7JlFV
         dSZ6WhPuKFnN4xYHLUwk6OTpJdozBwDIV2XltqnI=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm Driver updates for 5.5
Date:   Wed,  6 Nov 2019 13:33:59 -0600
Message-Id: <1573068840-13098-4-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573068840-13098-1-git-send-email-agross@kernel.org>
References: <1573068840-13098-1-git-send-email-agross@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.5

for you to fetch changes up to 971112e072938517fe80ab2adcbfffc568a8838e:

  MAINTAINERS: Add myself as co-maintainer for QCOM (2019-11-04 22:35:46 -0600)

----------------------------------------------------------------
Qualcomm ARM Based Driver Updates for v5.5

* Add Bjorn as QCOM co-maintainer
* Add LLLC yaml bindings and SC7180 support
* Fixups/Cleanup for LLLC
* Add SMD-RPM MSM8976 compatible and interconnect device
* Add missing RPMD SMD perf level

----------------------------------------------------------------
Angelo G. Del Regno (2):
      soc: qcom: smd-rpm: Add MSM8976 compatible
      dt-bindings: power: Add missing rpmpd smd performance level

AngeloGioacchino Del Regno (1):
      soc: qcom: rpmpd: Add rpm power domains for msm8976

Bjorn Andersson (1):
      MAINTAINERS: Add myself as co-maintainer for QCOM

Georgi Djakov (1):
      soc: qcom: smd-rpm: Create RPM interconnect proxy child device

Sai Prakash Ranjan (2):
      dt-bindings: msm: Convert LLCC bindings to YAML
      dt-bindings: msm: Add LLCC for SC7180

Srinivas Kandagatla (1):
      soc: qcom: socinfo: add sdm845 and sda845 soc ids

Stephen Boyd (2):
      soc: qcom: llcc: Name regmaps to avoid collisions
      soc: qcom: llcc: Move regmap config to local variable

Vivek Gautam (4):
      soc: qcom: llcc cleanup to get rid of sdm845 specific driver file
      soc: qcom: Rename llcc-slice to llcc-qcom
      soc: qcom: Make llcc-qcom a generic driver
      soc: qcom: llcc: Add configuration data for SC7180

YueHaibing (1):
      soc: qcom: Fix llcc-qcom definitions to include

 .../devicetree/bindings/arm/msm/qcom,llcc.txt      |  41 -------
 .../devicetree/bindings/arm/msm/qcom,llcc.yaml     |  55 +++++++++
 .../devicetree/bindings/power/qcom,rpmpd.txt       |   1 +
 .../devicetree/bindings/soc/qcom/qcom,smd-rpm.txt  |   1 +
 MAINTAINERS                                        |   1 +
 drivers/soc/qcom/Kconfig                           |  14 +--
 drivers/soc/qcom/Makefile                          |   3 +-
 drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c}     | 130 ++++++++++++++++++---
 drivers/soc/qcom/llcc-sdm845.c                     | 100 ----------------
 drivers/soc/qcom/rpmpd.c                           |  23 ++++
 drivers/soc/qcom/smd-rpm.c                         |  18 ++-
 drivers/soc/qcom/socinfo.c                         |   2 +
 include/dt-bindings/power/qcom-rpmpd.h             |   9 ++
 include/linux/soc/qcom/llcc-qcom.h                 |  94 ++++-----------
 14 files changed, 250 insertions(+), 242 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,llcc.txt
 create mode 100644 Documentation/devicetree/bindings/arm/msm/qcom,llcc.yaml
 rename drivers/soc/qcom/{llcc-slice.c => llcc-qcom.c} (68%)
 delete mode 100644 drivers/soc/qcom/llcc-sdm845.c
