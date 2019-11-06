Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12A07F1ED7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2019 20:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbfKFTeF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Nov 2019 14:34:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:33000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727208AbfKFTeF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Nov 2019 14:34:05 -0500
Received: from localhost (mobile-107-92-63-247.mycingular.net [107.92.63.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B45A8217D7;
        Wed,  6 Nov 2019 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573068845;
        bh=l7TF57RHkdq/Fn70FKMOafR0s2A9EtSc6Ut+uxvH1/0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=k09Dw2izKwPiqmjn+pTa2axdCOLlZ0c5xgFDU1joZeaJbkcZUVGQC9bPgjlEF0Uk0
         IdPGoAhpftQaExSKUr5KOQ2MuglrGK7CkD3BAqd31TlgfdwvyjLlu5w8vp4whhdmzG
         bxX7lHKi9f9St+rzUkV38r/ArlejV0M+/WNDKJ84=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm Defconfig updates for 5.5
Date:   Wed,  6 Nov 2019 13:33:58 -0600
Message-Id: <1573068840-13098-3-git-send-email-agross@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.5

for you to fetch changes up to b2181be1cfb81da3fad0f8b6994b2e714ae66876:

  ARM: qcom_defconfig: add ocmem support (2019-10-07 09:11:14 -0700)

----------------------------------------------------------------
Qualcomm ARM Based defconfig Updates for v5.5

* Enable OCMEM support

----------------------------------------------------------------
Brian Masney (1):
      ARM: qcom_defconfig: add ocmem support

 arch/arm/configs/qcom_defconfig | 1 +
 1 file changed, 1 insertion(+)
