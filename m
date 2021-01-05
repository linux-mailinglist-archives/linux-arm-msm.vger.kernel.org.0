Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FE42EA6BC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 09:49:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726202AbhAEIt1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 03:49:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbhAEIt1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 03:49:27 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21144C061793
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 00:48:47 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id e25so2270392wme.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 00:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tZFkJQ3fAZEQwYCs8CLqbU7LlJ4JvXcEd21RKiMIRgQ=;
        b=jACsAHJF67CqTVfd6UKS1+QhtG74vnJCP11w0phogyg9gAkFj8b8GIBnML7fob92Bw
         rWnEGj0z7TSnp3r2k7VtVz8IivyP8D2aTfNS4NOqrN++iJBXuC76898Fd5SA+AkIyzgo
         uwMCWCG5o/aoffIvIQL2pBBphb2C159OhH1YC8k+RYLoRMlzUO7iAURlRC9vYYSO55fJ
         ypGKLH07baSllqkFSZJ5a/zTImnplSxRIQbJdDWnAUXxklfbL3bgPoIIcfDFTrI0wIMC
         1IJM4O01kUHoeZg2XKQ5rsYOazfVlEnaHEJl/VJA34s1XLebQALYcmGi3u7IsgrLgByp
         Xf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tZFkJQ3fAZEQwYCs8CLqbU7LlJ4JvXcEd21RKiMIRgQ=;
        b=bw/s1HqKEpte+ifvkWdfeA7vpyy3J++EDI1keDmw/UYRS5tCX9mncqtbS8NWGBVc9T
         AM/xxopJYQveahocynJCEBt5uZRBLDrSrlZkeVY3hEdF3olOWIUHE+aLv14IknmFqAo5
         03HbeV3R6CmYNB4bRXJwzUgvVJUC/31Wkh2NVkM0k6xdosKzI1ISzP/ND5SZBd9Qxitj
         mNfo2XL8WBFwSqRpd6bXw35rbM2GcipM6jp9dYt/w5SEJVKs8NynbduMz+Q8GwRxCY0P
         acOZxUrnW8ZJ+c+MGKkT0ozAPnkPVprzML+jh6gBV6Y0bt38zkGmf5ztiQZ34g+rfdIH
         Gp6A==
X-Gm-Message-State: AOAM532IZRLdO4KyhP/qI3CM+33bdxVaXHQdjCAHCKjxj/mTbMYJq3WZ
        6LDcUeFPisz0V8MjgEVSS4llVzPNleRJqGjR
X-Google-Smtp-Source: ABdhPJz0hPGR9Aqk13JLsIyHw5SU+epeUJn3iU2mh+JqEtxcvi71dEQ81CiOuUGK7+HToHulN5Jkxw==
X-Received: by 2002:a7b:c212:: with SMTP id x18mr2465830wmi.113.1609836525805;
        Tue, 05 Jan 2021 00:48:45 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:2285:e92f:1a49:4891])
        by smtp.gmail.com with ESMTPSA id q73sm3162673wme.44.2021.01.05.00.48.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Jan 2021 00:48:45 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 2/2] mhi: pci_generic: Fix shared MSI vector support
Date:   Tue,  5 Jan 2021 09:56:15 +0100
Message-Id: <1609836975-5758-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609836975-5758-1-git-send-email-loic.poulain@linaro.org>
References: <1609836975-5758-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When a shared MSI vector must be used (e.g. when VTd is disabled on
x86_64), each event MSI vector must be set to the shared vector idx.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 86ff0c3..23ef585 100644
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
@@ -297,6 +297,11 @@ static int mhi_pci_get_irqs(struct mhi_controller *mhi_cntrl,
 	if (nr_vectors < mhi_cntrl->nr_irqs) {
 		dev_warn(&pdev->dev, "Not enough MSI vectors (%d/%d), use shared MSI\n",
 			 nr_vectors, mhi_cntrl_config->num_events);
+
+		/* Patch msi vectors, use only one (shared) */
+		for (i = 0; i < mhi_cntrl_config->num_events; i++)
+			mhi_cntrl_config->event_cfg[i].irq = 0;
+		mhi_cntrl->nr_irqs = 1;
 	}
 
 	irq = devm_kcalloc(&pdev->dev, mhi_cntrl->nr_irqs, sizeof(int), GFP_KERNEL);
-- 
2.7.4

