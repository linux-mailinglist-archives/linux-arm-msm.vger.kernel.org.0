Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 490FE50BF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 15:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729301AbfFXN0H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 09:26:07 -0400
Received: from ns.iliad.fr ([212.27.33.1]:48576 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729221AbfFXN0H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 09:26:07 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id AA2C0202C7;
        Mon, 24 Jun 2019 15:26:05 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 9275D2020F;
        Mon, 24 Jun 2019 15:26:05 +0200 (CEST)
Subject: [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Georgi Djakov <georgi.djakov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
 <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
Date:   Mon, 24 Jun 2019 15:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Mon Jun 24 15:26:05 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 used to be enabled by default
in drivers/clk/qcom/Kconfig. A recent patch changed that by dropping
the 'default ARCH_QCOM' directive.

Add the two options explicitly in the arm64 defconfig, to avoid
functional regressions.

Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
---
Bjorn, Andy, I believe you can take this patch through the qcom tree,
once Stephen takes the parent patch.
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
2.17.1
