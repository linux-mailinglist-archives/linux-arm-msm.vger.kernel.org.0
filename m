Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5786F900F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 09:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231172AbjEFHcO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 03:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbjEFHcG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 03:32:06 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0909D11629
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 00:32:00 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6439b410679so1408858b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 00:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683358319; x=1685950319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gnprX8nF58MbC+8jk2bB2WSCWcm3GNiHBCtxvPm30dM=;
        b=IEPLhW3VjIQfoKFoGZMwj/5mHPFXFTkjY7vlMGmonbbPkTlEr7EHa294tNa/LOpUqr
         pmk7r1njQJX+hZRxDuvFkiUqzHGKuHFBGTLrIWZar5Y2x99dd4LPAX549Pk9AqIao9jO
         ElBb3tmmEOgCGjY35nqnHgq6QOiCGRyf0ZSctdPfrSTWw2FyoZ5x2n9aDgY+0795eYC8
         AFHCPWTVc3cITjYxELTXD7CLzyL4AUksfaiEyytWqTGnYPPuoqhX/KKoB9uZW/zcNCaH
         Jdx/ztme3QMugbBBKg76PrOq9WuO9XjJuqL5YRcNGlD3UXniPpSI9EvDos+dZFpn+iwO
         ZqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683358319; x=1685950319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gnprX8nF58MbC+8jk2bB2WSCWcm3GNiHBCtxvPm30dM=;
        b=GxbMP2XrO3FS8gSQt0veS3mheAamWE9dE5KIWVCtMl2Rt+YAnvO03INPRp6hDXQk+S
         sffOFthkh+sV2O0Iw8+VKsOmMudkfU2ezpPqS+lc++Z8xjyDbvbd/cxSEm4mkC9lIQvm
         wysckmeNxnOb3WKOTkhX39b7ofR3IliDMtcHWwImtnHB3PTu00qKtU1zwlT/xrJABJBP
         yB956pZxLEkJESQZNEiSoCeJ+Q/qBzY8EMIWPa0zZzVfa+o1R0Lw7qY3KZ4DwYtE/nk5
         aO6Cf0Ity4E+KbDG724UkGk6NPlDqFHuOc5tVMAjwvb7ma9TKSk7sEW7ToGqcIMQwnMg
         TNPg==
X-Gm-Message-State: AC+VfDyrQ0Wgs1feLzFLumU3BLTf4NApHc0KY6W5nHHcxOKV/RaWY51w
        nraAgaew3mAlu2VfQpuegqRD
X-Google-Smtp-Source: ACHHUZ4e+3o0zhkMKnSQOeDFtRGJYjyqM20YY/XUi3h/jE50P7TPO9rF8YGTiQip+KkHLiSSpVhGZA==
X-Received: by 2002:a05:6a00:24cf:b0:63d:3411:f9e3 with SMTP id d15-20020a056a0024cf00b0063d3411f9e3mr5929321pfv.19.1683358319465;
        Sat, 06 May 2023 00:31:59 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.87])
        by smtp.gmail.com with ESMTPSA id z16-20020aa785d0000000b0062a56e51fd7sm2627373pfn.188.2023.05.06.00.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 May 2023 00:31:59 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com
Cc:     robh@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, steev@kali.org,
        quic_srichara@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 3/8] PCI: qcom: Do not advertise hotplug capability for IPs v2.7.0 and v1.9.0
Date:   Sat,  6 May 2023 13:01:34 +0530
Message-Id: <20230506073139.8789-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
References: <20230506073139.8789-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SoCs making use of Qcom PCIe controller IPs v2.7.0 and v1.9.0 do not
support hotplug functionality. But the hotplug capability bit is set by
default in the hardware. This causes the kernel PCI core to register
hotplug service for the controller and send hotplug commands to it. But
those commands will timeout generating messages as below during boot and
suspend/resume.

[    5.782159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2020 msec ago)
[    5.810161] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x03c0 (issued 2048 msec ago)
[    7.838162] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2020 msec ago)
[    7.870159] pcieport 0001:00:00.0: pciehp: Timeout on hotplug command 0x07c0 (issued 2052 msec ago)

This not only spams the console output but also induces a delay of a
couple of seconds. To fix this issue, let's clear the HPC bit in
PCI_EXP_SLTCAP register as a part of the post init sequence to not
advertise the hotplug capability for the controller.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 391a45d1e70a..00246726c21d 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -966,6 +966,23 @@ static int qcom_pcie_init_2_7_0(struct qcom_pcie *pcie)
 	return ret;
 }
 
+static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
+{
+	struct dw_pcie *pci = pcie->pci;
+	u16 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	u32 val;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = readl(pci->dbi_base + offset + PCI_EXP_SLTCAP);
+	val &= ~PCI_EXP_SLTCAP_HPC;
+	writel(val, pci->dbi_base + offset + PCI_EXP_SLTCAP);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	return 0;
+}
+
 static void qcom_pcie_deinit_2_7_0(struct qcom_pcie *pcie)
 {
 	struct qcom_pcie_resources_2_7_0 *res = &pcie->res.v2_7_0;
@@ -1272,6 +1289,7 @@ static const struct qcom_pcie_ops ops_2_3_3 = {
 static const struct qcom_pcie_ops ops_2_7_0 = {
 	.get_resources = qcom_pcie_get_resources_2_7_0,
 	.init = qcom_pcie_init_2_7_0,
+	.post_init = qcom_pcie_post_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
 };
@@ -1280,6 +1298,7 @@ static const struct qcom_pcie_ops ops_2_7_0 = {
 static const struct qcom_pcie_ops ops_1_9_0 = {
 	.get_resources = qcom_pcie_get_resources_2_7_0,
 	.init = qcom_pcie_init_2_7_0,
+	.post_init = qcom_pcie_post_init_2_7_0,
 	.deinit = qcom_pcie_deinit_2_7_0,
 	.ltssm_enable = qcom_pcie_2_3_2_ltssm_enable,
 	.config_sid = qcom_pcie_config_sid_1_9_0,
-- 
2.25.1

