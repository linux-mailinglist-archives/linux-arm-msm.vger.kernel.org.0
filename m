Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 869032E9A4E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 17:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729192AbhADQIS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 11:08:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729425AbhADQIM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 11:08:12 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84D40C061795
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 08:07:31 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id g185so19830447wmf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 08:07:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vyOYapeQzBqEAbAliweYgjMI0i+SwAaAghDPdGFwyJs=;
        b=zBunDPFs6m3V5Lt5E+gmrT4vVCnJkUzt3hNT2dJt1YDf/QD0vmma+wv1arwnkunCjV
         jYP9chYllrxoO/y5S2OiUOwe+4v54/2xFg4bmHsgAcNSmkFbPhuL8KEBAuT32Cz8dblF
         8YxlHSKsTLjUwfVY4nyExHyQo5A1rkMapF71c88Y4SD4Pdgn7ko2yEFECPR2yxVuduqI
         84JWKegQaNKjdgT8JXSXA3DHBM4wjItwTTAzDOr/5cVdlTHNDTOCPQKdy3PCvMWllCIv
         skViLxhBIEUJbRYdDnm+fFKG0mdqW6ZXnYpBO45/UCPPz0CBoX2wiz5XjJ50oaf0qBrY
         C9NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vyOYapeQzBqEAbAliweYgjMI0i+SwAaAghDPdGFwyJs=;
        b=Y9snafQnAO6Aw0Xhvh9qDUlwYlUzElHwO6pL0R9D/rdhXHtvkWuQPCQoSwlidt3Xgp
         uljx68f32hNV4VvjES06TSs4DBYv9dYn4UcFrelxFq0hmisoTZYtbVBrMpW/fOfziiaZ
         YY+rIbUPYjIsXPFb/LUYOEk4cUuib+CoIzBBFUVbBZOWva9IfcW84wh40Z9+9R/nhOqh
         ocgA80nZJbdqQuWbU1TRAXopbIneTTmrCEQjeqLUOk8CjrtcqI1cNfAbMUOtPFVPMntI
         p7kVltzTjd4tok6id28GIqvIccRkmQ+QOCpipwEp6S0hbvaAWXIAltiw1lEBAtQNbsX6
         3gLg==
X-Gm-Message-State: AOAM533HdNr6l6WAwHW5EX3Tvb74d82fOBZBi8fIeThD5DhsUmLblP4E
        vTXwlopbe87DDurSWsr+kMYTIg==
X-Google-Smtp-Source: ABdhPJyMCbXTeZoNZwo6T5HmSU5OmxtHSEi6wGbRJOeGLyZRxNwEUdlU9bPHTQp5xsAhCL2/Mr656Q==
X-Received: by 2002:a1c:2e88:: with SMTP id u130mr27376224wmu.83.1609776450291;
        Mon, 04 Jan 2021 08:07:30 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:41b:e085:fa9a:9c53])
        by smtp.gmail.com with ESMTPSA id h9sm89278049wre.24.2021.01.04.08.07.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Jan 2021 08:07:29 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        hemantk@codeaurora.org, Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v8 03/10] mhi: pci_generic: Enable burst mode for hardware channels
Date:   Mon,  4 Jan 2021 17:14:52 +0100
Message-Id: <1609776899-30664-4-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
References: <1609776899-30664-1-git-send-email-loic.poulain@linaro.org>
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
index d3896ef..778d13f 100644
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

