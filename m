Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC2D4C66C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 07:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731266AbfFTFB6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 01:01:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:59904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731205AbfFTFB5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 01:01:57 -0400
Received: from hector.attlocal.net (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 401042173E;
        Thu, 20 Jun 2019 05:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561006917;
        bh=FdidKMWZXNZRlVki+qkAOY1C+Bx2Izlzw8sYpt8a3CI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EURBy383Hc5P8wWMvTVRKb9cJvqmKtIPpYDB3bj8dD9SSScKZhNeShTBybE9zXYs0
         2oON9TqW4X0ezMZ2X+DNNU5XgIEdpOjCCJ1sWtNGgnYo8T/oEbv/Y9iE7wu8Yhr7ah
         7aZyyMot4ERD8FuX6gtHCtycgYSwZhEh5Pfl+85U=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [GIT PULL] Qualcomm Device Tree updates for 5.3
Date:   Thu, 20 Jun 2019 00:01:51 -0500
Message-Id: <1561006911-28519-4-git-send-email-agross@kernel.org>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.3

for you to fetch changes up to 489bacb29818865d2db63d4800f4ddff56929031:

  ARM: dts: qcom: msm8974-hammerhead: add support for display (2019-06-16 11:27:45 -0700)

----------------------------------------------------------------
Qualcomm Device Tree Changes for v5.3

* Add display support to MSM8974
* Add display, backlight, and touchscreen support to MSM8974 Hammerhead
* Update coresight bindings for MSM8974 and APQ8064

----------------------------------------------------------------
Brian Masney (3):
      ARM: dts: qcom: msm8974-hammerhead: add support for backlight
      ARM: dts: msm8974: add display support
      ARM: dts: qcom: msm8974-hammerhead: add support for display

Jonathan Marek (1):
      ARM: dts: qcom: msm8974-hammerhead: add touchscreen support

Leo Yan (2):
      ARM: dts: qcom-apq8064: Update coresight DT bindings
      ARM: dts: qcom-msm8974: Update coresight DT bindings

 arch/arm/boot/dts/qcom-apq8064.dtsi                |   4 +-
 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     | 156 +++++++++++++++++++++
 arch/arm/boot/dts/qcom-msm8974.dtsi                | 138 +++++++++++++++++-
 3 files changed, 293 insertions(+), 5 deletions(-)
