Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A760230610E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 17:31:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343947AbhA0Qae (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 11:30:34 -0500
Received: from foss.arm.com ([217.140.110.172]:53978 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343860AbhA0QaX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Jan 2021 11:30:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D60631B;
        Wed, 27 Jan 2021 08:29:36 -0800 (PST)
Received: from DESKTOP-VLO843J.arm.com (unknown [10.57.47.135])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1F1C3F66E;
        Wed, 27 Jan 2021 08:29:34 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     will@kernel.org
Cc:     joro@8bytes.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sricharan@codeaurora.org,
        architt@codeaurora.org, srinivas.kandagatla@linaro.org,
        bjorn.andersson@linaro.org
Subject: [PATCH 1/2] iommu/msm: Hook up iotlb_sync_map
Date:   Wed, 27 Jan 2021 16:29:28 +0000
Message-Id: <e95223a0abf129230a0bec6743f837075f0a2fcb.1611764372.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The core API can now accommodate invalidate-on-map style behaviour in a
single efficient call, so hook that up instead of having io-pgatble do
it piecemeal.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---

Just a little quick cleanup on top of the Mediatek TLB patches now
queued - CC'ing a bunch of folks from the Git history in the hope that
someone can still test MSM... :)

 drivers/iommu/msm_iommu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 040e85f70861..f0ba6a09b434 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -343,7 +343,6 @@ static int msm_iommu_domain_config(struct msm_priv *priv)
 	spin_lock_init(&priv->pgtlock);
 
 	priv->cfg = (struct io_pgtable_cfg) {
-		.quirks = IO_PGTABLE_QUIRK_TLBI_ON_MAP,
 		.pgsize_bitmap = msm_iommu_ops.pgsize_bitmap,
 		.ias = 32,
 		.oas = 32,
@@ -490,6 +489,14 @@ static int msm_iommu_map(struct iommu_domain *domain, unsigned long iova,
 	return ret;
 }
 
+static void msm_iommu_sync_map(struct iommu_domain *domain, unsigned long iova,
+			       size_t size)
+{
+	struct msm_priv *priv = to_msm_priv(domain);
+
+	__flush_iotlb_range(iova, size, SZ_4K, false, priv);
+}
+
 static size_t msm_iommu_unmap(struct iommu_domain *domain, unsigned long iova,
 			      size_t len, struct iommu_iotlb_gather *gather)
 {
@@ -680,6 +687,7 @@ static struct iommu_ops msm_iommu_ops = {
 	 * kick starting the other master.
 	 */
 	.iotlb_sync = NULL,
+	.iotlb_sync_map = msm_iommu_sync_map,
 	.iova_to_phys = msm_iommu_iova_to_phys,
 	.probe_device = msm_iommu_probe_device,
 	.release_device = msm_iommu_release_device,

base-commit: 0954d61a59e3c014e52b8d938bc12dc5a2e4949c
-- 
2.17.1

