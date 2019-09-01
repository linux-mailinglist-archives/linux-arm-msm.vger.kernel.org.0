Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 681B9A47D1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Sep 2019 07:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbfIAFyu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Sep 2019 01:54:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39674 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725263AbfIAFyu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Sep 2019 01:54:50 -0400
Received: from localhost (mobile-107-107-187-231.mycingular.net [107.107.187.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AC29121897;
        Sun,  1 Sep 2019 05:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567317290;
        bh=CZYuBAjGTPwLFZHb8DN2Pf0WfGrbWSpU3EmT4Rdvxkk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AYY3UjfVDKOV07yjmY9N7ODhqTx2aI2KuDwCrQvkgWGWB1L1q5ofavav/NAXSNDkK
         IrAgISRB8/KuQFVRGquHnQdHcrVr6pvsLuJ1tJsyxUYgqu1785/a/fRHYtdQLJMX1b
         4qz3Teoy0NZK3JQeoSwDgL/evt7cM5rzTcRGPJb0=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm Defconfig updates for 5.4
Date:   Sun,  1 Sep 2019 00:54:44 -0500
Message-Id: <1567317285-8555-3-git-send-email-agross@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.4

for you to fetch changes up to 1cd3e52a07b86cf03079e05968d1a2641b6261c4:

  ARM: multi_v7_defconfig: Add DRM_MSM to defconfigs with ARCH_QCOM (2019-09-01 00:37:54 -0500)

----------------------------------------------------------------
Qualcomm ARM Based defconfig Updates for v5.4

* Add DRM_MSM to ARCH_QCOM defconfigs

----------------------------------------------------------------
Andy Gross (1):
      ARM: multi_v7_defconfig: Add DRM_MSM to defconfigs with ARCH_QCOM

Jordan Crouse (1):
      ARM: qcom_defconfig: Add DRM_MSM to defconfigs with ARCH_QCOM

 arch/arm/configs/multi_v7_defconfig | 1 +
 arch/arm/configs/qcom_defconfig     | 1 +
 2 files changed, 2 insertions(+)
