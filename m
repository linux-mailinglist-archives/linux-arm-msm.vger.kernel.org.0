Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C736279DCB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Sep 2020 05:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730303AbgI0DhV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Sep 2020 23:37:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730301AbgI0DhV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Sep 2020 23:37:21 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628E9C0613D3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 20:37:21 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id q12so1483947plr.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2020 20:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DdES/Vq1PmYk4fpVLK/fAaZVLR8AEvP+LlTNygV5c/w=;
        b=Gm7+b5ETti6f6Mm+chzD9X8OacoppQNJNyp7/tD65olZneAxORM1rO/goBjocQHcEN
         5pKUCnfuanQ2boGYnNTDiRaR3XP8ctKCJaXJ7Mn3OXFBLbtlJyz8QINoiyroxKsOmAHO
         T9+gVrNHWgrCr59FmU2ZXpt59nO+e17HRwlKHKvj4AatPQLs4u1XQnzz9adsPgURcKfS
         SF1CG5lfrHi0dRXuRkpUQ1J8Qwjy8Q7hXW5sPeZH4S3pHz9o43cBaTWOxrZE57+BdG8h
         ZyOOyHoM3seidO1Y1/3KFFgdZsG5LkDegb4WYcwCHlx/NnWXhXLLwDWEtx1nupjJQxdz
         t3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DdES/Vq1PmYk4fpVLK/fAaZVLR8AEvP+LlTNygV5c/w=;
        b=FiEPuMXM0tKhWhEwBDp0EtC3KmMOSSOlQ2dEpGz8ZqzrJUKz+VDOUmR0eorf+ji9ii
         XCrnTHb0xcOZFt2KqfBfxcf/V+o6YR9W3G/12LURc2m6VNG+RjMxjGFem1o6srsLDyCB
         6OBYtDB1CM8OwMcjDqMFqI3WF8SoSj6oSzmm2F2skiSjcWqH7T3PYfUpccS8RYe0Q6sS
         FvPdJVcSV5/+jhV7h4aIOIHc/jxPJixozxlKOVRcRSHNQXDkc8X0qjJLZ1QLuNzKz3ds
         Leub2goW6q+TJixO5/TDa2uBhbxB5xQzTtcpGfBhxqJOR+LqfAD5c5OQaLhYsofSkxlq
         9QJA==
X-Gm-Message-State: AOAM531KWDePrGUayQqPsgQWWSHx754zhtiPQa+UBD5tYW5dhIRG7uiM
        N4gjSvh6IG4rmClv4Lgc7GHA
X-Google-Smtp-Source: ABdhPJz1PUO3o77Nd5w3/nAobQJiQXA7mG8ihCHTvu+LbAIfWCrcV5WvVVduXbwCYye+oZ9Yvndy9A==
X-Received: by 2002:a17:90a:71c9:: with SMTP id m9mr4003418pjs.146.1601177840934;
        Sat, 26 Sep 2020 20:37:20 -0700 (PDT)
Received: from Mani-XPS-13-9360.localdomain ([2409:4072:980:cb63:5c53:a3bf:dd6b:614d])
        by smtp.gmail.com with ESMTPSA id gx5sm2821439pjb.57.2020.09.26.20.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 20:37:20 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 5/5] bus: mhi: core: Move MHI_MAX_MTU to external header file
Date:   Sun, 27 Sep 2020 09:06:52 +0530
Message-Id: <20200927033652.11789-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200927033652.11789-1-manivannan.sadhasivam@linaro.org>
References: <20200927033652.11789-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Currently this macro is defined in internal MHI header as
a TRE length mask. Moving it to external header allows MHI
client drivers to set this upper bound for the transmit
buffer size.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/internal.h | 1 -
 include/linux/mhi.h             | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 33c23203c531..3e41edae829c 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -453,7 +453,6 @@ enum mhi_pm_state {
 #define CMD_EL_PER_RING			128
 #define PRIMARY_CMD_RING		0
 #define MHI_DEV_WAKE_DB			127
-#define MHI_MAX_MTU			0xffff
 #define MHI_RANDOM_U32_NONZERO(bmsk)	(prandom_u32_max(bmsk) + 1)
 
 enum mhi_er_type {
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 6522a4adc794..10ebda44ea3c 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -15,6 +15,9 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
+/* MHI client drivers to set this upper bound for tx buffer */
+#define MHI_MAX_MTU 0xffff
+
 #define MHI_MAX_OEM_PK_HASH_SEGMENTS 16
 
 struct mhi_chan;
-- 
2.17.1

