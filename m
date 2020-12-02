Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FEC2CB959
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbgLBJnq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:43:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgLBJnp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:43:45 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E47C061A48
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:42:37 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id r9so694006pjl.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:42:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RE5w69On3Eny/j1GWLpJs16JP4zJIqHV3HKQLkmEnls=;
        b=JPPSNoTRmp/EUqlKK0tgYpFwxrc2r5uK3JCoBu+cCeT+rtSa4GsKf2KYLttB8xNAb/
         NyZAXoaACHSI9gFMtlnxN+8C52a7YDQapSGExgEosRAAioaQmRgHdwua2u48UiyFUu9c
         H994PptDsvu2E79UUWTOUWrNxd+e8BJHcTS5uIsXBc0lGsJ5FevHk1FaKI2ik5mwGcPn
         agEz6TbsxGJ6jm2JUFYqi0vubpE8zqkLAvzZfxuYWQpwwMNxmJEmACFwMtIAF/F3t5uA
         qqh7bQ3elan9mzomtma6EgtOzWMugcXyS5HwdMN6dJf2nTMM6+3ur3Qsa5YZpkmDzbaO
         0J3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RE5w69On3Eny/j1GWLpJs16JP4zJIqHV3HKQLkmEnls=;
        b=ZyXRiiihsuMvwJqlUMvZuZngIt8R1f3S7LGpodPH4o9RpJE3lmyu6jqfXCBqwvuhOC
         SSneYkPAhchjrJylLt1wGSrqGH7lk59mFY8wq+9qcpNajD2CdWtT/Z5mTjLfu7eesZUR
         pkDrixPRMiCgS9+Mb9K0KKwCEWnl3EFvOhakc0qwYs65MLo8CbK/H9uuEs2MMciBbDKn
         X0MfHzU0IkscSlGU38ZMPwHhNQpLgCMgCjmuZGeV3QNP0UVy9AsCm17ZDX1vQlMNe5fr
         yuc0raDYIvGShrZMyM5TSEOeLl3WnL6X9MSNvOcNaImcx5pi2NLYTQKRPurf3gnuyPvj
         3f/w==
X-Gm-Message-State: AOAM532mz8OI+QzSYJ4rO9q5t5LIEmSkHi5H/0V3Hu60e3b4AHSall3M
        4w26IsiVQ1EI6F52XLkQ1xT4
X-Google-Smtp-Source: ABdhPJxsCM31MTDonNiC9EKnIYgo5e6CfLQoofYocFx5sTbJDG5Trzhp0G3F2WTegxHHcrLJaINieQ==
X-Received: by 2002:a17:902:7606:b029:da:246c:5bd8 with SMTP id k6-20020a1709027606b02900da246c5bd8mr1935031pll.27.1606902156684;
        Wed, 02 Dec 2020 01:42:36 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:42:35 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/29] bus: mhi: core: fix potential operator-precedence with BHI macros
Date:   Wed,  2 Dec 2020 15:11:33 +0530
Message-Id: <20201202094159.107075-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jeffrey Hugo <jhugo@codeaurora.org>

The BHI_MSMHWID and BHI_OEMPKHASH macros take a value 'n' which is
a BHI register index. If 'n' is an expression rather than a simple
value, there can be an operator precedence issue which can result
in the incorrect calculation of the register offset. Adding
parentheses around the macro parameter can prevent such issues.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 7989269ddd96..78e4e84d6743 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -153,8 +153,8 @@ extern struct bus_type mhi_bus_type;
 #define BHI_SERIALNU (0x40)
 #define BHI_SBLANTIROLLVER (0x44)
 #define BHI_NUMSEG (0x48)
-#define BHI_MSMHWID(n) (0x4C + (0x4 * n))
-#define BHI_OEMPKHASH(n) (0x64 + (0x4 * n))
+#define BHI_MSMHWID(n) (0x4C + (0x4 * (n)))
+#define BHI_OEMPKHASH(n) (0x64 + (0x4 * (n)))
 #define BHI_RSVD5 (0xC4)
 #define BHI_STATUS_MASK (0xC0000000)
 #define BHI_STATUS_SHIFT (30)
-- 
2.25.1

