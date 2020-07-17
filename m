Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F8DD222FC8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jul 2020 02:16:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726296AbgGQAQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 20:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726238AbgGQAQX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 20:16:23 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF01DC061755
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 17:16:23 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id k27so5783076pgm.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2020 17:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gz5Zo50XaaYCZ/NxMlikYXYKHZLd81NtOvGkTA8cH8o=;
        b=hR7K/50YBRAiYbzC5YEsIbA8rrB/9x+7sISP+RCiE+PEZ4V1DcU4bLgQSvldNsZ0c8
         DlWjm7LoKVY9Rz8e9IgppsSankyzITQqSY5b/cGexfVASMUQP3opQJ1PjW8bqK6geipV
         zSVYGSqXW0FVUmM3/qy2HG22nBoC6cvLoqstJ0bhcsawn5tbuBgigq9soHAc1TbbbrXI
         ygJEnHbepx4gjwD2rGloW4NabRJXyVxcmxqAPB5n1cfQloJRJi4jmiqmPJbLGPeOQVO1
         zKZqZBmmmRchgEeyycJ7FTZbWWgOm7MNjc4uGjYm6V4G7tYor5UqiYvFokYU6C0EjdDM
         C8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gz5Zo50XaaYCZ/NxMlikYXYKHZLd81NtOvGkTA8cH8o=;
        b=C0/UixmwbGwAXjWrBytmpAcFTDo6K3aOfxo+qNQ54S4CXPZowvS4/zRuaXC6MNIehz
         aMBgwJGHfuAjlprnTWqaBEWJxEh2lTFNzVmMwQzij3gdIR7T8dUnCHwQID0U8kJVBoFP
         EjDXZjFFwFWS4E2NhhRN8Ws6iCRESqcjjKQL5pDB389ciMfSP+Q62ayHkFoqn/Xhfc5M
         UbIIAtsKmrvvtZqedVe95W1k2jT5VdZVm8U6D1PdRwdHAXbZ7PkXXWNBh5D8ZCIYuvVL
         IBT58/5HtgPztWc6Sbf+wZmGtq2rYUtPiX38F2l0kiYSzYrBG/x6yPC/oApqzulwayNj
         QbZQ==
X-Gm-Message-State: AOAM533QjrWRE9mvTOHWS7g5sIlbU5l9T4zn0XwLqnmvBIjH4UZ+L18D
        cHTgdCHNeOOKtyvW21GPt98p2A==
X-Google-Smtp-Source: ABdhPJy2pM1sb1dp82VBoREb9XieM3FFWojiWZR5vj1MXdZyzILDiZXH1IyjW0siveAEKiPXPp07Lw==
X-Received: by 2002:a63:e00c:: with SMTP id e12mr6451848pgh.413.1594944983134;
        Thu, 16 Jul 2020 17:16:23 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r7sm6211950pgu.51.2020.07.16.17.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 17:16:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org,
        John Stultz <john.stultz@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 1/5] iommu/arm-smmu: Make all valid stream mappings BYPASS
Date:   Thu, 16 Jul 2020 17:16:15 -0700
Message-Id: <20200717001619.325317-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200717001619.325317-1-bjorn.andersson@linaro.org>
References: <20200717001619.325317-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Turn all stream mappings marked as valid into BYPASS. This allows the
platform specific implementation to configure stream mappings to match
the boot loader's configuration for e.g. display to continue to function
through the reset of the SMMU.

Tested-by: John Stultz <john.stultz@linaro.org>
Tested-by: Vinod Koul <vkoul@kernel.org>
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Mark arm_smmu_setup_identity() static
- Picked up tested-by tags

 drivers/iommu/arm-smmu.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 243bc4cb2705..fb85e716ae9a 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -1924,6 +1924,22 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	return 0;
 }
 
+static int arm_smmu_setup_identity(struct arm_smmu_device *smmu)
+{
+	int i;
+
+	for (i = 0; i < smmu->num_mapping_groups; i++) {
+		if (smmu->smrs[i].valid) {
+			smmu->s2crs[i].type = S2CR_TYPE_BYPASS;
+			smmu->s2crs[i].privcfg = S2CR_PRIVCFG_DEFAULT;
+			smmu->s2crs[i].cbndx = 0xff;
+			smmu->s2crs[i].count++;
+		}
+	}
+
+	return 0;
+}
+
 struct arm_smmu_match_data {
 	enum arm_smmu_arch_version version;
 	enum arm_smmu_implementation model;
@@ -2181,6 +2197,10 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	err = arm_smmu_setup_identity(smmu);
+	if (err)
+		return err;
+
 	if (smmu->version == ARM_SMMU_V2) {
 		if (smmu->num_context_banks > smmu->num_context_irqs) {
 			dev_err(dev,
-- 
2.26.2

