Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9581D4C66B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 07:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731245AbfFTFB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 01:01:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:59876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731205AbfFTFB5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 01:01:57 -0400
Received: from hector.attlocal.net (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3943A21721;
        Thu, 20 Jun 2019 05:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561006916;
        bh=itsDs6bwwjOLWNDexT7pVUG3W7qMWjLI0YgX8w0Xoks=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E7GCrcYziBoa5qTuhvFc3l120rqg72ckMO1EK9AYDurah35lVt8pVT+yh9DHLKUZo
         oMaGtWOCmpcxJcMEPbhIIUwrMK7Xah8sqyG5ynBVCHdYfbr5ir7l65ngmMq7UmxePx
         6RJG0Q6AT3Gr4gSyAVDKGgcb/rscFqtaYW5m6eFg=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] Qualcomm Driver updates for 5.3
Date:   Thu, 20 Jun 2019 00:01:50 -0500
Message-Id: <1561006911-28519-3-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561006911-28519-1-git-send-email-agross@kernel.org>
References: <1561006911-28519-1-git-send-email-agross@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-5.3

for you to fetch changes up to e1068c32c1d413eaf8818ac10497817af9d2f231:

  soc: qcom: geni: Add support for ACPI (2019-06-19 01:03:24 -0500)

----------------------------------------------------------------
Qualcomm ARM Based Driver Updates for v5.3

* Add ACPI support to Qualcomm GENI SE
* Update Qualcomm Maintainers entry to remove David Brown as maintainer and
  fixup typos and incorrect DT file entry
* Fixup APR domain id usage and making callbacks in non-atomic context
* Add AOSS QMP driver and bindings
* Add power domains for MSM8998 and QCS404 in QCOM RPMPD
* Add corner macros, max state support, and fixups for setting performance state
  for Qcom RPMPD

----------------------------------------------------------------
Amit Kucheria (1):
      MAINTAINERS: fix typo in file name

Bjorn Andersson (6):
      soc: qcom: rpmpd: Modify corner defining macros
      dt-bindings: power: Add rpm power domain bindings for qcs404
      soc: qcom: rpmpd: Add QCS404 power-domains
      dt-bindings: soc: qcom: Add AOSS QMP binding
      soc: qcom: Add AOSS QMP driver
      soc: qcom: apr: Don't use reg for domain id

David Brown (1):
      MAINTAINERS: Remove myself as qcom maintainer

Lee Jones (1):
      soc: qcom: geni: Add support for ACPI

Randy Dunlap (1):
      soc: qcom: fix QCOM_AOSS_QMP dependency and build errors

Sibi Sankar (4):
      soc: qcom: rpmpd: fixup rpmpd set performance state
      soc: qcom: rpmpd: Add support to set rpmpd state to max
      dt-bindings: power: Add rpm power domain bindings for msm8998
      soc: qcom: rpmpd: Add MSM8998 power-domains

Srinivas Kandagatla (1):
      qcom: apr: Make apr callbacks in non-atomic context

Vinod Koul (1):
      MAINTAINER: Fix Qualcomm ETHQOS ethernet DT file

 .../devicetree/bindings/power/qcom,rpmpd.txt       |   2 +
 .../devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt |  81 ++++
 .../devicetree/bindings/soc/qcom/qcom,apr.txt      |   6 +-
 MAINTAINERS                                        |   5 +-
 drivers/soc/qcom/Kconfig                           |  12 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/apr.c                             |  76 +++-
 drivers/soc/qcom/qcom-geni-se.c                    |  21 +-
 drivers/soc/qcom/qcom_aoss.c                       | 480 +++++++++++++++++++++
 drivers/soc/qcom/rpmpd.c                           | 134 ++++--
 include/dt-bindings/power/qcom-aoss-qmp.h          |  14 +
 include/dt-bindings/power/qcom-rpmpd.h             |  34 ++
 12 files changed, 824 insertions(+), 42 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 drivers/soc/qcom/qcom_aoss.c
 create mode 100644 include/dt-bindings/power/qcom-aoss-qmp.h
