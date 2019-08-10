Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6908890B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Aug 2019 09:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725845AbfHJHUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Aug 2019 03:20:07 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:49664 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfHJHUH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Aug 2019 03:20:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wcsoQD/kkeXHlE3wtt7ujhgal0D9X1wjreyfjFvyJnE=; b=rIQjVBRbUalUzEgkNxwyt43Zn
        x4PbTuezgbMXai9FbWUTG955GfhRdZtHMgkm48H9IZG2qHXA/7l1NMmgayFmZPYBmAoaV9EQx+gsM
        ZClXrKMYO5VeGslBdsR01nfiSE/n6l7MMbvWf1vgsIk9BezRvpL+E4ypdUw4cEZj7KxrC//oazGNg
        46s9Kj3k4nyi4FzykAJCqTakzENOSCuyIN1KZEW4OMtenJshrE9HX7rLqy7AF4Y5CNyfUUTniyVt6
        ZkLANDCWLqFQILL4/8oj2J44p/33VkgTremVQfjG52J0CFLFda610kjKoGRGT7vbdJ/hp42uYAtRq
        Mv0xDjzGA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hwLfM-0006iA-Bq; Sat, 10 Aug 2019 07:19:52 +0000
Date:   Sat, 10 Aug 2019 00:19:52 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>
Cc:     Heiko Stuebner <heiko@sntech.de>,
        Will Deacon <will.deacon@arm.com>,
        virtualization@lists.linux-foundation.org,
        David Brown <david.brown@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Kukjin Kim <kgene@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        David Woodhouse <dwmw2@infradead.org>,
        linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v4 0/5] iommu/amd: Convert the AMD iommu driver to the
 dma-iommu api
Message-ID: <20190810071952.GA25550@infradead.org>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
 <20190624061945.GA4912@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624061945.GA4912@infradead.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 23, 2019 at 11:19:45PM -0700, Christoph Hellwig wrote:
> Tom,
> 
> next time please cc Jerg as the AMD IOMMU maintainer.
> 
> Joerg, any chance you could review this?  Toms patches to convert the
> AMD and Intel IOMMU drivers to the dma-iommu code are going to make my
> life in DMA land significantly easier, so I have a vested interest
> in this series moving forward :)

Tom, can you repost the series?  Seems like there hasn't been any
news for a month.
