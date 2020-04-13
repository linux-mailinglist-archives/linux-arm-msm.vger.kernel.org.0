Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3421A6637
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 14:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbgDMMOt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 08:14:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728256AbgDMMOn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 08:14:43 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE0CC03BC82
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 05:08:05 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id c5so4360129pgi.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 05:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=BIBvMgUnvDgGZghMH04dMf9slrG7wjbl7QR/9HSXTJo=;
        b=uRy1s7EGEp8BkdEjZAQpmQo3cCodNSSvRaev6POOo+mew8bO4EAHrfOWQQCMqUIfiY
         tZZomzvqBubP3hpBJx91Tdt7UlfEGizPkNnPi08th3i0O5OFPQatYf26n4Im3rKwpkGr
         t8/MUJBK0cfSnwBxkBatfcLTOPDR+jrAR6UBZoq/c451VLHjzEDrv1ro4Qx2+27AVnC6
         2m8eIMS2J6shbLRpbcoIJFgG9Uk45VJDxRJwVk5uPLlVljS1M1Jvq0Qm/tKVOhqhaztq
         XwxsXZ08txZzy1uLTHGR0LTpgNi2Sf2ehPE3WQf8OYlML6Xo6KslCbYr0XiTty5KaEAA
         5PDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BIBvMgUnvDgGZghMH04dMf9slrG7wjbl7QR/9HSXTJo=;
        b=hgSzMEItyx10c64G/yYIwNMGbXbRs3Xv4okZS31ZMKY+VsfC0oOne/gLQARVaNoVq3
         3eVp244ghnmahdc4Jlp1wmLRcodj+yc1k9f5w8LrNpbaWyLvESGfnQ1oz3VrGZzjKHl0
         6bsP22jgpRI1PZ+dlroGLWo1oS5SR8elM6up8RMB1a2OeRq9aM13I1n39p5Cf9EDTb/d
         77h5goElJNUFW/yYNjtrTSgah5UAeHb3EgEyE9HWHRi9CWYAZrMV51wyzPNwkqrPJCHi
         vBPkOpWkof5NTGyp8a0RyJnB/3RPgiSu1VUSbr1Zb0R2vFqgMdf2MOnFf/tcjfCI/GQ1
         8Zwg==
X-Gm-Message-State: AGi0PuYAN74WV+aZF/jk5v2bixT5fhB8xOkyGfYe25PrbzjfVk7MfkZw
        5QMP8RXxbQDmU1vmic91IIQriZtwyA==
X-Google-Smtp-Source: APiQypLIoeYk9G74CAvG8xdvpdDVlfoDimcpFm6oRfnwQBcwTRX6j+ysTHd1tHSRhBTGCvlmc+VtHw==
X-Received: by 2002:a63:2cd5:: with SMTP id s204mr16420791pgs.71.1586779684515;
        Mon, 13 Apr 2020 05:08:04 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:621d:5eab:c98c:e94e:e075:c316])
        by smtp.gmail.com with ESMTPSA id i187sm8493136pfg.33.2020.04.13.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 05:08:03 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     hemantk@codeaurora.org, jhugo@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        smohanad@codeaurora.org, dan.carpenter@oracle.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] bus: mhi: core: Fix parsing of mhi_flags
Date:   Mon, 13 Apr 2020 17:37:40 +0530
Message-Id: <20200413120741.2832-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the current parsing of mhi_flags, the following statement always
return false:

eob = !!(flags & MHI_EOB);

This is due to the fact that 'enum mhi_flags' starts with index 0 and we
are using direct AND operation to extract each bit. Fix this by using
BIT() macro to extract each bit and make the mhi_flags index start from 1.

Fixes: 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 6 +++---
 include/linux/mhi.h         | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index eb4256b81406..4165a853c189 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1090,9 +1090,9 @@ int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
 	if (ret)
 		return ret;
 
-	eob = !!(flags & MHI_EOB);
-	eot = !!(flags & MHI_EOT);
-	chain = !!(flags & MHI_CHAIN);
+	eob = !!(flags & BIT(0));
+	eot = !!(flags & BIT(1));
+	chain = !!(flags & BIT(2));
 	bei = !!(mhi_chan->intmod);
 
 	mhi_tre = tre_ring->wp;
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index ad1996001965..22185fecbbf2 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -53,7 +53,7 @@ enum mhi_callback {
  * @MHI_CHAIN: Linked transfer
  */
 enum mhi_flags {
-	MHI_EOB,
+	MHI_EOB = 1,
 	MHI_EOT,
 	MHI_CHAIN,
 };
-- 
2.17.1

