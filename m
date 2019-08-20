Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3D7995B3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 11:41:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbfHTJlv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 05:41:51 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34500 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729333AbfHTJlv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 05:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=tzn5bK3tbNsiWgQGYaxZl6ZSSnLs1CWcQlXNKSbagq0=; b=jtXhyGX6RFLZEXfdyxYVaGpe7i
        I/AIX1W2McUPBTSwD0AEExmIXaKs7T/fIXSvjRG9kjWzst6hw31JyidJKj3OnAqbVy7OoQF/YNdLD
        QA34nygptFZu9wBF719DF7LO08ZjfsRjQyv6gnpDJAkmyvN5MXR+4+1Z/nZ/5gjL3bP8LD6tXWlC5
        PQuG95sOBNDun+y68Cpf9cO5wVDzDh73H1dXlwirbKgiXPhdkErbRar31Yc7Pkg9mF/EgBGp+hSaD
        YbrMNB3jYijcgcG1q0gx5az//hgZ2bDfcUWSSp0lOzKaGK32UhjMRis8aNos8ZhcQbVF/K0oEtw2i
        HEJANvzg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1i00e7-0008Ol-OL; Tue, 20 Aug 2019 09:41:43 +0000
Date:   Tue, 20 Aug 2019 02:41:43 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tom Murphy <murphyt7@tcd.ie>
Cc:     iommu@lists.linux-foundation.org, Heiko Stuebner <heiko@sntech.de>,
        virtualization@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        David Woodhouse <dwmw2@infradead.org>,
        linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH V5 1/5] iommu/amd: Remove unnecessary locking from AMD
 iommu driver
Message-ID: <20190820094143.GA24154@infradead.org>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
 <20190815110944.3579-2-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190815110944.3579-2-murphyt7@tcd.ie>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Aug 15, 2019 at 12:09:39PM +0100, Tom Murphy wrote:
> We can remove the mutex lock from amd_iommu_map and amd_iommu_unmap.
> iommu_map doesn’t lock while mapping and so no two calls should touch
> the same iova range. The AMD driver already handles the page table page
> allocations without locks so we can safely remove the locks.

I've been looking over the code and trying to understand how the
synchronization works.  I gues we the cmpxchg64 in free_clear_pte
is the important point here?  I have to admit I don't fully understand
the concurrency issues here, but neither do I understand what the
mutex you removed might have helped to start with.
