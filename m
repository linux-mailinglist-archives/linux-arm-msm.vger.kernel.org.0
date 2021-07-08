Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AE063BF783
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 11:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231260AbhGHJY4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 05:24:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231190AbhGHJY4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 05:24:56 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B21DC061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 02:22:13 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id r11so1372770wro.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 02:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=D0GVRma+WjAiBuDgc+UXLQN2rv//eYbHQ7Ejo+oBtUc=;
        b=WQeQMQAv9C2Za3ek0oZdqELqlKM3rUF1pGwDKWu23OB+eykGNP+YaB+YLHWLZ1N4dX
         Na4JUQI+tXLOm/DUlXW198CU41H0U1SCkqj2vswhp688qhEba7np0405BdAfZW+ti5LM
         fQRfEDwx+RhyO0lZwKkQuNaaMBWt/0+7voEtVAv4HtBcI9K6xF0QbmdM+ilmFEFL8ik/
         aXBff4eHw2PCeoVXSrVHfC6eNQWNTFLA45o1lq1+nEaQ0tW2tZVF+MUV3Rhc9AUffQws
         3WwxRFcqKELJY572f4OtaCRUROVf4DYTzyVaNwiB2/+LjLCKefBLoltBSLSQCRmrsLzO
         8LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=D0GVRma+WjAiBuDgc+UXLQN2rv//eYbHQ7Ejo+oBtUc=;
        b=Rl95R7aRUd1/yeD17JEdHv2K+AIJ8sQhKU4ZNuZh3DSUDKc0n8SrLUy/wsJmu+ybH3
         74gphgCHgD/FvU0WhmAFk6ZwFQMugIkWBNGxHmUBNsZeUHQYFUvjS6xwkdrkW1jrnUXO
         WMoyTwdeAF6gaPbMpPDTk6w0ZE584cOuz0kb4IJQRf0VPSjiYpcNPhu+72cORl/ggxEH
         0Hj3bNJFUzUwtXdn+FU4W3sYcufzBEXVj97gaSrxbKCfz0krRnW6jbZLM7V85VBNQKli
         AgkKYvAdEgOTgsB6Pg19z24jMsFsBbUQfifcM9uaTUhWxPKgK4KCkTDIWJCDlT4dQ51p
         hn2Q==
X-Gm-Message-State: AOAM5315gNQNwD/ioB2FDpOZ7hLQOClOTq5HUeelRgOeQ7lMKsTXZzgq
        6sTSMZMW7U6joqrRB76nXHGEc2xZjTQZsg==
X-Google-Smtp-Source: ABdhPJwFe4M1R5WELQh7kNtotD3NOLVrJ8iLDSxlJ0NowpmKiG1AHiEpZJQrm/PvzxBD3bT1U3qaAw==
X-Received: by 2002:adf:e10c:: with SMTP id t12mr33021799wrz.36.1625736132066;
        Thu, 08 Jul 2021 02:22:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:7064:9879:f4d7:9ccc])
        by smtp.gmail.com with ESMTPSA id p5sm1675590wrd.25.2021.07.08.02.22.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Jul 2021 02:22:11 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     mani@kernel.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>, stable@vger.kernel.org
Subject: [PATCH] mhi: pci_generic: Fix inbound IPCR channel
Date:   Thu,  8 Jul 2021 11:32:29 +0200
Message-Id: <1625736749-24947-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qrtr-mhi client driver assumes that inbound buffers are
automatically allocated and queued by the MHI core, but this
no happens for mhi pci devices since IPCR inbound channel is
not flagged with auto_queue, causing unusable IPCR (qrtr)
feature. Fix that.

Cc: stable@vger.kernel.org
Fixes: 855a70c12021 ("bus: mhi: Add MHI PCI support for WWAN modems")
Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 8bc6149..6d2ddec 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -75,6 +75,22 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
+#define MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(ch_num, ch_name, el_count, ev_ring) \
+	{						\
+		.num = ch_num,				\
+		.name = ch_name,			\
+		.num_elements = el_count,		\
+		.event_ring = ev_ring,			\
+		.dir = DMA_FROM_DEVICE,			\
+		.ee_mask = BIT(MHI_EE_AMSS),		\
+		.pollcfg = 0,				\
+		.doorbell = MHI_DB_BRST_DISABLE,	\
+		.lpm_notify = false,			\
+		.offload_channel = false,		\
+		.doorbell_mode_switch = false,		\
+		.auto_queue = true,			\
+	}
+
 #define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count) \
 	{					\
 		.num_elements = el_count,	\
@@ -213,7 +229,7 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(14, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 4, 0),
 	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 8, 0),
-	MHI_CHANNEL_CONFIG_DL(21, "IPCR", 8, 0),
+	MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(21, "IPCR", 8, 0),
 	MHI_CHANNEL_CONFIG_UL_FP(34, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_DL_FP(35, "FIREHOSE", 32, 0),
 	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 2),
-- 
2.7.4

