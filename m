Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 100001EBE0E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 16:23:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgFBOXR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 10:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725958AbgFBOXQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 10:23:16 -0400
Received: from theia.8bytes.org (8bytes.org [IPv6:2a01:238:4383:600:38bc:a715:4b6d:a889])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D30DC08C5C0;
        Tue,  2 Jun 2020 07:23:16 -0700 (PDT)
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 6498A2A6; Tue,  2 Jun 2020 16:23:14 +0200 (CEST)
Date:   Tue, 2 Jun 2020 16:23:12 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Lu Baolu <baolu.lu@linux.intel.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Message-ID: <20200602142312.GJ14598@8bytes.org>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200529221623.qc6twmpzryh7nkvb@cantor>
 <20200601104240.7f5xhz7gooqhaq4n@cantor>
 <47711845-98ee-95b8-aa95-423a36ed9741@linux.intel.com>
 <20200602000236.j4m3jvluzdhjngdc@cantor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200602000236.j4m3jvluzdhjngdc@cantor>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jerry,

On Mon, Jun 01, 2020 at 05:02:36PM -0700, Jerry Snitselaar wrote:
> 
> Yeah, that will solve the panic.
>

If you still see the kdump faults, can you please try with the attached
diff? I was not able to reproduce them in my setup.

Regards,

	Joerg

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index b5ea203f6c68..5a6d509f72b6 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1680,8 +1680,12 @@ static void probe_alloc_default_domain(struct bus_type *bus,
 static int iommu_group_do_dma_attach(struct device *dev, void *data)
 {
 	struct iommu_domain *domain = data;
+	int ret = 0;
 
-	return __iommu_attach_device(domain, dev);
+	if (!iommu_is_attach_deferred(group->domain, dev))
+		ret = __iommu_attach_device(group->domain, dev);
+
+	return ret;
 }
 
 static int __iommu_group_dma_attach(struct iommu_group *group)
