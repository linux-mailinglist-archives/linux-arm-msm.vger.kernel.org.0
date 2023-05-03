Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6B6C6F546A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 11:17:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjECJRn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 May 2023 05:17:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjECJRm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 May 2023 05:17:42 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 67893E4F;
        Wed,  3 May 2023 02:17:40 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 006112F4;
        Wed,  3 May 2023 02:18:24 -0700 (PDT)
Received: from [10.57.82.232] (unknown [10.57.82.232])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 539BE3F67D;
        Wed,  3 May 2023 02:17:34 -0700 (PDT)
Message-ID: <1db712d2-9e33-4183-2766-34e32f170507@arm.com>
Date:   Wed, 3 May 2023 10:17:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 02/20] iommu/terga-gart: Replace set_platform_dma_ops()
 with IOMMU_DOMAIN_PLATFORM
To:     Jason Gunthorpe <jgg@nvidia.com>, Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Steven Price <steven.price@arm.com>
References: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
Content-Language: en-GB
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <2-v1-21cc72fcfb22+a7a-iommu_all_defdom_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-8.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-01 19:02, Jason Gunthorpe wrote:
> tegra-gart seems to be kind of wonky since from the start its 'detach_dev'
> op doesn't actually touch hardware. It is supposed to empty the GART of
> all translations loaded into it.

No, detach should never tear down translations - what if other devices 
are still using the domain?

> Call this weirdness PLATFORM which keeps the basic original
> ops->detach_dev() semantic alive without needing much special core code
> support. I'm guessing it really ends up in a BLOCKING configuration, but
> without any forced cleanup it is unsafe.

The GART translation aperture is in physical address space, so the truth 
is that all devices have access to it at the same time as having access 
to the rest of physical address space. Attach/detach here really are 
only bookkeeping for which domain currently owns the aperture.

FWIW I wrote up this patch a while ago, not sure if it needs rebasing 
again...

Thanks,
Robin.

----->8-----
Subject: [PATCH] iommu/tegra-gart: Add default identity domain support

The nature of a GART means that supporting identity domains is as easy
as doing nothing, so bring the Tegra driver into the modern world of
default domains with a trivial implementation. Identity domains are
allowed to exist alongside any explicit domain for the translation
aperture, since they both simply represent regions of the physical
address space with no isolation from each other. As such we'll continue
to do the "wrong" thing with groups to allow that to work, since the
notion of isolation that groups represent is counterproductive to the
GART's established usage model.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
  drivers/iommu/tegra-gart.c | 39 +++++++++++++++++++-------------------
  1 file changed, 19 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
index c4136eec1f97..07aa7ea6a306 100644
--- a/drivers/iommu/tegra-gart.c
+++ b/drivers/iommu/tegra-gart.c
@@ -111,7 +111,13 @@ static int gart_iommu_attach_dev(struct 
iommu_domain *domain,

  	spin_lock(&gart->dom_lock);

-	if (gart->active_domain && gart->active_domain != domain) {
+	if (domain->type == IOMMU_DOMAIN_IDENTITY) {
+		if (dev_iommu_priv_get(dev)) {
+			dev_iommu_priv_set(dev, NULL);
+			if (--gart->active_devices == 0)
+				gart->active_domain = NULL;
+		}
+	} else if (gart->active_domain && gart->active_domain != domain) {
  		ret = -EINVAL;
  	} else if (dev_iommu_priv_get(dev) != domain) {
  		dev_iommu_priv_set(dev, domain);
@@ -124,28 +130,15 @@ static int gart_iommu_attach_dev(struct 
iommu_domain *domain,
  	return ret;
  }

-static void gart_iommu_set_platform_dma(struct device *dev)
-{
-	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
-	struct gart_device *gart = gart_handle;
-
-	spin_lock(&gart->dom_lock);
-
-	if (dev_iommu_priv_get(dev) == domain) {
-		dev_iommu_priv_set(dev, NULL);
-
-		if (--gart->active_devices == 0)
-			gart->active_domain = NULL;
-	}
-
-	spin_unlock(&gart->dom_lock);
-}
-
  static struct iommu_domain *gart_iommu_domain_alloc(struct device *dev,
  						    unsigned type)
  {
+	static struct iommu_domain identity;
  	struct iommu_domain *domain;

+	if (type == IOMMU_DOMAIN_IDENTITY)
+		return &identity;
+
  	if (type != IOMMU_DOMAIN_UNMANAGED)
  		return NULL;

@@ -162,7 +155,8 @@ static struct iommu_domain 
*gart_iommu_domain_alloc(struct device *dev,
  static void gart_iommu_domain_free(struct iommu_domain *domain)
  {
  	WARN_ON(gart_handle->active_domain == domain);
-	kfree(domain);
+	if (domain->type != IOMMU_DOMAIN_IDENTITY)
+		kfree(domain);
  }

  static inline int __gart_iommu_map(struct gart_device *gart, unsigned 
long iova,
@@ -247,6 +241,11 @@ static struct iommu_device 
*gart_iommu_probe_device(struct device *dev)
  	return &gart_handle->iommu;
  }

+static int gart_iommu_def_domain_type(struct device *dev)
+{
+	return IOMMU_DOMAIN_IDENTITY;
+}
+
  static int gart_iommu_of_xlate(struct device *dev,
  			       struct of_phandle_args *args)
  {
@@ -271,9 +270,9 @@ static const struct iommu_ops gart_iommu_ops = {
  	.domain_alloc	= gart_iommu_domain_alloc,
  	.probe_device	= gart_iommu_probe_device,
  	.device_group	= generic_device_group,
-	.set_platform_dma_ops = gart_iommu_set_platform_dma,
  	.pgsize_bitmap	= GART_IOMMU_PGSIZES,
  	.of_xlate	= gart_iommu_of_xlate,
+	.def_domain_type = gart_iommu_def_domain_type,
  	.default_domain_ops = &(const struct iommu_domain_ops) {
  		.attach_dev	= gart_iommu_attach_dev,
  		.map		= gart_iommu_map,
-- 
2.39.2.101.g768bb238c484.dirty

