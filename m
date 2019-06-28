Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5ED59378
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2019 07:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfF1FgZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jun 2019 01:36:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:56240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbfF1FgZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jun 2019 01:36:25 -0400
Received: from localhost (107-207-74-175.lightspeed.austtx.sbcglobal.net [107.207.74.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7B2E4214AF;
        Fri, 28 Jun 2019 05:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561700184;
        bh=+8IwKueaEBLXU1EoGhnReZv3KnbikWL+cKVAqL3KuRA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aNIUI4H+fKdm3axVeyiTFeo3h8A0jNA9fx7qKQgY3iNCJPbZ8QiMFeGFo/T9bMLms
         UnO6d/pU/vsERJbQcnc+svA7YhISIa3ahaY2ThIIwhzGd7/pHgkwalJ6Ui3O/PmhTD
         ybwe3ov62qzMkvZsYA27UudRS69zZmQphFY6wLGQ=
From:   Andy Gross <agross@kernel.org>
To:     arm@kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@baylibre.com>
Subject: [GIT PULL] Qualcomm Device Tree updates for 5.3 Part 2
Date:   Fri, 28 Jun 2019 00:36:22 -0500
Message-Id: <1561700182-18108-2-git-send-email-agross@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561700182-18108-1-git-send-email-agross@kernel.org>
References: <1561700182-18108-1-git-send-email-agross@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following changes since commit 489bacb29818865d2db63d4800f4ddff56929031:

  ARM: dts: qcom: msm8974-hammerhead: add support for display (2019-06-16 11:27:45 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.3-2

for you to fetch changes up to e9146339515ece09ee651f122a51a26ae652ab80:

  ARM: dts: msm8974-FP2: Add vibration motor (2019-06-25 13:29:32 -0500)

----------------------------------------------------------------
Qualcomm Device Tree Changes for v5.3

* Add vibrator motor for MSM8974 based Fairphone 2

----------------------------------------------------------------
Luca Weiss (1):
      ARM: dts: msm8974-FP2: Add vibration motor

 arch/arm/boot/dts/qcom-msm8974-fairphone-fp2.dts | 6 ++++++
 1 file changed, 6 insertions(+)
