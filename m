Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA9232F384
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 20:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhCETIf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 14:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhCETIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 14:08:25 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0191DC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 11:08:25 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id e10so3202989wro.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 11:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xkgQUEFZxMLHtaJf4dT2RA8TF9CH0psfk4qBs11bA6Q=;
        b=EYJB0Kyt9DQvqBKZElD86HvN//EQ4/SX9nI0NSvsfWiiFKbZGcoCHstICf/2ei7NJd
         V/XNSszl7SzNqNQmqaxAZlcySlQV/fkfis2rqyag0AOSHf6mCBi6mZ2RPh/rKP9wHX2M
         o8sz052Jf3MWtKJ/l0bYlTopClg7QiCHG1lGEw73PtAx8OjylzrQUWXKT65vmdNLFWu8
         4y5ahl4EjrXUi8xfUuIMxhLTT2tD2yfYE6ZXvltCTnjHve2VosXGtkiKO9sX2NtIPTD2
         1BN/qQaSfAnWPhIDq7koBMiB1zW9hODp396Xi22zyeDCziT9wX9zHXvGs1YnnXcA9LZZ
         yQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xkgQUEFZxMLHtaJf4dT2RA8TF9CH0psfk4qBs11bA6Q=;
        b=FmI9TbjQEU/AME4UbcjtD7y54jbwn+6l1H6eZg4kO+I2PGz8XzUYivRj7YhZI/4fbJ
         f9Mvh9/5YjZ9X3PlnoSucnYvL76CRa8WR7HEzXv16agjiWB0Lz8KdbFQbDlg+fWFsIfB
         uW7ORHGGmDxoBOel5AEK9D5Yq7NcUcuuRKI+OJjYUKe5hlzTg7v+AsCPunFOX/HSpLq9
         AUTG+kQpxbBRp4TI1MtM0SNuV0/cK44xYiM7KTg1YiFXKvn8GAHSa7UjUX6u2ZGmksE2
         7zFQ95qQooJ+bW5QtG9WvbIDWuwqnpFTINvNpAfkQ7ZqApA+uj3VpAFskzX0sRmytybv
         lTXw==
X-Gm-Message-State: AOAM532gVxKPOHbS9RmXtFMoeOkmvfgzTd9gN2EO+lxVFAfZl0dJkTVN
        6IJlOCurMYwB5Mnj+DIRewGOGw==
X-Google-Smtp-Source: ABdhPJyTxRn7JNCgS/78lWHltq9xS8YhSDLKPBfs147caKBmRD+/viVKenUvowWj9++fpnfw8FXOnQ==
X-Received: by 2002:adf:8104:: with SMTP id 4mr10857600wrm.265.1614971303662;
        Fri, 05 Mar 2021 11:08:23 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:55da:a740:2edb:1c7e])
        by smtp.gmail.com with ESMTPSA id c11sm5355437wrs.28.2021.03.05.11.08.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 11:08:23 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 3/6] mhi: pci_generic: Add SDX24 based modem support
Date:   Fri,  5 Mar 2021 20:16:45 +0100
Message-Id: <1614971808-22156-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add generic info for SDX24 based modems. Also add the FIREHOSE channels
used by the flash-programmer firmware loaded in EDL mode.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 v2: no change
 v3: no change

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

