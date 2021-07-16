Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D0443CB391
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 09:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236809AbhGPHyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 03:54:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236794AbhGPHyY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 03:54:24 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDF65C06175F
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 00:51:28 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id x13-20020a17090a46cdb0290175cf22899cso315389pjg.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jul 2021 00:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3drlnqLci8b92FvhLSUmW1dM18kTxe4HZJWDZW845h8=;
        b=Jdj9wk8b2VbsBv1/xEpWv+SR/MxQH9P6VEjUfs0n1DxUpd3I6H1opD1dIAsBSKGSVu
         xeOJH1Sv4HM1ta6lO09VyrteUsmy7dEPpNojMlcaojxdmQHzd/0B1tIXYMylZaSpKyJG
         qwIjcStYGt/uy+esecFXWnHUPHhLf6Blk8XIZ4zW8qVPuGAq93kWcdm9zLP8GRPWNtMp
         BRJyhJKfPOZVd6Wj1WZ9iFF1qi6+LciVxiZyvOms6YJJ4Sj2EU8XNJKAynJAvOsB+9wl
         tcKqqCNgbhw4d3fe5qJiCH+2u9QHa3oksL1q5GwZw+9LVUnJ/jOBw8VeJOu6SJ/35v8E
         b7ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3drlnqLci8b92FvhLSUmW1dM18kTxe4HZJWDZW845h8=;
        b=GgKcty4tkBnP8W6b+KpxkeaQ7HWdazYzF10/zCRwKc/4+SGwSJLrKPgybJyLYJXi6F
         P4GLhlpZsev5B/62a0cwasOd94wWejqs5ruoEvHXQMLdgGULHePNE5T+2bC9n53JSIeO
         KP6iCdoXk7GIkKWF3FNJ2QTUTUeJupJz/t6HuDLeSUzrCpEqgBWoYOQHPgbPGlJuJT5Z
         tpliUFmfmcB5HDjPPKg+estR9aOMjfU6s+XmbRSzMFZhgnncD04YGdKOZnWyyQ+ntclr
         9cMx3fkEjIzTEhsVMgtqefB5DNlfMWdPaHtbgK9J/SQ57FMK0N7KSROKBloH6xNV+LeN
         GwdA==
X-Gm-Message-State: AOAM531s/EPHBSgtUWkKgASqjXacI26uzqfQb18uj6s0xfxZpxKoDSBH
        vQlBj/fIScPoSUsMy6OqSbcV
X-Google-Smtp-Source: ABdhPJyuWNdHtPtkcEZNiwF7MgRatrF5Q3VY/6wlMaJTtMaxlrPvDJylyd5ps6I+RPJAbDfG5NK3Cg==
X-Received: by 2002:a17:90a:5204:: with SMTP id v4mr14324567pjh.147.1626421888238;
        Fri, 16 Jul 2021 00:51:28 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.214])
        by smtp.gmail.com with ESMTPSA id 21sm9253357pfp.211.2021.07.16.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 00:51:27 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     gregkh@linuxfoundation.org
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, jhugo@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        stable@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/3] bus: mhi: pci_generic: Apply no-op for wake using sideband wake boolean
Date:   Fri, 16 Jul 2021 13:21:04 +0530
Message-Id: <20210716075106.49938-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210716075106.49938-1-manivannan.sadhasivam@linaro.org>
References: <20210716075106.49938-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bhaumik Bhatt <bbhatt@codeaurora.org>

Devices such as SDX24 do not have the provision for inband wake
doorbell in the form of channel 127 and instead have a sideband
GPIO for it. Newer devices such as SDX55 or SDX65 support inband
wake method by default. Ensure the functionality is used based on
this such that device wake stays held when a client driver uses
mhi_device_get() API or the equivalent debugfs entry.

Cc: stable@vger.kernel.org #5.12
Fixes: e3e5e6508fc1 ("bus: mhi: pci_generic: No-Op for device_wake operations")
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Link: https://lore.kernel.org/r/1624560809-30610-1-git-send-email-bbhatt@codeaurora.org
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/bus/mhi/pci_generic.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index ca3bc40427f8..3396cb30ebec 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -32,6 +32,8 @@
  * @edl: emergency download mode firmware path (if any)
  * @bar_num: PCI base address register to use for MHI MMIO register space
  * @dma_data_width: DMA transfer word size (32 or 64 bits)
+ * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
+ *		   of inband wake support (such as sdx24)
  */
 struct mhi_pci_dev_info {
 	const struct mhi_controller_config *config;
@@ -40,6 +42,7 @@ struct mhi_pci_dev_info {
 	const char *edl;
 	unsigned int bar_num;
 	unsigned int dma_data_width;
+	bool sideband_wake;
 };
 
 #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
@@ -242,7 +245,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx65_info = {
 	.edl = "qcom/sdx65m/edl.mbn",
 	.config = &modem_qcom_v1_mhiv_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = false,
 };
 
 static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
@@ -251,7 +255,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.edl = "qcom/sdx55m/edl.mbn",
 	.config = &modem_qcom_v1_mhiv_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = false,
 };
 
 static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
@@ -259,7 +264,8 @@ static const struct mhi_pci_dev_info mhi_qcom_sdx24_info = {
 	.edl = "qcom/prog_firehose_sdx24.mbn",
 	.config = &modem_qcom_v1_mhiv_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = true,
 };
 
 static const struct mhi_channel_config mhi_quectel_em1xx_channels[] = {
@@ -301,7 +307,8 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 	.edl = "qcom/prog_firehose_sdx24.mbn",
 	.config = &modem_quectel_em1xx_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = true,
 };
 
 static const struct mhi_channel_config mhi_foxconn_sdx55_channels[] = {
@@ -339,7 +346,8 @@ static const struct mhi_pci_dev_info mhi_foxconn_sdx55_info = {
 	.edl = "qcom/sdx55m/edl.mbn",
 	.config = &modem_foxconn_sdx55_config,
 	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
-	.dma_data_width = 32
+	.dma_data_width = 32,
+	.sideband_wake = false,
 };
 
 static const struct pci_device_id mhi_pci_id_table[] = {
@@ -640,9 +648,12 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	mhi_cntrl->status_cb = mhi_pci_status_cb;
 	mhi_cntrl->runtime_get = mhi_pci_runtime_get;
 	mhi_cntrl->runtime_put = mhi_pci_runtime_put;
-	mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
-	mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
-	mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
+
+	if (info->sideband_wake) {
+		mhi_cntrl->wake_get = mhi_pci_wake_get_nop;
+		mhi_cntrl->wake_put = mhi_pci_wake_put_nop;
+		mhi_cntrl->wake_toggle = mhi_pci_wake_toggle_nop;
+	}
 
 	err = mhi_pci_claim(mhi_cntrl, info->bar_num, DMA_BIT_MASK(info->dma_data_width));
 	if (err)
-- 
2.25.1

