Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1606532EAB0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 13:40:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbhCEMjv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 07:39:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhCEMjf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 07:39:35 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D86C061756
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 04:39:34 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id k66so1341013wmf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 04:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Qg19vffoErDUVCue7avEWam1BJicCB7smRgVL/qfkzg=;
        b=AD4E7JpX3LBKmWzsl8qMhe6+GNP9GOE9kSWutymwKtiu03pvBbcuvqHwV9HxbVgOIU
         wRkRf8mhCWs8H+r6KPbKW3p89h5ILyOOTKEoXNtPS0bGay3inl5M2n40efVtdmEgS5cE
         5PrYSmtqrn+JmpTUHNwhaUpeQZI9s6LAIHQHHC8z8QDZQHnQMui4fb9zjPWFzsF0X90o
         gmFo/yTVJfBhxNptAD++RjWZVeQJjfSs44gY3lPyzahYQOnCbmKmRWtExYGgd49Hp7HW
         P0nOrB4W2Nym/DtupUJiGCgBApHWBK/AFlnxTQHko8PeTMP8oMVrpHX+EM0U5/XIGBBu
         sBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Qg19vffoErDUVCue7avEWam1BJicCB7smRgVL/qfkzg=;
        b=BsQ5cDDkRXpedDN7At0IOpGzlwylmAKZzSz46i6j7U2VuHWhtthqO+xXgYW7p4WhCD
         6LV7MShqH0VeeQ5QnbrQQ/RLZxUsrW6NLV6Hzflp65NC3HmmXpqouE7Cc32dZhWLatIB
         5W5C2WsPv/Y2ZVR/xiQCffx+zjTf8cCrEyuKa/vFCzPTyCunB+CQlIoRlYnjIrtlRePk
         hJkKqPKz1zVTJgBcSpG0ZbvBcIkRIIFQ7qNzr8JYIn/x6btra5qDWwtYLtf6QQlV+q9B
         wHR5i4/D4HFQqbZsopPfzXIwEltC/Y9FXne1JQ7hWDGpVCbldKPBKNhOOX2fIFG/w405
         /WPg==
X-Gm-Message-State: AOAM531DoIwsgiughIbvvz/Oo1QH7IrLr1UU/pCOsKk4bFa0USRdmP00
        mGiIVxRBSs0/8DHOWZXxgu49p4XDofmS63FK
X-Google-Smtp-Source: ABdhPJz/JwSYbhhsw/VgCa/qCBc0axC7vHmWCmj17OFG/DKY3FQ2aO7Q2KZcJo2ySQTEZG72j3tvfQ==
X-Received: by 2002:a05:600c:198c:: with SMTP id t12mr8480670wmq.183.1614947973407;
        Fri, 05 Mar 2021 04:39:33 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id f5sm4173256wrx.39.2021.03.05.04.39.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 04:39:32 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v2 3/6] mhi: pci_generic: Add SDX24 based modem support
Date:   Fri,  5 Mar 2021 13:47:55 +0100
Message-Id: <1614948478-2284-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
References: <1614948478-2284-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add generic info for SDX24 based modems. Also add the FIREHOSE channels
used by the flash-programmer firmware loaded in EDL mode.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 v2: no change

 drivers/bus/mhi/pci_generic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 45d0cf2..c274e65 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -212,6 +212,14 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.dma_data_width = 32
 };
 
+static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
+	.name = "qcom-sdx24",
+	.edl = "qcom/prog_firehose_sdx24.mbn",
+	.config = &modem_qcom_v1_mhiv_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32
+};
+
 static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(0, "NMEA", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(1, "NMEA", 32, 0),
@@ -254,6 +262,8 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
-- 
2.7.4

