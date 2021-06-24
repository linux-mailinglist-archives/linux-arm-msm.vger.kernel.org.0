Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC443B302D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 15:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231250AbhFXNjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 09:39:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:59246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230257AbhFXNjR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 09:39:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3EA2613EB;
        Thu, 24 Jun 2021 13:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624541817;
        bh=g0zux5mruXr8HgwB0J/Fg2ET0cGWJ+eO/WgbobZer78=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MnmTzlvS04mRBfahmUtH3yzTTGvsVHhdNFYf3l3iseIf39pEAh4JE4jSnyR2UppWJ
         CDpwlF/glmCJ4fKm3UqgkdW9J4VDJN6bDrCrvdl4aUyTlaywsra5opQSPuC8Ozkxpg
         dZ1ObbX9YCUcZNB/d6C7WJAWNrp7h6ETzueX1SH0=
Date:   Thu, 24 Jun 2021 15:36:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     rafael@kernel.org, rafael.j.wysocki@intel.com, will@kernel.org,
        robin.murphy@arm.com, joro@8bytes.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, adrian.hunter@intel.com,
        bhelgaas@google.com, robdclark@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_c_gdjako@quicinc.com, iommu@lists.linux-foundation.org,
        sonnyrao@chromium.org, saiprakash.ranjan@codeaurora.org,
        linux-mmc@vger.kernel.org, vbadigan@codeaurora.org,
        rajatja@google.com, saravanak@google.com, joel@joelfernandes.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] drivers: base: Add bits to struct device to control
 iommu strictness
Message-ID: <YNSKdhMACa9LFuVN@kroah.com>
References: <20210621235248.2521620-1-dianders@chromium.org>
 <20210621165230.2.Icfe7cbb2cc86a38dde0ee5ba240e0580a0ec9596@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621165230.2.Icfe7cbb2cc86a38dde0ee5ba240e0580a0ec9596@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 21, 2021 at 04:52:44PM -0700, Douglas Anderson wrote:
> How to control the "strictness" of an IOMMU is a bit of a mess right
> now. As far as I can tell, right now:
> * You can set the default to "non-strict" and some devices (right now,
>   only PCI devices) can request to run in "strict" mode.
> * You can set the default to "strict" and no devices in the system are
>   allowed to run as "non-strict".
> 
> I believe this needs to be improved a bit. Specifically:
> * We should be able to default to "strict" mode but let devices that
>   claim to be fairly low risk request that they be run in "non-strict"
>   mode.
> * We should allow devices outside of PCIe to request "strict" mode if
>   the system default is "non-strict".
> 
> I believe the correct way to do this is two bits in "struct
> device". One allows a device to force things to "strict" mode and the
> other allows a device to _request_ "non-strict" mode. The asymmetry
> here is on purpose. Generally if anything in the system makes a
> request for strictness of something then we want it strict. Thus
> drivers can only request (but not force) non-strictness.
> 
> It's expected that the strictness fields can be filled in by the bus
> code like in the patch ("PCI: Indicate that we want to force strict
> DMA for untrusted devices") or by using the new pre_probe concept
> introduced in the patch ("drivers: base: Add the concept of
> "pre_probe" to drivers").
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  include/linux/device.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index f1a00040fa53..c1b985e10c47 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -449,6 +449,15 @@ struct dev_links_info {
>   *		and optionall (if the coherent mask is large enough) also
>   *		for dma allocations.  This flag is managed by the dma ops
>   *		instance from ->dma_supported.
> + * @force_strict_iommu: If set to %true then we should force this device to
> + *			iommu.strict regardless of the other defaults in the
> + *			system. Only has an effect if an IOMMU is in place.

Why would you ever NOT want to do this?

> + * @request_non_strict_iommu: If set to %true and there are no other known
> + *			      reasons to make the iommu.strict for this device,
> + *			      then default to non-strict mode. This implies
> + *			      some belief that the DMA master for this device
> + *			      won't abuse the DMA path to compromise the kernel.
> + *			      Only has an effect if an IOMMU is in place.

This feels in contrast to the previous field you just added, how do they
both interact?  Would an enum work better?

thanks,

greg k-h
