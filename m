Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1600C95B58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 11:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729622AbfHTJn2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 05:43:28 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:39348 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728426AbfHTJn2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 05:43:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QuUfcwWC5q1OlMKppxZZFPeRr1Pnwn10MjnRty4Jw/4=; b=DK+6E/3PvKq02RZ+wH3AKe0g2
        emgWtb26QojlY4VAHpRGmh3KlIund4mgdHMWgmc0ZRx6dcJyo3PpG8MDI8KlKQmIpUNKSN9TeJuGl
        km+i5/j2F3SaoJeTXNpwyc1DA3G5i1XAAOhEVYYfTsCs6LrVFePHZhgsVEfjdHWWyzVstKhYQi0L8
        331yfp/XlNTLtQEhPvth1dRekXENsIUVS+WGFJwLetcqcaZ9pRjR0Xm/JRuBmaKm1lM6bJLWAZQf+
        WIC+77g9XgPJKWwaVMZLpEs7+zOk4VI1rE2qynuwmwBQdiLIKKi6tLX+fcqjXUnNNvFOI9OQI6Dt3
        D4XxsCCZw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1i00fk-00016J-2k; Tue, 20 Aug 2019 09:43:24 +0000
Date:   Tue, 20 Aug 2019 02:43:24 -0700
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
Subject: Re: [PATCH V5 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
Message-ID: <20190820094323.GD24154@infradead.org>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
 <20190815110944.3579-5-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815110944.3579-5-murphyt7@tcd.ie>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Looks good, and should probably be queued up asap as a bug fix:

Reviewed-by: Christoph Hellwig <hch@lst.de>
