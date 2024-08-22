Return-Path: <linux-arm-msm+bounces-29238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCE495AD4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 08:15:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 805371C22992
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 06:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 637F377102;
	Thu, 22 Aug 2024 06:15:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD362D611;
	Thu, 22 Aug 2024 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724307346; cv=none; b=Z+upBD0/qPSQhH0EifAJtx4AFUZXB+FkR2bX/kLknG+EYRIlzKG5IDIc5k6mpewiPUXFDSisolXC5ngXKHwQnKSu8pZZf5NBTv98E3j7b7Da0j3kxJnZ62rEDxCK7KxSZStu03T2nj4IinNKEYX01kRdAsSrBYwbo71SCxCupOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724307346; c=relaxed/simple;
	bh=pk9rDW/8PJfyGVDRKhGR52fq86aLGSZWYWmwV6FRoZQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nOubRMHu9CNMUmHo7NRx3SX9m1qLhNTWA7BzXJI8cP6HaWymw1r4C6WokU43dQXwm3R8xD+Xm8jeqFqMyOAK88wJAKSn0EVI54gpBZ9seh18wDqkoTIjRwepDDZvk460URd2OIFqaqGiKilv3TVyVLYBMXmx0JzF5xEuccBQczA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WqCc45ytDzyR3C;
	Thu, 22 Aug 2024 14:15:16 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 5A4D81800D4;
	Thu, 22 Aug 2024 14:15:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemh500013.china.huawei.com
 (7.202.181.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 22 Aug
 2024 14:15:39 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
	<joro@8bytes.org>, <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next] iommu/arm-smmu: Simplify with scoped for each OF child loop
Date: Thu, 22 Aug 2024 14:23:11 +0800
Message-ID: <20240822062311.3489924-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemh500013.china.huawei.com (7.202.181.146)

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index b98a7a598b89..18a4568f0aaa 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -764,14 +764,10 @@ static struct platform_driver qcom_iommu_ctx_driver = {
 
 static bool qcom_iommu_has_secure_context(struct qcom_iommu_dev *qcom_iommu)
 {
-	struct device_node *child;
-
-	for_each_child_of_node(qcom_iommu->dev->of_node, child) {
+	for_each_child_of_node_scoped(qcom_iommu->dev->of_node, child) {
 		if (of_device_is_compatible(child, "qcom,msm-iommu-v1-sec") ||
-		    of_device_is_compatible(child, "qcom,msm-iommu-v2-sec")) {
-			of_node_put(child);
+		    of_device_is_compatible(child, "qcom,msm-iommu-v2-sec"))
 			return true;
-		}
 	}
 
 	return false;
-- 
2.34.1


