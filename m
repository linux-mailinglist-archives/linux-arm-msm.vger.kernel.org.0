Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B84ACF5A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2019 11:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729375AbfJHJIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 05:08:16 -0400
Received: from 8bytes.org ([81.169.241.247]:46464 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729799AbfJHJIP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 05:08:15 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 51E203D0; Tue,  8 Oct 2019 11:08:13 +0200 (CEST)
Date:   Tue, 8 Oct 2019 11:08:13 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Tom Murphy <murphyt7@tcd.ie>
Cc:     iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v6 0/5] iommu/amd: Convert the AMD iommu driver to the
 dma-iommu api
Message-ID: <20191008090813.GB2514@8bytes.org>
References: <20190908165642.22253-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190908165642.22253-1-murphyt7@tcd.ie>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Sep 08, 2019 at 09:56:36AM -0700, Tom Murphy wrote:
> Convert the AMD iommu driver to the dma-iommu api. Remove the iova
> handling and reserve region code from the AMD iommu driver.

Applied, thanks. Note that it will not show up in linux-next before
-rc3.
