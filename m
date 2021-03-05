Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8FFD32EAA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 13:40:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbhCEMjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 07:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233227AbhCEMjc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 07:39:32 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E02CFC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 04:39:31 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id h7so1336646wmf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 04:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=7qoy8ws0GMoO76ZFzFvVASvAp1cibtRrbaHfOrGKlvA=;
        b=NR94e4OS/m19B6HSWIRpVegjAC6v0BYTYXiV6EiuwFVW8PWSWX2XLquzU1f9DKuJvU
         C1gB0OCWqnq2IVuBYCFKWsYyq/RPJ5rJVvK2jDHw+xpvgmhQHWsUbyZtuloPaAlZsxdD
         c4DNhFO/hDhXd3KkYARU+8jzCCeb3PxTmFAG3SM7MbstPz7s8m8qs3Z/SdKdHxqJ9Avk
         a6ua8TBbOHrFPI1xoVPTFDfq0Ossgz0trc8kwTBDZm63m9jEowuPeYQZjrZwoyQFUgs3
         tft3mNB7+qQuYC0GjEra45QHB+bf8ZhtRQN+J0p+sXdvwtNu8ZdTk8UwgOU+SkdQsWOv
         Ok8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=7qoy8ws0GMoO76ZFzFvVASvAp1cibtRrbaHfOrGKlvA=;
        b=mbGHOFYc9GZG70uGbQ1XprXNGDaBKt/umK186bU8Kpb7+fGox905XCaY9HYg8Ywmzh
         vMk2lwaSPDbuIyJ+cXl7BG89IZtt2UqMmJZyJk3WPHhIHTa8NWjSXZ2EPqmTmt/w2Vcs
         hoyIXh+F2ftp9A+QDtNhbSuUxeymjxIhdua/C7EfSLajFyU+nWQ0qi7/Cszf7mqAZLaU
         Mehw8qq8IkuzQBoXoKYWBMfPTsupmk8naHuV6X9Ov8fnvdqVtmA3i3qoXx9FQ28mzh/C
         2nS0RaudLkRXnTIStx4OB4XMoUflUgbTFRMR+WFzLDnSB3dG+PS7MVw0Z1Mz8a49CVht
         vR5Q==
X-Gm-Message-State: AOAM532U2UXwEOSaex0xNnlYLQtrp+Cn476s8ULXkBrJOB8ECkJs3tAO
        TaqNZdobNHx3sySMB8rgAMbThQ==
X-Google-Smtp-Source: ABdhPJzSCDQ528eqXwY434W8htpi1uXWk11TbC5OfQ6FwFm2MmPm9I854tpqz2f+CFH4ECCBhstvVA==
X-Received: by 2002:a1c:68c5:: with SMTP id d188mr8392943wmc.119.1614947970517;
        Fri, 05 Mar 2021 04:39:30 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id f5sm4173256wrx.39.2021.03.05.04.39.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 04:39:30 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 1/6] mhi: pci_generic: Parametrable element count for events
Date:   Fri,  5 Mar 2021 13:47:53 +0100
Message-Id: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
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

