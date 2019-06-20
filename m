Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 386EA4C669
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 07:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731206AbfFTFBz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 01:01:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:59810 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfFTFBz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 01:01:55 -0400
Received: from hector.attlocal.net (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 131A6208CB;
        Thu, 20 Jun 2019 05:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561006913;
        bh=phnydbrve6D9xWDJP0v1HDzHr04Ms8FK11DaWWwlAs4=;
        h=From:To:Cc:Subject:Date:From;
        b=obsCth2fJ+sYkH022X1dCT2N735J26yg3H/XHCPb+ieerpVgDdtmkjy0969DG9YJR
         SSCsVA9A4Mr31pUX4F0o8mflebca1itWNk+g3O5gsjxDqLxSZr2ULjVRpVWm1G/MR3
         e9+RKx0A8tVtmt61XxjIYbMkwdI5adwqgOIrqyqg=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for 5.3
Date:   Thu, 20 Jun 2019 00:01:48 -0500
Message-Id: <1561006911-28519-1-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.3

for you to fetch changes up to 2410fd450c09a126aefefc9106b4652285b5d60f:

  arm64: dts: qcom: qcs404-evb: fix vdd_apc supply (2019-06-19 23:50:52 -0500)

----------------------------------------------------------------
Qualcomm ARM64 Updates for v5.3

* Switch to use second gen PON on PM8998
* Add PSCI cupidle states for MSM8996, MSM8998,and SDM845
* Add MSM8996 UFS phy reset controller
* Add propre cpu capacity scaling on MSM8996
* Fixups for APR domain, legacy clocks, and PSCI entry latency on MSM8996
* Enable SMMUs on MSM8996
* Add Dragonboard 845C
* Add Q6V5, GPU, GMU, and AOSS QMP node on SDM845
* Fixup CPU topology on SDM845
* Change USB1 to be peripheral on SDM845 MTP
* Add PCIe Phy, RC nodes, ANOC1 SMMU, and RPMPD node on MSM8998
* Update coresight bindings for MSM8916
* Update idle state names and entry-method on MSM8916
* Add PCIe, RPMPD, LPASS, Q6, TCSR, TuringCC, PSCI cpuidle states,
  and CDSP on QCS404
* Add reset-cells property to QCS404 GCC node
* Fixup s3 max voltage, l3 min voltage, drive strength typo, and
  s3 supply definition on QCS404-evb
* Fixup ADC outputs and VADC calibration on PMS405

----------------------------------------------------------------
Amit Kucheria (8):
      arm64: dts: sdm845: Fix up CPU topology
      arm64: dts: qcom: pms405: calibrate the VADC correctly
      arm64: dts: qcom: pms405: Rename adc outputs as per schematics
      arm64: dts: qcom: msm8916: Add entry-method property for the idle-states node
      arm64: dts: qcom: msm8916: Use more generic idle state names
      arm64: dts: qcom: msm8996: Add PSCI cpuidle low power states
      arm64: dts: msm8996: Add proper capacity scaling for the cpus
      arm64: dts: qcom: msm8998: Add PSCI cpuidle low power states

Andy Gross (1):
      arm64: dts: qcom-qcs404: Add reset-cells to GCC node

Bjorn Andersson (14):
      arm64: dts: qcom: sdm845-mtp: Make USB1 peripheral
      arm64: dts: qcom: qcs404: Add turingcc node
      arm64: dts: qcom: qcs404-evb: Mark CDSP clocks protected
      arm64: dts: qcom: qcs404: Add TCSR node
      arm64: dts: qcom: qcs404: Fully describe the CDSP
      arm64: dts: qcom: qcs404: Move lpass and q6 into soc
      arm64: dts: qcom: qcs404: Add rpmpd node
      arm64: dts: qcom: Add AOSS QMP node
      arm64: dts: qcom: msm8996: Stop using legacy clock names
      arm64: dts: qcom: qcs404: Add PCIe related nodes
      arm64: dts: qcom: qcs404-evb: Enable PCIe
      arm64: dts: qcom: Add Dragonboard 845c
      arm64: dts: qcom: msm8996: Correct apr-domain property
      arm64: dts: qcom: msm8996: Enable SMMUs

Evan Green (1):
      arm64: dts: msm8996: Add UFS PHY reset controller

John Stultz (1):
      arm64: dts: qcom: pm8998: Use qcom,pm8998-pon binding for second gen pon

Jordan Crouse (2):
      arm64: dts: sdm845: Add gpu and gmu device nodes
      arm64: dts: sdm845: Add zap shader region for GPU

Jorge Ramirez-Ortiz (1):
      arm64: dts: qcom: qcs404-evb: fix vdd_apc supply

Leo Yan (1):
      arm64: dts: qcom-msm8916: Update coresight DT bindings

Marc Gonzalez (2):
      arm64: dts: qcom: msm8998: Add ANOC1 SMMU node
      arm64: dts: qcom: msm8998: Add PCIe PHY and RC nodes

Niklas Cassel (4):
      arm64: dts: qcom: qcs404-evb: fix l3 min voltage
      arm64: dts: qcom: qcs404-evb: increase s3 max voltage
      arm64: dts: qcom: qcs404: Add PSCI cpuidle low power states
      arm64: dts: msm8996: fix PSCI entry-latency-us

Raju P.L.S.S.S.N (1):
      arm64: dts: qcom: sdm845: Add PSCI cpuidle low power states

Sibi Sankar (2):
      arm64: dts: qcom: msm8998: Add rpmpd node
      arm64: dts: qcom: sdm845: Add Q6V5 MSS node

Vinod Koul (1):
      arm64: dts: qcom: qcs404-evb: Fix typo

 arch/arm64/boot/dts/qcom/Makefile          |   1 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi      |  17 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi      |  59 +--
 arch/arm64/boot/dts/qcom/msm8998.dtsi      | 185 ++++++++++
 arch/arm64/boot/dts/qcom/pm8998.dtsi       |   2 +-
 arch/arm64/boot/dts/qcom/pms405.dtsi       |  20 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi   |  43 ++-
 arch/arm64/boot/dts/qcom/qcs404.dtsi       | 364 ++++++++++++++-----
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 557 +++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts    |   4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi       | 283 ++++++++++++++-
 11 files changed, 1393 insertions(+), 142 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-db845c.dts
