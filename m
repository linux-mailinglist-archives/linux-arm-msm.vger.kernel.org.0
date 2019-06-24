Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0D01950214
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 08:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726721AbfFXGT6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 02:19:58 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38664 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbfFXGT5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 02:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=HJFnO/8iFK6/8h+P54G3yCQG359ggQHSy2fGcxIE6tg=; b=dpTYhomxoOK7Fn9FZAWy/F2d7
        OB7DbwOE/C/akpzeuzlFpIzjTzgoisvDVOi16ZOChuge0F6rRBKzi/zyrVCPfV41l37CddrCDy9wj
        PkqmyYHP3GYQM23anQWNnajftFlRUdipaP1YC40vmEHUC9Xv2wt5GzuZEx40uTy0BMPSEfE4SLZFr
        1GN8Gsm6hYT++2wtH7J0rAf26csTNJaeQwzpPzSohD0iNWgp9gSggAiNUCv8SKdG8HI94/bi3Wrnh
        LvnWeGzcHl93S3WJCQWQi4N0S74dvgznU+OwCpBcRWi+2ZzrGpfA+z42pLHGuyd8wUxyrpgpbOC+0
        xR9laD4Pg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hfIKP-0001PA-JV; Mon, 24 Jun 2019 06:19:45 +0000
Date:   Sun, 23 Jun 2019 23:19:45 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org, Heiko Stuebner <heiko@sntech.de>,
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
Message-ID: <20190624061945.GA4912@infradead.org>
References: <20190613223901.9523-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613223901.9523-1-murphyt7@tcd.ie>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Tom,

next time please cc Jerg as the AMD IOMMU maintainer.

Joerg, any chance you could review this?  Toms patches to convert the
AMD and Intel IOMMU drivers to the dma-iommu code are going to make my
life in DMA land significantly easier, so I have a vested interest
in this series moving forward :)
