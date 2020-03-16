Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 956CF186EC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 16:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731550AbgCPPkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 11:40:15 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:45486 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731553AbgCPPkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 11:40:14 -0400
Received: by mail-wr1-f66.google.com with SMTP id t2so11760386wrx.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2020 08:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vJQ7s9x85ia8HxlMYprwaZJGn4L6RP+BR7+jWVKPLTo=;
        b=w84O1QQJwU6wMTGEhyd3tdZmzyokkNQNgtvlgCbk7JrgRg0w2R3EtdUzes5TKo/XyE
         0GN9BzerCd+PBe2gdX+VVWalWV0GvUaZ1Hvpn02xC7Z6cQbZ9zUYoVR8SlrMkeTHa5pO
         ZNV7G4zwVtMQAtwNFVsP7G9rAugODJUvegfg+Joz2/pLSwTVFLeBdLC69Mm9fmsFaT0H
         4lQ985eQTWmn73BDP/WhhWDXVBZBfC45ZHQLQxe35G5uOfpUGYH7dFLUTw7I6qKsVqm6
         VCf79+8VBzgdX46YQ4mkH13lYwMdQrGC6Ai/EhOinV88dF/tVd63mOiTbTus//PTo1AD
         eHZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vJQ7s9x85ia8HxlMYprwaZJGn4L6RP+BR7+jWVKPLTo=;
        b=GWvG5fxU4p1A8Agwoc/ZEjeWGE2Ync5P6LbdQRv4A3M53Cg026MzNmLJYDEZCBzG9L
         hxRswSXtDl1cb3W7A4BNIWR9CQZDpvMQn0oa5vRr5xNMhhc2SjiuNZiPV278+xE8Lchv
         zwDl+DpyqMcJimADBOZSjk2mWaWSD5YHA1VK9D2ofNz40uKhabaMJ9+7abPs5SuLwq6b
         wM7ocnsVti2vy4HVMDrjB2tCOmOCFYcFFiWFB79NbGwBOFPwRVjSvP6YGI6VtuiREw55
         Bp9IgMA0Psy43Z0VaUKcgzvaHLgb00qOCk4EjRkoQO9narDDc74BGJhtvbjVTRm7e8VL
         U9xA==
X-Gm-Message-State: ANhLgQ3P8zhljW8GtTvUNSbsC57uDT0Yfhfj5JwW1bbxtFjXuD9uTftI
        AxPHxroDPyDShB7SucVGLL5mog==
X-Google-Smtp-Source: ADFU+vu5RlEmmjxd74oFX3RvJEdQFPOMmKqi/N4OkXyJVDSx1NxqeLTrLEHwet7QRQD2B1qytUrz8w==
X-Received: by 2002:a5d:4ad1:: with SMTP id y17mr29213545wrs.119.1584373212032;
        Mon, 16 Mar 2020 08:40:12 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
        by smtp.gmail.com with ESMTPSA id u17sm393519wrm.43.2020.03.16.08.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 08:40:11 -0700 (PDT)
Date:   Mon, 16 Mar 2020 16:40:03 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        virtualization@lists.linux-foundation.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <jroedel@suse.de>
Subject: Re: [PATCH 02/15] ACPI/IORT: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200316154003.GC304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-3-joro@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-3-joro@8bytes.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 10, 2020 at 10:12:16AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Tested-by: Hanjun Guo <guohanjun@huawei.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/acpi/arm64/iort.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/acpi/arm64/iort.c b/drivers/acpi/arm64/iort.c
> index ed3d2d1a7ae9..7d04424189df 100644
> --- a/drivers/acpi/arm64/iort.c
> +++ b/drivers/acpi/arm64/iort.c
> @@ -1015,6 +1015,7 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
>  		return ops;
>  
>  	if (dev_is_pci(dev)) {
> +		struct iommu_fwspec *fwspec;
>  		struct pci_bus *bus = to_pci_dev(dev)->bus;
>  		struct iort_pci_alias_info info = { .dev = dev };
>  
> @@ -1027,8 +1028,9 @@ const struct iommu_ops *iort_iommu_configure(struct device *dev)
>  		err = pci_for_each_dma_alias(to_pci_dev(dev),
>  					     iort_pci_iommu_init, &info);
>  
> -		if (!err && iort_pci_rc_supports_ats(node))
> -			dev->iommu_fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
> +		fwspec = dev_iommu_fwspec_get(dev);
> +		if (fwspec && iort_pci_rc_supports_ats(node))
> +			fwspec->flags |= IOMMU_FWSPEC_PCI_RC_ATS;
>  	} else {
>  		int i = 0;
>  
> -- 
> 2.17.1
> 
