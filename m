Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D8D834A4A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 10:37:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbhCZJhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 05:37:17 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14563 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229893AbhCZJg7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 05:36:59 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6GyR5LQszPn9Z;
        Fri, 26 Mar 2021 17:34:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 17:36:50 +0800
From:   Zhiqi Song <songzhiqi1@huawei.com>
To:     <will@kernel.org>, <joro@8bytes.org>, <robin.murphy@arm.com>,
        <robdclark@gmail.com>
CC:     <iommu@lists.linux-foundation.org>,
        <linux-arm-msm@vger.kernel.org>, <wangzhou1@hisilicon.com>,
        <fanghao11@huawei.com>, <shenyang39@huawei.com>
Subject: [PATCH 3/3] drivers: iommu/arm - coding style fix
Date:   Fri, 26 Mar 2021 17:37:17 +0800
Message-ID: <1616751437-59956-4-git-send-email-songzhiqi1@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
References: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixed following checkpatch error:
- spaces required around '='
- space required before the open parenthesis '('
- "foo * bar" should be "foo *bar"

Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       | 6 +++---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index 8ca7415..53e24f0 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -2479,7 +2479,7 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,
 		}
 		break;
 	case IOMMU_DOMAIN_DMA:
-		switch(attr) {
+		switch (attr) {
 		case DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE:
 			smmu_domain->non_strict = *(int *)data;
 			break;
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index d8c6bfd..1496033 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -1261,7 +1261,7 @@ static phys_addr_t arm_smmu_iova_to_phys_hard(struct iommu_domain *domain,
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	struct io_pgtable_ops *ops= smmu_domain->pgtbl_ops;
+	struct io_pgtable_ops *ops = smmu_domain->pgtbl_ops;
 	struct device *dev = smmu->dev;
 	void __iomem *reg;
 	u32 tmp;
@@ -1486,7 +1486,7 @@ static int arm_smmu_domain_get_attr(struct iommu_domain *domain,
 {
 	struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);

-	switch(domain->type) {
+	switch (domain->type) {
 	case IOMMU_DOMAIN_UNMANAGED:
 		switch (attr) {
 		case DOMAIN_ATTR_NESTING:
@@ -1527,7 +1527,7 @@ static int arm_smmu_domain_set_attr(struct iommu_domain *domain,

 	mutex_lock(&smmu_domain->init_mutex);

-	switch(domain->type) {
+	switch (domain->type) {
 	case IOMMU_DOMAIN_UNMANAGED:
 		switch (attr) {
 		case DOMAIN_ATTR_NESTING:
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 7f280c8..f3985f3 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -81,7 +81,7 @@ static struct qcom_iommu_domain *to_qcom_iommu_domain(struct iommu_domain *dom)

 static const struct iommu_ops qcom_iommu_ops;

-static struct qcom_iommu_dev * to_iommu(struct device *dev)
+static struct qcom_iommu_dev *to_iommu(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);

@@ -91,7 +91,7 @@ static struct qcom_iommu_dev * to_iommu(struct device *dev)
 	return dev_iommu_priv_get(dev);
 }

-static struct qcom_iommu_ctx * to_ctx(struct qcom_iommu_domain *d, unsigned asid)
+static struct qcom_iommu_ctx *to_ctx(struct qcom_iommu_domain *d, unsigned asid)
 {
 	struct qcom_iommu_dev *qcom_iommu = d->iommu;
 	if (!qcom_iommu)
--
2.7.4

