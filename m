Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C14314C07
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 10:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbhBIJq2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 04:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbhBIJoY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 04:44:24 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AB2BC061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 01:43:44 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id g6so7799054wrs.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=5XAWwQ+uVP5pL2TbZZCQGiFx0hS1pDt93D8wDUbYErw=;
        b=KEY1CUzrkh5YnoT1x+qo4clOUvxyclwMfw7XKgKpWYLMV/OpwnL1X7xccdEJo92qiu
         xC2NaJqHTH2kGd0EigMdTvM9IbM2nLmqF9mdtTAQW2dc8OMNJQZsoghI0f55L1G0VFey
         hCCUAYQNVBfZRrsSQc2x7emVLjVJuhzNyYtNgMEisSQ4T2WdkpnPeib++79e/WKbFf1y
         S3T+GL6k3T4pnrr4Y537nnKPBmZsLLetoF81IQqyXMh6zJeiPo2cTN2Eb1fiPr3sNxis
         tzKXXgdBeHuZuKmpIjXE4MBOGh2C5AavSrNZgoLDp/hn8MymWXdS5CUsCM9zj0T2IAf5
         +BkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5XAWwQ+uVP5pL2TbZZCQGiFx0hS1pDt93D8wDUbYErw=;
        b=NQU1q4JIzooypZlEyc8Hr1xKULM+derND2hqc47dRchwTgMAJ61Etx/u+G7Z1dQLBp
         yUfesXwxQQu/GMjwAAsWRhBfu+Oe210XXH0A5k/UO/DNSACd6PiMe6zybhS0qWkjzTIu
         v2H4iBPMQlqPMKFOxAvGgkWMeksru3kuw9JU8dcs2MTJLDmjWJn8TvFuKE7F520NlYLa
         PIhJTsutcK5Oy20a2Ob0qQe8/sMj3sym7ppcGeN8wxmSgorpmiLpgducsi29GD4BH4hL
         hFa0fuhr8ldAj9g92lYDEF0416T8giOfAv5jeQvNCTfnI0PyZFMQndT0Em11OI2VFf6K
         TM0A==
X-Gm-Message-State: AOAM530fnZTAahfdThoYIcMI5fu8mqkK0eMKXp+bwWvA8vLry/CrEZVh
        42w/6QxvjhRNhHR50Q28glanZg==
X-Google-Smtp-Source: ABdhPJzOfoKIa0+y+Kld4pIiGvuR3bXmpvCpWdkPsS/LxBNElrNcQWF0qSadA7EF8H5VdXxjB0kXvw==
X-Received: by 2002:a05:6000:192:: with SMTP id p18mr1777663wrx.403.1612863822898;
        Tue, 09 Feb 2021 01:43:42 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id u3sm39444168wre.54.2021.02.09.01.43.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Feb 2021 01:43:42 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, carl.yin@quectel.com,
        mpearson@lenovo.com, cchen50@lenovo.com, jwjiang@lenovo.com,
        ivan.zhang@quectel.com, naveen.kumar@quectel.com,
        ivan.mikhanchuk@quectel.com, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 1/2] mhi: pci_generic: Parametrable element count for events
Date:   Tue,  9 Feb 2021 10:51:45 +0100
Message-Id: <1612864306-10108-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all hardwares need to use the same number of event ring elements.
This change makes this parametrable.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 v2: add this change to the series

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

