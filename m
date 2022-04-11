Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495F94FBD38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 15:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346544AbiDKNg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 09:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346538AbiDKNgz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 09:36:55 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BACFB62F4
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 06:34:38 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id e8-20020a17090a118800b001cb13402ea2so12371818pja.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Apr 2022 06:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rau6ikLWDvZ3H5Rxeor37L0yr1H0C2rH637cdeZ/OEw=;
        b=EcsKlULhqSIURak13xFODrD8tjy0rdmIMa8n+/G3m2f+SMKxpBpm+DPWoo/UQr0Fvg
         l2A0lVR9hkxlkTxwondEhCgwoWXnMP7zzT4I20eNXLBuIF892aJOqFAFb1g2+5/ruJuo
         SFU2eMVbPiDLIRWtJM9+w4uYmG3g5p9bBxX5+MiSwRI5v/6d3D8euduzdZ/PxOmaMNNT
         77m6ou9HfzFkLKvyZn/ataeEYhEhQjkDIbpqAbSad6ECJVHCWokGt5rXavbyQxzyXkBJ
         8nU2z2JqdE09n3ma3XuscmCcI38HQDAOrVzwKJJ1g/8tRFOwzXDkXjbiec+1rmwuO14k
         W1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rau6ikLWDvZ3H5Rxeor37L0yr1H0C2rH637cdeZ/OEw=;
        b=EqZIOjhFsgXXN4vY8XpnMfxbCLa2pX/G1rgNTeD8M+LDFbq/RdBsHiydRSIDYWcOd2
         qK1hxN6Fd32O1im3c/3zY55sOl5Gtr5TnVtQe7+oxemN76HLs8Csd0lbyVOqVS3BJIRh
         8cU5dtBitGlGHsCwPMlA1R90TBDZM3ynmXaLiBh+O6K1IS3cfgT9b98MUGNbQWubJQ+9
         cT0VK4uprs4lgTQo2J1HOkMaIPexz66eXLbjuf6JYmDLQbYvb2GHVc2UTs3LSV7tbhXS
         Yuu5ClhVNnyeBR8H4rITtBS1zuvTWKHjqNiKLxh0oZ3AnMVpg2occNmjUGJSGrLlep0t
         CuJw==
X-Gm-Message-State: AOAM531qYiOyd7UAbcNzm8RKuJM7f2YsDXepcHH8KhhkOPDrTMPAAPIk
        5PikxQRhPmFDgmaWal2BL40v
X-Google-Smtp-Source: ABdhPJzD+D2eOcZy8zFeHEt8TITM9KS6UhjpgS7YATdQRKhIivWnns/ATZL4rrHpOhDjSQRgZev4pg==
X-Received: by 2002:a17:902:b189:b0:14d:6f87:7c25 with SMTP id s9-20020a170902b18900b0014d6f877c25mr32803825plr.31.1649684077788;
        Mon, 11 Apr 2022 06:34:37 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id q15-20020a056a00150f00b004fb28ea8d9fsm37390195pfu.171.2022.04.11.06.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 06:34:37 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, dnlplm@gmail.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2] bus: mhi: host: pci_generic: Sort mhi_pci_id_table based on the PID
Date:   Mon, 11 Apr 2022 19:04:28 +0530
Message-Id: <20220411133428.42165-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sorting this way helps in identifying the products of vendors. There is no
sorting required for VID and the new VID should be added as the last entry.

Let's also add a note clarifying this.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---

Changes in v2:

* Fixup the 0x0306 entry by moving it after subid

 drivers/bus/mhi/host/pci_generic.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 541ced27d941..8858f3bf4f04 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -446,20 +446,21 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
 	.sideband_wake = false,
 };
 
+/* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
-		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(0x1eac, 0x1001), /* EM120R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
 	{ PCI_DEVICE(0x1eac, 0x1002), /* EM160R-GL (sdx24) */
 		.driver_data = (kernel_ulong_t) &mhi_quectel_em1xx_info },
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
-		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	/* T99W175 (sdx55), Both for eSIM and Non-eSIM */
 	{ PCI_DEVICE(PCI_VENDOR_ID_FOXCONN, 0xe0ab),
 		.driver_data = (kernel_ulong_t) &mhi_foxconn_sdx55_info },
-- 
2.25.1

