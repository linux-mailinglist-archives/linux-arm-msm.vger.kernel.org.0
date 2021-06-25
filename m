Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77DE3B4358
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jun 2021 14:34:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbhFYMgu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 08:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231563AbhFYMgs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 08:36:48 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2723C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:27 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so5449669pjo.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Itg7q21v3EKwlINV20Qj2TJ1H5+La9fbdkbVcLCqRkY=;
        b=WlnZ38Zz9n2oTqBeL1RjHNJyWTJit2WSGHo2bwO9NDb6CKbz43ZnRF8E7I6km42SOE
         k6bEqAZiII+z/P+wOkVcqZjT7vazDc1c6xWvQSbij54UET1JTzx4Z0ZYalCmI4K7LkHh
         T80XC8IHH1rh+f3KqaTZ5GMDZD4mho76cw/WIc1UQQkk+i83oxWtO3tmQdJlVIv49Z5J
         MO0vuMnF6QfAs8ssH83RRI9U3JqnsoAASd2IxfJ+XYA0wNJgyFoDXIhY0O6+T2sxVvjK
         M3gH6m/yUUVawQymhAbBEP5MxXXwGG2Uj/ugOuo9xL/kxWXHYW3nXacQk7HtO4Kl4piC
         mofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Itg7q21v3EKwlINV20Qj2TJ1H5+La9fbdkbVcLCqRkY=;
        b=G8vphtCly0E3Ojm9weJsd+wzljAXKhbwhYo4iHNUMmfYfJQnP+MmWtKNvmaF/Yl8/o
         NsFqC6zOJk8d07mC/xji/ODNDgSCJ6KZUZy77Cae/bpdh9VJ30caoECzqe6oWEua8dwL
         XdBBWxNz24wUAOMTOGzqbLSllS/ZOxCn3Hbf10qWsKUXUliXhxy49/XwPpf3bsiGojrX
         DEvc4OZyyf2uBMqaZD7Dl+Yxz4SZR66us8XjfZETrodcCZFNlR2Cq/h5s6VXnCb1poR1
         huigU55GrdAfX0IqjUDE0V5foF9a326Jl4sWiOAAIgou1V1GBRKE6/anzo3IRs7zEEtP
         TrRg==
X-Gm-Message-State: AOAM531Jks/23lnUx2zmx4ChWcodIFkW6aoTNZwcURSaKBELRH6nR88W
        NCbiDFlN79kPlqtKmNzUQv21
X-Google-Smtp-Source: ABdhPJzOv1zAuiqifLZNLayZ5ykIYrMN1g26DbaPIYGk5jMKpCjhgp/2K5OMi4gvZ9XLjphNhZS9wA==
X-Received: by 2002:a17:902:a5c9:b029:f7:9f7e:aa2f with SMTP id t9-20020a170902a5c9b02900f79f7eaa2fmr8984700plq.54.1624624467452;
        Fri, 25 Jun 2021 05:34:27 -0700 (PDT)
Received: from localhost.localdomain ([2409:4072:600b:2a0:ed5d:53e7:c64e:1bac])
        by smtp.gmail.com with ESMTPSA id y7sm6077780pfy.153.2021.06.25.05.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 05:34:26 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, ath11k@lists.infradead.org,
        ULRICH Thomas <thomas.ulrich@thalesgroup.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 03/10] bus: mhi: pci_generic: Add Cinterion MV31-W PCIe to MHI
Date:   Fri, 25 Jun 2021 18:03:48 +0530
Message-Id: <20210625123355.11578-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
References: <20210625123355.11578-1-manivannan.sadhasivam@linaro.org>
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
index eac4d10f99c9..89f71e6db23f 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -350,6 +350,40 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.sideband_wake = false,
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
+	MHI_EVENT_CONFIG_HW_DATA(3, 1024, 101),
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
+	.dma_data_width = 32,
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

