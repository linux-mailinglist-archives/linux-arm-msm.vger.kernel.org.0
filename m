Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EA7FA47CF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 07:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728390AbfIAFyr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 01:54:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:39580 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725263AbfIAFyr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 01:54:47 -0400
Received: from localhost (mobile-107-107-187-231.mycingular.net [107.107.187.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E0FC21897;
        Sun,  1 Sep 2019 05:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567317286;
        bh=hYNpfCdsssYnFefu4UrSMeq2HNFfaASOrL68acUZ+Cg=;
        h=From:To:Cc:Subject:Date:From;
        b=fPQa0Fj0tuKxh6NzYoeTsBqy4iv4GwTY4h8fWgG4EzpHhF/kuvIsXPrtFPDYipe+X
         Kzzpl9n1c0oKRNZMVzC4CMSdX0sXTXhopodQMWQqe5PzG9ofqD/eseXHP7fqHAYA9v
         otA1CRqjREihnPtw0tELMlxgqt+Wv7z9kntR1G4o=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm ARM64 Defconfig updates for 5.4
Date:   Sun,  1 Sep 2019 00:54:42 -0500
Message-Id: <1567317285-8555-1-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.4

for you to fetch changes up to fcee7de608a2e4cb3481fd224b11242427d8ec28:

  arm64: defconfig: Enable CPU clock drivers for Qualcomm msm8916 (2019-09-01 00:42:53 -0500)

----------------------------------------------------------------
Qualcomm ARM64 Based defconfig Updates for v5.4

* Enable Qualcomm MSM8916 clock drivers
* Add DRM_MSM to ARCH_QCOM defconfigs
* Enable Qualcomm SM8150 clock and pinctrl drivers

----------------------------------------------------------------
Jordan Crouse (1):
      arm64: defconfig: Add DRM_MSM to defconfigs with ARCH_QCOM

Marc Gonzalez (1):
      arm64: defconfig: Enable CPU clock drivers for Qualcomm msm8916

Vinod Koul (1):
      arm64: defconfig: Enable SM8150 GCC and pinctrl driver

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)
