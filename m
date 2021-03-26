Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E36734AE7A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 19:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhCZSXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 14:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229933AbhCZSWs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 14:22:48 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01DDCC0613AA
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 11:22:48 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id h25so5196986pgm.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Mar 2021 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jTn/uUJ+LFQPTBhHrUYL0kAqEpchxiI/QloMXShvaSg=;
        b=nn1MjHPYaWoHftAWKn+3FFCIcCa1eRT0uZOUpIjI6j9ZE93LqX2Eak3CIXk5YdtBQL
         GGDir9kdxKg6NiSr0WbgqwjXmOypBn/eXFhQPhmyypBVAheL+hv3GXh/XPngDcVsvDO4
         LN7dFGVyS5TBS8fVHd+fO0kw6lD+LXfyb8OoVNkor57JZ9e4XjZRNrGJ36+S7eyQ/lMc
         V0dMhEbO4lBRJZ+KADbhAO0gemOU3lhHZ90YgBOY9ERfHSqH5lsKvge/lQxkKXFP8hza
         NhQh5NTxoSSNhkyG02fiUEfZErr8lR4DV0kJ8i6ttc35oQBcolKceTZWsS+SWAiGFAIX
         HCBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jTn/uUJ+LFQPTBhHrUYL0kAqEpchxiI/QloMXShvaSg=;
        b=m8QbVg+RJy9f9tUo9SaeRVOaRlt8Tvo9G+dvUu0FSkTCGCBBzYnCPfvoB/rJjpktYz
         9imKXKuW7RTRNHaQH5FzZscD41gEv0vUwRuVGUnrPUdGVVt0d9NbkOI/59M+tVJIjIZX
         fjpPIp3FflzSMVpPjEKt9S7ChTvgdB4SqpDVaYHo/oAJ32VS9YCK4fyUikky6OxDLTUc
         tTbA9tkXoLzdnkPK1FQTUWYPcwQIweIK+1PF97jeYkVEs4llZRmC/8hgiRH6ZF98eR05
         N6U94NBuR6x1eDwz0kxatvAbgBOe0Is69ZNpoowk+X7JPeA9dDlGpUbIghBLVBmtZWEr
         KCog==
X-Gm-Message-State: AOAM530iSfbUB3nwbaCmdT1fuhKttS1ldPc1P4v9oi7E3V9jdeJ34p9f
        Pn+GjZrHHJHIeW4YN8Hp8P+S
X-Google-Smtp-Source: ABdhPJyrPVoMQlwEHjwBivlbDbaEwnf1pl7RuLCDnlGwsVTz+RGbEjpi5UGFQQlmPZpjo1Bp0pjYtA==
X-Received: by 2002:a63:fd50:: with SMTP id m16mr13460841pgj.256.1616782967428;
        Fri, 26 Mar 2021 11:22:47 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.139])
        by smtp.gmail.com with ESMTPSA id p1sm9573592pfn.22.2021.03.26.11.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 11:22:47 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     soc@kernel.org
Cc:     linux@armlinux.org.uk, will@kernel.org, arnd@arndb.de,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3] ARM: kernel: Fix interrupted SMC calls
Date:   Fri, 26 Mar 2021 23:52:37 +0530
Message-Id: <20210326182237.47048-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Qualcomm ARM32 platforms, the SMC call can return before it has
completed. If this occurs, the call can be restarted, but it requires
using the returned session ID value from the interrupted SMC call.

The ARM32 SMCC code already has the provision to add platform specific
quirks for things like this. So let's make use of it and add the
Qualcomm specific quirk (ARM_SMCCC_QUIRK_QCOM_A6) used by the QCOM_SCM
driver.

This change is similar to the below one added for ARM64 a while ago:
commit 82bcd087029f ("firmware: qcom: scm: Fix interrupted SCM calls")

Without this change, the Qualcomm ARM32 platforms like SDX55 will return
-EINVAL for SMC calls used for modem firmware loading and validation.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v3:

* Rebased on top of v5.12-rc2
* Sent to SoC list since there was no review so far apart from initial one
  by Russel

Changes in v2:

* Preserved callee saved registers and used the registers r4, r5 which
  are getting pushed onto the stack.

 arch/arm/kernel/asm-offsets.c |  3 +++
 arch/arm/kernel/smccc-call.S  | 11 ++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
index be8050b0c3df..70993af22d80 100644
--- a/arch/arm/kernel/asm-offsets.c
+++ b/arch/arm/kernel/asm-offsets.c
@@ -24,6 +24,7 @@
 #include <asm/vdso_datapage.h>
 #include <asm/hardware/cache-l2x0.h>
 #include <linux/kbuild.h>
+#include <linux/arm-smccc.h>
 #include "signal.h"
 
 /*
@@ -148,6 +149,8 @@ int main(void)
   DEFINE(SLEEP_SAVE_SP_PHYS,	offsetof(struct sleep_save_sp, save_ptr_stash_phys));
   DEFINE(SLEEP_SAVE_SP_VIRT,	offsetof(struct sleep_save_sp, save_ptr_stash));
 #endif
+  DEFINE(ARM_SMCCC_QUIRK_ID_OFFS,	offsetof(struct arm_smccc_quirk, id));
+  DEFINE(ARM_SMCCC_QUIRK_STATE_OFFS,	offsetof(struct arm_smccc_quirk, state));
   BLANK();
   DEFINE(DMA_BIDIRECTIONAL,	DMA_BIDIRECTIONAL);
   DEFINE(DMA_TO_DEVICE,		DMA_TO_DEVICE);
diff --git a/arch/arm/kernel/smccc-call.S b/arch/arm/kernel/smccc-call.S
index 00664c78faca..931df62a7831 100644
--- a/arch/arm/kernel/smccc-call.S
+++ b/arch/arm/kernel/smccc-call.S
@@ -3,7 +3,9 @@
  * Copyright (c) 2015, Linaro Limited
  */
 #include <linux/linkage.h>
+#include <linux/arm-smccc.h>
 
+#include <asm/asm-offsets.h>
 #include <asm/opcodes-sec.h>
 #include <asm/opcodes-virt.h>
 #include <asm/unwind.h>
@@ -27,7 +29,14 @@ UNWIND(	.fnstart)
 UNWIND(	.save	{r4-r7})
 	ldm	r12, {r4-r7}
 	\instr
-	pop	{r4-r7}
+	ldr	r4, [sp, #36]
+	cmp	r4, #0
+	beq	1f			// No quirk structure
+	ldr     r5, [r4, #ARM_SMCCC_QUIRK_ID_OFFS]
+	cmp     r5, #ARM_SMCCC_QUIRK_QCOM_A6
+	bne	1f			// No quirk present
+	str	r6, [r4, #ARM_SMCCC_QUIRK_STATE_OFFS]
+1:	pop	{r4-r7}
 	ldr	r12, [sp, #(4 * 4)]
 	stm	r12, {r0-r3}
 	bx	lr
-- 
2.25.1

