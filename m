Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D45742B44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2019 17:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728550AbfFLPwX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Jun 2019 11:52:23 -0400
Received: from ns.iliad.fr ([212.27.33.1]:50248 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726829AbfFLPwX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Jun 2019 11:52:23 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 9F7FA20BC5;
        Wed, 12 Jun 2019 17:52:21 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 8A0D01FF7C;
        Wed, 12 Jun 2019 17:52:21 +0200 (CEST)
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v1] clk: qcom: msm8916: Don't build support by default
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Message-ID: <49b95f19-4da6-4491-6ed7-5238ecfc35a8@free.fr>
Date:   Wed, 12 Jun 2019 17:52:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun 12 17:52:21 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Build QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 by default only when
we're building MSM_GCC_8916.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 drivers/clk/qcom/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e1ff83cc361e..d5b065f64afc 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -21,7 +21,7 @@ if COMMON_CLK_QCOM
 
 config QCOM_A53PLL
 	tristate "MSM8916 A53 PLL"
-	default ARCH_QCOM
+	default MSM_GCC_8916
 	help
 	  Support for the A53 PLL on MSM8916 devices. It provides
 	  the CPU with frequencies above 1GHz.
@@ -31,7 +31,7 @@ config QCOM_A53PLL
 config QCOM_CLK_APCS_MSM8916
 	tristate "MSM8916 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
-	default ARCH_QCOM
+	default MSM_GCC_8916
 	help
 	  Support for the APCS Clock Controller on msm8916 devices. The
 	  APCS is managing the mux and divider which feeds the CPUs.
-- 
2.17.1
