Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00CF232E287
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 07:51:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229465AbhCEGvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 01:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbhCEGvc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 01:51:32 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B0E1C061756
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Mar 2021 22:51:30 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id s7so914882plg.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Mar 2021 22:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=ylMLa5HeZunolCrxNpnLV11Rpx2fup4TKTrVHiQOU3U=;
        b=rNisq513EGCX6tfWkzogcERqNZsSkzqFclF5sVaaAfKds223kD+oHMEqP3UDlZQvvG
         O3cT/fUPoCfA+jS6hpsC1rT/tgbIG6iwUN7+eWBjaUI6zqPDMul4RUV6oV1l/2fXnF8l
         gAtN2m4uFckt0n7pbj6PlHfJMhnfzHUZmcKIblB4XW7GS5MzOPZcR5Q2vIbDS7QuwaUr
         cYngL2N6xBMxwIgddHgzYAnj8xFcgAbRHvgdkXluioGbsPO9t8DJPRCKHJKvZw3nMbEU
         Bp+cgxOh0+TlfeM/1KfIVuoHF74o5I+WAKD2tjeoJrzWLC1sRo1gpJzLP3uOpf9zDTdw
         B58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ylMLa5HeZunolCrxNpnLV11Rpx2fup4TKTrVHiQOU3U=;
        b=bSLdI5uosPykZyMCp/5kRyOYO0I3xwu9inPiGnO/27TgxdiILjXc7E5d07LveZZdJA
         /rRM5gsc8jBefay9/ehv/q8fqYYrnVJ3/290rahpsyKC0dw1ldo4ya0b4PUly3UcDeAQ
         XulYuHYqBQAlnHR88LDqBFVOaU3Fn/5B18vSGvhu/+5wQ//pLmzmALXkPIJh/Bm1iuhq
         qFBOWBPet8cftPtdLq55lwTvDXKoysRhHd8yJdnrMfStK0pY/QgnQfygoB1oEzl+psCD
         bdKHOZcJVOefOuDBJIfdrXfS+EFZupNCzWmWt+Tkic7Ywe0Px+4Cozfy2kFdlR/5U7W+
         fNQA==
X-Gm-Message-State: AOAM531S6PGnsmBQzI+yBzlxzM9+GOM2oWF0OND7aldZ12hnPzq52Oqu
        VCJSWHVlVXgsQ0NlrA44v2iDtQ==
X-Google-Smtp-Source: ABdhPJy28iWsl4+zhRYFn1OA9ZMqc+2MnS79adEhS2kTGg18DVBGP1cvaMahUT5uWDForWgwDEP3Ww==
X-Received: by 2002:a17:902:7c8e:b029:e5:f70f:b7ab with SMTP id y14-20020a1709027c8eb02900e5f70fb7abmr860503pll.32.1614927090074;
        Thu, 04 Mar 2021 22:51:30 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c4sm1472874pfo.2.2021.03.04.22.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 22:51:27 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-efi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] arm64: efi: add check for broken efi poweroff
Date:   Fri,  5 Mar 2021 14:51:20 +0800
Message-Id: <20210305065120.11355-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Poweroff via UEFI Runtime Services doesn't always work on every single
arm64 machine.  For example, on Lenovo Flex 5G laptop, it results in
a system reboot rather than shutdown.  Add a DMI check to keep such
system stay with the original poweroff method (PSCI).

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 arch/arm64/kernel/efi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index fa02efb28e88..8ae0002c72f1 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -7,6 +7,7 @@
  * Copyright (C) 2013, 2014 Linaro Ltd.
  */
 
+#include <linux/dmi.h>
 #include <linux/efi.h>
 #include <linux/init.h>
 
@@ -113,12 +114,26 @@ int __init efi_set_mapping_permissions(struct mm_struct *mm,
 				   set_permissions, md);
 }
 
+static const struct dmi_system_id efi_reboot_broken_table[] = {
+	{
+		.ident = "Lenovo Flex 5G",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Flex 5G"),
+		},
+	},
+	{ } /* terminator */
+};
+
 /*
  * UpdateCapsule() depends on the system being shutdown via
  * ResetSystem().
  */
 bool efi_poweroff_required(void)
 {
+	if (dmi_check_system(efi_reboot_broken_table))
+		return false;
+
 	return efi_enabled(EFI_RUNTIME_SERVICES);
 }
 
-- 
2.17.1

