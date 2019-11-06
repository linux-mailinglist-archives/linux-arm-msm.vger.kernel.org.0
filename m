Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80A05F1EDA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 20:34:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727655AbfKFTeJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 14:34:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:33150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727208AbfKFTeI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 14:34:08 -0500
Received: from localhost (mobile-107-92-63-247.mycingular.net [107.92.63.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C3AAC21882;
        Wed,  6 Nov 2019 19:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573068848;
        bh=L6z/fy593ih1VelBHJtxIfR7dAjL9slg0ehkYH3tD1Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CyHJu8JSpcvBojxhl7S1pPYSq7XApPY0aMIlMjiRWfAeL6N7oQFniB1ZDx8Ck4htO
         bejEK/pB0lftrzNWyumvqJ1qrsVGF7qqS3fmJVEMFpo48VsVlF3emos/T3czcrRzSx
         m2G3dtY4o5ke0gnDM6rqBFPJiXdEdicUd9C9av5I=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm Device Tree updates for 5.5
Date:   Wed,  6 Nov 2019 13:34:00 -0600
Message-Id: <1573068840-13098-5-git-send-email-agross@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.5

for you to fetch changes up to 140647f84dd8d895da2bf3e540dfd038f5076d46:

  ARM: dts: msm8974: thermal: Add thermal zones for each sensor (2019-10-27 01:06:59 -0500)

----------------------------------------------------------------
Qualcomm Device Tree Changes for v5.5

* Add thermal zones and IRQ support for MSM8974
* Add 5vs2 regulator node for PM8941
* Add reboot-mode node, fix sdhci and card detect on MSM8974-FP2
* Add IPQ4019 SDHCI node

----------------------------------------------------------------
Amit Kucheria (2):
      ARM: dts: msm8974: thermal: Add interrupt support
      ARM: dts: msm8974: thermal: Add thermal zones for each sensor

Brian Masney (1):
      ARM: dts: qcom: pm8941: add 5vs2 regulator node

Luca Weiss (3):
      ARM: dts: msm8974-FP2: Drop unused card-detect pin
      ARM: dts: msm8974-FP2: Increase load on l20 for sdhci
      ARM: dts: msm8974-FP2: add reboot-mode node

Robert Marko (1):
      ARM: dts: qcom: ipq4019: Add SDHCI controller node

 arch/arm/boot/dts/qcom-ipq4019.dtsi              |  12 +++
 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts |  22 +++--
 arch/arm/boot/dts/qcom-msm8974.dtsi              | 103 +++++++++++++++++++++++
 arch/arm/boot/dts/qcom-pm8941.dtsi               |  10 +++
 4 files changed, 138 insertions(+), 9 deletions(-)
