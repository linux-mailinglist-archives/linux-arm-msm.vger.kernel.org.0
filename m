Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1197E1406
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Nov 2023 16:04:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjKEPEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Nov 2023 10:04:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjKEPEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Nov 2023 10:04:50 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF08ECC
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Nov 2023 07:04:46 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-41cc535cd5cso23335011cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Nov 2023 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699196686; x=1699801486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fEG9kPj5CJD+rtid4fYcQp2weHAsG/Xfik4WDUkS/OA=;
        b=BwBWTODa95hkAFhhiRcLOaBldItR4+s8WkWjsXZtZ6kZQx0R2pNEsAVcE1ArJgoou2
         9f4T1RKilUVOMY/rIbNdYknF0FS09aPkv2qTHHwgqdXIhKz3s8YhOChlmKjGRzJoKUIR
         sB1HyB74GRLuwt+Lckc/uahYSM57EeI1rv/jauuZU7tb0UhylJ/+ML7uFAh9Y9C2SFCG
         reC9+8/OwSYYHSseP6G8UmP0OnhgW9qmgW10VMDbAWMSIeC3Avlrm2E3+alcpGZReqQY
         G+AyQs3nmLHESXlmmiuFdt0tTjDs0Khvre9DznohuL+iSRzmZaS/+ZuS+hoLaoI2ySev
         FOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699196686; x=1699801486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEG9kPj5CJD+rtid4fYcQp2weHAsG/Xfik4WDUkS/OA=;
        b=WoE+lQRgwmy6VT1jFjtGUgbDbR8W+6drkvzElVHHM1DYjgmOQy8eL4Aca0NjRemDwq
         6DHXSiSxotwlDL0hfGfHgQ6SF9EuuOxTxKBfs/aL1UYdb79BAKg1qwcLnv3VxTyVLtNe
         /rXnn0NuMI40/jEP4g/MDCE+Jc6nh0hBnQYufxeCNdiVh5ADCvnLcj8kYCF+ybVFQRnW
         iqa+ct2PV6Z8jaD4iZ5iYPV5vCXSh9DCu/rckuz5yUWJ7VYtizxOzZands+yf5CA8WTq
         4z3uipVmReTU/n+pCdCIRlLXCfrLfGbcFm2Epa3uYAFFGu1zBiZ/amswjXcN/xUv4/DJ
         ULPA==
X-Gm-Message-State: AOJu0YxRZPWOgsrnHKZfAhEtxp4deYWi9oKRM/MsCVOSSIbBZzo/pDpq
        RhdigYVovQ0xSH7216LnSzh6pK0KAcyniQ==
X-Google-Smtp-Source: AGHT+IHUV0dHK2B6cJ9/ReMlGV+h3jKOsOHsCJyR1xuP7KFxb1scRptYF2ABS3u5YAVS24l+5wmKSw==
X-Received: by 2002:a05:622a:115:b0:41e:453a:4dfd with SMTP id u21-20020a05622a011500b0041e453a4dfdmr32567901qtw.54.1699196684398;
        Sun, 05 Nov 2023 07:04:44 -0800 (PST)
Received: from luigi.stachecki.net (pool-96-246-165-101.nycmny.fios.verizon.net. [96.246.165.101])
        by smtp.gmail.com with ESMTPSA id i5-20020ac813c5000000b0041b9b6eb309sm2528607qtj.93.2023.11.05.07.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 07:04:44 -0800 (PST)
From:   "Tyler J. Stachecki" <stachecki.tyler@gmail.com>
To:     mani@kernel.org
Cc:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        "Tyler J. Stachecki" <stachecki.tyler@gmail.com>
Subject: [PATCH] bus: mhi: host: pci_generic: Add support for Sierra Wireless EM9291
Date:   Sun,  5 Nov 2023 10:05:10 -0500
Message-Id: <20231105150510.96136-1-stachecki.tyler@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the Sierra Wireless EM9291 modem.
Empirically, it seems to use the same configuration as
EM9191.

$ lspci -vv
03:00.0 Unassigned class [ff00]: Qualcomm Device 0308
        Subsystem: Device 18d7:0301

Signed-off-by: Tyler J. Stachecki <stachecki.tyler@gmail.com>
---
 drivers/bus/mhi/host/pci_generic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 08f3f039dbdd..a9ac49a94832 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -503,6 +503,14 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
 	.sideband_wake = false,
 };
 
+static const struct mhi_pci_dev_info mhi_sierra_em929x_info = {
+	.name = "sierra-em929x",
+	.config = &modem_sierra_em919x_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32,
+	.sideband_wake = false,
+};
+
 static const struct mhi_channel_config mhi_telit_fn980_hw_v1_channels[] = {
 	MHI_CHANNEL_CONFIG_UL(14, "QMI", 32, 0),
 	MHI_CHANNEL_CONFIG_DL(15, "QMI", 32, 0),
@@ -587,6 +595,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
+	/* EM929x (sdx62), use the same vid:pid as qcom-sdx65m */
+	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x18d7, 0x0301),
+		.driver_data = (kernel_ulong_t) &mhi_sierra_em929x_info },
 	/* Telit FN980 hardware revision v1 */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
 		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
-- 
2.30.2

