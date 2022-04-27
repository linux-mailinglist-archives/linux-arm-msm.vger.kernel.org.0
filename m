Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D3E511277
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 09:29:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358830AbiD0Hco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 03:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358831AbiD0Hcm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 03:32:42 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 348D778936
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 00:29:30 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id g23so875490edy.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 00:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UAlx2TBjO4zQdUcfk7qqadkkIfHQi8ARgELGZX9bCmw=;
        b=PEphi8sYJzvphwEoCiLlI9mGjWjjX9Cs66ONkH1ncMkLqi8AGIQyJbGwtqVy1s3XaG
         66H13C6gcheANfFBr2n7ztHTNI7RLhm+LC77zDf4U9ZuxDgVspi5X6F4jqHCKnBG9Dl5
         u9zzrZG0uyOh/OHY+LOe0pm73k2KyL206hm4fEWxGE+yUhKzsyBnN4y1ADePANAg2+ZO
         zCrNSqqY3JXu/cfcgiyuyHaku0XAK0gT8QXWtsjc23DZbP+FSUhXMEY96RQziKcLvJfd
         1qr4v7th9QzYBZ+3eVsgGFrKnJCfL8WngX6i6E01IE7iOIp1b2fhdn11EEee3FrGWTxg
         M9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UAlx2TBjO4zQdUcfk7qqadkkIfHQi8ARgELGZX9bCmw=;
        b=BeldnjqtTT8I6IgaPsLSAWsVIX7Et10qQyVws3+7+eNJqZC7nnGb2VE5jrVh7Os1wA
         a2NoEZhT0UzZpsLZkgSXiKt7tEb1tYe8CrUoeRuXC9fIS17imMQ0OQ/1Zcc/9js1i8gg
         TXsTZT3z5N1iKU0NN7+iJauhkW4F6at1DoGSRQzWroFRLzFfYJDe9AQVU7rLxqK7+InK
         j8Wi3JNg1HoaTgDlOwoHQ34UE3RQNsDefzb1arxy/b+m8aGkzQ5/TbOMDqx2aTHAe5gm
         /AShuEc9WFMDJJYJQHl30KM1c01jBoapoBfBe0B/Kjd3QDPDDBdrG8zJ7eefuIAVFRHO
         qjGQ==
X-Gm-Message-State: AOAM531q+0b/YXJ/oMj1h5oxcjjA1jeuvhtx4g9GN6X9oZnDaBi7CAjI
        DrJSKQ6pNyPG2lAOS4Itr1U=
X-Google-Smtp-Source: ABdhPJxtBTXJSQIimDntmvaIM/BgqDf9lsYm5rpzTR6BaZmo90nKmPqrUgEjNwkHfEId+CvHwTgyDg==
X-Received: by 2002:a05:6402:1d4b:b0:425:e0ad:7203 with SMTP id dz11-20020a0564021d4b00b00425e0ad7203mr16883708edb.367.1651044568757;
        Wed, 27 Apr 2022 00:29:28 -0700 (PDT)
Received: from ThinkStation-P340.. (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906310a00b006e834953b55sm6235499ejx.27.2022.04.27.00.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 00:29:28 -0700 (PDT)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH v2 1/1] bus: mhi: pci_generic: add Telit FN980 v1 hardware revision
Date:   Wed, 27 Apr 2022 09:26:48 +0200
Message-Id: <20220427072648.17635-1-dnlplm@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_ENVFROM,
        HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add Telit FN980 v1 hardware revision:

01:00.0 Unassigned class [ff00]: Qualcomm Device [17cb:0306]
        Subsystem: Device [1c5d:2000]

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
V2: rebased after mhi_pci_id_table reordering
---
 drivers/bus/mhi/host/pci_generic.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 8858f3bf4f04..8e453b74e6cd 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -446,6 +446,41 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
+	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
+	MHI_CHANNEL_CONFIG_UL(20, "IPCR", 16, 0),
+	MHI_CHANNEL_CONFIG_DL_AUTOQUEUE(21, "IPCR", 16, 0),
+	MHI_CHANNEL_CONFIG_HW_UL(100, "IP_HW0", 128, 1),
+	MHI_CHANNEL_CONFIG_HW_DL(101, "IP_HW0", 128, 2),
+};
+
+static struct mhi_event_config mhi_telit_fn980_hw_v1_events[] = {
+	MHI_EVENT_CONFIG_CTRL(0, 128),
+	MHI_EVENT_CONFIG_HW_DATA(1, 1024, 100),
+	MHI_EVENT_CONFIG_HW_DATA(2, 2048, 101)
+};
+
+static struct mhi_controller_config modem_telit_fn980_hw_v1_config = {
+	.max_channels = 128,
+	.timeout_ms = 20000,
+	.num_channels = ARRAY_SIZE(mhi_telit_fn980_hw_v1_channels),
+	.ch_cfg = mhi_telit_fn980_hw_v1_channels,
+	.num_events = ARRAY_SIZE(mhi_telit_fn980_hw_v1_events),
+	.event_cfg = mhi_telit_fn980_hw_v1_events,
+};
+
+static const struct mhi_pci_dev_info mhi_telit_fn980_hw_v1_info = {
+	.name = "telit-fn980-hwv1",
+	.fw = "qcom/sdx55m/sbl1.mbn",
+	.edl = "qcom/sdx55m/edl.mbn",
+	.config = &modem_telit_fn980_hw_v1_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.mru_default = 32768,
+	.sideband_wake = false,
+};
+
 /* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
@@ -453,6 +488,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
+	/* Telit FN980 hardware revision v1 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
-- 
2.32.0

