Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 434595BB59
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 14:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbfGAMTR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Jul 2019 08:19:17 -0400
Received: from 8bytes.org ([81.169.241.247]:33632 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727243AbfGAMTR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Jul 2019 08:19:17 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id B9E84229; Mon,  1 Jul 2019 14:19:15 +0200 (CEST)
Date:   Mon, 1 Jul 2019 14:19:14 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Tom Murphy <murphyt7@tcd.ie>, iommu@lists.linux-foundation.org,
        Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        virtualization@lists.linux-foundation.org,
        David Brown <david.brown@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Robin Murphy <robin.murphy@arm.com>,
        linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v4 0/5] iommu/amd: Convert the AMD iommu driver to the
 dma-iommu api
Message-ID: <20190701121914.GD8166@8bytes.org>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
 <20190624061945.GA4912@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624061945.GA4912@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,
	
On Sun, Jun 23, 2019 at 11:19:45PM -0700, Christoph Hellwig wrote:
> Joerg, any chance you could review this?  Toms patches to convert the
> AMD and Intel IOMMU drivers to the dma-iommu code are going to make my
> life in DMA land significantly easier, so I have a vested interest
> in this series moving forward :)

I really appreciate Toms work on this. Tom, please rebase and resubmit
this series after the next merge window and I will do more performance
testing on it. If all goes well I and no other issues show up I can
apply it for v5.4.

Regards,

	Joerg

