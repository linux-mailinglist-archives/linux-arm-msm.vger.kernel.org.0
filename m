Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923B62E6EFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 09:37:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgL2IhJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 03:37:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgL2IhJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 03:37:09 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A244BC061798
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:28 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id j22so17175117eja.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Dec 2020 00:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pOEXaNJekDpHw1CP3O0Pj76+vI42wYO3Vt7QFcDTgJc=;
        b=csyhjrc9GjSVvQEAW1cEocZMyz2EMGheHNVnnmDv0CF1ePIXFh8mDWmDM3iseoUyI2
         1FbMkDvIQUDHGos9ZJpsFT51nrnHNAOa0x76SrekYbiayhWDbqKiZIzoiKum8CRKvauh
         nShM6D29YuBZv1nCW8O0+iQRDTzP8zw8Jivu0FbuaWWCrIQg3UPW/gZFideULgvKisd5
         Jnkpdex9GLvlZv1kbgIxbNANA43zz/ugTmJTXMLprHBV6mTYQqeBJTNPV6JSbkPpXOz+
         wst8LvcQSGUXXDBlWgCmYHGGBqNkfcrLk/SgKqI8lCFk6YdXYw/C1rxlRVP1WFcUYuoV
         1Ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pOEXaNJekDpHw1CP3O0Pj76+vI42wYO3Vt7QFcDTgJc=;
        b=YacfcoSdwLvWGs4cA2knCIi00p0M6XgyOt7j3GE9triupyBaO9T+5l2Txi6kLDMLLS
         GDcbkNBGJUU9XMNGP55TOA8E1oMMPgGrUwLrEZSgDEZPZEspz90YTBenWDwAx1LAv6Ti
         Hx5S79hm+5dCgqo5QKljvqvgl73O4wFmsOF9ReE/zrWx1wKTASu00G/XgBn/l8eLU68Q
         cRJf8Jr3+S9gPVFRS4NCq9hnAKDexZlsBZfgMTmL9+7uVHUJx44fkJ/gFV+Oc2hcOEU1
         tF1ivoE4vRBN7n3rctQH7+6jWarlng1U9OU6BMZb5vgV5BiBZ+d5rZ7im4HcI111b63V
         BsiQ==
X-Gm-Message-State: AOAM533+5pxntAUO6emOdG5536OIRz7EQmrJ4Mkc3admVCJr35HFigKj
        46pLtnSXIoLQFyVxX3dmHRQWSQqOiyqasg==
X-Google-Smtp-Source: ABdhPJy/tjI5cUznOgC87mLqT5VAhzTSVZkKbpCQ1IH2iydJz1EnRgL8BIK0BdVMdT6bHHJaYhZ2uw==
X-Received: by 2002:a17:906:d62:: with SMTP id s2mr44721010ejh.61.1609230987411;
        Tue, 29 Dec 2020 00:36:27 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:6f69:290a:2b46:b9])
        by smtp.gmail.com with ESMTPSA id c23sm37265143eds.88.2020.12.29.00.36.26
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 29 Dec 2020 00:36:27 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v6 02/10] bus: mhi: core: Add device hardware reset support
Date:   Tue, 29 Dec 2020 09:43:43 +0100
Message-Id: <1609231431-10048-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
References: <1609231431-10048-1-git-send-email-loic.poulain@linaro.org>
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

