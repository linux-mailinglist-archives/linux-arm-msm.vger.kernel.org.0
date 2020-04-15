Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1010E1AA0D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 14:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369600AbgDOMbs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 08:31:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:53368 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S369595AbgDOMbp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 08:31:45 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id C7A69AC11;
        Wed, 15 Apr 2020 12:31:41 +0000 (UTC)
Date:   Wed, 15 Apr 2020 14:31:40 +0200
From:   Joerg Roedel <jroedel@suse.de>
To:     Lu Baolu <baolu.lu@linux.intel.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v2 07/33] iommu: Add probe_device() and remove_device()
 call-backs
Message-ID: <20200415123140.GC21899@suse.de>
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200414131542.25608-8-joro@8bytes.org>
 <0ad37581-b464-30ac-c503-4c0daaf43867@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ad37581-b464-30ac-c503-4c0daaf43867@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 15, 2020 at 02:36:20PM +0800, Lu Baolu wrote:
> On 2020/4/14 21:15, Joerg Roedel wrote:
> > From: Joerg Roedel<jroedel@suse.de>
> > 
> > Add call-backs to 'struct iommu_ops' as an alternative to the
> > add_device() and remove_device() call-backs, which will be removed when
> > all drivers are converted.
> > 
> > The new call-backs will not setupt IOMMU groups and domains anymore,
> > so also add a probe_finalize() call-back where the IOMMU driver can do
> > per-device setup work which require the device to be set up with a
> > group and a domain.
> 
> The subject is inaccurate. probe_device() and release_device() are
> added to replace the add and remove pair.

This patch does not replace them yet, it just adds the new call-backs.
The removal of add_device()/remove_device() happens later in the
patch-set when all drivers are converted.

Regards,

	Joerg

