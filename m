Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 917634F978F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Apr 2022 16:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235686AbiDHODm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Apr 2022 10:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236082AbiDHODl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Apr 2022 10:03:41 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0695834BA7
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Apr 2022 07:01:38 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id k23so17569492ejd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Apr 2022 07:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XleLYxPj8RqaxqCHhK/axch93UQBu/FbHCjjLsjUXjA=;
        b=qNvDkVqdFLQvTmsmdp6cxlL5q6Xw3jKmCGQxqr2gwMdvx43Ij+98yGe0lwKOKwYB4b
         /z+55WIq2FF4NHsqw9tAOl//EevQr0bim8KXGyG75QrF/AsjTg92mypNfGHrTNb1PHXa
         ZyTSoUf82Y9zyVItYou4HdY2BClgCWZ+WaSUHIqya2QrvtMq/9Vhy6LbpCw3LefQMEqi
         GZU38VAVovAXkiEFH294KSf+Zdk7vHbI491Z8nzf1bTsRf5z+7slUqxh6lxVGhP6l/D4
         Rp90J7nqH7KaDjuno/R9c45BnIASUyMnS9qmlDpvuqiAIRY8oqMIlR3aKCfGGVKJeba1
         swyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XleLYxPj8RqaxqCHhK/axch93UQBu/FbHCjjLsjUXjA=;
        b=wwvF9Vpp5t/bxMRC7+XfwacQGZnYEMEFc+2jGhIRn9KDuQmaIJwO6HXPix2uai/LbB
         gs8pirAaQ4f91gUuHu7cNNe3TcgntKyVjT9S1a5JjFp64nE8zZ+YKwnvSE6wws5pFbuD
         NTAR5NFKKSfGvW1Ex8F6AgKMMRIR9caOBW6jRwpqE99PeXc075FNe54/PhWErZ2ItbJD
         IYwvycW6YeFtF3mHB3anAzRsNEpGir6Co0wE2p0LPxLhHIgMBbXdXieHeCKebSCp6Phu
         JRAESdgmDf3suUGPxjQPCyNubj9Q1r5+tU/c3ospAxcE1JpnF5NoDoXxbJafsd55HW6S
         j+Jw==
X-Gm-Message-State: AOAM531cAQKPqtT2FM7PvPTo36FzhGDSIeZmlxSkP7BISMc+Bp43x3WE
        dg4w+Oa6sHU+wisuxhiB7Ds=
X-Google-Smtp-Source: ABdhPJwoxV4xVc6PkTwCC1t2MQUq7TowgfnGgoat6kksN9r8UA9IN8sBLbSeMxcLw2s9Go/qf/xdlg==
X-Received: by 2002:a17:906:974e:b0:6bb:4f90:a6ae with SMTP id o14-20020a170906974e00b006bb4f90a6aemr19153584ejy.452.1649426496486;
        Fri, 08 Apr 2022 07:01:36 -0700 (PDT)
Received: from ThinkStation-P340.. (static-82-85-31-68.clienti.tiscali.it. [82.85.31.68])
        by smtp.gmail.com with ESMTPSA id k11-20020a50cb8b000000b0041d20d0bae7sm1046228edi.41.2022.04.08.07.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 07:01:35 -0700 (PDT)
From:   Daniele Palmas <dnlplm@gmail.com>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        Daniele Palmas <dnlplm@gmail.com>
Subject: [PATCH 1/1] bus: mhi: pci_generic: add Telit FN980 v1 hardware revision
Date:   Fri,  8 Apr 2022 15:59:24 +0200
Message-Id: <20220408135924.3038485-1-dnlplm@gmail.com>
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

Add Telit FN980 v1 hardware revision:

01:00.0 Unassigned class [ff00]: Qualcomm Device [17cb:0306]
        Subsystem: Device [1c5d:2000]

Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9527b7d63840..5e786f4a3bdf 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -446,7 +446,45 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
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
 static const struct pci_device_id mhi_pci_id_table[] = {
+	/* Telit FN980 hardware revision v1 */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
+		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
-- 
2.32.0

