Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6CCEF1ED5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 20:34:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfKFTeC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 14:34:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:32878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727208AbfKFTeC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 14:34:02 -0500
Received: from localhost (mobile-107-92-63-247.mycingular.net [107.92.63.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 706BD217D7;
        Wed,  6 Nov 2019 19:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573068841;
        bh=coOa4RxODjJ6EYPV7rFTewcJTnI1nFBAjUdusE+P6SI=;
        h=From:To:Cc:Subject:Date:From;
        b=HB1qkuScqVLA8LfkEUpRzyEQuzZTvLubfGJ1n4aZ44SIYvJFRTPzkn0TNUfUEH8/F
         plDSsx6rqwcU2v98rMkFAlv0fQDIurBdzGVKkih3kV5GVHu23iqjBGxExTeT/4AsmH
         RUdBxmAqtY5s1MECbhxHiXyPEJ9ThhIZDB5R29uA=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.5
Date:   Wed,  6 Nov 2019 13:33:56 -0600
Message-Id: <1573068840-13098-1-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.5

for you to fetch changes up to a36612b7469cf76953cf237a2b9a62f6c97730bb:

  arm64: defconfig: Enable Qualcomm watchdog driver (2019-10-20 23:04:59 -0700)

----------------------------------------------------------------
Qualcomm ARM64 Based defconfig Updates for v5.5

* Enable Qualcomm cpufreq, watchdog, prng, socinfo, SPI, and QSPI controllers
* Enable SN65DSI86 display bridge
* Enable QCA Bluetooth over Uart
* Enable various Qualcomm remoteproc dependencies

----------------------------------------------------------------
Bjorn Andersson (6):
      arm64: defconfig: Enable Qualcomm remoteproc dependencies
      arm64: defconfig: Enable Qualcomm SPI and QSPI controller
      arm64: defconfig: Enable Qualcomm socinfo driver
      arm64: defconfig: Enable Qualcomm CPUfreq HW driver
      arm64: defconfig: Enable Qualcomm pseudo rng
      arm64: defconfig: Enable Qualcomm watchdog driver

Jeffrey Hugo (2):
      arm64: defconfig: Enable QCA Bluetooth over UART
      arm64: defconfig: Enable SN65DSI86 display bridge

 arch/arm64/configs/defconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
