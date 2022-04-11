Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8E04FB354
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 07:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242259AbiDKFuw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 01:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241083AbiDKFuv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 01:50:51 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D41B52CE18
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 22:48:38 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id be5so6968892plb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 22:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=asidVsxyIkB3smI5tvjWUtq2ho7mLzVkVUHx4rAV13g=;
        b=TX4X6X/uYWWocZgV5W3leK3OmupcigwdvvTggqX3gQipGKG22EMA233dKAMFrMbnMc
         wfE9zwMrIjs+i/7p9Rp5QuyRmmA97ZtigFNiseX9J0GUgeSn25sUcwUk0NgfX1fLypII
         Hzwv+xCn2sUUy3UR6ZjQGobzrGkgSG4Kzf2WtieJvCQWYEjgzihoxCbUVlh3cIbxMI/V
         dpVX6hY0/46eAobG0qP2xS1r3Lpna948/bdZecvhR4pDZjiDQTxP2AjDLk+6SGlLiVOL
         daWyKJrsM1uEls9AWwZVH48rsx3GmNZqAJ/OZeBOUTVmps+5Ec9qN2aEx94McA/UmtpD
         wplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=asidVsxyIkB3smI5tvjWUtq2ho7mLzVkVUHx4rAV13g=;
        b=IoyWE3iu6o69Lhdr8MMJN82+lXQnM1qBZs8ni8iPtHu4rizub+aXktMPA33o++cwP8
         GQJ8ksOgbVfTpOXZPDaqt4nRE8sIVAmWDyYSwdICoZ0R61mA+Qww6FLhPs/eCDUbUUD7
         ambzEp5vqERpLKbLs7TkLi7RdYBqz99Vtw7LEiSvvPKIzBG2tBKIMwQ6vsbz6tEoYfH6
         Ne+BIcFsJFHIWmh7ziP7BTJHavElVqqGu2+rLJjnmoNm2Vj8l5vcK/zLitbeGG9lZHSm
         ubQ4hamn9xbBrvX1g7JNglzKbXGI46q0H6YIaU0mPz+mEajbV4CFzFz7NtoHjClO++IA
         ZDIg==
X-Gm-Message-State: AOAM532nLYf5peVjFUd/+dfNL3O0ZdNRD1Asi93M6UWv74aGZPNAEkHI
        GMsbmQmhPbA8VaFXOr/PhRvc
X-Google-Smtp-Source: ABdhPJwbmgBsIdc8j5+HgdEMIiEjceFzXitMX8DNRPYWXDDLDm0k+Q8F8j3z5VDeACyosEuB+rj2sg==
X-Received: by 2002:a17:90a:39c3:b0:1ca:88b9:eb4a with SMTP id k3-20020a17090a39c300b001ca88b9eb4amr35334445pjf.96.1649656118376;
        Sun, 10 Apr 2022 22:48:38 -0700 (PDT)
Received: from localhost.localdomain ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id o4-20020a625a04000000b004fdf5419e41sm25961728pfb.36.2022.04.10.22.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 22:48:37 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH] bus: mhi: host: pci_generic: Sort mhi_pci_id_table based on the PID
Date:   Mon, 11 Apr 2022 11:18:31 +0530
Message-Id: <20220411054831.16344-1-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
 drivers/bus/mhi/host/pci_generic.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 9527b7d63840..55e96aa15566 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -446,20 +446,21 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
 	.sideband_wake = false,
 };
 
+/* Keep the list sorted based on the PID. New VID should be added as the last entry */
 static const struct pci_device_id mhi_pci_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx24_info },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
 	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
 		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
-	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
-		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
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

