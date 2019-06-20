Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2EDC4C66A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 07:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725875AbfFTFBz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 01:01:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:59846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731205AbfFTFBz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 01:01:55 -0400
Received: from hector.attlocal.net (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 17B25215EA;
        Thu, 20 Jun 2019 05:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561006914;
        bh=w9nyptU8yTrq5RjXTdHTV+L34NPIQZCSznpAPi8hwjQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RHJiAIVXGzEDt3UUz/H4ITEndh1nHGNemQS387yeTR+x62vX/Q2P+1YZCM0i5ic7V
         giaIoldO5X1HKYkgnDZjgyN4j77ew12KfcHwYLKgH7zOM91Eh8dL7U4rhBQuwUcWOi
         P1lUtfN9F6i6idvtrgr0DFjnfg9K4hHJ/kkEd9BM=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] Qualcomm Defconfig updates for 5.3
Date:   Thu, 20 Jun 2019 00:01:49 -0500
Message-Id: <1561006911-28519-2-git-send-email-agross@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.3

for you to fetch changes up to 817bbbb7749decb99262dc3bb1569a579eea5ba8:

  ARM: qcom_defconfig: add support for USB networking (2019-06-16 11:31:50 -0700)

----------------------------------------------------------------
Qualcomm ARM Based defconfig Updates for v5.3

* Add support for USB networking
* Add support for display related options

----------------------------------------------------------------
Brian Masney (2):
      ARM: qcom_defconfig: add display-related options
      ARM: qcom_defconfig: add support for USB networking

 arch/arm/configs/qcom_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)
