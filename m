Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACE3C2CB988
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Dec 2020 10:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388381AbgLBJpA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 04:45:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388600AbgLBJom (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 04:44:42 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75C43C08E861
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Dec 2020 01:43:26 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id f17so754154pge.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Dec 2020 01:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qlptgLAgYYEEBECAOSdw0l78qtjRaQyT/9MkpEBmWJU=;
        b=WxxRtYpdbnDZtPw8aTHbrkPc+jst9eXu8a/qPDLPBiWTxotTgJ8Ubm0oQ2o+y2RvFX
         RoKL2hzhmGcLywD4OEw1EPmRTjht7k1YQs3pUInAPwQ5gQlJ+LVpjgjZnkU5yXArFpMJ
         l5LL0RisqLXXnqITYhjmYDey6k5UxZfW5oq5cx9q+SX35hAUQYlV+03dh7owyGCPiKWg
         kPAWTDiWwnIM43ltUznEhK0yvwKHRRDIY6wL/Ioq3BSMF6wkmUJmdNOo4aL/Y5nlrB0a
         5WBnDSEZ10wvhFbFTm1otfhZjJ2qRQ+6IHzqb7UKsalWCj74IY6jtn91JM355Oxyiohp
         XbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qlptgLAgYYEEBECAOSdw0l78qtjRaQyT/9MkpEBmWJU=;
        b=oQyZM6jfXLnRqwsK6tRR/HQHxdzjY2kx9UEbuGM6XtVUBJ2b/rGZrE5oieHIgywFZC
         txxBDqumGyHtGJCV8A38ljI20n/tlKXWXHC91JqOmK+BNbDDPov5bqFm1HseXN8Zk9BV
         EIJ6LGvPry/7eIv97Ao40UTUxTz+PcqVOhpsWDa3tCS5mh3bHdSTVGmuBcYjPENacEGD
         DiUl82iBsqHpMYAU/JKL7Ao8+6QNXqYn+FPFQQ0z2UE8X0xVuSg5cI9B+K2U98t3anwj
         ggFppNg4qRnY4ACbUjX2abZJgIQ9TK38gN4a15qHHb+urg2I1x79BH/b89x7D+R2X2M8
         7x5A==
X-Gm-Message-State: AOAM531S8nM7omJQFhfuVtF0KsK2drW6Jh0+JD82kmsQkjWzUCmBgcAt
        T9kWPzKc7bU4SyLEzQE5qmerfoLOCXqk
X-Google-Smtp-Source: ABdhPJxT1rNeYAGdoGJhRD4cjBn7M5tuSWn2D4ijSTQOlQt5SagBBrNbcMJ0jQSezS2l2A9RgWKVuQ==
X-Received: by 2002:a63:e:: with SMTP id 14mr1879403pga.426.1606902206012;
        Wed, 02 Dec 2020 01:43:26 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id bg8sm1393990pjb.52.2020.12.02.01.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Dec 2020 01:43:25 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 15/29] bus: mhi: core: Skip device wake in error or shutdown states
Date:   Wed,  2 Dec 2020 15:11:45 +0530
Message-Id: <20201202094159.107075-16-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
References: <20201202094159.107075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

MHI client drivers can request a device wake even if the device
may be in an error state or undergoing a shutdown. To prevent
unnecessary device wake processing, check for the device state
and bail out early so that the clients are made aware of the
device state sooner.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index 805b6fa748f0..029919647002 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -827,6 +827,10 @@ int __mhi_device_get_sync(struct mhi_controller *mhi_cntrl)
 
 	/* Wake up the device */
 	read_lock_bh(&mhi_cntrl->pm_lock);
+	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
+		read_unlock_bh(&mhi_cntrl->pm_lock);
+		return -EIO;
+	}
 	mhi_cntrl->wake_get(mhi_cntrl, true);
 	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
 		mhi_trigger_resume(mhi_cntrl);
-- 
2.25.1

