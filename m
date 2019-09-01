Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCA79A47D2
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 07:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728633AbfIAFyw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 01:54:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:39734 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725263AbfIAFyw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 01:54:52 -0400
Received: from localhost (mobile-107-107-187-231.mycingular.net [107.107.187.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5338D22CF7;
        Sun,  1 Sep 2019 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567317291;
        bh=nuNp/nbNuRsArDmj1Ltgr8jR+mEyDbvJ+/0zuHCnL6M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ydrJwlYLnsmTp+CY9l8jTtjq+0z0D4ffa6hodmflfRhdhkJxnIBjhYM/7huBr4Iee
         JiiIkEMWpQs3UTeV0eK/mFQQk5+kYWVROoJHl9UIPcjr84URDRZeSydrhP39Zw6jJL
         Is+A1cOJGtMFeCflsdpwHQc5ZgWCXlzopRHh3mss=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm Driver updates for 5.4
Date:   Sun,  1 Sep 2019 00:54:45 -0500
Message-Id: <1567317285-8555-4-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567317285-8555-1-git-send-email-agross@kernel.org>
References: <1567317285-8555-1-git-send-email-agross@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.4

for you to fetch changes up to 1709510221c57fd566479c228434ff9edd6435be:

  soc: qcom: aoss: Add AOSS QMP support (2019-08-21 15:59:44 -0700)

----------------------------------------------------------------
Qualcomm ARM Based Driver Updates for v5.4

* Add AOSS QMP support
* Various fixups for Qualcomm SCM
* Add socinfo driver
* Add SoC serial number attribute and associated APIs
* Add SM8150 and SC7180 support in Qualcomm SCM
* Fixup max processor count in SMEM

----------------------------------------------------------------
Bjorn Andersson (2):
      base: soc: Add serial_number attribute to soc
      soc: qcom: socinfo: Annotate switch cases with fall through

Imran Khan (1):
      soc: qcom: Add socinfo driver

Sibi Sankar (5):
      soc: qcom: smem: Update max processor count
      dt-bindings: firmware: scm: re-order compatible list
      dt-bindings: firmware: scm: Add SM8150 and SC7180 support
      dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
      soc: qcom: aoss: Add AOSS QMP support

Stephen Boyd (3):
      firmware: qcom_scm: Use proper types for dma mappings
      firmware: qcom_scm: Fix some typos in docs and printks
      firmware: qcom_scm: Cleanup code in qcom_scm_assign_mem()

Thara Gopinath (1):
      soc: qcom: Extend AOSS QMP driver to support resources that are used to wake up the SoC.

Vaishali Thakkar (2):
      soc: qcom: socinfo: Expose custom attributes
      soc: qcom: socinfo: Expose image information

Vinod Koul (1):
      base: soc: Export soc_device_register/unregister APIs

 Documentation/ABI/testing/sysfs-devices-soc        |   7 +
 .../devicetree/bindings/firmware/qcom,scm.txt      |   4 +-
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |   5 +-
 drivers/base/soc.c                                 |   9 +
 drivers/firmware/qcom_scm.c                        |  47 +-
 drivers/soc/qcom/Kconfig                           |   8 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/qcom_aoss.c                       | 133 ++++++
 drivers/soc/qcom/smem.c                            |  11 +-
 drivers/soc/qcom/socinfo.c                         | 476 +++++++++++++++++++++
 include/linux/qcom_scm.h                           |   9 +-
 include/linux/sys_soc.h                            |   1 +
 12 files changed, 681 insertions(+), 30 deletions(-)
 create mode 100644 drivers/soc/qcom/socinfo.c
