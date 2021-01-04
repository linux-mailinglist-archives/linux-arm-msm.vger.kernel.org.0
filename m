Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DAD92E9634
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 14:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbhADNmv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 08:42:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726637AbhADNmv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 08:42:51 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A85C061794
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 05:42:10 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id k10so18503705wmi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 05:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=07rDU/OuVJvk6JF93jkdN2tmY83mHUDzBU2a1fn2P0w=;
        b=l/0aQMuTQBAkPOZSm08RmdSm1kqoPxvPBl8+byeCXJuumKsmV7g/OKSTYLCtnQUxDO
         17JxJiiI8zweDO/K+6s9g83X/5T3A/CaoqIjmFJd/AY3eerFXN2aHu60wcKMHgFxwRIu
         zHouXN+yMPWIHfWMELCP/J8Ec4OL8QowQMY/mCBGWOJXZNecyJLWMZa2/BPCXAs4Mpud
         qPYphRh/LEBs+PIEn0OV6Uis7aIVMRE/Y8swRHVYKi/2Tw6aBIEH3Uzi4Glz1F6D3V0G
         O6Opz+5jDwpWbZbPqYcUZFHOeynzYJGLSQydnl4YMsQVk8N737R72TFy4q55BHMlBDPk
         d/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=07rDU/OuVJvk6JF93jkdN2tmY83mHUDzBU2a1fn2P0w=;
        b=awWkFCPSQtTyIFZaEwo2+hFsh4TWaLb3ibZUaQrT2XcMiq7BPnMH0ELzoll5Osehaa
         dqs7nMaCEyNaZsOud9FrBKey1rLAuZZZ7HJlZ6Dy10+qGWdEnmltnThqojUKauB4uVAx
         sbQCgO82TibqHkvzCoDMFb7zcuOlRNL18U5sYkfy5p74Ogb/BmJtEuij/GZCEUe7Hg4e
         HVicjHdvPIbgXolAyAm2ndpNNVSgXCTLgIZrjk8zv/tYEQEVV5+C2xnRj3AuSb5tdKpd
         Os2eMjti8/A2wSor4zwNpUAygWMWOWm/+73oBYpBqNDTt3O8sURVzBpdBNcsn11uWilq
         a84w==
X-Gm-Message-State: AOAM531+MTSoWR61XBq6LFecHa4d5CsSzIQ73AyZqnUiA713VCiomo36
        eNx0GwOhKTwFa8QNkHPW8sRjGQ==
X-Google-Smtp-Source: ABdhPJxJUbxFiH7898YMOyBHTL+yE72qpn0TdvoHqC+Vw0DghViP3JDBmbeyLPL+cbV12GuSLlOsQw==
X-Received: by 2002:a1c:9ac6:: with SMTP id c189mr27075961wme.137.1609767729368;
        Mon, 04 Jan 2021 05:42:09 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id w4sm34042968wmc.13.2021.01.04.05.42.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 05:42:08 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v7 01/10] bus: mhi: core: Add device hardware reset support
Date:   Mon,  4 Jan 2021 14:49:30 +0100
Message-Id: <1609768179-10132-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
References: <1609768179-10132-1-git-send-email-loic.poulain@linaro.org>
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
---
 drivers/bus/mhi/core/main.c | 13 +++++++++++++
 include/linux/mhi.h         |  9 +++++++++
 2 files changed, 22 insertions(+)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index a353d1e..c181a85 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -142,6 +142,19 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
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
index 04cf7f3..7ddbcd7 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -355,6 +355,7 @@ struct mhi_controller_config {
  * @unmap_single: CB function to destroy TRE buffer
  * @read_reg: Read a MHI register via the physical link (required)
  * @write_reg: Write a MHI register via the physical link (required)
+ * @reset: Controller specific reset function (optional)
  * @buffer_len: Bounce buffer length
  * @index: Index of the MHI controller instance
  * @bounce_buf: Use of bounce buffer
@@ -445,6 +446,7 @@ struct mhi_controller {
 			u32 *out);
 	void (*write_reg)(struct mhi_controller *mhi_cntrl, void __iomem *addr,
 			  u32 val);
+	void (*reset)(struct mhi_controller *mhi_cntrl);
 
 	size_t buffer_len;
 	int index;
@@ -681,6 +683,13 @@ enum mhi_ee_type mhi_get_exec_env(struct mhi_controller *mhi_cntrl);
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

