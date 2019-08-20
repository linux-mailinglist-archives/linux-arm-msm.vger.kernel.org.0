Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F72D95B55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2019 11:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729472AbfHTJnM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Aug 2019 05:43:12 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:38290 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728426AbfHTJnM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Aug 2019 05:43:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=y2Vb0u6L2l2xDaGwl0aejcSlSBrEqa0UZ6vr4R/xzlI=; b=Yt8sjaUioP/HtdaEWw2n7MK0j
        N4q3jf9voqnwsZBDLpp2aPRnKCVpMpZxcSNv4uzIDmrhH2Cbs52h4iywKrvypMnrqNrkmUAhbeBiL
        60Ule9btpmnpIibEDuLlhXwLczHvvOX03Lxz7oApCRCbvbrvywb2o/9r49yfW4CKkVwFaXxiPi8tg
        xa2SLnm4C71hgfjQE3Kkwa0ZXk+SpxM5qxTSdw75BZV27ULNxRhby1r627ggDwGCfQ4IaxEeZ9+kf
        7eFZxevU++HMVB3IvCPCAS1Z960gyAuhk6eDPWjNmENoCOGbAzNtAfE3S+wUoyGbxiraMXJmPMZ70
        D9FJh1/AQ==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1i00fS-0000ug-OG; Tue, 20 Aug 2019 09:43:06 +0000
Date:   Tue, 20 Aug 2019 02:43:06 -0700
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
Subject: Re: [PATCH V5 3/5] iommu/dma-iommu: Handle deferred devices
Message-ID: <20190820094306.GC24154@infradead.org>
References: <20190815110944.3579-1-murphyt7@tcd.ie>
 <20190815110944.3579-4-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815110944.3579-4-murphyt7@tcd.ie>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> +static int handle_deferred_device(struct device *dev,
> +	struct iommu_domain *domain)

Nitick: we usually use double tab indents (or indents to after
the opening brace) for multi-line prototyped.

> +	if (!is_kdump_kernel())
> +		return 0;
> +
> +	if (unlikely(ops->is_attach_deferred &&
> +		ops->is_attach_deferred(domain, dev)))
> +		return iommu_attach_device(domain, dev);

And for multi-line conditionals we also use two-tab indents.
