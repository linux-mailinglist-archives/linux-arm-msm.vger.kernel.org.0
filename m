Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 825132D57BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 10:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbgLJJ5V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 04:57:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729017AbgLJJ5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 04:57:01 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A4BC0611CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:58 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id 91so4780235wrj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pOEXaNJekDpHw1CP3O0Pj76+vI42wYO3Vt7QFcDTgJc=;
        b=pXGA6QhDrCOw9SnFeootvMsNGyD2l57cLugkuXwhJvjZMRl3Edivv6iOFetcNz6GRC
         QpgyquTX7K/Ew/s2/4YCKYHM/u/q1dzkGAP9yelfLHN9OxKULcvl43CHtBF/U97NnP/2
         zIoNuq3qY4HSggQupp+v6E8W47ZMybSpY4sVXWyBbxvbmRk2HQRaLrlceyA4rWYsvy//
         dtC0fglPg36NXqfM0jPCLkrp8YUSE31F8ne74c9LXsZhD4hc+nzNnLdr053nuHtJghNX
         zC+KDYMhdAkrELi3mO8pfzy8SsOBL1NkAcTV5frichnfL5jB8hYQ6/oZ4PzkuAQouDZp
         n2XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pOEXaNJekDpHw1CP3O0Pj76+vI42wYO3Vt7QFcDTgJc=;
        b=Wa+t4YeN2djYBrKSQ5QziAFTaHQTUlsDds2RyOMcbJ/Bn+78SJOd0vquiWUd7mjpAG
         IGekin2Noft0fwVJkZdwP4vdnHbtQ8GHpD5tD98fJHaE9zzKmDXdjrlm2ZdpE7lCWqUZ
         70p0NEjyFQK5oMbD+VMONNi/hcJO7OW5AGxdPjQk6FOfuF00IwmbYWla8s3G/ahyjLuF
         C65S5hoF9DHuQq8ol+Z2B1WnUuaM98mJ1GhoIQTJl+xFAG2M+8cls27KOdZs1M/cOSri
         riqc7UejCJqn8G1lO8t8eYBI2diYNlxuQ6IivoBy6UEcA2kscvNuPfAHENXzTA7JZqUa
         kk8A==
X-Gm-Message-State: AOAM531QkqrfJ/8rkw2cavfALXNdzKfo8VM/CfXVESVro47tAvqEMMsJ
        o4aaW2YdEloVNib/38yTJCeNbg==
X-Google-Smtp-Source: ABdhPJzLP+v8a04Xpv9cx4L05oRc0epcEeIdGfu081L0D8dBteCChwrWJsZ5xwnWSVdMneWZW9gP+Q==
X-Received: by 2002:adf:94c7:: with SMTP id 65mr7035251wrr.423.1607594156720;
        Thu, 10 Dec 2020 01:55:56 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id l16sm9043721wrx.5.2020.12.10.01.55.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:55:56 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 02/10] bus: mhi: core: Add device hardware reset support
Date:   Thu, 10 Dec 2020 11:02:47 +0100
Message-Id: <1607594575-31590-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
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

