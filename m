Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5877218F4A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2020 13:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727548AbgCWMbW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Mar 2020 08:31:22 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39283 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728207AbgCWMbW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Mar 2020 08:31:22 -0400
Received: by mail-pg1-f194.google.com with SMTP id b22so7124874pgb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2020 05:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=NJFfdkDDVWPfDBODZ8jf2fP70+u0slAGMe8B4fkY7/s=;
        b=T//sib/MZoxXffAJaWHl9eMzDJmthoI8qNI/kjNt8Ajq5Cq8KKr0VHXAj1aYl/bNtk
         3wwn6PDok2sBsJwI18vqGCUco5fhYj638DSNZDMtAakR31sX1GJLvPbE6oGaBO+iZqOw
         10+ACqr0ozOCADRKWYvnjsvuaOAWbbwdlqa2j3D4SARsL+y74g5BuBeG2Tlf6uUidSmG
         Tg8J0HUZl30Zij9FjsQK19wQve7BT/HpNBIITiq2JR1oZQKo7S0O2Sjm45P+T1ME+9sq
         MY82aVsQnJgTzvsT5ukc4GKMVlUFhad+YysZx3w2lndapDcXQ6IUQL5iWABaGFJtfCmM
         NxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=NJFfdkDDVWPfDBODZ8jf2fP70+u0slAGMe8B4fkY7/s=;
        b=o23KyY3qzXjL77GfZVgx5W3IWreTg0pp5HB0mWrko58I2Wy9lkPRKx0H70DpGEHMKE
         mnPqU+isTyA1EqyvO0s/ZmEseLc5QndKF1/ClMwQ5x8d/EThWAFeo+FcoZJ3RaFhVoSh
         yjJxjBe7Sx2DR4KqIZ9L8Pm5rASdX5BWYVW6IxsViHKIemxlZfnQvj8EDVQ3No4UZbia
         N5cguUpnu5mZnE12KobWbAgppJzyH+HPmA7ckznY6dcxKL1IuP5uUZvRVeXQA1n8JOd0
         stPkSE44ACZFXkOWB3C/s1noxcEBHMmelLlF6uSNmisrfm/jW7bGgaEunyzA4jybGRzW
         b89g==
X-Gm-Message-State: ANhLgQ0K7AoDLvCyayMtoetHH8+Q/LCTU1f0m0uaPN7E3v8Oow7GsaAH
        TV0jQ5T/isvONbOE0rDhhemC
X-Google-Smtp-Source: ADFU+vu+KpKyjeTtIwrK9NfcrgcsN7GPjs67i9gcir0fNE/tpe0Cw/eovSyq0cQsxIezch8w8yOmRw==
X-Received: by 2002:a63:6d43:: with SMTP id i64mr2694413pgc.201.1584966679266;
        Mon, 23 Mar 2020 05:31:19 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 144sm3590131pgd.29.2020.03.23.05.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 05:31:18 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org, davem@davemloft.net
Cc:     smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/7] bus: mhi: core: Add support for reading MHI info from device
Date:   Mon, 23 Mar 2020 18:00:57 +0530
Message-Id: <20200323123102.13992-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200323123102.13992-1-manivannan.sadhasivam@linaro.org>
References: <20200323123102.13992-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MHI register base has several registers used for getting the MHI
specific information such as version, family, major, and minor numbers
from the device. This information can be used by the controller drivers
for usecases such as applying quirks for a specific revision etc...

While at it, let's also rearrange the local variables
in mhi_register_controller().

Suggested-by: Hemant Kumar <hemantk@codeaurora.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/core/init.c     | 19 +++++++++++++++++--
 drivers/bus/mhi/core/internal.h | 10 ++++++++++
 include/linux/mhi.h             |  8 ++++++++
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index eb7f556a8531..d136f6c6ca78 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -802,12 +802,12 @@ static int parse_config(struct mhi_controller *mhi_cntrl,
 int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 			    struct mhi_controller_config *config)
 {
-	int ret;
-	int i;
 	struct mhi_event *mhi_event;
 	struct mhi_chan *mhi_chan;
 	struct mhi_cmd *mhi_cmd;
 	struct mhi_device *mhi_dev;
+	u32 soc_info;
+	int ret, i;
 
 	if (!mhi_cntrl)
 		return -EINVAL;
@@ -874,6 +874,21 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
 		mhi_cntrl->unmap_single = mhi_unmap_single_no_bb;
 	}
 
+	/* Read the MHI device info */
+	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs,
+			   SOC_HW_VERSION_OFFS, &soc_info);
+	if (ret)
+		goto error_alloc_dev;
+
+	mhi_cntrl->family_number = (soc_info & SOC_HW_VERSION_FAM_NUM_BMSK) >>
+					SOC_HW_VERSION_FAM_NUM_SHFT;
+	mhi_cntrl->device_number = (soc_info & SOC_HW_VERSION_DEV_NUM_BMSK) >>
+					SOC_HW_VERSION_DEV_NUM_SHFT;
+	mhi_cntrl->major_version = (soc_info & SOC_HW_VERSION_MAJOR_VER_BMSK) >>
+					SOC_HW_VERSION_MAJOR_VER_SHFT;
+	mhi_cntrl->minor_version = (soc_info & SOC_HW_VERSION_MINOR_VER_BMSK) >>
+					SOC_HW_VERSION_MINOR_VER_SHFT;
+
 	/* Register controller with MHI bus */
 	mhi_dev = mhi_alloc_device(mhi_cntrl);
 	if (IS_ERR(mhi_dev)) {
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 18066302e6e2..5deadfaa053a 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -196,6 +196,16 @@ extern struct bus_type mhi_bus_type;
 #define BHIE_RXVECSTATUS_STATUS_XFER_COMPL (0x02)
 #define BHIE_RXVECSTATUS_STATUS_ERROR (0x03)
 
+#define SOC_HW_VERSION_OFFS (0x224)
+#define SOC_HW_VERSION_FAM_NUM_BMSK (0xF0000000)
+#define SOC_HW_VERSION_FAM_NUM_SHFT (28)
+#define SOC_HW_VERSION_DEV_NUM_BMSK (0x0FFF0000)
+#define SOC_HW_VERSION_DEV_NUM_SHFT (16)
+#define SOC_HW_VERSION_MAJOR_VER_BMSK (0x0000FF00)
+#define SOC_HW_VERSION_MAJOR_VER_SHFT (8)
+#define SOC_HW_VERSION_MINOR_VER_BMSK (0x000000FF)
+#define SOC_HW_VERSION_MINOR_VER_SHFT (0)
+
 #define EV_CTX_RESERVED_MASK GENMASK(7, 0)
 #define EV_CTX_INTMODC_MASK GENMASK(15, 8)
 #define EV_CTX_INTMODC_SHIFT 8
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index d83e7772681b..b295de5b4ab4 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -310,6 +310,10 @@ struct mhi_controller_config {
  * @sw_ev_rings: Number of software event rings
  * @nr_irqs_req: Number of IRQs required to operate (optional)
  * @nr_irqs: Number of IRQ allocated by bus master (required)
+ * @family_number: MHI controller family number
+ * @device_number: MHI controller device number
+ * @major_version: MHI controller major revision number
+ * @minor_version: MHI controller minor revision number
  * @mhi_event: MHI event ring configurations table
  * @mhi_cmd: MHI command ring configurations table
  * @mhi_ctxt: MHI device context, shared memory between host and device
@@ -375,6 +379,10 @@ struct mhi_controller {
 	u32 sw_ev_rings;
 	u32 nr_irqs_req;
 	u32 nr_irqs;
+	u32 family_number;
+	u32 device_number;
+	u32 major_version;
+	u32 minor_version;
 
 	struct mhi_event *mhi_event;
 	struct mhi_cmd *mhi_cmd;
-- 
2.17.1

