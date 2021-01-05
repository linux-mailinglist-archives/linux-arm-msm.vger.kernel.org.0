Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D37CA2EB03E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 17:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728521AbhAEQhq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 11:37:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726132AbhAEQhq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 11:37:46 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5473BC061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 08:37:05 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c124so112886wma.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 08:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=X6dhxhHPhwe4AHqAolrTY98ly8nJrzDzmlYNxRcsiWM=;
        b=cubo/MD/iz2qUNad4YuZL8T6D/9Mw3b8PjNf8dVbgyLA+s6n4vQTJyCo8e7o+YbQfg
         hnN45oFCjBnTEulyLZ9QeGKbNkGT/vhmTFZiMsr2We9Jcfg+S8LE6Lny4BZe7Uc/TsVf
         XfPp1jnAJWBmp2224C0U2xFUeg8vjrlhq30t76aM4HWYI/0DGewfBYbl3B+4Ep5eDr2h
         ISvCHP4levfzy/CNveYh+eM9L4FXavRY8yym6N/u0TNR52dw22G+dMii+dfwDGvDOodT
         XaZv94dy1HN/uY3uCUP9v7vrMJ3Sm5S3bz0CqSWV+oTvTbkEzcSg+fS7caZaP+t5lR7d
         VvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=X6dhxhHPhwe4AHqAolrTY98ly8nJrzDzmlYNxRcsiWM=;
        b=KRxFC/vTqDNWVQ6V9yb35a92eIP/Qis81w5CBZChKW4YsTcBYRsPuW9g4To0XCCclH
         RnovdCiMCWz3DX0q4ZexuYfj4c/eGvcT5Is00WSRGI+i037pRaIux3qMMRGhgJ81GYQb
         FDZSWyOExjew0SwYUB+8leQ8O0k+PrWkrptU0MqZQmiWq52CZYA7EmrBUfOviecMh21d
         75KHlv2EO4aCazvFxxaIxUGH4XTqSkkyUs3ciF7ODKrtvkCMubmC8i5/pDGNEVsgVp5Q
         FMW1Q2pPmgKBiw8UQoGEYI5M04/3F1lgP4mag9X1gAWTTNHc9YyqbcGumroh4TvC//TD
         8qlw==
X-Gm-Message-State: AOAM531GPvgjKIXopow9zvw4cDr34eFZruE7XGEoseAhBoZXL3RwUWEd
        Wfnbu4tEcls83qlsr3s2ZmXj6B2/S5uhXw==
X-Google-Smtp-Source: ABdhPJw2S73z6lnrNAm60I19HTXhx8kFE6R9X57I6qk2VyQ6UjrzjsJCRX3ojSSu26cd0W+W6jd0ng==
X-Received: by 2002:a1c:630b:: with SMTP id x11mr10916wmb.138.1609864624064;
        Tue, 05 Jan 2021 08:37:04 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:2285:e92f:1a49:4891])
        by smtp.gmail.com with ESMTPSA id z3sm475801wrn.59.2021.01.05.08.37.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 08:37:03 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 2/2] mhi: pci_generic: Fix shared MSI vector support
Date:   Tue,  5 Jan 2021 17:44:36 +0100
Message-Id: <1609865076-13890-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
References: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When a shared MSI vector must be used (e.g. when VTd is disabled on
x86_64), each event MSI vector must be set to the shared vector idx.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 v2: reword MSI warning

 drivers/bus/mhi/pci_generic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 86ff0c3..5b3a23a4 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -154,7 +154,7 @@ static const struct mhi_channel_config modem_qcom_v1_mhi_channels[] = {
 	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 3),
 };
 
-static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
+static struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 	/* first ring is control+data ring */
 	MHI_EVENT_CONFIG_CTRL(0),
 	/* DIAG dedicated event ring */
@@ -164,7 +164,7 @@ static const struct mhi_event_config modem_qcom_v1_mhi_events[] = {
 	MHI_EVENT_CONFIG_HW_DATA(3, 101)
 };
 
-static const struct mhi_controller_config modem_qcom_v1_mhiv_config = {
+static struct mhi_controller_config modem_qcom_v1_mhiv_config = {
 	.max_channels = 128,
 	.timeout_ms = 8000,
 	.num_channels = ARRAY_SIZE(modem_qcom_v1_mhi_channels),
@@ -295,8 +295,12 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
 	}
 
 	if (nr_vectors < mhi_cntrl->nr_irqs) {
-		dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d), use shared MSI\n",
-			 nr_vectors, mhi_cntrl_config->num_events);
+		dev_warn(&pdev->dev, "using shared MSI\n");
+
+		/* Patch msi vectors, use only one (shared) */
+		for (i = 0; i < mhi_cntrl_config->num_events; i++)
+			mhi_cntrl_config->event_cfg[i].irq = 0;
+		mhi_cntrl->nr_irqs = 1;
 	}
 
 	irq = devm_kcalloc(&pdev->dev, mhi_cntrl->nr_irqs, sizeof(int), GFP_KERNEL);
-- 
2.7.4

