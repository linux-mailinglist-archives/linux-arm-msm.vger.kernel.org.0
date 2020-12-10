Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6799B2D57BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 10:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgLJJ5d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 04:57:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728679AbgLJJ5P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 04:57:15 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 925F4C0619D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:56:05 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id y23so4642236wmi.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ZzQPfQ29PG8PsGOBCWPViCQjWX0wjL+LTkVDVSsgyt8=;
        b=Yg/LY+8CYPMVJw7hS7aZb8gGucbCW/Lhp/QQQXplxMxrkBPSrk1LRfeG0WjMs7YSzJ
         cfIaL0odKagqdldhR2XZg+LYwsCVGHGxUn+g0zD0fDfnIiHJa7C/oNQdBJVikV4vJdW9
         YQdcxQE6lhe/CQa5ocE3zFgERVYRg/GTf2s220jHBw5E/Kv9QVHbb+pfm1ms7gxghDyR
         ReNlV5OG0ipJQKv7m8ROQX6G+6QyxCeEohb4Gv2QEPb34WYoXXllPipDRqt2W0zGtJaQ
         XugU0lfT9k1fKeUpr+8Al0oCQMIO4or1906o+PbhxoUkBHePGITpp3mY3PWWHxpgAlwN
         qB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ZzQPfQ29PG8PsGOBCWPViCQjWX0wjL+LTkVDVSsgyt8=;
        b=REA/u+bWbjbNNLkK+Md1810i/c+dq3pSUGHB9JboxGgpvT/oQMJgPYFL555Nz9K0ei
         JizbB6KcR3h100dxICkvlNVX22zVsU35htYAXcodJlq4dF6yPJxvxF7yopy0xqs8gMwt
         oY9ixnQouuLcOVr6pKDQAwldRyJVeRDI0a+fwhClPln/7WgRUiba7enFPW14tI9yAl3J
         hsM/FsFOptRj9RoE69UMbdswWwRhJuEScnsYqKmdIvghWhE57KN3sk+C/f6Ya5d+K4oc
         WJbB21V53YmfOOWwuvaKPqeDupu/Nkl4IezXblwvItcy7JW8WjrDfhiKCBoZp58eBCIn
         rybA==
X-Gm-Message-State: AOAM533rl22xSLJhWkbtgU96ltIA1SitxKAYmMieC9Uis1oI6Oj54J/c
        l9e7EaQgy29fvHSCMwN43EEIMg==
X-Google-Smtp-Source: ABdhPJyNfi8ATr3LbF8i1/6OJoSQ9v/pVm8nt0rE1ogFps5FDaKUdlOlAY6ElOk+qkfgw/AHMB+TeA==
X-Received: by 2002:a1c:6208:: with SMTP id w8mr7217356wmb.96.1607594164317;
        Thu, 10 Dec 2020 01:56:04 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id l16sm9043721wrx.5.2020.12.10.01.56.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:56:03 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 10/10] mhi: pci_generic: Add diag channels
Date:   Thu, 10 Dec 2020 11:02:55 +0100
Message-Id: <1607594575-31590-11-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for Diag over MHI. Qualcomm Diag is the qualcomm
diagnostics interface that can be used to collect modem logs,
events, traces, etc. It can be used by tools such QPST or QXDM.

This patch adds the DIAG channels and a dedicated event ring.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 0c48884..6f15b1d 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -140,22 +140,26 @@ struct mhi_pci_dev_info {
 	}
 
 static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 16, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 16, 1),
 	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 4, 0),
 	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(14, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
-	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
-	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
 };
 
 static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 	/* first ring is control+data ring */
 	MHI_EVENT_CONFIG_CTRL(0),
+	/* DIAG dedicated event ring */
+	MHI_EVENT_CONFIG_DATA(1),
 	/* Hardware channels request dedicated hardware event rings */
-	MHI_EVENT_CONFIG_HW_DATA(1, 100),
-	MHI_EVENT_CONFIG_HW_DATA(2, 101)
+	MHI_EVENT_CONFIG_HW_DATA(2, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 101)
 };
 
 static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
-- 
2.7.4

