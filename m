Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0C7132E07
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2019 12:52:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727565AbfFCKwB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jun 2019 06:52:01 -0400
Received: from 8bytes.org ([81.169.241.247]:41064 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727255AbfFCKwB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jun 2019 06:52:01 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id C6EF836B; Mon,  3 Jun 2019 12:51:59 +0200 (CEST)
Date:   Mon, 3 Jun 2019 12:51:58 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Tom Murphy <tmurphy@arista.com>
Cc:     iommu@lists.linux-foundation.org, murphyt7@tcd.ie,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/4] iommu/amd: Convert the AMD iommu driver to the
 dma-iommu api
Message-ID: <20190603105158.GL12745@8bytes.org>
References: <20190506185207.31069-1-tmurphy@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506185207.31069-1-tmurphy@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Tom,

On Mon, May 06, 2019 at 07:52:02PM +0100, Tom Murphy wrote:
> Convert the AMD iommu driver to the dma-iommu api. Remove the iova
> handling and reserve region code from the AMD iommu driver.

Thank you for your work on this! I appreciate that much, but I am not
sure we are ready to make that move for the AMD and Intel IOMMU drivers
yet.

My main concern right now is that these changes will add a per-page
table lock into the fast-path for dma-mapping operations. There has been
much work in the past to remove all locking from these code-paths and
make it scalable on x86.

The dma-ops implementations in the x86 IOMMU drivers have the benefit
that they can call their page-table manipulation functions directly and
without locks, because they can make the necessary assumptions. The
IOMMU-API mapping/unmapping path can't make these assumptions because it
is also used for non-DMA-API use-cases.

So before we can move the AMD and Intel drivers to the generic DMA-API
implementation we need to solve this problem to not introduce new
scalability regressions.

Regards,

	Joerg

