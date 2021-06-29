Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5DB53B6CC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jun 2021 05:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231680AbhF2DHo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 23:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhF2DHn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 23:07:43 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A41FC061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 20:05:16 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id gd24-20020a17090b0fd8b02901702bcb0d90so925395pjb.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jun 2021 20:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=l1bjuoaTVbYtnhNI71QZX5Bx6fnm6uPZuv4M80rHUjI=;
        b=EFPrS5/IJmf67dyAm4KZznFpmXEsnAa2yEGDVtpNxOLdO65IWgWwfwgGT+RNfTijOV
         pT9AHojI9B4wdqFrbbuDK9Iyq1NtRAkonZuR3EgTCLL9+XLZvvSPTJExSdHhPpX3rfgR
         jISwbhxauiV+PhGAeb3h1AThAj6H/JbNvO++U0QOfpkm6nXW0dTLu2uKXd1yVImMa164
         G1PitWSzoNldBkGugs/r+oiQrgbveIvdCtzfFtR1deZpP147mtbS0RxJnUIBk/pw7jfE
         M+6wVVfBjuhE8xit8VPLe7uy72BYfMR+bNpy/SDf9islfRADLhXMBwHoDrjVaxeKg2ZV
         bkbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=l1bjuoaTVbYtnhNI71QZX5Bx6fnm6uPZuv4M80rHUjI=;
        b=a2sf48ZLu6mJVWFqWimlLBtaytXI2gCRonRj3gHnbk+0jx/yX3JIidrU4HvpCfsE0f
         X/R6hxmOE5kGtvVBZJUs4QB8VUxWz0c8Qt8k+COp4Uu+677Nl/LWm+xXZyZmyJnHrFQT
         A7SXJRv7wlHUydPsc/p3InxxtA2gvJpACrD8c8NKgJcOpZAxanV9SAX+7FsgVIqkgd1R
         vyHGst5Ego9ogi1nt0NJi+rNlzgwVi5j+GveXA7E3Nx94T2ifkPAdYQhEzJHWJKVYR/S
         xjoSUr+6azOypjajTuDnUUh40zRDrCXsuJidNtmax2N35f/AhI4uATJJgib/qV6PJ+9J
         y/rA==
X-Gm-Message-State: AOAM532DJABjoTXqSjqep4X9Z66DDWlXQfWTvOZmc92sSj71hSl2IX91
        xBNwgQHpae8V70P+a+uwhV0X5w==
X-Google-Smtp-Source: ABdhPJzhSix3YEGvTst44Nwpe6Pm7XYTmpfnwFY/JEmitw9IOcyIOb19UeWrQWTdx2IMDixv6stgnQ==
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr41885724pja.181.1624935915630;
        Mon, 28 Jun 2021 20:05:15 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i20sm15617163pfo.130.2021.06.28.20.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 20:05:15 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH] Input: pm8941-pwrkey - respect reboot_mode for warm reset
Date:   Tue, 29 Jun 2021 11:05:09 +0800
Message-Id: <20210629030509.2893-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On some devices, e.g. Sony Xperia M4 Aqua, warm reset is used to reboot
device into bootloader and recovery mode.  Instead of always doing hard
reset, add a check on reboot_mode for possible warm reset.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/input/misc/pm8941-pwrkey.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/input/misc/pm8941-pwrkey.c b/drivers/input/misc/pm8941-pwrkey.c
index cf8104454e74..9b14d6eb1918 100644
--- a/drivers/input/misc/pm8941-pwrkey.c
+++ b/drivers/input/misc/pm8941-pwrkey.c
@@ -27,6 +27,7 @@
 #define PON_PS_HOLD_RST_CTL2		0x5b
 #define  PON_PS_HOLD_ENABLE		BIT(7)
 #define  PON_PS_HOLD_TYPE_MASK		0x0f
+#define  PON_PS_HOLD_TYPE_WARM_RESET	1
 #define  PON_PS_HOLD_TYPE_SHUTDOWN	4
 #define  PON_PS_HOLD_TYPE_HARD_RESET	7
 
@@ -93,7 +94,10 @@ static int pm8941_reboot_notify(struct notifier_block *nb,
 		break;
 	case SYS_RESTART:
 	default:
-		reset_type = PON_PS_HOLD_TYPE_HARD_RESET;
+		if (reboot_mode == REBOOT_WARM)
+			reset_type = PON_PS_HOLD_TYPE_WARM_RESET;
+		else
+			reset_type = PON_PS_HOLD_TYPE_HARD_RESET;
 		break;
 	}
 
-- 
2.17.1

