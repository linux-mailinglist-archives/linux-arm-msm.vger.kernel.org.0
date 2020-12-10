Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15CB22D57B9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 10:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729892AbgLJJ5F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 04:57:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729847AbgLJJ5B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 04:57:01 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D373DC0611D0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:59 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id v14so4068687wml.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Dec 2020 01:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b6KTirZejd3sDDi2THGHxOo7aZHrY3+M9Y8zIKfmv2E=;
        b=E05AXotsblQ2mtqna256uAfre29ZYXMDW8uvjcZvoBvNe1h42VU2MOyc2sfys2FpX6
         2vppYEF4s5gt/kDiikZFeN5VgvwMfSbE3mVQIh0ECGSz9WzV7iyncZ7JT1p+JcVsJkBr
         uJG3F+S0jtFYTYSTCMZxJS20VjRb6/d2Q7q/5jQI5+lhVJIK3RmqkpAkieDsnmiWZtRw
         3SOxlLpGUu7iINBuB0WA15UWQGQ1kXQeiA9yJ/ppbjrFyidfMe4sfbKLJ1YD19trFEzj
         WIE+HhM/2F+Eub7LPYUAoiy92z6XwS+869NgYhhhXkLgxGvCZOU+N+PYZPuBtF+WClia
         lhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b6KTirZejd3sDDi2THGHxOo7aZHrY3+M9Y8zIKfmv2E=;
        b=uHOo1pFg20c0oR0PFUwNChnK4uPtQMIMm18gL4F6bTF23qj9Ers3NlxLxUd3ufrb29
         7YRpRGtQRIBgItIbmizmK0xCu0mdgVYpp+7gSI0sNmoTP4Nm6f0Pd2+4KFnaRwhX3xp8
         wAck+CwAQAYPFMA/nRnbsUkndMgyie9NNTf75V03Nt6XidVMKUDlwbo7BgK0oS5MB/wI
         244qEpfSDgc43BdrD3BjCSWFwCqp5SuGcXXJ3Ads2O/q8e7ymOvuwO+avYzSUDRHjJWK
         HqC65Z2zyYoIcPyS1vJ7TNq74Oxx8OAztnja67w/Qsw6J2TsMzaOQm5LSLBLvRN5ow1H
         SOkw==
X-Gm-Message-State: AOAM533Bd4v08+pcs2zA+W0VN8giznxzo78WTaEMMJ0DQkDliP3XJ1VO
        LCIM4cDh7lLE6xlpWrmL/tVGgA==
X-Google-Smtp-Source: ABdhPJyY3tAtNJmImXi+ojiwjI+JRn2IEAWD8WKztptNIXfeJFGZgspVTDmUjvYmvAmgg+cFzmzMZw==
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr7424694wmi.45.1607594158578;
        Thu, 10 Dec 2020 01:55:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:4468:1cc2:be0c:233f])
        by smtp.gmail.com with ESMTPSA id l16sm9043721wrx.5.2020.12.10.01.55.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 01:55:58 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        bbhatt@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v4 04/10] mhi: pci_generic: Enable burst mode for hardware channels
Date:   Thu, 10 Dec 2020 11:02:49 +0100
Message-Id: <1607594575-31590-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
References: <1607594575-31590-1-git-send-email-loic.poulain@linaro.org>
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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 13a7e4f..077595c 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -76,6 +76,36 @@ struct mhi_pci_dev_info {
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
@@ -110,8 +140,8 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
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

