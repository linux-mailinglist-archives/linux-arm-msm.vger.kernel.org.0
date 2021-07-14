Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174EA3C8248
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jul 2021 11:59:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239036AbhGNKCE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jul 2021 06:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239031AbhGNKCC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jul 2021 06:02:02 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31DCC061762
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 02:59:10 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id n11so1243965plc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jul 2021 02:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=l1bjuoaTVbYtnhNI71QZX5Bx6fnm6uPZuv4M80rHUjI=;
        b=EM4ks1xnAhxy/oyMPK+YmsxsS8bDIyg6oX+je8bM1orlDBciQn00YRtWkJ0vI93Prn
         U8/+BVyPocLBJLw91waPql/4SmUgMaS5kDcPbxb9Pqb56PehJDlipv5vKTuglcl4oYUB
         BY/uh9Gt3fJZDwJL3gVTrRsLNyQoTaI3jKQxgiaUy54G3AeuLrdn8Qf931iK5E1atSz7
         qNHHsRAmujlZBUVJfgVhXfUv9e9xKxY79+WaKIxRqyBNFZxkPFG8pmsVUXptDTdlI1o7
         swi/NTWbePwxQwz7qTU/7E1Sqpb/Awqp8F+b9t+etHf/aiZ/PTLqyCrm9y7HhlCGp++s
         sToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=l1bjuoaTVbYtnhNI71QZX5Bx6fnm6uPZuv4M80rHUjI=;
        b=cQiFeK/+Yifs3YGXNZUb8+O/Y5AghrWNN7g4f24g9dUbSM2Q1XBSkaxGuAAzo04YoT
         hPatpL02lM/fS++JIqArtrTUVE6fRajiRgoP3qRUD4xPJpR+8kzQBV3rh4Kuh6RuzguW
         ealTifjAIABapFdmeLfs3xSQu74Z2jNUuMXK4CsZlF65TbisIoK6yfYKxBI/dEJyxRMi
         sZjjwVe57fze0C7MuKoNuDSONIsxdMKrYoCRL6USbyGQg2WmJ1zJy6NSnajv6FvxPHpP
         ObcUbB73K2A++SLLY97XHZjZDX7VOUAGdZK8scVsI2/IgoCCKYecX08rj2QKezMdeqJD
         uWGQ==
X-Gm-Message-State: AOAM531gaD866NyEuEZRvE+VoEXd+bed5qfjlbWeHgZZ7hkNZuCHaoG+
        UW+JjYvAB23bX3UzJhF20KBCtw==
X-Google-Smtp-Source: ABdhPJxzCVfEsbc0mVDVQlW7BG7ySqnlExnHTBB9BPUghBKax4eq63LO/nDMtA6PqW46DrcO1K6xTA==
X-Received: by 2002:a17:902:d217:b029:105:e265:65c7 with SMTP id t23-20020a170902d217b0290105e26565c7mr7203320ply.16.1626256750527;
        Wed, 14 Jul 2021 02:59:10 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g1sm2283304pgs.23.2021.07.14.02.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 02:59:10 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Luca Weiss <luca@z3ntu.xyz>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matteo Croce <mcroce@microsoft.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Petr Mladek <pmladek@suse.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 2/2] Input: pm8941-pwrkey - Respect reboot_mode for warm reset
Date:   Wed, 14 Jul 2021 17:58:49 +0800
Message-Id: <20210714095850.27185-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210714095850.27185-1-shawn.guo@linaro.org>
References: <20210714095850.27185-1-shawn.guo@linaro.org>
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

