Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9A62CB960
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388300AbgLBJn4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:43:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388274AbgLBJny (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:43:54 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D342FC061A4F
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:42:54 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id b10so893959pfo.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DLEpetMqROUc2OOQ0fVepK2+3FOFzdcD46Lm023xCZ4=;
        b=sU60JdKX1bMF/Sz7d8IzSVSDvOXsbOvwUI2moEbOr32zMImmIXisPR4ivQlpmM7GBD
         8vU1N9taSa/VTd1x+vqPqF5yJ6oGdyP3GjJR8VNb5fncOJw3lqXP0LEsSN3Q4oYTen08
         dUbgpk7gZuqw9j6ZLhcVGRUT2vwJIkRgR01Qcx4yhPc6xiIT/+hPfNfTYPchU9r4Y2E+
         UP/6nNpdVg8yEy5zSUEwbuxuLZ5gTrxBE9pWgOaSiP+fXxcGewfU0N+dPTAOw06E2kf/
         YKLPbK1jgLsfu9DbvxhXgf+J73zF3NMf/BGAk8IDgjaSwn72crV72GvqnVYcYkOnBNT0
         584Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DLEpetMqROUc2OOQ0fVepK2+3FOFzdcD46Lm023xCZ4=;
        b=t8t3IyoMst77RD8suQgAAdMQKaV/ETyYc9W1drLaxMC/v5kCBbvUNj6Zn80DM7QAzx
         Yu5q6XKBEHSyezbZV3fg07XGIMoprjQ5stNh8drLeGMxDf/J9/ejSKtT/3Mmk4isCb57
         DIupO7hcgl5nWOVR86PbabT1+KptqwR7rxhG36xxs0xoxIHMxO6HXnYoMG9WDib/wtQs
         ugthpl8hIWuWOqJYa3aE8AvKV48sqh/kcXFIbvSTwO+a6yCGc31uNzkO+fQKhwMwcnmg
         fmOfMH6IFyxxhaNVdJ+tPgg24XTxeXNr9P2grO5Ab7E/EB703mHALlgTEECMnkI2AxKw
         k2HA==
X-Gm-Message-State: AOAM530ZTMmlYDjga3lIXU2ilXEFdNqlzCkx9Xh98wuMN0aq8BRv/OKf
        GV00KyILbPe8iCjoAo7mOnxq
X-Google-Smtp-Source: ABdhPJwHSq366NwHqsSA6mecJNUKt0tiWbN7DTmr/Cyx2wGsHOOFILBi1UUgxdtGZEY4wVJOMDXCew==
X-Received: by 2002:a63:c54e:: with SMTP id g14mr1900811pgd.398.1606902174395;
        Wed, 02 Dec 2020 01:42:54 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:42:53 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kernel test robot <lkp@intel.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/29] bus: mhi: core: Remove unnecessary counter from mhi_firmware_copy()
Date:   Wed,  2 Dec 2020 15:11:37 +0530
Message-Id: <20201202094159.107075-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

There is an extra 'i' counter in the mhi_firmware_copy() function
which is unused. Remove it to clean-up code and reduce stack
space as well as improve efficiency of the function.

Fixes: cd457afb1667 ("bus: mhi: core: Add support for downloading firmware over BHIe")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 24422f5c3d80..6b6fd9668c3b 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -365,7 +365,6 @@ static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
 	size_t remainder = firmware->size;
 	size_t to_cpy;
 	const u8 *buf = firmware->data;
-	int i = 0;
 	struct mhi_buf *mhi_buf = img_info->mhi_buf;
 	struct bhi_vec_entry *bhi_vec = img_info->bhi_vec;
 
@@ -377,7 +376,6 @@ static void mhi_firmware_copy(struct mhi_controller *mhi_cntrl,
 
 		buf += to_cpy;
 		remainder -= to_cpy;
-		i++;
 		bhi_vec++;
 		mhi_buf++;
 	}
-- 
2.25.1

