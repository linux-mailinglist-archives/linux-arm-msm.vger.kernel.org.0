Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D81CA2E9A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 17:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbhADQKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 11:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729390AbhADQIK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 11:08:10 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D57C2C061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 08:07:29 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id a6so18931692wmc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 08:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=D3FY0m7LeloNo/GU5bzjUJdGWPyDuclaFRVWh7ls4wY=;
        b=cqcV+gm/7vkAygZEwdTzZm+Dz8EuQ2wy7vnF6lhjXYdbObIeqePcJ4DE1oWZdU7Tpt
         TiZrHmWq3hCOuD3heH4QfKnCFB+GuZ+vT6lhzA7YhbyeDqQU5vxAgr/2RUcvRbn4reeq
         VNTa2aW1IEG8Ma3jjW5phejZIvDBElkVqkVcVJbBl9X461molVlwz0ShRfiT2kcaywvD
         F2wTgjHrkVAcz4iec0f6MpQYB3j+yN//5CLeVfa2HLPvAsv39y8u6T8/X2IIt0BFJWGA
         Lo3eH13SM21MhvVK4o7L8+Ug97dm1axSsXehruzfu/RLijohVM3Q7bHKqeN2QP27FTy1
         fnEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=D3FY0m7LeloNo/GU5bzjUJdGWPyDuclaFRVWh7ls4wY=;
        b=MIGK3ubTz6iYkOYZ3PBg8UKfZtYZqwx73LN5T0ycDvD8UTM/wqE/STHARl04jRbacE
         6gjeXt95OaINruiBspgVlwaXj5j36FxsYHL4ego0VFRtMDUU1R+/qjhZhoyiIo689sq3
         cLT7DxWFAKHn4Q6+LXTCKOds9qgYRYFDeDi+fznXwlHeuXY4SmK0PmFgOJBcGwVSB2vZ
         nUZwWtfWbX7UKO6OsWk8pxVXJ8bFXodbfnSfd7458mfB+TNoxL4AeqeLsFFBDnFALD9r
         mub+MPRCTWM1VnXuE/hp/dGlGOJI7wH+WkB44iAi7lRR9eqq44p4LbyZn7BZQ62p2ckG
         8KMw==
X-Gm-Message-State: AOAM531UKvGdLnoO81+Ppejj6HPiDN9LiHkWQrI/N/K2eFsei/XKEnbC
        dshbgwqg1iMEmw4LojYp5SC61Q==
X-Google-Smtp-Source: ABdhPJzgL9ZPKeGKwFdWB6bbNmnQSCsW2w+XZuWY0peA6005akJIQREdpu9j4yxI7rfXEuMiVk94Wg==
X-Received: by 2002:a7b:c842:: with SMTP id c2mr27377848wml.100.1609776448508;
        Mon, 04 Jan 2021 08:07:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id h9sm89278049wre.24.2021.01.04.08.07.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:28 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 01/10] bus: mhi: core: Add device hardware reset support
Date:   Mon,  4 Jan 2021 17:14:50 +0100
Message-Id: <1609776899-30664-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MHI specification allows to perform a hard reset of the device
when writing to the SOC_RESET register. It can be used to completely
restart the device (e.g. in case of unrecoverable MHI error).

This is up to the MHI controller driver to determine when this hard
reset should be used, and in case of MHI errors, should be used as
a reset of last resort (after standard MHI stack reset).

This function is a stateless function, the MHI layer do nothing except
triggering the reset by writing into the right register(s), this is up
to the caller to ensure right mhi_controller state (e.g. unregister the
controller if necessary).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/main.c | 13 +++++++++++++
 include/linux/mhi.h         |  9 +++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index d34d7e9..9b42540 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -135,6 +135,19 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
 
+void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
+{
+	if (mhi_cntrl->reset) {
+		mhi_cntrl->reset(mhi_cntrl);
+		return;
+	}
+
+	/* Generic MHI SoC reset */
+	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
+		      MHI_SOC_RESET_REQ);
+}
+EXPORT_SYMBOL_GPL(mhi_soc_reset);
+
 int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
 			 struct mhi_buf_info *buf_info)
 {
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 562862f..54afcae 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -347,6 +347,7 @@ struct mhi_controller_config {
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
  * @write_reg: Write a MHI register via the physical link (required)
+ * @reset: Controller specific reset function (optional)
  * @buffer_len: Bounce buffer length
  * @index: Index of the MHI controller instance
  * @bounce_buf: Use of bounce buffer
@@ -437,6 +438,7 @@ struct mhi_controller {
 			u32 *out);
 	void (*write_reg)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
 			  u32 val);
+	void (*reset)(struct mhi_controller *mhi_cntrl);
 
 	size_t buffer_len;
 	int index;
@@ -673,6 +675,13 @@ enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl);
 enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
 
 /**
+ * mhi_soc_reset - Trigger a device reset. This can be used as a last resort
+ *		   to reset and recover a device.
+ * @mhi_cntrl: MHI controller
+ */
+void mhi_soc_reset(struct mhi_controller *mhi_cntrl);
+
+/**
  * mhi_device_get - Disable device low power mode
  * @mhi_dev: Device associated with the channel
  */
-- 
2.7.4

