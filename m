Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 447743F5DF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Aug 2021 14:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237131AbhHXM2g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Aug 2021 08:28:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236953AbhHXM2g (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Aug 2021 08:28:36 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E35CC061764
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Aug 2021 05:27:51 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:fd1d:ce2:c16e:185a])
        by albert.telenet-ops.be with bizsmtp
        id lQTk250094wgRL106QTkyV; Tue, 24 Aug 2021 14:27:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mIVWq-005Q6P-5H; Tue, 24 Aug 2021 14:27:44 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mIVWp-009Dq7-5E; Tue, 24 Aug 2021 14:27:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        He Ying <heying24@huawei.com>
Cc:     Will Deacon <will@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] firmware: qcom_scm: QCOM_SCM should depend on ARCH_QCOM
Date:   Tue, 24 Aug 2021 14:27:41 +0200
Message-Id: <5cda77085c07dc2e8d2195507b287457cb2f09e9.1629807831.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Qualcomm Secure Channel Manager (SCM) is only present on Qualcomm
SoCs.  All drivers using it select QCOM_SCM, and depend on ARCH_QCOM.
Until recently, QCOM_SCM was an invisible symbol, but this was changed
by adding loadable module support, exposing it to all ARM and ARM64
users.  Hence add a dependency on ARCH_QCOM, to prevent asking the user
about this driver when configuring a kernel without Qualcomm SoC
support.

While at it, drop the dependency on ARM || ARM64, as that is implied by
HAVE_ARM_SMCCC.

Fixes: b42000e4b8741bf6 ("firmware: qcom_scm: Allow qcom_scm driver to be loadable as a permenent module")
Fixes: 2954a6f12f250890 ("firmware: qcom-scm: Fix QCOM_SCM configuration")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 220a58cf0a441ca2..0bebd5a62a9f4d66 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -204,7 +204,7 @@ config INTEL_STRATIX10_RSU
 
 config QCOM_SCM
 	tristate "Qcom SCM driver"
-	depends on ARM || ARM64
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on HAVE_ARM_SMCCC
 	select RESET_CONTROLLER
 
-- 
2.25.1

