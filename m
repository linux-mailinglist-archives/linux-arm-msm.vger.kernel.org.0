Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE15639D08D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Jun 2021 21:00:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhFFTCk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Jun 2021 15:02:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbhFFTCk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Jun 2021 15:02:40 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9D3C061766;
        Sun,  6 Jun 2021 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=tYadTfIoZ063BCYi28o2+yHVKdZM0UZmfXU63uIM+zg=; b=gZkcRLe4vImUM9yyx9hjE4R9SZ
        6IauWEXbBajAilT2DGhO50oDmgKBOa9G1QxRJBMwamqxClusF6Ad7DeSjo+OXsjKPN7lU1/Px5ml2
        RJQLTH437JqUyvBWFr3H+jXbtVTnX7qdVUjaHMbCqyH2Hh6YtyIzQl74RR6RKIX0PW7cgxJKq7r1m
        1Z9nS6FmHAn+e37m36gdoY47c0hwumm1GPZDUozIswGmvktxBAP7//XWTTKSVh2HPusTL79RRVL67
        qHTRVMgx7F0Fw04tRSiQwDbRtNlYXWY5ApXeUIiRv2w9fa3LankQZ5cAdXMLpbx29oOQm6NdoZgxZ
        sjHEyEHA==;
Received: from [2601:1c0:6280:3f0::bd57] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lpy0v-000hJc-AB; Sun, 06 Jun 2021 19:00:49 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, He Ying <heying24@huawei.com>
Subject: [PATCH] cpuidle: ARM_QCOM_SPM_CPUIDLE should depend on HAVE_ARM_SMCCC
Date:   Sun,  6 Jun 2021 12:00:48 -0700
Message-Id: <20210606190048.689-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCOM_SCM depends on HAVE_ARM_SMCCC, so ARM_QCOM_SPM_CPUIDLE should
also depend on HAVE_ARM_SMCCC since 'select' does not follow any
dependency chains.

This fixes a kconfig warning and subsequent build errors:

WARNING: unmet direct dependencies detected for QCOM_SCM
  Depends on [n]: (ARM [=y] || ARM64) && HAVE_ARM_SMCCC [=n]
  Selected by [y]:
  - ARM_QCOM_SPM_CPUIDLE [=y] && CPU_IDLE [=y] && (ARM [=y] || ARM64) && (ARCH_QCOM [=n] || COMPILE_TEST [=y]) && !ARM64 && MMU [=y]

arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-smc.o: in function `__scm_smc_do_quirk':
qcom_scm-smc.c:(.text+0x5c): undefined reference to `__arm_smccc_smc'
arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-legacy.o: in function `scm_legacy_call':
qcom_scm-legacy.c:(.text+0x140): undefined reference to `__arm_smccc_smc'
arm-linux-gnueabi-ld: drivers/firmware/qcom_scm-legacy.o: in function `scm_legacy_call_atomic':
qcom_scm-legacy.c:(.text+0x364): undefined reference to `__arm_smccc_smc'

Fixes: a871be6b8eee ("cpuidle: Convert Qualcomm SPM driver to a generic CPUidle driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: He Ying <heying24@huawei.com>
---
 drivers/cpuidle/Kconfig.arm |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210604.orig/drivers/cpuidle/Kconfig.arm
+++ linux-next-20210604/drivers/cpuidle/Kconfig.arm
@@ -108,6 +108,7 @@ config ARM_TEGRA_CPUIDLE
 config ARM_QCOM_SPM_CPUIDLE
 	bool "CPU Idle Driver for Qualcomm Subsystem Power Manager (SPM)"
 	depends on (ARCH_QCOM || COMPILE_TEST) && !ARM64 && MMU
+	depends on HAVE_ARM_SMCCC
 	select ARM_CPU_SUSPEND
 	select CPU_IDLE_MULTIPLE_DRIVERS
 	select DT_IDLE_STATES
