Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0968432836D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 17:19:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237756AbhCAQSm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 11:18:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237703AbhCAQRq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 11:17:46 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F163C06178A
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 08:17:02 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id e23so3919988wmh.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 08:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=N1N7eT6oY4oVxf6VNGytBuwW4oDrTaZSDp/gJ5zF54s=;
        b=J3mqoIosVP3Q+n0iJZcR3TAKRhYR+1D+OwrfOWLRWiyXa5CjMwps0FatNzFHFwj7K+
         FWZRS2t85YUmZ/bhA0DZOmDMGJJC3YP0OfyL9qqif8lrZKgUGDimIpYISj9b5OLvEp8U
         Q0/VRPN5QMqTmk5nitv65IKM6iOe8FXutBVgAjLLt7G12fgOMBjqyrwWHtfpdYQ7MLPF
         PLxY0JjAjdp1QDxNMOntZdXNgqtlLkyn84WGfD7+MdrFTA/kUj5m7Jp3oP8j/jtHEe6+
         c1aBBcDuiXI6ontu53qg08I7rfYv6jZ6W3bWtfhmYdxdSbrhZ48Cz+DsGu+KKyLUaEtb
         TOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=N1N7eT6oY4oVxf6VNGytBuwW4oDrTaZSDp/gJ5zF54s=;
        b=KJkSma0P5GuU9he3/YwkGrowKnD42dHNubrBO8SO4pbD1w3iTq2VpO6E4SzmG8vpsK
         44jr60IEs77NoU9Y0DHqMZd9xLplSZqlC26tR67BKdPJLW+pM/DsXTNCYmj+EW2kNb9c
         sHTTwgiSdYN8j2Wc2IyMNw9dJk7CmZfk4vYTZHTEhlCF2mqT6zGDL2ioUx8JnKuEHkn0
         e26bnMRYMODHJrA2ELif4RWin4Nltx5a/6t2RgO55mg2BallX67ZkXCvLcgfJSwOfgEI
         cpFUzDKnmlVW7oJEH+h+ZoAJVX84iHplEI2pFyA9x29Bt31YyUJOuHJlyHdQPanVI9uQ
         Iygg==
X-Gm-Message-State: AOAM531swNyVkP+v7gVUWPYXKWtJbfN8SbTu0PrHBHGmlK4Zk1X6V25O
        GTq5e9+/67RNtCILWvfbx4tExVCZvlg2Ped8
X-Google-Smtp-Source: ABdhPJzikeqleRmrQKLTMxyK8N1FxECw7/XZPxWvDEuSf225oSYEzwhMHNzSSJQBS/OxrFwg3APJmw==
X-Received: by 2002:a05:600c:2dda:: with SMTP id e26mr11134663wmh.155.1614615420933;
        Mon, 01 Mar 2021 08:17:00 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:82c:5f0:5a20:c00c:6ec3:cc84])
        by smtp.gmail.com with ESMTPSA id w6sm3919789wrl.49.2021.03.01.08.17.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Mar 2021 08:17:00 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 3/6] mhi: pci_generic: Add SDX24 based modem support
Date:   Mon,  1 Mar 2021 17:25:08 +0100
Message-Id: <1614615911-18794-3-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
References: <1614615911-18794-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add generic info for SDX24 based modems. Also add the FIREHOSE channels
used by the flash-programmer firmware loaded in EDL mode.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 00a0410..87bab93 100644
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

