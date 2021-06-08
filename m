Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1E0039F9B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 16:56:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbhFHO6K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 10:58:10 -0400
Received: from mail-pg1-f177.google.com ([209.85.215.177]:44810 "EHLO
        mail-pg1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232833AbhFHO6K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 10:58:10 -0400
Received: by mail-pg1-f177.google.com with SMTP id y11so8565886pgp.11;
        Tue, 08 Jun 2021 07:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BXIJhrJtCnUwRr3BS6zPrJx1Jt47CrNizQ5dotc5JuM=;
        b=r9YQx1mjItYpJg8dKYY7v+z8vtEZRnEaBoGEki83EOyzIKmBac8w1hvvpwk4MhwWh1
         mBrEmQV6jbXnHYAW85BnGXYKSq1KMOYZsBdRzlr9fGLdwg5BCy2jqB56q5IvJaOvHJMy
         4tH04qu4LNbldjD4k6i0AL1GQ19OIBYG3QOkyY4eAL7AEQNqogQebUxqI66dDmLLIpq2
         VIMJxLhWIfwwP+zfFpXtjMGYFJnCKoa9PL+iBiW/nw4uzdWS2KSCzpFK4kWiuo657rFn
         tYxnyHQfK8pnT4Bp9BMJu3UXy6KIQtkVx4DZN+ueAwql2VR9ULeoYehQtkHTF34MsDFN
         MBQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BXIJhrJtCnUwRr3BS6zPrJx1Jt47CrNizQ5dotc5JuM=;
        b=NYGRkFP64DihVH7nONo0LV+DRZDXQrxgjyrkbaFgf03ldGz9EDVSl97dWO22IA6JyO
         oXKgRMZWDW+XA5HuiUsbNq5uHF8u8BcFv4Q+r9TsuXTFUQh5h0HodqsmTXr6jWBH32SK
         E6UhIB9x4mkQmVMq6OTcAh9q7pVuBFFwTfQyOqSob6kohUA1cA16KD2H1CqzzzYGP3cB
         RgWqE/4lBaR958Br9wor1TkhdDrvVBzTzSDFBy8wXEP7u/jiERT0O+2Z+mQJfvxeQBrx
         e2l7sAq8PbNC02gOX3jz1tlHemKuUs/qlVNpJhcTwo7BwysqJgKGPCg7eoufeM8GhUbf
         AhiQ==
X-Gm-Message-State: AOAM531HT5o3wYFR0WDTPR2edVqY7QtQd0fensqSj+wIvabOISpstGgO
        BMjfrB7BDfurZEzvD4bjlps=
X-Google-Smtp-Source: ABdhPJyKxi1AwxQYdbPLhPt/9PtnIXI+zxCtPTWSSFFYrmDMjiZTlo6M3Xy70SGobC4sSTE6fy/pYQ==
X-Received: by 2002:aa7:8194:0:b029:2aa:db3a:4c1d with SMTP id g20-20020aa781940000b02902aadb3a4c1dmr308216pfi.58.1623164103922;
        Tue, 08 Jun 2021 07:55:03 -0700 (PDT)
Received: from localhost ([103.200.106.115])
        by smtp.gmail.com with ESMTPSA id gg22sm2569437pjb.17.2021.06.08.07.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 07:55:03 -0700 (PDT)
Date:   Tue, 8 Jun 2021 20:25:00 +0530
From:   Amey Narkhede <ameynarkhede03@gmail.com>
To:     Will Deacon <will@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/qcom: Cleanup resources in case of probe error path
Message-ID: <20210608145500.wxtes4wpp4rpw7si@archlinux>
References: <20210421221030.70647-1-ameynarkhede03@gmail.com>
 <20210608092958.GA8935@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210608092958.GA8935@willie-the-truck>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/06/08 10:29AM, Will Deacon wrote:
> On Thu, Apr 22, 2021 at 03:40:30AM +0530, Amey Narkhede wrote:
> > If device registration fails, remove sysfs attribute
> > and if setting bus callbacks fails, unregister the device
> > and cleanup the sysfs attribute.
> >
> > Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
> > ---
> >  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> > index 4294abe389b2..5fa128a1f7f0 100644
> > --- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> > +++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
> > @@ -850,10 +850,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
> >  	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to register iommu\n");
> > -		return ret;
> > +		goto err_sysfs_remove;
> >  	}
> >
> > -	bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
> > +	ret = bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
> > +	if (ret)
> > +		goto err_unregister_device;
> >
> >  	if (qcom_iommu->local_base) {
> >  		pm_runtime_get_sync(dev);
> > @@ -862,6 +864,14 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
> >  	}
> >
> >  	return 0;
> > +
> > +err_unregister_device:
> > +	iommu_device_unregister(&qcom_iommu->iommu);
> > +
> > +err_sysfs_remove:
> > +	iommu_device_sysfs_remove(&qcom_iommu->iommu);
> > +
> > +	return ret;
>
> It looks like we're also missing this logic in arm-smmu/arm-smmu.c and
> arm-smmu-v3/arm-smmu-v3.c. Would you be able to fix those up too, please?
>
> Will

Sure, I will send a v2 with this and new patches.

Thanks,
Amey
