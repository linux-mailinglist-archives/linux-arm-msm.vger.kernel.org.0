Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50FCBA9A76
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2019 08:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730778AbfIEGSa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Sep 2019 02:18:30 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33172 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbfIEGS3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Sep 2019 02:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=fTcSpA3ZHXId80EpTLogSujsoZ0WrK6Tdlrkg5U4n3U=; b=CoryMkzNMX3aDlJ+m7fw27+Y5
        k6b2VLOXAy5PZZ2GtUk7b2Gg7Z+a62WBshvp2BBEqZkvIfsJQUOhgXRJTP2cSkkiV6UMawUgMAnnM
        BPLyvE/okmSa6W3JyrHnd206HGUFLFCYGyDbkef1/pqS6w6FaTPpzQPIgX7h+a7yf6MIqFQviJlbh
        O9sVQPNQ3kcpV6SSsFzZkzpahtly3RGBfCYsEwP3r7TlEl9q4+GYVY/KG/YPUjMI8iHQ3Ml2GypGJ
        JtO9RtgEejTvKcuVSYanopJTNDvcYwgteHDAFFzgUHLNtasHSA48ajt+6LHbTDqmS8+IseRBdsc3B
        jdCV6Qw4Q==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1i5l67-0000MK-7v; Thu, 05 Sep 2019 06:18:23 +0000
Date:   Wed, 4 Sep 2019 23:18:23 -0700
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
Subject: Re: [PATCH V5 0/5] iommu/amd: Convert the AMD iommu driver to the
 dma-iommu api
Message-ID: <20190905061823.GA813@infradead.org>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815110944.3579-1-murphyt7@tcd.ie>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Dave, Joerg, Robin:

is there any chance we could at least pick up patches 2 and 4 ASAP
as they are clearly fixes for current deficits, even without the
amd conversion?
