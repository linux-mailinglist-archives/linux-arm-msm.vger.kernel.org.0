Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACECE32F380
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 20:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbhCETIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 14:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhCETIX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 14:08:23 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6046FC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 11:08:22 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id d11so3238673wrj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 11:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=VV6l2UYIK3KjG62wbZQyRbbCwbcaL9xMG+xJectCaSQ=;
        b=bzxxKMo6Ogos8ed1bQ6s6udD/kJ9kQL+1u7FQeFbjidgEvu7cBJ7VGiE9Pl9+cvX6e
         sAxLTFoXPOWnUBZO+tojPnSHCleOjw8eb0nXTbsvx62naFi+h5VJUSF4vHvLERKNnEgS
         F+Y5H5XYcK759NObYrQN1pJafRKkCHwrDg3Rz2QYQQLWZ25uoKjeglKuDYYP+cQe9QDS
         g05OmBw0+CVQ8pPD47CPwJpMmx/Zkwgq8omYzjfg2wPGAmUUhyh3Z2y32D0d38oz3xb4
         d7g0qt2PpP8wSNmdXp408Op28gMqny3F4UIx7sw+wNwW1pV/wwTqhldsgf4eBj+8lXre
         C6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VV6l2UYIK3KjG62wbZQyRbbCwbcaL9xMG+xJectCaSQ=;
        b=YRz4hbaM9lj+3UavwkuTdmVVSCfaB9z4d2pd3AqzRwjnoPij9cHgRjSqK14yvRLGd9
         WpZvqqCiJA8OKgH4zpbsgDPmdZlwwyJNSB+GKGYGS30nvdhGKuQ8ySND/3aMcodAibKh
         19Kz2leNRE8OhkpOC9jArycYpGYgQy30QNpwxEyseXZHVQvvi9oiQk7jAAxposDNWea+
         hqKfLHW9bx7ne3AnM0fSjQ/0N2E3Sw29DhGRfERsyYTymZYTH8zakL/Ub5eg6NpL8Qt0
         PQ1BIGb6qgHFfqWynhBEIPmCf4T2jsdhWa8rbp17P194Y6x7O2Me5JMLhSv0MGIGemzS
         hd4A==
X-Gm-Message-State: AOAM532E7bN//o4vzEoRh/jUJVZY+GzZ2ST1ZpLCs9760BCe4zhAy9fA
        rROp8TR+LXxTGi53LHH6+pPyRQ==
X-Google-Smtp-Source: ABdhPJwSG01o5s+EAiX9DlJgp5ApYWyJhcfx05amAw2sqzKp6HxulEWaU6zMh5vpo24kX5h8VhB0zw==
X-Received: by 2002:adf:fe09:: with SMTP id n9mr11017306wrr.104.1614971300978;
        Fri, 05 Mar 2021 11:08:20 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id c11sm5355437wrs.28.2021.03.05.11.08.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 11:08:20 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 1/6] mhi: pci_generic: Parametrable element count for events
Date:   Fri,  5 Mar 2021 20:16:43 +0100
Message-Id: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all hardwares need to use the same number of event ring elements.
This change makes this parametrable.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 v2: no change
 v3: no change

 drivers/bus/mhi/pci_generic.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 8187fcf..c58bf96 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -71,9 +71,9 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = false,		\
 	}
 
-#define MHI_EVENT_CONFIG_CTRL(ev_ring)		\
+#define MHI_EVENT_CONFIG_CTRL(ev_ring, el_count) \
 	{					\
-		.num_elements = 64,		\
+		.num_elements = el_count,	\
 		.irq_moderation_ms = 0,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
@@ -114,9 +114,9 @@ struct mhi_pci_dev_info {
 		.doorbell_mode_switch = true,		\
 	}
 
-#define MHI_EVENT_CONFIG_DATA(ev_ring)		\
+#define MHI_EVENT_CONFIG_DATA(ev_ring, el_count) \
 	{					\
-		.num_elements = 128,		\
+		.num_elements = el_count,	\
 		.irq_moderation_ms = 5,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
@@ -127,9 +127,9 @@ struct mhi_pci_dev_info {
 		.offload_channel = false,	\
 	}
 
-#define MHI_EVENT_CONFIG_HW_DATA(ev_ring, ch_num) \
+#define MHI_EVENT_CONFIG_HW_DATA(ev_ring, el_count, ch_num) \
 	{					\
-		.num_elements = 2048,		\
+		.num_elements = el_count,	\
 		.irq_moderation_ms = 1,		\
 		.irq = (ev_ring) + 1,		\
 		.priority = 1,			\
@@ -156,12 +156,12 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 
 static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 	/* first ring is control+data ring */
-	MHI_EVENT_CONFIG_CTRL(0),
+	MHI_EVENT_CONFIG_CTRL(0, 64),
 	/* DIAG dedicated event ring */
-	MHI_EVENT_CONFIG_DATA(1),
+	MHI_EVENT_CONFIG_DATA(1, 128),
 	/* Hardware channels request dedicated hardware event rings */
-	MHI_EVENT_CONFIG_HW_DATA(2, 100),
-	MHI_EVENT_CONFIG_HW_DATA(3, 101)
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101)
 };
 
 static struct mhi_controller_config modem_qcom_v1_mhiv_config = {
-- 
2.7.4

