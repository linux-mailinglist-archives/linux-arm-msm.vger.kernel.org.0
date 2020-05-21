Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3495F1DD3C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 19:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730149AbgEURD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 13:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730144AbgEURD2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 13:03:28 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AE3DC061A0F
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:28 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ci23so3361748pjb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+ZFyAn0PkXeIup2kRW5t6FNRm1aMj00iI9en0WntCK4=;
        b=rWUNlA362xvG255ffl+6S5fdUBPAiSu8oFgKDRswXo6o9noWbDQxSt962nJzRsLi7e
         miNzTFrGQceRqmmkIxxbctmAInQpv+Q5bEbaKJBAiX+Ee+YnuadEtj/DEfik41aEcez/
         GkBsLgMfpEhF8uRZSlGvYdQ+8uRGNJtBuMGCMwtR5wx4sCojw/4p2vo36D6iv2cY7FT0
         f0CT+5abiAbMfSR1xbcbAOhn6JF1BI03/5zYX4BRG+BYqK7I6Q+PzSWd5CqbtBMO2u1v
         v7wt/J6bWZyXPKKzCjAhrTHqweLLPFVVBeN6Uvmh7997+Z1kv0uZ3601tXVNX309yLEU
         899Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+ZFyAn0PkXeIup2kRW5t6FNRm1aMj00iI9en0WntCK4=;
        b=CXS2x2Bc8Vx9Or3FiATqhOj5cboxD7vpAp1SQRW79cVsfacEERPg4JmU4WpF5zZdbu
         MyNLQ6y5/wnqfeeqtm8vUus4V7usNTcbwA4ZL5UaQG9/6jComKY0Eebx+zLRDueHzu5+
         uUnAPoV0KKf/vaYEtWPFi/wEOC/PRGdXKMIfrxAx5BvsdkzJFRNgAAMRzm+JYh3J1bF+
         RsmsrUtXtyStJlI0tR4BuhoyGrBF5XeX2M9vFU+v3KhGkkLPJqUPn5SdDc6K92Bo70Q9
         NYYzq/3mrN7CRebEJUED5qWJ8GNkPMyl2J6Oly+ukja2mL/Ykg7HXWlFAS5bOA2TtXI2
         b4kQ==
X-Gm-Message-State: AOAM531yetd056js8tqbNz3KA94MMU7s31AElTtTaIhS/XrvvZZzVmif
        AhcZCEoOpI0HkDsLjTj0TrU7
X-Google-Smtp-Source: ABdhPJwNNqKYcu+11Sp2lQHUmd2GoZQB6BHct09YF8gHp9PqUCG6KWedXOXPTa6NHZyLChON9GFS4A==
X-Received: by 2002:a17:902:b98c:: with SMTP id i12mr10826361pls.41.1590080607299;
        Thu, 21 May 2020 10:03:27 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:69f:45f2:3d8d:3719:f568:7ee9])
        by smtp.gmail.com with ESMTPSA id e26sm4874693pff.137.2020.05.21.10.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:03:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 06/14] bus: mhi: core: Return appropriate error codes for AMSS load failure
Date:   Thu, 21 May 2020 22:32:41 +0530
Message-Id: <20200521170249.21795-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
References: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

When loading AMSS firmware using BHIe protocol, return -ETIMEDOUT if no
response is received within the timeout or return -EIO in case of a
protocol returned failure or an MHI error state.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/boot.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
index 17c636b4bc6e..cf6dc5a2361c 100644
--- a/drivers/bus/mhi/core/boot.c
+++ b/drivers/bus/mhi/core/boot.c
@@ -176,6 +176,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	void __iomem *base = mhi_cntrl->bhie;
 	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
 	u32 tx_status, sequence_id;
+	int ret;
 
 	read_lock_bh(pm_lock);
 	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
@@ -198,19 +199,19 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
 	read_unlock_bh(pm_lock);
 
 	/* Wait for the image download to complete */
-	wait_event_timeout(mhi_cntrl->state_event,
-			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
-			   mhi_read_reg_field(mhi_cntrl, base,
-					      BHIE_TXVECSTATUS_OFFS,
-					      BHIE_TXVECSTATUS_STATUS_BMSK,
-					      BHIE_TXVECSTATUS_STATUS_SHFT,
-					      &tx_status) || tx_status,
-			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
-
-	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
+	ret = wait_event_timeout(mhi_cntrl->state_event,
+				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
+				 mhi_read_reg_field(mhi_cntrl, base,
+						   BHIE_TXVECSTATUS_OFFS,
+						   BHIE_TXVECSTATUS_STATUS_BMSK,
+						   BHIE_TXVECSTATUS_STATUS_SHFT,
+						   &tx_status) || tx_status,
+				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
+	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
+	    tx_status != BHIE_TXVECSTATUS_STATUS_XFER_COMPL)
 		return -EIO;
 
-	return (tx_status == BHIE_TXVECSTATUS_STATUS_XFER_COMPL) ? 0 : -EIO;
+	return (!ret) ? -ETIMEDOUT : 0;
 }
 
 static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
-- 
2.17.1

