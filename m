Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8620C328370
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 17:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237703AbhCAQSo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 11:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237620AbhCAQRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 11:17:46 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC7CC061756
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 08:16:59 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id n4so16786582wrx.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 08:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=vaQb7S7VE33lCI9REO8er+62IGQEtBq+HCe1GdHTW2Q=;
        b=iCiWAkcuYHDNc6+4whGvEdBgSekAIeuNVCFXT5tFks48JfgS8ew1fyMNss/HjoVnkS
         iTXiT4Wqg08i/b3fNKqMUiOSlC0jm/SigjF9btXJjxryv83u5hyI7/OfZrbuDLqHBmo4
         5iUUHKlYW1EzYiJkLMRMeQis1jWiYVu+D0F8DOKSCwlwA2/yDX4SWF/osyic6w/hSXSC
         luJ/8takMKvrlDeoli9iNK9V/n3emYWEzbH9az0GNRy5XrG8GqBT2l8egl1S18NoPJxV
         RjHWMEoDmm1Jo604XR2pOdcnYHn7p14vJMlCgm+xzuecb2A6f/szXYbRQkCwh3w8ei+u
         VN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=vaQb7S7VE33lCI9REO8er+62IGQEtBq+HCe1GdHTW2Q=;
        b=qKpjWvBHOavMuAUSEVfL30iYWgS1HOdzePom/Mq4jmSaibOhEmqYs3cubcqm/ltleW
         WgIdF1CrwJraRxtMTEVLDiWJIxxnRlxsibi85ab2TD4QcVhdFiKq8pb5ESBQOPbAncIj
         eZf48pim+ypPqEVuAwxTeerFwElt1wGtjGqGP/bcyeNuCdcYnqfrvR08tR2ZKi+wC3lV
         b244B+pfl3pvhPLJ9kETWia9asVEAzLwr8DRX9IY8mXi+R3s+Wp0wto38MXdbHKAeyh5
         og+rhWOEiNBwi0JYzGGlscMSDx2lUaqQZg4WNY8eo52R2sb+iLoY1jj/c93SpfBwOhIN
         6glw==
X-Gm-Message-State: AOAM531c1gcdKd5L584TLDg7978eYC1jHN4JOCYokjNloZ79PYnG5ElE
        GAIvuKT9L0N1mrTFjW/eFBUqew==
X-Google-Smtp-Source: ABdhPJz8Au13zwmEf6RTicHWgxcwQ2hQqjYwYojPywhAyfJH2Dvh0AuLP1w8Lx1/neZ+ePkwN4eing==
X-Received: by 2002:a5d:5050:: with SMTP id h16mr17299474wrt.186.1614615418028;
        Mon, 01 Mar 2021 08:16:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:5a20:c00c:6ec3:cc84])
        by smtp.gmail.com with ESMTPSA id w6sm3919789wrl.49.2021.03.01.08.16.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 08:16:57 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 1/6] mhi: pci_generic: Parametrable element count for events
Date:   Mon,  1 Mar 2021 17:25:06 +0100
Message-Id: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Not all hardwares need to use the same number of event ring elements.
This change makes this parametrable.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
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

