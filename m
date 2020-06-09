Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897121F474F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 21:42:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389292AbgFITmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 15:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389287AbgFITkh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 15:40:37 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48FFAC08C5C5
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 12:40:37 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id 205so22060051qkg.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0BqclPegqJok0tr1lg07n1QfpjQ6ftwveg7CVu5MR2U=;
        b=EJ5I7b0p5sm6fG2LVDGmZFIoyUoEMOuv8dVuO+rWpAYZVg5NR9bq0wHB8aFLqtXbzX
         /kFMTgm/V/5WvrVz2M2EsfKNKxHNUIvuVjvZQQQDkpY/UQkKY/ra/6hAunI0v+uMZh6D
         0KyD/4Dhe9OBRkY/jQJgLgoVpLI87OZ0IGfTFEWHdL7PLOyC44ojCz/6e56gNWKMbygt
         P/VR1yGt2c8lH2OKGfLR+JiNAgrHj3fP6Ta+Nf74YWvAjaQr9cjHFme5RcIbHePSjo7u
         pR7FioGemlKZlrSNpD1MePBLmBhnAR+uUWkMJq5msxpz/0yE240PEL6jgGrlNq8pbix5
         eC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0BqclPegqJok0tr1lg07n1QfpjQ6ftwveg7CVu5MR2U=;
        b=Hn7taZkdSMfumdiWPxBxrTXQDaim9JQH4eFT+5ZcIHAnuF+QbqF2FlRRbu+CT9tHbF
         din1erkC3gCmNyG7s1W+ZHSf0I6ku+UXPmNe5Di872cA8yPh9xIXNtyasi9RJ/CCAX80
         Xa9WdOvp+QSxE8OKnzdG9pC7wFIhguTDyeVCkWnhjV5Mk4SzBZxQIQuMzcO0vKgAzVGx
         oGPqmYI2h6hN+t8NUtkY0bBwBbT+jkSs8zUgYpmG1kT30wF99iCmr7MqZUtWbH2ejL74
         hyXGvNWwKuRYaHJo4ftUwltjij4ZHsXW+0m6VSavhKieX7stQyxLYxJXCoei6TP4CtGF
         gTOw==
X-Gm-Message-State: AOAM531Ty7n/BmwVK0LbiGpw0RuBdT/rbCVVyLwlZzh04Oj8eWqPqemd
        8yyJxsa6eGBm6cP5WKoSm3n8d6NjsiKR8Q==
X-Google-Smtp-Source: ABdhPJyz/M9ZpkYSVQxPXiFgNuTI0QUGQCMuSuyLv9c8jT0hNZNxRz1VGjqEgkrwXdXTkx7A3ZM78w==
X-Received: by 2002:a37:6c2:: with SMTP id 185mr28950911qkg.95.1591731635916;
        Tue, 09 Jun 2020 12:40:35 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v8sm10513181qto.21.2020.06.09.12.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 12:40:35 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/8] iommu: arm-smmu-impl: Use qcom impl for sm8150 and sm8250 compatibles
Date:   Tue,  9 Jun 2020 15:40:20 -0400
Message-Id: <20200609194030.17756-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200609194030.17756-1-jonathan@marek.ca>
References: <20200609194030.17756-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the qcom implementation for IOMMU hardware on sm8150 and sm8250 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/iommu/arm-smmu-impl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu-impl.c b/drivers/iommu/arm-smmu-impl.c
index c75b9d957b70..f5f6cab626be 100644
--- a/drivers/iommu/arm-smmu-impl.c
+++ b/drivers/iommu/arm-smmu-impl.c
@@ -172,7 +172,9 @@ struct arm_smmu_device *arm_smmu_impl_init(struct arm_smmu_device *smmu)
 		smmu->impl = &calxeda_impl;
 
 	if (of_device_is_compatible(np, "qcom,sdm845-smmu-500") ||
-	    of_device_is_compatible(np, "qcom,sc7180-smmu-500"))
+	    of_device_is_compatible(np, "qcom,sc7180-smmu-500") ||
+	    of_device_is_compatible(np, "qcom,sm8150-smmu-500") ||
+	    of_device_is_compatible(np, "qcom,sm8250-smmu-500"))
 		return qcom_smmu_impl_init(smmu);
 
 	return smmu;
-- 
2.26.1

