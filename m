Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855162D99AA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440020AbgLNOT3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:19:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440023AbgLNOTM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:19:12 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C7D1C0613D6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:32 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id i9so16586817wrc.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pOEXaNJekDpHw1CP3O0Pj76+vI42wYO3Vt7QFcDTgJc=;
        b=sTMD/CplS0S2yV2Hd1GUgMdESiqWIQtE8xVzBZN5YN9zGU9S5Vsv7Iz2wdtQTnFbfO
         83+eHaG3FVH3fFSaHmJ5b8osXFVCHyU7pFpFoZoC9NBpRQCvdGFCtpbegY4Bb+tSy0Vn
         Z8f+0iR8TorLTMyHJeIaFb8CD68OFLpe7D1PoWSyh9FZxP7pzcS05IQgetLCht0OkepG
         XMjrPE4fKA9DvEklgLhvSc5OD1/wdANR00h11U/2Cxr5q4s+ciU+qDU4ikIPZSmx94Mx
         lk5bA7apPImY8zEfKk/XT0J5CROmgmKNUoaW+LXGLeMcoVp8ljB83I+0g2hFzwJrl//g
         JNcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pOEXaNJekDpHw1CP3O0Pj76+vI42wYO3Vt7QFcDTgJc=;
        b=uUtrbeXw3g4iXEVz+oOEH0JRplkmwjZYoOaQ3H9gsSJ2Yt0IAUxnxpxWIW/geZDBI8
         +fV0XvhDWVX28iUP4o7tDLK7KQaLFERkaXqNPoBBdfZicveBOGiXKb2jjEHBsJhymUuS
         ubfjkHVDIS3B0IZzkj2qkEM2DXS/kVfTMM3KB/uZIvaeyNgtJ6UyIKI+ZS8ecjmKCyd+
         Zo+uZIb80G8/wm5xg64SBCheRD096c9fqi4zz8F8gQRpLQz5QWNYVPtPl/ksMm1r9J03
         YZV7ahXcnaGIhCYQiCtf4wbeOPXnHyrOxY9RXBh1jTQYOZX94HxNB6BnBTKTKeO7giXv
         FwBg==
X-Gm-Message-State: AOAM532jdqVVxRMa4eFc3IeTNl1yaX/7qQvVoevz6uyT1b5sYDMlmG2r
        KzBga17gt6J24T49pIj7GgELPZojYVpimw==
X-Google-Smtp-Source: ABdhPJxVdmdsdiODBTq+Cfwio7l5mULMRBQRTz175sMMxN080iykRo59mos6jC9QdPBh0g1Tz6ohHQ==
X-Received: by 2002:a5d:42cf:: with SMTP id t15mr28985885wrr.267.1607955511222;
        Mon, 14 Dec 2020 06:18:31 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:30 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 02/10] bus: mhi: core: Add device hardware reset support
Date:   Mon, 14 Dec 2020 15:25:29 +0100
Message-Id: <1607955937-26951-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MHI specification allows to perform a hard reset of the device
when writing to the SOC_RESET register. It can be used to completely
restart the device (e.g. in case of unrecoverable MHI error).

This is up to the MHI controller driver to determine when this hard
reset should be used, and in case of MHI errors, should be used as
a reset of last resort (after standard MHI stack reset).

This function is prefixed with 'mhi_reg' to highlight that this is
a stateless function, the MHI layer do nothing except triggering the
reset by writing into the right register, this is up to the caller
to ensure right mhi_controller state (e.g. unregister the controller
if necessary).

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/main.c | 7 +++++++
 include/linux/mhi.h         | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index a353d1e..9f8ce15 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -142,6 +142,13 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
 
+void mhi_reg_soc_reset(struct mhi_controller *mhi_cntrl)
+{
+	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
+		      MHI_SOC_RESET_REQ);
+}
+EXPORT_SYMBOL_GPL(mhi_reg_soc_reset);
+
 int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
 			 struct mhi_buf_info *buf_info)
 {
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 2754742..8b1bf80 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -687,6 +687,13 @@ enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl);
 enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
 
 /**
+ * mhi_reg_soc_reset - Trigger a device reset. This can be used as a last resort
+ *		       to reset and recover a device.
+ * @mhi_cntrl: MHI controller
+ */
+void mhi_reg_soc_reset(struct mhi_controller *mhi_cntrl);
+
+/**
  * mhi_device_get - Disable device low power mode
  * @mhi_dev: Device associated with the channel
  */
-- 
2.7.4

