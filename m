Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CD52C5803
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 16:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391308AbgKZPWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 10:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391056AbgKZPWV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 10:22:21 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D239FC0613D4
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:19 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id w24so2782082wmi.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Q9zTqSWRADrCT+W1kE3DJbDxj2aY3KJG9TA1g4Ejo4Y=;
        b=uqI9Io6VNt5GihnMLaEVjkZ2AjV7skOUv9OT5KrqKfajn9EynTem1gxWDYwDirXs2f
         sihl9AcrjOt7CFbice5ORcyrd2bcHmV/8wmogJPq/Y121QBDz34tE6YDcJu9pouHBBaV
         ANlqIO5cuAPCJcI8t9X4YTxr7RkgI1mLLo/IuluLlzrKG6JfiAOqXBmkbgOwArmd7gzQ
         0SOcAhHlkdC004ENzrHmcsh2DqRjAjY83WjxZysngksUL/AwFFY4OO9uhpwAxDGm5nUh
         xWtbjzL7VNk9YEkyjtl9eAQbuaAOaF4f2MKg4WMwe5aTWYKRzqk4qqsTu3g8/2LQWh1b
         v99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Q9zTqSWRADrCT+W1kE3DJbDxj2aY3KJG9TA1g4Ejo4Y=;
        b=mhzQctoYefMT5NwBbMzrtu8AFsV3clZZh8I9iZW3t4dhUmgUjKa+VrOX3UVHyWFiNu
         AHu3uYBjPVngn2zxuPBbT/B5cFL3E5/tn83x0EimfKEWDB5BIfQHGtrKiwmGyOxScba/
         m6g49Pfp8+bkI+U6qKjjvjLsPNi26F7yiG8sDoo2guREBZ5/D1KKcnRSCQvbDDMPU4Kl
         MnjXX9ON51IupgNOI76XzoUP/JTjRmSD5al7hJmmzsnIKp7N7W7YCuXcSKHOJmjvIYck
         N5QGmnF65w2sQ/26Nl2b/Zi/uIBQIP9j1cw/tERH7tisj65z9Y5tZB145W0Rlh5buGvK
         9SYA==
X-Gm-Message-State: AOAM532WGksjP1lAVXbNe5rP4N+CRUeXsh7OsAjNdZtbdES7Bcbez9J1
        Z2YOTPOmsaPtzHMUv6mqpxv4kQ==
X-Google-Smtp-Source: ABdhPJz6qoib4hrLkSNrodeWEnCwIDI0hO+oAXzaFngNkrJYJQ88SVEl3rBASZTqXNWY7FD59plWTA==
X-Received: by 2002:a1c:3c84:: with SMTP id j126mr3985310wma.151.1606404138584;
        Thu, 26 Nov 2020 07:22:18 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id l10sm2756144wme.42.2020.11.26.07.22.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:22:18 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 4/9] mhi: pci_generic: Enable burst mode for hardware channels
Date:   Thu, 26 Nov 2020 16:29:02 +0100
Message-Id: <1606404547-10737-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hardware channels have a feature called burst mode that allows to
queue transfer ring element(s) (TRE) to a channel without ringing
the device doorbell. In that mode, the device is polling the channel
context for new elements. This reduces the frequency of host initiated
doorbells and increase throughput.

Create a new dedicated macro for hardware channels with burst enabled.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 4363676..6b6e5bf 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -78,6 +78,36 @@ struct mhi_pci_dev_info {
 		.offload_channel = false,	\
 	}
 
+#define MHI_CHANNEL_CONFIG_HW_UL(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_TO_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_ENABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = true,		\
+	}						\
+
+#define MHI_CHANNEL_CONFIG_HW_DL(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_FROM_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_ENABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = true,		\
+	}
+
 #define MHI_EVENT_CONFIG_DATA(ev_ring)		\
 	{					\
 		.num_elements = 128,		\
@@ -112,8 +142,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
-	MHI_CHANNEL_CONFIG_UL(100, "IP_HW0", 128, 1),
-	MHI_CHANNEL_CONFIG_DL(101, "IP_HW0", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
 };
 
 static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
-- 
2.7.4

