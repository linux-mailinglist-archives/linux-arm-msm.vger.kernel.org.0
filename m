Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01C5C2D3899
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Dec 2020 03:11:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgLICJU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Dec 2020 21:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgLICJR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Dec 2020 21:09:17 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14230C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Dec 2020 18:08:31 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id y8so119287plp.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Dec 2020 18:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KsToaui+c4tLuJA6o1UPV0Iqu/q3rNtPcLmVbxkIOGw=;
        b=RJ6lMMlQN9Q0FB0pHRGZ64OYsdGDDdSVADApCttmcfF4htYVJMxmSAltyG/V8saCKc
         QZGbx/qM+zInZxM71xW/sodC3WFVd282yqUZ0AZFwoGVeI54E7D4RkLla/BLmi6wAzKX
         T9pQPPOiiqP60jUIFqzTuHr+qr3XldiH7LuIDlEOJ2J2u4f1utR2dzNrj7FMIhErpXiS
         X2TqHZs6xuGapmX4P8hKkYrpkATpftIHcnCdZUx4q2oQGUbQZffjtkecO/uC4L/bwS0Q
         W2Yq4uCnuV5i2w7yUu5nP45E/IL6UyDn6TQyhxpqV+PAVoDkCTwUnvx5fffUqvibou2P
         aGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KsToaui+c4tLuJA6o1UPV0Iqu/q3rNtPcLmVbxkIOGw=;
        b=f+3bCq45TUyXF9JafwC7G/9oVvhs+bn2fEZ/fxxEazjGZ30/VQrQ+Nm/nm78YHhhWV
         piaZCP6bRunykqhCUb3Cqb6oxSlQdqjBSBri6oB99xC9KLKv0GpB+3i6jU6P5MmNHlna
         p4+htNFXN+3NvU0mHZb9XU6NQ929+nYbS5yFpRb9hfBaeg2ACWZYWzz6m0/mT1KaiB1R
         AVRhYSF4DGICvotigwHOTk/dTWcFvdbALqUbO1pDUev7+MXRP//GyuY/MRo6KdseOsvG
         WH6m1FjUnamyrrMjpft1xZnbH9A2xhhr6mJV2cs+f8saMqczakr2nu1Dx+EvR0w93D93
         WmWA==
X-Gm-Message-State: AOAM531oJToVv7d9tbWNCOCnXM8lmS/ds+DJUwVyT/rgxhl1ARaPqljN
        BLo7rKirNgXqCB3cmEbUsoWJ
X-Google-Smtp-Source: ABdhPJxj0eU9WE1ZTHGb/qUkwS/+6BVHvEAcCmVgSiHdqU6TtAIpJiZarmMQ4W509vuXhJi9mV3w0A==
X-Received: by 2002:a17:90b:350b:: with SMTP id ls11mr82922pjb.193.1607479710395;
        Tue, 08 Dec 2020 18:08:30 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id az19sm89046pjb.24.2020.12.08.18.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 18:08:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To:     lorenzo.pieralisi@arm.com
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        svarbanov@mm-sol.com, bhelgaas@google.com,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, mgautam@codeaurora.org,
        truong@codeaurora.org, Manivannan Sadhasivam <mani@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] PCI: qcom: Fix using uninitialized smmu_sid_base variable
Date:   Wed,  9 Dec 2020 07:38:17 +0530
Message-Id: <20201209020817.12776-1-mani@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

smmu_sid_base should hold the base of SMMU SID extracted from the first
entry of iommu-map. This value will be used to extract the successive SMMU
SID values. Fix it by assigning the first SMMU SID base before for loop.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 8ba3e6b29196..affa2713bf80 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1297,6 +1297,9 @@ static int qcom_pcie_config_sid_sm8250(struct qcom_pcie *pcie)
 	/* Registers need to be zero out first */
 	memset_io(bdf_to_sid_base, 0, CRC8_TABLE_SIZE * sizeof(u32));
 
+	/* Extract the SMMU SID base from the first entry of iommu-map */
+	smmu_sid_base = map[0].smmu_sid;
+
 	/* Look for an available entry to hold the mapping */
 	for (i = 0; i < nr_map; i++) {
 		u16 bdf_be = cpu_to_be16(map[i].bdf);
-- 
2.25.1

