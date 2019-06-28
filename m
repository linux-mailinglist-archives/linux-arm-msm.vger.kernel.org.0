Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD5659377
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 07:36:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfF1FgY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 01:36:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:56194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbfF1FgY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 01:36:24 -0400
Received: from localhost (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 045E12070D;
        Fri, 28 Jun 2019 05:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561700183;
        bh=FrgZyULDsdlp/dbM+Ueip3XNqaluGnZEuhCYWvlBMp8=;
        h=From:To:Cc:Subject:Date:From;
        b=Lpg214YQDWPBW/Ca/p5ziGD+MlClogtEDLfmec6VwTsdhAVpTFbpdXfasgn+uG2Sl
         162rV67Ubed1Ud85W63hVISdTleO9NJrZYab2mQQx8GLAl7e1akyJxO5fucfdzRJYN
         aIjhqR1mYD+LunYOd0sW8SrDp5tVcURMynzFSOQE=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 DT updates for 5.3 Part 2
Date:   Fri, 28 Jun 2019 00:36:21 -0500
Message-Id: <1561700182-18108-1-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 2410fd450c09a126aefefc9106b4652285b5d60f:

  arm64: dts: qcom: qcs404-evb: fix vdd_apc supply (2019-06-19 23:50:52 -0500)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.3-2

for you to fetch changes up to 8291e15108cde33c3e086a34af5381c95cc7aa87:

  arm64: dts: qcom: qcs404: Add missing space for cooling-cells property (2019-06-28 00:20:37 -0500)

----------------------------------------------------------------
Qualcomm ARM64 Updates for v5.3 Part 2

* Add SDM845 Cheza support
* Add TSENS controller and thermal zones for QCS404

----------------------------------------------------------------
Amit Kucheria (2):
      arm64: dts: qcom: qcs404: Add tsens controller
      arm64: dts: qcom: qcs404: Add thermal zones for each sensor

Niklas Cassel (1):
      arm64: dts: qcom: qcs404: Add missing space for cooling-cells property

Rob Clark (1):
      arm64: dts: qcom: sdm845-cheza: add initial cheza dt

 arch/arm64/boot/dts/qcom/Makefile            |    3 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi         |  272 ++++++
 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts |  238 +++++
 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts |  238 +++++
 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts |  174 ++++
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi   | 1326 ++++++++++++++++++++++++++
 6 files changed, 2251 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
