Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D1E72D99A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Dec 2020 15:21:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439156AbgLNOT2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Dec 2020 09:19:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440025AbgLNOTO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Dec 2020 09:19:14 -0500
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E5FAC061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:34 -0800 (PST)
Received: by mail-wm1-x344.google.com with SMTP id k10so13861598wmi.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Dec 2020 06:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=b6KTirZejd3sDDi2THGHxOo7aZHrY3+M9Y8zIKfmv2E=;
        b=ISXwCHroDN4ZRRIDtVw1624xKGOITa2X85ynUDO9lihneRxxxGnPYuySnvfD8D/Jn7
         rQdb8V/MxNOtk8hbTLF6mvbZwlvyvwpy3JxnobExi9xso4ujd52RfxDvrKyh95CVPAcz
         4x7AdkVoKw/LZ0f/Ov7HVVvshvEnaYfDM4NsSpRtl9jkH4nSwBOT6DrQ1kXga7SG3Me0
         5kI1GFknP9Umog3FPAkFIvuLytatTcCyMFKPhTogNDRh7X702Y7A3ngjKTmsBjPqO29T
         Nyw+HQD/zsWds6YIlScQUGgbmloeD2Fku2/JefZdD2GaoejUu+y41NnxFiP7cyC66yDj
         v6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=b6KTirZejd3sDDi2THGHxOo7aZHrY3+M9Y8zIKfmv2E=;
        b=sGxuwswdnP1fMU8RFrq7QAPZ3pok2HcR8ztifhfgXC46fhJA8u46yriZaoI3+2Ke8z
         6+6wTC7g5xidpugmhk4/1KPAkRe9AE71vGITaAkWJBqS00iFID8uDp9cweRXHY21zPaw
         P/hWkit4vC/IeooQD2/lyHrECA6GLK48qlTv7TC5+W5e2+6b938r6Q3yTLlrKbuhSzcd
         N1dRqCO8F8MoEAMAJC2zFHiWp1imrWfR3K6puhbiaf0fyTTkSNwROZDc3pHYjnp1Vo/Z
         7NDG3P7krqBIju8GtKe7ippDol4hG/fdUzriMnAKOl4/ihlItvkiEmFL/etOahpq3IcL
         d4BA==
X-Gm-Message-State: AOAM5323Btr1auAsIlTdprSQ/+LKBvKA3Dntu/vECyOOjdkdbXQ5Liol
        9yqN93f0WjF3r0S//Eslh6Aq6ykdX1Iydw==
X-Google-Smtp-Source: ABdhPJyhZWCbLo+vmUw2sQzg6uAyYnovS0eKd1JYtk5kb6Cs0QnB/3a4vKaUzj6q40V+jqoiZC4w4A==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr27921734wml.153.1607955512977;
        Mon, 14 Dec 2020 06:18:32 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:490:8730:f2e4:25b3:2b53:52cd])
        by smtp.gmail.com with ESMTPSA id h5sm34126285wrp.56.2020.12.14.06.18.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Dec 2020 06:18:32 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v5 04/10] mhi: pci_generic: Enable burst mode for hardware channels
Date:   Mon, 14 Dec 2020 15:25:31 +0100
Message-Id: <1607955937-26951-5-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
References: <1607955937-26951-1-git-send-email-loic.poulain@linaro.org>
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

