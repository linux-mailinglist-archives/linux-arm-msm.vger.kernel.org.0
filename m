Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCAE2F74DE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 10:04:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727885AbhAOJE1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 04:04:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:34372 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726494AbhAOJE0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 04:04:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 339302339D;
        Fri, 15 Jan 2021 09:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610701425;
        bh=7la6AOF22duM8nJdUP2TkacYvkWl00x0WTDSlkJJ08Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ilM8UPVTtCs0av85SpQYZFCxrPLSFrVCyYJJsEyhSzUncpZAXQkyzYW6Ku8KfCB+b
         zfS0Ky5uGtAsxu6ufVQZILJwqRHc94+QfSejF0URKcVZbVbvWMuwkYXPE1F+IAY0R5
         YfZucUpv2mEJyszNkt9TwNZrIOL3zOcMaP1jz2aJpNX4rP+yXW9Spy+pjhtBa6UqGv
         WUrLRZ7rB6WIKe9eMiET+QTH1V/zlRL1FrpwAuCKfznd4pb7IEEGgnvXtBlelI0Poq
         wxPZY63YZjsRD3tIPYGsUNGC3b0+DQrApSN09tEa8v9aZThBNcVQ7JXLdb6X7VH7oL
         z/les4wrPZugQ==
From:   Vinod Koul <vkoul@kernel.org>
To:     Will Deacon <will@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] iommu: arm-smmu-impl: Add SM8350 qcom iommu implementation
Date:   Fri, 15 Jan 2021 14:33:22 +0530
Message-Id: <20210115090322.2287538-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210115090322.2287538-1-vkoul@kernel.org>
References: <20210115090322.2287538-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add SM8350 qcom iommu implementation to the table of
qcom_smmu_impl_of_match table which brings in iommu support for SM8350
SoC

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 5dff7ffbef11..8044a9bfca66 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -327,6 +327,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sdm845-smmu-500" },
 	{ .compatible = "qcom,sm8150-smmu-500" },
 	{ .compatible = "qcom,sm8250-smmu-500" },
+	{ .compatible = "qcom,sm8350-smmu-500" },
 	{ }
 };
 
-- 
2.26.2

