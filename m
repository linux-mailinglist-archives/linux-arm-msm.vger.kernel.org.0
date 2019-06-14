Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7EC44557B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 09:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbfFNHM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Jun 2019 03:12:57 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60754 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfFNHM4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Jun 2019 03:12:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=iTqU4HCutRR3uOJUYQ45ZU7506Sl5CfUv5xpSiuoAIU=; b=s1QW40cdUPPbUO6WyXX5MasT2
        zpUzI0yFs1dQWyfV9pw8s8UglBzqG+hjlADCXiVES4YrjrDEhXQvqU3LokO6gSsZwbjRHmb+6ZyE1
        FuDxJYef6OyM+Hxt2LP7pNdGVoMXpMHIdsuXRR2OX42DSoYiurBP9/ocQAMN4Eta7uIzpXrzg9fmp
        Y6r0Be3/EI5gOKvt4DARL3XPteJl0Va8ohPC+ryF0kMr7AlVaHJTI5rRsCiDRjvakeLyezkJsw8fG
        3bMGg1n2z31C8vbZYnB2aHllCUjOCFyLrkeM3GqhFS7vfUhCcWJNuI/OTr0WLGQyWdFBmmlWt2b+L
        5rQEFqwrg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat Linux))
        id 1hbgOE-0000yO-1z; Fri, 14 Jun 2019 07:12:46 +0000
Date:   Fri, 14 Jun 2019 00:12:46 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Yangtao Li <tiny.windzz@gmail.com>
Cc:     joro@8bytes.org, m.szyprowski@samsung.com, kgene@kernel.org,
        krzk@kernel.org, will.deacon@arm.com, robin.murphy@arm.com,
        agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/10] iommu/exynos: convert to SPDX license tags
Message-ID: <20190614071245.GA2950@infradead.org>
References: <20190613162703.986-1-tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190613162703.986-1-tiny.windzz@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thomas Gleixner is doing automated SPDX conversion that directly
got to Linux at the moment.  I'd avoid doing more manual ones for
now as it will just create conflicts.
