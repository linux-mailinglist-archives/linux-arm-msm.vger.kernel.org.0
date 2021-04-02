Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A256D3530C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 23:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235538AbhDBVd2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 17:33:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31695 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234619AbhDBVd2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 17:33:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1617399206; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=SNgmJCBq3tjYrxVHV8+VHM2aq1+r1qtAuIzokb9UuMo=; b=hhS/v+yGA1bdnFCZgwAgQvciTgE3J/uL9zH+7rh+6bEQdaOZjndJqCbgm7DooldfWhltdRkS
 Nej3jj/Zr3qy3cre1c4LhKnKMGXkueAbUym0pg7ku0QkdpgKKce9MCONYYKPukF5OLeoQxf4
 0Q4Hme+oLWz65y+zymOK/u4Pa44=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60678da68807bcde1d9616c2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 02 Apr 2021 21:33:26
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 15A09C433C6; Fri,  2 Apr 2021 21:33:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 03C85C433C6;
        Fri,  2 Apr 2021 21:33:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 03C85C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        linux-kernel@vger.kernel.org, loic.poulain@linaro.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] bus: mhi: pci_generic: Add SDX65 based modem support
Date:   Fri,  2 Apr 2021 14:33:19 -0700
Message-Id: <1617399199-35172-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add generic info for SDX65 based modems.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
This patch was tested on SDX65 hardware with Ubuntu X86_64 PC as host.

 drivers/bus/mhi/pci_generic.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/bus/mhi/pci_generic.c b/drivers/bus/mhi/pci_generic.c
index 5cf44bc..92a1b18 100644
--- a/drivers/bus/mhi/pci_generic.c
+++ b/drivers/bus/mhi/pci_generic.c
@@ -204,6 +204,15 @@ static struct mhi_controller_config modem_qcom_v1_mhiv_config = {
 	.event_cfg = modem_qcom_v1_mhi_events,
 };
 
+static const struct mhi_pci_dev_info mhi_qcom_sdx65_info = {
+	.name = "qcom-sdx65m",
+	.fw = "qcom/sdx65m/xbl.elf",
+	.edl = "qcom/sdx65m/edl.mbn",
+	.config = &modem_qcom_v1_mhiv_config,
+	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
+	.dma_data_width = 32
+};
+
 static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
 	.name = "qcom-sdx55m",
 	.fw = "qcom/sdx55m/sbl1.mbn",
@@ -261,6 +270,8 @@ static const struct mhi_pci_dev_info mhi_quectel_em1xx_info = {
 };
 
 static const struct pci_device_id mhi_pci_id_table[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0308),
+		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx65_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
 		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0304),
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

