Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F9AE3AED56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jun 2021 18:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhFUQTY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 12:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbhFUQTQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 12:19:16 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8768C061760
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:17:01 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id g24so10265108pji.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jun 2021 09:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jaMOGou8OIStnzpQhBsWDMF6mgMEtciN1TT+obUCwVM=;
        b=raHg184lpq5hdxIZOUa03J5hGpLnbvUlGC2AgkvFIevmfG0vvWey3+vzFt+MzOCfE8
         70cyFg26xCYHEZTHJXjKmjIR8BwCJrNNcBx1zQGXWmgweNjZuub8kDDwgNQpa4TrvPMV
         5lpXxwbGDwUIEmaGE0tnuuHsPsEkagjv3WOLQIYN0kdMSVPl9Xe/i6G82ZtfUO7yE4dB
         7dGBpfpmFXKd4NeArvqOoEPRnWNcGQomKUD4otXtxumln8J8N6luPu5KUm8oTRMYOjK5
         1p7bZ10qmSBfIqXRUUKPQxaY7xyYn4QuTbtJGID6c1+Ov/jMWqmqWJqG11+R8z9qpTMu
         x8pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jaMOGou8OIStnzpQhBsWDMF6mgMEtciN1TT+obUCwVM=;
        b=mWEXXXp5qZdzU94Gd37JDgAJi494Yy4Xw+baq3Yl8gKL5pM8OaHSSiwAjP2lYj4vs+
         Kp/4ZrsmoDK0s32deW1vrH575UkRhUTFZk1I+g441A5RG0guTJuX1T19ZjnEnFLk2mE+
         vahA3+8xu84f9dkh3izlv1MoKQ+7BwaSeoXQzijqR2p/421uRWSOSa6Q9SWKSgGibbWa
         UA+2c8rFNr/gcqu2+srElf01gD10rEOJ/5HbNlHjWXHFJ4ekn8a/T6N8rlcwrz76m8ri
         8JYz1tbF5b+sTFvcx20YmkR8XTJykIqr8tyWoRv+d0hlSlNmxQh56Uf1XVhvvNmoIHgn
         q8SA==
X-Gm-Message-State: AOAM530Vm6WuwOSK+OalTq0LxMFOisyBiFEcg8BzhPFDggSDsXwoST4d
        KBLtTy6diIZQfHYFM02SEkJp
X-Google-Smtp-Source: ABdhPJynJqEM4LRtZGuRfZbJP3V1HEZ/MDJno6HiGK0ooXodFsKHCtoZFTs9J43IxQXPU4yx+xxcyg==
X-Received: by 2002:a17:90b:b03:: with SMTP id bf3mr39349905pjb.47.1624292221286;
        Mon, 21 Jun 2021 09:17:01 -0700 (PDT)
Received: from localhost.localdomain ([120.138.13.116])
        by smtp.gmail.com with ESMTPSA id k88sm10734730pjk.15.2021.06.21.09.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 09:17:00 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        ULRICH Thomas <thomas.ulrich@thalesgroup.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 8/8] bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI
Date:   Mon, 21 Jun 2021 21:46:16 +0530
Message-Id: <20210621161616.77524-9-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
References: <20210621161616.77524-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: ULRICH Thomas <thomas.ulrich@thalesgroup.com>

This patch adds VendorID/ProductID and MBIM Channel Definitions for
M.2 Modem Card (PCIe Variant) to MHI PCI generic controller driver.

Cinterion MV31-W (by Thales)
Additional information on such Modem Card (USB or PCIe variant) is
available at:
https://www.thalesgroup.com/en/markets/digital-identity-and-security/iot/iot-connectivity/products/iot-products/mv31-w-ultra-high

Signed-off-by: ULRICH Thomas <thomas.ulrich@thalesgroup.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/PAZP264MB284690134DA010698E6B3BDDE60A9@PAZP264MB2846.FRAP264.PROD.OUTLOOK.COM
[mani: fixed the subject, whitespace, and added sideband_wake field]
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index eb9263bd1bd8..1773cb3173bc 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -350,6 +350,40 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.sideband_wake = false
 };
 
+static const struct mhi_channel_config mhi_mv31_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(0, "LOOPBACK", 64, 0),
+	MHI_CHANNEL_CONFIG_DL(1, "LOOPBACK", 64, 0),
+	/* MBIM Control Channel */
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 64, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 64, 0),
+	/* MBIM Data Channel */
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 512, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 512, 3),
+};
+
+static struct mhi_event_config mhi_mv31_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 256),
+	MHI_EVENT_CONFIG_DATA(1, 256),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101)
+};
+
+static const struct mhi_controller_config modem_mv31_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_mv31_channels),
+	.ch_cfg = mhi_mv31_channels,
+	.num_events = ARRAY_SIZE(mhi_mv31_events),
+	.event_cfg = mhi_mv31_events,
+};
+
+static const struct mhi_pci_dev_info mhi_mv31_info = {
+	.name = "cinterion-mv31",
+	.config = &modem_mv31_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32
+};
+
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
@@ -370,6 +404,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* DW5930e (sdx55), Non-eSIM, It's also T99W175 */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0b1),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
+	/* MV31-W (Cinterion) */
+	{ PCI_DEVICE(0x1269, 0x00b3),
+		.driver_data = (kernel_ulong_t) &mhi_mv31_info },
 	{  }
 };
 MODULE_DEVICE_TABLE(pci, mhi_pci_id_table);
-- 
2.25.1

