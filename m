Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 609348B984
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2019 15:07:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728935AbfHMNHX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Aug 2019 09:07:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60956 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfHMNHX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Aug 2019 09:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=TsShzSbt4bhSjgobAYTU3+tEcGq+xbDvcHgE2PR7JFE=; b=KmK5lYfXHKPZIOmbtg/9TeMAU
        jR94qd1Da/h0kWRTW7hGeEUlH1c4KOrfkC2dSXptMHhtZWircaTyetQorlqnfzWKzV9C6Cg+ft2Fo
        OQuLSVQp9GHA79JrrHXsck2yRrzH6LkOOjR8Kqik8b5ubb2W0h6Ae2NNfAV8YqCNajfiomtWGipvp
        WxW7vXm0ChbaigStFbDzEJAT/TzVxS9UKwU6vPkS/4Frrx+8+Me3QvNyyf7JX6x2ZvnHvebD7Xr4G
        bR/wTN8GvtoDBRStGqvkfPy3jZX2zb50jyZE+l6CnSEppunxtiEfoeuzHRhptk7SE1ztKeERzvXXz
        dwfHkwDNQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hxWW7-0002GY-Ir; Tue, 13 Aug 2019 13:07:11 +0000
Date:   Tue, 13 Aug 2019 06:07:11 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tom Murphy <murphyt7@tcd.ie>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Joerg Roedel <joro@8bytes.org>,
        Heiko Stuebner <heiko@sntech.de>,
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
Message-ID: <20190813130711.GA30468@infradead.org>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
 <20190624061945.GA4912@infradead.org>
 <20190810071952.GA25550@infradead.org>
 <CALQxJuvxBc3MH3_B_fZ3FvURHOM3F3dvvZ6x=GtALUAvyu7Qxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALQxJuvxBc3MH3_B_fZ3FvURHOM3F3dvvZ6x=GtALUAvyu7Qxw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 13, 2019 at 08:09:26PM +0800, Tom Murphy wrote:
> Hi Christoph,
> 
> I quit my job and am having a great time traveling South East Asia.

Enjoy!  I just returned from my vacation.

> I definitely don't want this work to go to waste and I hope to repost it
> later this week but I can't guarantee it.
> 
> Let me know if you need this urgently.

It isn't in any strict sense urgent.  I just have various DMA API plans
that I'd rather just implement in dma-direct and dma-iommu rather than
also in two additional commonly used iommu drivers.  So on the one had
the sooner the better, on the other hand no real urgency.
