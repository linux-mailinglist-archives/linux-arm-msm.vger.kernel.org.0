Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7907312AF1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2019 23:18:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727028AbfLZWRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 17:17:49 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:40581 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727008AbfLZWRt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 17:17:49 -0500
Received: by mail-pg1-f196.google.com with SMTP id k25so13487457pgt.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2019 14:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=atr5dH9+58H0L1dBqDewFnWoCVnAfiU1TJyN0b3SOLw=;
        b=PovNYG/8yvcQkau2yxewsi61ZYVYH+xuJSm+1FfpbcX5Lrd0edTC29t1WUNmEMOldi
         qPeG9Jit/2cej0EQ3S5UwiPB/P81sRwx+kA8476XgyLM5vPpDYODNowEb4qZFqL370i1
         nXB/3af9sVFwcCfMTVDORSGSaNQlKr11e+WY4JkXYXKJP5VvY/aqksZoQw0qmCWg2S0s
         vqwUhMkHrVdcPw4NicoDOQLFcfvb9iF8bkTXnGXxMQHpPYnXN+5TlDya2LAmMPM+fAMa
         HvLK4DsOixPh0d9iJ2c1bstBsXyJ6sHGcqpJ+oJBaA1BiyxgKAFa91LP4IwOrSkettTv
         4fJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=atr5dH9+58H0L1dBqDewFnWoCVnAfiU1TJyN0b3SOLw=;
        b=SzMHutcnr705HchQ2ZUJd8RChPWe3H4z5eicqYVa7+xpAXj6mtIsiusweQ3nhDd7QI
         5C4eyxwXkaAatt2d1nlbTLg32+IGATK86z+O3RtDwU6WkII+4wCVGHXp8AA/1Diekpc4
         Mtg/WU6SPctzop1CgnFUtmNQc85sdW2uPa7pWKDMdo1kpqamEU6W4sb1GfALLmbGO0qu
         H1y1bR6xmpDeTh+N1jTmxi7qF/5g2KulDJsuiekR8cT08eC1V+GcIY+Owev5XYuga/b5
         uivzpITeCSGxY7ITjRyNXiOF9QeLdYyDXjmS7KcgmA7yzTH5ltO6yKC3u8F7YtG8EYdS
         gyoQ==
X-Gm-Message-State: APjAAAXILTtk4CxOWiRTbY8IV9wazjXLZNygCwHTEoMNkZQPXgrPiqli
        qIhVJM1LRpjnv2ee5j0M4P0XYw==
X-Google-Smtp-Source: APXvYqxjkphDV74NYDySl7S4Q4EqHt9CrR3SMTKiWnb+uEpFNDfkgplzaC9LAXUDcXRpxSglzDL53A==
X-Received: by 2002:a62:3603:: with SMTP id d3mr49051073pfa.37.1577398667182;
        Thu, 26 Dec 2019 14:17:47 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 2sm11779409pjh.19.2019.12.26.14.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 14:17:46 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Patrick Daly <pdaly@codeaurora.org>,
        Pratik Patel <pratikp@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Subject: [PATCH 2/3] iommu/arm-smmu: Expose s2cr and smr structs to impl
Date:   Thu, 26 Dec 2019 14:17:08 -0800
Message-Id: <20191226221709.3844244-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191226221709.3844244-1-bjorn.andersson@linaro.org>
References: <20191226221709.3844244-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move the arm_smmu_s2cr and arm_smmu_smr structs to the internal header
file, in order to expose them to the platform specific arm-smmu
implementations.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since RFC:
- New patch

 drivers/iommu/arm-smmu.c | 14 --------------
 drivers/iommu/arm-smmu.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 6ca6a4e072c8..9a9091b9dcc7 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -73,24 +73,10 @@ module_param(disable_bypass, bool, S_IRUGO);
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
index 62b9f0cec49b..73f94579b926 100644
--- a/drivers/iommu/arm-smmu.h
+++ b/drivers/iommu/arm-smmu.h
@@ -224,6 +224,20 @@ enum arm_smmu_implementation {
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
+};
+
 struct arm_smmu_device {
 	struct device			*dev;
 
-- 
2.24.0

