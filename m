Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 003334B749
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 13:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbfFSLoc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 07:44:32 -0400
Received: from ns.iliad.fr ([212.27.33.1]:53654 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727067AbfFSLoc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 07:44:32 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id C96CD20564;
        Wed, 19 Jun 2019 13:44:30 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id ACE482017A;
        Wed, 19 Jun 2019 13:44:30 +0200 (CEST)
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Subject: [PATCH v3] clk: qcom: msm8916: Don't build drivers by default
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Message-ID: <0171956f-b367-9f3b-f690-71657d8c50ec@free.fr>
Date:   Wed, 19 Jun 2019 13:44:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jun 19 13:44:30 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
built by default. List them in defconfig after dropping the default.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
 arch/arm64/configs/defconfig | 2 ++
 drivers/clk/qcom/Kconfig     | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5a8e853833cf..3277944626c2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -658,6 +658,8 @@ CONFIG_CLK_IMX8MQ=y
 CONFIG_CLK_IMX8QXP=y
 CONFIG_TI_SCI_CLK=y
 CONFIG_COMMON_CLK_QCOM=y
+CONFIG_QCOM_A53PLL=y
+CONFIG_QCOM_CLK_APCS_MSM8916=y
 CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_GCC_8074=y
diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index e1ff83cc361e..6461a1aa7325 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -21,7 +21,6 @@ if COMMON_CLK_QCOM
 
 config QCOM_A53PLL
 	tristate "MSM8916 A53 PLL"
-	default ARCH_QCOM
 	help
 	  Support for the A53 PLL on MSM8916 devices. It provides
 	  the CPU with frequencies above 1GHz.
@@ -31,7 +30,6 @@ config QCOM_A53PLL
 config QCOM_CLK_APCS_MSM8916
 	tristate "MSM8916 APCS Clock Controller"
 	depends on QCOM_APCS_IPC || COMPILE_TEST
-	default ARCH_QCOM
 	help
 	  Support for the APCS Clock Controller on msm8916 devices. The
 	  APCS is managing the mux and divider which feeds the CPUs.
-- 
2.17.1
