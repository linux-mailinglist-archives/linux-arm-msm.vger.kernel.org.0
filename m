Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD62415D9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 08:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfEGGkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 02:40:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:44332 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfEGGkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 02:40:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=XYiVJaYipElgO5DnYZ9IrtCvXPhrJsC2Tw1fwQg5GSA=; b=M2nM+YCCYmiZNNCEpsr9d0tYK
        BlAg0kfZ2aS0QA5DIszm27dGTcv88VTH3ZzJDRYu9kQ75lDbMSp3+LisfFLwmzrNs6grL8QaJsO47
        pFii8fgK5x+Pt2gxCY9TeHgRHbiic1pONVMSR+7oDKxlNJarKhYCKWQEtbKh1fTS+XOx+JM7FG7B3
        ggIgXtbupg5yvc0ORzsOrBV23ECv/AdUqbIpBkiV849J+2N9GDEKIuJ+LLLjBmI9T95YzXhbEPMUA
        bVjERUFjbkl0Z91J1BcS9bFD+QGStzRPb+mF9beVASs+FiesV2/vSyTBHhmy35tu0L4hThVRAwXH7
        Q3cz+FZdw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hNtlg-0002k3-HT; Tue, 07 May 2019 06:40:00 +0000
Date:   Mon, 6 May 2019 23:40:00 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Tom Murphy <tmurphy@arista.com>
Cc:     iommu@lists.linux-foundation.org, murphyt7@tcd.ie,
        Joerg Roedel <joro@8bytes.org>,
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
Subject: Re: [PATCH v3 2/4] iommu/dma-iommu: Handle deferred devices
Message-ID: <20190507064000.GB5173@infradead.org>
References: <20190506185207.31069-1-tmurphy@arista.com>
 <20190506185207.31069-3-tmurphy@arista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506185207.31069-3-tmurphy@arista.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 06, 2019 at 07:52:04PM +0100, Tom Murphy wrote:
> +static int handle_deferred_device(struct device *dev)
> +{
> +	struct iommu_domain *domain;
> +	const struct iommu_ops *ops;
> +
> +	if (!is_kdump_kernel())
> +		return 0;
> +
> +	domain = iommu_get_domain_for_dev(dev);

> -	dma_handle =__iommu_dma_map(dev, phys, size,
> +	if (unlikely(handle_deferred_device(dev)))
> +		return DMA_MAPPING_ERROR;
> +
> +	dma_handle = __iommu_dma_map(dev, phys, size,

__iommu_dma_map already looks up the domain, and as far as I can
tell all callers need the handle_deferred_device call.  Should we
just move it to there and pass the domain from the caller?

Also shouldn't the iommu_attach_device call inside
handle_deferred_device also get an unlikely marker?
