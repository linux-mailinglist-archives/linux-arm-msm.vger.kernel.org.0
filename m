Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D61E2516ED1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 13:23:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352647AbiEBL05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 May 2022 07:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbiEBL04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 May 2022 07:26:56 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6C6612AD1
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 May 2022 04:23:27 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id g20so16230377edw.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 May 2022 04:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fGKU4iEA70MctaOu47KUgwC5u/x0dsROSJOX3ncjBgg=;
        b=ds5QQYv0f2l6x9LITobsOg7ado/meKLpOpptbRRS6ekPaZX7VSink6r47fXVQNaKyu
         uL0TaP6eBXzRv7jacLZJE3t+myznOHWb7wjRACrfLugGxI4zP0TZ2tO9k+kpda33W+qx
         O8yseL5qEnjqfCxDz6lMD1nwvn62N6gKNkWTHjYUxl8l4Wmtss4zE89mHIS4A/0yM3ap
         rnnVnZn1bT8h/Yl0RZfRxz0U677z8YjdoZy2F6gNIPRe57Zm+3WpeeSLHCy26OGDrCRg
         13rE+TJmr4rKb9LT/QLg9hm0J/pQjVChpS2vHld2KxfdSnztUMaIedwH04/EOxRCBt0D
         fShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fGKU4iEA70MctaOu47KUgwC5u/x0dsROSJOX3ncjBgg=;
        b=cjqTuKqnHhrWGqf7f8sxfjImTnPuKfJnjHT95wRzFm+DPlSZrG+DuPlErd2MpK/CDd
         qLsi/FkeAyfK6LhXMCjaZEZ+ZpfeHdGgfNVwLSLRATnYLZps0IeOk1zGVQIv9rJmJ3O0
         p9+Ny5MzK+YR3TzwwS+ElzSIlWwkD6qldAyud/qqypyYZMoxGbt/l8VIVBWvIoue3U57
         2HC3Q1nTV7vj6eenUTTeEn7jGhM55bFmpXVqe9kK8m5XvhYg8+8U6R0NaVtr6F3yhCfb
         p6ZlO02Vvd4wj5jylZAWWPb3KlttLO42bcFN71TQzyKJbhLBKWR6lpYxQW8ontC2i+bV
         9f4A==
X-Gm-Message-State: AOAM532xAxVUQIbTAfngXTErWcJ5ulPT+tBUOyeotMObWdI2IL3bNAoq
        gkdwb0M1nKaCrEGk+Xj2sIQ=
X-Google-Smtp-Source: ABdhPJwCmF8eBtE7Q3YCW0PsES8Ml8GEGBoz6uS9Q0MvEKU7RTWHrLI/I88Au8MAlXc+KVjMj3nlrg==
X-Received: by 2002:a05:6402:2554:b0:423:f3e3:81da with SMTP id l20-20020a056402255400b00423f3e381damr12823233edb.87.1651490606100;
        Mon, 02 May 2022 04:23:26 -0700 (PDT)
Received: from ThinkStation-P340.. (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id u26-20020aa7d99a000000b0042617ba63b7sm6659104eds.65.2022.05.02.04.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 04:23:25 -0700 (PDT)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: pci_generic: add Telit FN990
Date:   Mon,  2 May 2022 13:20:36 +0200
Message-Id: <20220502112036.443618-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Telit FN990:

01:00.0 Unassigned class [ff00]: Qualcomm Device 0308
        Subsystem: Device 1c5d:2010

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 41 ++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index d0a7b5d3c01e..24c94c23d78b 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -489,6 +489,44 @@ static const struct mhi_pci_dev_info mhi_telit_fn980_hw_v1_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_channel_config mhi_telit_fn990_channels[] = {
+	MHI_CHANNEL_CONFIG_UL_SBL(2, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_DL_SBL(3, "SAHARA", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(4, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_DL(5, "DIAG", 64, 1),
+	MHI_CHANNEL_CONFIG_UL(12, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(13, "MBIM", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(32, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(33, "DUN", 32, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0_MBIM", 128, 2),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0_MBIM", 128, 3),
+};
+
+static struct mhi_event_config mhi_telit_fn990_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_DATA(1, 128),
+	MHI_EVENT_CONFIG_HW_DATA(2, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(3, 2048, 101)
+};
+
+static const struct mhi_controller_config modem_telit_fn990_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_telit_fn990_channels),
+	.ch_cfg = mhi_telit_fn990_channels,
+	.num_events = ARRAY_SIZE(mhi_telit_fn990_events),
+	.event_cfg = mhi_telit_fn990_events,
+};
+
+static const struct mhi_pci_dev_info mhi_telit_fn990_info = {
+	.name = "telit-fn990",
+	.config = &modem_telit_fn990_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+	.mru_default = 32768,
+};
+
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
@@ -501,6 +539,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
+	/* Telit FN990 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
-- 
2.32.0

