Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52802197A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 07:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgGIFBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 01:01:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgGIFBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 01:01:45 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF60C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 22:01:45 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id f16so563238pjt.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 22:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hqoe1VtzzAa4w0lrTNILxm5TZOFtQ6ZqFKD8K8ft5H8=;
        b=oi9P502fvIr5PyRQt5SQntHS3N3rx17AUMRRDrMtGMGII+nqCiGfEZ2jmn+Oitn9pt
         wlCSE90hhoVr6uoZKD+LbMQ5/Y9+xcLTPqnch8CseRIy2aPJnDwDAeis1HABlWtDOBy7
         oKrHCpxZYZ9hLcBNAeQVP+cwUqCU2ANOYryvP9QJm+yNkv9tQahz++BfsI6BXQI+jDxj
         xTnQFcZxteOYJ5U7JqW918NzOFQnWnQDEbicTDOR+IZkCAeVuIuonOeNa+Cy/Fu/mvWd
         YPdVIRstiJ4F39m1b+ee9XpFEzYr38DuHaRZUFKsUNdfwzRteCm8CiBS+tK7rDMK18Kv
         5ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hqoe1VtzzAa4w0lrTNILxm5TZOFtQ6ZqFKD8K8ft5H8=;
        b=XknLRWTb7DYLNzrRJf5Zp004Uq7gmuttVraacEDdiiwVMQNYvoZR94ajBa/Ln0F6O3
         KHwqabeFQkuMpXuk7gkdJdgm26QUAieInFuNhnoG+A+VE4a2gH8ahCiIpR5BvceiUui6
         9E71hFggoNEJQl7q3rMshkth/sGkSNtkiVNGvZLFhWiQc3CEWBadeOi/5eJwFpnHMgd2
         CRo7llKM49TxIzyt4qLNRqink5EHkPqjiS3nDB7PjMpiF6nm6Mz3dPNzsJULPSUCc5Rn
         sE2iBcp3tqKKIyahPYZTgk1JRM/TVdhscESauTOHyTf5f7o+gdyRtM1JuwGkoYqWsGq0
         5qow==
X-Gm-Message-State: AOAM531Hq6j0YGAxzQOEWS6g6W7aDKCEDp71ceB5aHbIVCElUn9Y6ZYC
        BfaPUlJlyAy8Bxke7I0Id2xoZQ==
X-Google-Smtp-Source: ABdhPJzCupbQIwvneQUBGafAC/eeTzQOM0srORgcQQb7VuqHhdTklwpUGbFFDu+jPwitKVvAVy/5VQ==
X-Received: by 2002:a17:90b:1a86:: with SMTP id ng6mr13156196pjb.88.1594270904651;
        Wed, 08 Jul 2020 22:01:44 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h15sm999974pjc.14.2020.07.08.22.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 22:01:43 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurentiu Tudor <laurentiu.tudor@nxp.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jonathan Marek <jonathan@marek.ca>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/5] iommu/arm-smmu: Move SMR and S2CR definitions to header file
Date:   Wed,  8 Jul 2020 22:01:43 -0700
Message-Id: <20200709050145.3520931-4-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
References: <20200709050145.3520931-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Expose the SMR and S2CR structs in the header file, to allow platform
specific implementations to populate/initialize the smrs and s2cr
arrays.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/arm-smmu.c | 14 --------------
 drivers/iommu/arm-smmu.h | 15 +++++++++++++++
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index f33eda3117fa..e2d6c0aaf1ea 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -68,24 +68,10 @@ module_param(disable_bypass, bool, S_IRUGO);
 MODULE_PARM_DESC(disable_bypass,
 	"Disable bypass streams such that incoming transactions from devices that are not attached to an iommu domain will report an abort back to the device and will not be allowed to pass through the SMMU.");
 
-struct arm_smmu_s2cr {
-	struct iommu_group		*group;
-	int				count;
-	enum arm_smmu_s2cr_type		type;
-	enum arm_smmu_s2cr_privcfg	privcfg;
-	u8				cbndx;
-};
-
 #define s2cr_init_val (struct arm_smmu_s2cr){				\
 	.type = disable_bypass ? S2CR_TYPE_FAULT : S2CR_TYPE_BYPASS,	\
 }
 
-struct arm_smmu_smr {
-	u16				mask;
-	u16				id;
-	bool				valid;
-};
-
 struct arm_smmu_cb {
 	u64				ttbr[2];
 	u32				tcr[2];
diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
index a71d193073e4..bcd160d01c53 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -251,6 +251,21 @@ enum arm_smmu_implementation {
 	QCOM_SMMUV2,
 };
 
+struct arm_smmu_s2cr {
+	struct iommu_group		*group;
+	int				count;
+	enum arm_smmu_s2cr_type		type;
+	enum arm_smmu_s2cr_privcfg	privcfg;
+	u8				cbndx;
+};
+
+struct arm_smmu_smr {
+	u16				mask;
+	u16				id;
+	bool				valid;
+	bool				pinned;
+};
+
 struct arm_smmu_device {
 	struct device			*dev;
 
-- 
2.26.2

