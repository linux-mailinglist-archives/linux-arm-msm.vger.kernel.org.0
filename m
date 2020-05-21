Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B38721DD3D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2020 19:04:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730260AbgEURDz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 May 2020 13:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730243AbgEURDz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 May 2020 13:03:55 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F299AC061A0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x2so3595926pfx.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2020 10:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wdveJ3QhJNINg8lglcDvLzRXp2z12os7RH9vf3yIpNE=;
        b=NhKBsJyihkvsrQkj40lqNfmDwS+dfhrbm+15c+GfeEdpuoCNmM7Jqy0xTkx9T/JypI
         /woiP1HaoPWnfJ3xo0GAACLtbQF83Q3WSospDMTwZqq+tipHhDt+SbhHA8vcM85G0sgs
         qMSarZe7mZ7aMsoMlnzb3/ZKEzpTS5f5SaV5NG4XRFbJIDOz3gUsJKBvOZOrEK1qkVqY
         qeAxaIB/Q7dFcisnftkyIh59I5M0SnxDZsNtrREGQykms7bUSqrQbpR6himTN2aIKcAj
         oRk2KhL3XF01CFWeuZepeIfL54OQl2Dd/r06NxXIZrqPJ3uNgm8G+a3N/L6mEy2J/Tyt
         lCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wdveJ3QhJNINg8lglcDvLzRXp2z12os7RH9vf3yIpNE=;
        b=WXivQvkiGNPe39baOZM0tcbYQOZoi5VuFqJkrPaj8GReUIXpyBnwgZ1+owoQIPih6e
         dib6TwbWkzjxd9IGP57AzblPmc46lgH6zZ1nxEDkuKcwWmcPSj9az++kD+Peb2GWERzZ
         73vpPUz57qOzIjeG59PX3sY3sHiyV88SBbDXRIUaOLChbRohvQEiNt/NF14cALTd3PJZ
         ksuLCoWYe1eF/9hbm9/Wj9UMEoboBHUSmp0U9EAvv4NbjbHzG4GzVe/noHrYl/gLXpd9
         3Y/Bmk99+l/PyQ+8GKCGW+m0QZAs3Q7NKUmZqxxsw8D+w9uq94iwuzOTidBU9ZMOgpud
         0R+g==
X-Gm-Message-State: AOAM533Rk2e7D3laMC6MmfMLYf0H7nT/+07ioKnSWWQoPfqhZ6Ipb+Zs
        pFf9qzsBhP0khVFup9tmiZnJ
X-Google-Smtp-Source: ABdhPJyT33cgYu1WN1UmasTVgYrtrhpSGUliKfOh7q/C4M/ciA9VYqcYhhfl6vTBN+TznX/uAEsjHQ==
X-Received: by 2002:a63:4b0c:: with SMTP id y12mr9486645pga.56.1590080634479;
        Thu, 21 May 2020 10:03:54 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:69f:45f2:3d8d:3719:f568:7ee9])
        by smtp.gmail.com with ESMTPSA id e26sm4874693pff.137.2020.05.21.10.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 10:03:53 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, jhugo@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [RESEND PATCH 12/14] bus: mhi: core: Do not process SYS_ERROR if RDDM is supported
Date:   Thu, 21 May 2020 22:32:47 +0530
Message-Id: <20200521170249.21795-13-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
References: <20200521170249.21795-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Hemant Kumar <hemantk@codeaurora.org>

Devices that support RDDM do not require processing SYS_ERROR as it is
deemed redundant. Avoid SYS_ERROR processing if RDDM is supported by
the device.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index 7429189840b0..eef145180a55 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -396,9 +396,9 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
 	}
 	write_unlock_irq(&mhi_cntrl->pm_lock);
 
-	/* If device in RDDM don't bother processing SYS error */
-	if (mhi_cntrl->ee == MHI_EE_RDDM) {
-		if (mhi_cntrl->ee != ee) {
+	 /* If device supports RDDM don't bother processing SYS error */
+	if (mhi_cntrl->rddm_image) {
+		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
 			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
 			wake_up_all(&mhi_cntrl->state_event);
 		}
@@ -734,6 +734,11 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
 			{
 				enum mhi_pm_state new_state;
 
+				/* skip SYS_ERROR handling if RDDM supported */
+				if (mhi_cntrl->ee == MHI_EE_RDDM ||
+				    mhi_cntrl->rddm_image)
+					break;
+
 				dev_dbg(dev, "System error detected\n");
 				write_lock_irq(&mhi_cntrl->pm_lock);
 				new_state = mhi_tryset_pm_state(mhi_cntrl,
-- 
2.17.1

