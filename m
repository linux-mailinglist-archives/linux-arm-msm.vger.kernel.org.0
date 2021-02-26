Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE4C1326798
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Feb 2021 20:59:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhBZTzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Feb 2021 14:55:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbhBZTzA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Feb 2021 14:55:00 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09787C06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:54:20 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id u20so10880889iot.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Feb 2021 11:54:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cosmicpenguin-net.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=JIP7pj2bII2YYqVDvOr4T8XZtG0IKAlZ5S5uVeQftY8=;
        b=ReNrLHuTcYMc5CV8DYEubwqgUp8OLflDGEY3KtfN43gOeixyXRxztxX99MgxHh0g5d
         64KTNKWWxXh2DgacpC4Wr91I7A5c/DV52KLxiNYe3/k3tSnFScQqUEYqVhFnrqyAJPCv
         OU7V7jy/7u93j2hDr4MzeddvDsi7nOAxg/L86PTHJhXfrSfMy5J+Wj6K1fp0e7IsjMFI
         b9S9V8UPPqDvUV/hcyBozDp+3fFJuK3M6drZly2dsWbnlnimNN39KgKUgcUMs0xLzOhb
         rRqpiSFSTrSfDaJo77cGfE9CpNFM0cy4knvulCrmTuoZeplJi6wi92xK1eRB97L/Vr6b
         duKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=JIP7pj2bII2YYqVDvOr4T8XZtG0IKAlZ5S5uVeQftY8=;
        b=SDb7qJfda70eAO9r5pT7YH5RKVBZeVtTWC7COJUetIxxBc4uEPSQzpOY27VFuoWlRk
         mHr4pbPqJi/MZk1+y/XLpumwydFCGmGgDYfjaCMrdaf0ekR0S+W45do8krKjifnyHAui
         X0lj/QtKHVDLhqlovPdfs+laNbWs6GsSYFwwxRDHV4IMlkF+kZP41Q3/oDiKrVHqCFY9
         gZrv46NhTemODdVT9r0OV4s6nUmfHv8gpkmipz9jLOyz3T2P2hF8nf4GgMedlxC94UW4
         MCOIkN5l388lPKCcC1xso+W/vblNLL9LrzWvYVJJsAc3hL0Uc7IEZm7oCanSEeC5S7Rp
         4uOw==
X-Gm-Message-State: AOAM530QS4H6Ptbi3KmkHvpDQOzidLQDjNgIKQ8nwc8Ny8eetWSrW2D7
        XK0aOgLNsUPExRT1ZDlrcQb2zuN1A4cc6WHf
X-Google-Smtp-Source: ABdhPJxT3JMfcN7o0fe55mwMhIvwoQjsrhAEaDedA6b09+t1iIJRi3Lvanp7xOpZX4iPzsgu8QnT+Q==
X-Received: by 2002:a02:3541:: with SMTP id y1mr4532704jae.66.1614369259483;
        Fri, 26 Feb 2021 11:54:19 -0800 (PST)
Received: from cosmicpenguin.net (c-71-237-100-236.hsd1.co.comcast.net. [71.237.100.236])
        by smtp.gmail.com with ESMTPSA id u14sm5012109ilv.0.2021.02.26.11.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 11:54:19 -0800 (PST)
Date:   Fri, 26 Feb 2021 12:54:16 -0700
From:   Jordan Crouse <jordan@cosmicpenguin.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 2/2] iommu/arm-smmu-qcom: Move the adreno smmu specific
 impl earlier
Message-ID: <20210226195416.7dzyln7v6lke6ssr@cosmicpenguin.net>
Mail-Followup-To: Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <cover.1614332994.git.saiprakash.ranjan@codeaurora.org>
 <c607d71eb0fe507c8b83cc0ea9b393777f22149a.1614332994.git.saiprakash.ranjan@codeaurora.org>
 <YDku5PFQZetP4iG8@builder.lan>
 <20210226184813.t6ohkh3gxeseev2j@cosmicpenguin.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210226184813.t6ohkh3gxeseev2j@cosmicpenguin.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 26, 2021 at 11:48:13AM -0700, Jordan Crouse wrote:
> On Fri, Feb 26, 2021 at 11:24:52AM -0600, Bjorn Andersson wrote:
> > On Fri 26 Feb 03:55 CST 2021, Sai Prakash Ranjan wrote:
> > 
> > > Adreno(GPU) SMMU and APSS(Application Processor SubSystem) SMMU
> > > both implement "arm,mmu-500" in some QTI SoCs and to run through
> > > adreno smmu specific implementation such as enabling split pagetables
> > > support, we need to match the "qcom,adreno-smmu" compatible first
> > > before apss smmu or else we will be running apps smmu implementation
> > > for adreno smmu and the additional features for adreno smmu is never
> > > set. For ex: we have "qcom,sc7280-smmu-500" compatible for both apps
> > > and adreno smmu implementing "arm,mmu-500", so the adreno smmu
> > > implementation is never reached because the current sequence checks
> > > for apps smmu compatible(qcom,sc7280-smmu-500) first and runs that
> > > specific impl and we never reach adreno smmu specific implementation.
> > > 
> > 
> > So you're saying that you have a single SMMU instance that's compatible
> > with both an entry in qcom_smmu_impl_of_match[] and "qcom,adreno-smmu"?
> > 
> > Per your proposed change we will pick the adreno ops _only_ for this
> > component, essentially disabling the non-Adreno quirks selected by the
> > qcom impl. As such keeping the non-adreno compatible in the
> > qcom_smmu_impl_init[] seems to only serve to obfuscate the situation.
> > 
> > Don't we somehow need the combined set of quirks? (At least if we're
> > running this with a standard UEFI based boot flow?)
> 
> We *do* need the combined set of quirks, so there has to be an adreno-smmu
> impelmentation that matches the "generic" implementation with a few extra
> function hooks added on. I'm not sure if there is a clever way to figure out how
> to meld the implementation hooks at runtime but the alternative is to just make
> sure that the adreno-smmu static struct calls the same quirks as its generic
> partner.

To clarify, the gpu-smmu doesn't strictly need the s2cr handoff or the cfg_probe
though it wouldn't hurt to have them since they would be essentially
passthroughs for the GPU. We do need to capture errata like the
sdm845_smmu500_reset which is already part of the upstream adreno
implementation.

I think the main takeaway is that if a new errata or quirk is added
for main mmu500 it needs to be considered for adreno-smmu too.

Jordan

> > > Suggested-by: Akhil P Oommen <akhilpo@codeaurora.org>
> > > Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> > > ---
> > >  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 12 +++++++++---
> > >  1 file changed, 9 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > index bea3ee0dabc2..03f048aebb80 100644
> > > --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> > > @@ -345,11 +345,17 @@ struct arm_smmu_device *qcom_smmu_impl_init(struct arm_smmu_device *smmu)
> > >  {
> > >  	const struct device_node *np = smmu->dev->of_node;
> > >  
> > > -	if (of_match_node(qcom_smmu_impl_of_match, np))
> > > -		return qcom_smmu_create(smmu, &qcom_smmu_impl);
> > > -
> > > +	/*
> > > +	 * Do not change this order of implementation, i.e., first adreno
> > > +	 * smmu impl and then apss smmu since we can have both implementing
> > > +	 * arm,mmu-500 in which case we will miss setting adreno smmu specific
> > > +	 * features if the order is changed.
> > > +	 */
> > >  	if (of_device_is_compatible(np, "qcom,adreno-smmu"))
> > >  		return qcom_smmu_create(smmu, &qcom_adreno_smmu_impl);
> > >  
> > > +	if (of_match_node(qcom_smmu_impl_of_match, np))
> > > +		return qcom_smmu_create(smmu, &qcom_smmu_impl);
> > > +
> > >  	return smmu;
> > >  }
> > > -- 
> > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > > of Code Aurora Forum, hosted by The Linux Foundation
> > > 
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
