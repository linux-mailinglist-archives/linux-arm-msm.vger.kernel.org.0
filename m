Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5B3E553EA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jun 2022 00:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354812AbiFUWqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jun 2022 18:46:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354277AbiFUWqL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jun 2022 18:46:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0AC6632073
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 15:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655851567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f/+1/Xy/oMl85EwlznQPMBlg4SJKLxQKry9nxTTQZbw=;
        b=Xig8AL7bKmoYrVt3KaOD6ZubfTjvJ95Z/iKKaeu4FmsD6e4BRA0kk5O6toWz43616jEavp
        31pZ6D4Czl9IS0ucpR8VD7XG2jarpF94jm6yftW88mjROVNgZs8jKwdA+dYZhWQRvtMgDz
        MxgTgFzZdt1QuRURiLBcmwfgs0p1puA=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-b60FyJldOqCOzF-8u_-eMQ-1; Tue, 21 Jun 2022 18:46:06 -0400
X-MC-Unique: b60FyJldOqCOzF-8u_-eMQ-1
Received: by mail-il1-f197.google.com with SMTP id u8-20020a056e021a4800b002d3a5419d1bso10009942ilv.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jun 2022 15:46:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:organization:mime-version:content-transfer-encoding;
        bh=f/+1/Xy/oMl85EwlznQPMBlg4SJKLxQKry9nxTTQZbw=;
        b=OK3Js9x3/bEbWt6aO+fQxqmOhvQUeZUdXp+H4wemuUJ5gd/aHMnAbau8ovBdqgYW9I
         fWB/L/tZgbM0icNbbJrNlvshdhbNtoEGoj4M8XiVbFd1up3mi3xUVn4H1Kf0v6Hrg3V4
         Lx27g/uEb5X9aYl/QECqFrig+7bnn8ZZlijP24nFqdmwtOHZrEvFBsyk1Pozn6aTwROf
         GcovvTWLhlqXNiaFEhhuDYuA8KxTgowuuX1xqG6N5fgNelVGO3sETwJRCgE3Wri8kKMA
         VLCIAMfmQ+4t2zRRZF5BpC7k/YDhpca+/Ixsn2Lnr7PwbWJejTlwwLqlJMMe7Z9H8upQ
         Iwyg==
X-Gm-Message-State: AJIora/aL6wPSdoxVPjNGOefwHyfyVIadI9Qii95tVII093569XMxVf+
        rnEqdSjL2lLawg84ba6mSvd9eamRiWR6Vi+cfUY2UIIGudU6LWwFHFDkWI0DHxMXQ4d0oiT8K00
        1pXNWJ2OCMsU82fK8LoEUZf2leg==
X-Received: by 2002:a6b:ba43:0:b0:669:a9b2:48fb with SMTP id k64-20020a6bba43000000b00669a9b248fbmr192944iof.125.1655851566097;
        Tue, 21 Jun 2022 15:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tCBBV2lQEfTtXWwkhfe9gHC1iihjOMaGFwTYEcz2D9BCipjXjT/6swp6lkrYHefJSlpm5AwA==
X-Received: by 2002:a6b:ba43:0:b0:669:a9b2:48fb with SMTP id k64-20020a6bba43000000b00669a9b248fbmr192927iof.125.1655851565803;
        Tue, 21 Jun 2022 15:46:05 -0700 (PDT)
Received: from redhat.com ([38.15.36.239])
        by smtp.gmail.com with ESMTPSA id m3-20020a056638224300b00339c015fd84sm2073679jas.59.2022.06.21.15.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 15:46:05 -0700 (PDT)
Date:   Tue, 21 Jun 2022 16:46:02 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Nicolin Chen <nicolinc@nvidia.com>
Cc:     <joro@8bytes.org>, <will@kernel.org>, <marcan@marcan.st>,
        <sven@svenpeter.dev>, <robin.murphy@arm.com>,
        <robdclark@gmail.com>, <baolu.lu@linux.intel.com>,
        <matthias.bgg@gmail.com>, <orsonzhai@gmail.com>,
        <baolin.wang7@gmail.com>, <zhang.lyra@gmail.com>,
        <jean-philippe@linaro.org>, <jgg@nvidia.com>,
        <kevin.tian@intel.com>, <suravee.suthikulpanit@amd.com>,
        <alyssa@rosenzweig.io>, <dwmw2@infradead.org>,
        <yong.wu@mediatek.com>, <mjrosato@linux.ibm.com>,
        <gerald.schaefer@linux.ibm.com>, <thierry.reding@gmail.com>,
        <vdumpa@nvidia.com>, <jonathanh@nvidia.com>, <cohuck@redhat.com>,
        <thunder.leizhen@huawei.com>, <tglx@linutronix.de>,
        <christophe.jaillet@wanadoo.fr>, <john.garry@huawei.com>,
        <chenxiang66@hisilicon.com>, <saiprakash.ranjan@codeaurora.org>,
        <isaacm@codeaurora.org>, <yangyingliang@huawei.com>,
        <jordan@cosmicpenguin.net>, <iommu@lists.linux-foundation.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-s390@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>,
        <virtualization@lists.linux-foundation.org>, <kvm@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] vfio/iommu_type1: Prefer to reuse domains vs
 match enforced cache coherency
Message-ID: <20220621164602.4079bf43.alex.williamson@redhat.com>
In-Reply-To: <20220616000304.23890-3-nicolinc@nvidia.com>
References: <20220616000304.23890-1-nicolinc@nvidia.com>
        <20220616000304.23890-3-nicolinc@nvidia.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 15 Jun 2022 17:03:01 -0700
Nicolin Chen <nicolinc@nvidia.com> wrote:

> From: Jason Gunthorpe <jgg@nvidia.com>
> 
> The KVM mechanism for controlling wbinvd is based on OR of the coherency
> property of all devices attached to a guest, no matter those devices are
> attached to a single domain or multiple domains.
> 
> So, there is no value in trying to push a device that could do enforced
> cache coherency to a dedicated domain vs re-using an existing domain
> which is non-coherent since KVM won't be able to take advantage of it.
> This just wastes domain memory.
> 
> Simplify this code and eliminate the test. This removes the only logic
> that needed to have a dummy domain attached prior to searching for a
> matching domain and simplifies the next patches.
> 
> It's unclear whether we want to further optimize the Intel driver to
> update the domain coherency after a device is detached from it, at
> least not before KVM can be verified to handle such dynamics in related
> emulation paths (wbinvd, vcpu load, write_cr0, ept, etc.). In reality
> we don't see an usage requiring such optimization as the only device
> which imposes such non-coherency is Intel GPU which even doesn't
> support hotplug/hot remove.

The 2nd paragraph above is quite misleading in this respect.  I think
it would be more accurate to explain that the benefit to using separate
domains was that devices attached to domains supporting enforced cache
coherency always mapped with the attributes necessary to provide that
feature, therefore if a non-enforced domain was dropped, the associated
group removal would re-trigger an evaluation by KVM.  We can then go on
to discuss that in practice the only known cases of such mixed domains
included an Intel IGD device behind an IOMMU lacking snoop control,
where such devices do not support hotplug, therefore this scenario lacks
testing and is not considered sufficiently relevant to support.  Thanks,

Alex

> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/vfio/vfio_iommu_type1.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index c13b9290e357..f4e3b423a453 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -2285,9 +2285,7 @@ static int vfio_iommu_type1_attach_group(void *iommu_data,
>  	 * testing if they're on the same bus_type.
>  	 */
>  	list_for_each_entry(d, &iommu->domain_list, next) {
> -		if (d->domain->ops == domain->domain->ops &&
> -		    d->enforce_cache_coherency ==
> -			    domain->enforce_cache_coherency) {
> +		if (d->domain->ops == domain->domain->ops) {
>  			iommu_detach_group(domain->domain, group->iommu_group);
>  			if (!iommu_attach_group(d->domain,
>  						group->iommu_group)) {

