Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7748E1AC0A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2020 14:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634110AbgDPMCM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Apr 2020 08:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634504AbgDPMCG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Apr 2020 08:02:06 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Apr 2020 05:02:06 PDT
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E67C061A0C
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2020 05:02:06 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:fd83:81bb:c1d7:433d])
        by michel.telenet-ops.be with bizsmtp
        id TPx0220094dKHqf06Px0kz; Thu, 16 Apr 2020 13:57:03 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jP38e-0003Kb-9y; Thu, 16 Apr 2020 13:57:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jP38e-0005Jx-7f; Thu, 16 Apr 2020 13:57:00 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     Robert Richter <rrichter@marvell.com>,
        Wei Xu <xuwei5@hisilicon.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] [RFC] arm64: Add dependencies to vendor-specific errata
Date:   Thu, 16 Apr 2020 13:56:58 +0200
Message-Id: <20200416115658.20406-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416115658.20406-1-geert+renesas@glider.be>
References: <20200416115658.20406-1-geert+renesas@glider.be>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently the user is asked about enabling support for each and every
vendor-specific erratum, even when support for the specific platform is
not enabled.

Fix this by adding platform dependencies to the config options
controlling support for vendor-specific errata.

Note that FUJITSU_ERRATUM_010001 is left untouched, as no config symbol
exists for the Fujitsu A64FX platform.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/Kconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 8d33d7fed6d8549b..81f52f0b988e6350 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -622,6 +622,8 @@ config ARM64_ERRATUM_1542419
 
 	  If unsure, say Y.
 
+if ARCH_THUNDER2
+
 config CAVIUM_ERRATUM_22375
 	bool "Cavium erratum 22375, 24313"
 	default y
@@ -697,6 +699,8 @@ config CAVIUM_TX2_ERRATUM_219
 
 	  If unsure, say Y.
 
+endif # ARCH_THUNDER2
+
 config FUJITSU_ERRATUM_010001
 	bool "Fujitsu-A64FX erratum E#010001: Undefined fault may occur wrongly"
 	default y
@@ -718,6 +722,7 @@ config FUJITSU_ERRATUM_010001
 
 config HISILICON_ERRATUM_161600802
 	bool "Hip07 161600802: Erroneous redistributor VLPI base"
+	depends on ARCH_HISI
 	default y
 	help
 	  The HiSilicon Hip07 SoC uses the wrong redistributor base
@@ -726,6 +731,8 @@ config HISILICON_ERRATUM_161600802
 
 	  If unsure, say Y.
 
+if ARCH_QCOM
+
 config QCOM_FALKOR_ERRATUM_1003
 	bool "Falkor E1003: Incorrect translation due to ASID change"
 	default y
@@ -768,8 +775,11 @@ config QCOM_FALKOR_ERRATUM_E1041
 
 	  If unsure, say Y.
 
+endif # ARCH_QCOM
+
 config SOCIONEXT_SYNQUACER_PREITS
 	bool "Socionext Synquacer: Workaround for GICv3 pre-ITS"
+	depends on ARCH_SYNQUACER
 	default y
 	help
 	  Socionext Synquacer SoCs implement a separate h/w block to generate
-- 
2.17.1

