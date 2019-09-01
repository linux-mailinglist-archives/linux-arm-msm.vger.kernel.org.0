Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C55A47D0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 07:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728617AbfIAFyt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 01:54:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:39624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725263AbfIAFyt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 01:54:49 -0400
Received: from localhost (mobile-107-107-187-231.mycingular.net [107.107.187.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E0EB222CF7;
        Sun,  1 Sep 2019 05:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567317288;
        bh=P9OZelalII8xL534w1i82O97rpizGTntoD9ovwihX8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OdY9AK8vv8TTcBsCUnDoTCLJssULVK6Dp5wRqKdL0+p/ftNWUeGxd2ox+F+GHwXFA
         RU/OCJ71VVUx/VwtZHNKDZSO3Gu7utgSRJfjGuhjlqfiMrtjFfyzbpNFonDR5hwNBa
         o3zIZ3DaWAE9VPPFhsSzx5kAIWcMVZeuU1LclQPU=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for 5.4
Date:   Sun,  1 Sep 2019 00:54:43 -0500
Message-Id: <1567317285-8555-2-git-send-email-agross@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.4

for you to fetch changes up to 1dd70853f8131f1674c4496b1d24de7251cad42c:

  arm64: dts: sdm845: Add parent clock for rpmhcc (2019-08-26 17:43:23 -0700)

----------------------------------------------------------------
Qualcomm ARM64 Updates for v5.4

* Add Lenovo Miix 630, HP Envy x2, and Asus Novago TP370QL support
* Assorted cleanups for SDM845 nodes
* Add video nodes, cpu coefficients, adsp, csdp, and
  fastrpc nodes for SDM845
* Add coresight for MSM8996, SDM845, and MSM8998
* Misc cleanups on QCS404 and PMS405
* Update memory map for QCS404
* Add wifi rails, update WCSS clocks, and add ADS unit names on QCS404
* Add Longcheer and Samsung Galaxy A3U/A5U support
* Add initial support for SM8150 and PM8150

----------------------------------------------------------------
Bjorn Andersson (3):
      arm64: dts: qcom: msm8996: Rename smmu nodes
      arm64: dts: qcom: qcs404-evb: Mark WCSS clocks protected
      arm64: dts: qcom: qcs404: Update memory map to v3

Geert Uytterhoeven (1):
      arm64: dts: qcom: sdm845-cheza: Spelling s/conenctors/connectors/

Govind Singh (1):
      arm64: dts: qcom: qcs404: Add wifi rails in QCS404 dt node for proxy votes

Jeffrey Hugo (4):
      arm64: dts: qcom: Add Lenovo Miix 630
      arm64: dts: qcom: Add HP Envy x2
      arm64: dts: qcom: Add Asus NovaGo TP370QL
      arm64: dts: qcom: msm8998: Node ordering, address cleanups

Malathi Gottam (1):
      arm64: dts: sdm845: Add video nodes

Matthias Kaehlcke (1):
      arm64: dts: sdm845: Add dynamic CPU power coefficients

Sai Prakash Ranjan (3):
      arm64: dts: sdm845: Add device node for Last level cache controller
      arm64: dts: qcom: sdm845: Add Coresight support
      arm64: dts: qcom: msm8998: Add Coresight support

Srinivas Kandagatla (1):
      arm64: sdm845: add adsp and cdsp fastrpc nodes

Stanimir Varbanov (1):
      arm64: dts: qcom: msm8996: Add Venus video codec DT node

Stephan Gerhold (4):
      dt-bindings: vendor-prefixes: Add Longcheer Technology Co., Ltd.
      dt-bindings: qcom: Document bindings for new MSM8916 devices
      arm64: dts: qcom: Add device tree for Samsung Galaxy A3U/A5U
      arm64: dts: qcom: Add device tree for Longcheer L8150

Thara Gopinath (1):
      arm64: dts: qcom: Extend AOSS QMP node

Vinod Koul (17):
      arm64: dts: qcom: sdm845: Add unit name to soc node
      arm64: dts: qcom: sdm845: remove unnecessary properties for dsi nodes
      arm64: dts: qcom: sdm845: remove unit name for thermal trip points
      arm64: dts: qcom: sdm845-cheza: remove macro from unit name
      arm64: dts: qcom: sdm845: remove macro from unit name
      arm64: dts: qcom: pms405: add unit name adc nodes
      arm64: dts: qcom: pms405: remove reduandant properties
      arm64: dts: qcom: qcs404: remove unit name for thermal trip points
      arm64: dts: qcom: sm8150: Add base dts file
      arm64: dts: qcom: pm8150: Add base dts file
      arm64: dts: qcom: pm8150b: Add base dts file
      arm64: dts: qcom: pm8150l: Add base dts file
      arm64: dts: qcom: sm8150-mtp: Add base dts file
      arm64: dts: qcom: sm8150-mtp: Add regulators
      arm64: dts: qcom: sm8150: Add reserved-memory regions
      arm64: dts: qcom: sm8150: Add apps shared nodes
      arm64: dts: sdm845: Add parent clock for rpmhcc

Vivek Gautam (1):
      arm64: dts: qcom: msm8996: Add Coresight support

 Documentation/devicetree/bindings/arm/qcom.yaml    |   8 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   7 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      | 228 +++++++
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     | 236 +++++++
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |  10 +
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts      |  10 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 544 +++++++++++++++-
 .../boot/dts/qcom/msm8998-asus-novago-tp370ql.dts  |  47 ++
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    | 240 +++++++
 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts    |  30 +
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |  30 +
 arch/arm64/boot/dts/qcom/msm8998.dtsi              | 689 +++++++++++++++++----
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |  97 +++
 arch/arm64/boot/dts/qcom/pm8150b.dtsi              |  86 +++
 arch/arm64/boot/dts/qcom/pm8150l.dtsi              |  80 +++
 arch/arm64/boot/dts/qcom/pm8998.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi               |  16 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi           |   7 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  60 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |  12 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               | 646 +++++++++++++++++--
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            | 375 +++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 482 ++++++++++++++
 24 files changed, 3735 insertions(+), 209 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150b.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8150l.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150.dtsi
