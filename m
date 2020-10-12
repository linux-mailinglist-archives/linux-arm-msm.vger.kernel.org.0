Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 225F128AF14
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 09:31:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727395AbgJLHb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Oct 2020 03:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgJLHb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Oct 2020 03:31:57 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32898C0613D0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2020 00:31:56 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l16so15856932eds.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2020 00:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CzDxLaDLFJzWcap/ARMkfpBesRsQ6cFDLsAfzEHhwNg=;
        b=b0UFofGey9MHN4SSKeWJne/jISh0kZ4rKs08Umat1GtUhptcnknv3VsZFMe74YDxK8
         +JFbEMLjSb3QLuIDhnLOtzA8nFoFEAtB07cpzErKshtf7030J2/yyB2L8QDfIJM6IFMG
         wOgjFRhEoC0PoIJ1v5e52Av5WQBBAKNAChPIDSvM3CHvCIEEA1uWvjmJ9cXZJvrc70R2
         DbQR1JXv2jr8nGlgyMO1cZ1JtR6tayglpD8EwubGrKVXQgUgRCvptXMtyhJBm+3VbHFc
         qPo/L0Y73MO+zXoSQ+VKiA4TKFVoReqFKJE9CBqM6095iH22+gT3A2xMNboe/ZQxGfxl
         uF3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CzDxLaDLFJzWcap/ARMkfpBesRsQ6cFDLsAfzEHhwNg=;
        b=SOchri5aLv0xCS1ojcx18K/45kpNlvpspwAH/4Yn24t2qd/cfJtOY7doiAnww3WSbK
         rE8T8Sg9UM+lsOrZEM2Pp8iMpoJksp6QIaQJQLrs3x3+lqKKL+r39qdvtJc+FpYZmG/L
         6a/Au+AKF4pSCGF/Xe08osIAECGgLK4TiiJM9pN7S0g07E1eACNhw1GkCvVvPu2g90eI
         s9xXsNbKUJGWTYuc3qJwcnH/kIZrdYYzjizo0a/0PYwLT0JUfDyTcda8f05rC9izpfP/
         oG1dywa/a06i0XIs9ny70dArTvb7ywtiJsiaZkQITcQgtacfIYbUtgQllJskXvDWJ0Y/
         wBJQ==
X-Gm-Message-State: AOAM5306p6Qcz+thKMH0gR2HciiwAm5cTROKZTKfUY7yYuqIa2GOdDDM
        gGPB6/it7QyNHPb1xfR60U9wlA==
X-Google-Smtp-Source: ABdhPJxaZ45/LGCB6zLJp30ygGXXJGsXRsI9tcD8xqo9itEMOS9n1yfi201ECa1UI9OmrMS8rBHpBg==
X-Received: by 2002:aa7:dcc7:: with SMTP id w7mr12914876edu.80.1602487914471;
        Mon, 12 Oct 2020 00:31:54 -0700 (PDT)
Received: from yoga ([194.182.8.81])
        by smtp.gmail.com with ESMTPSA id n22sm10021525eji.106.2020.10.12.00.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 00:31:53 -0700 (PDT)
Date:   Mon, 12 Oct 2020 09:31:52 +0200
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/8] iommu/arm-smmu: Add impl hook for inherit boot
 mappings
Message-ID: <20201012073152.GA2998@yoga>
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-7-bjorn.andersson@linaro.org>
 <0bfcc8f7-d054-616b-834b-319461b1ecb9@arm.com>
 <20200913032559.GT3715@yoga>
 <20200921210814.GE3811@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921210814.GE3811@willie-the-truck>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 21 Sep 23:08 CEST 2020, Will Deacon wrote:

> On Sat, Sep 12, 2020 at 10:25:59PM -0500, Bjorn Andersson wrote:
> > On Fri 11 Sep 12:13 CDT 2020, Robin Murphy wrote:
> > > On 2020-09-04 16:55, Bjorn Andersson wrote:
> > > > Add a new operation to allow platform implementations to inherit any
> > > > stream mappings from the boot loader.
> > > 
> > > Is there a reason we need an explicit step for this? The aim of the
> > > cfg_probe hook is that the SMMU software state should all be set up by then,
> > > and you can mess about with it however you like before arm_smmu_reset()
> > > actually commits anything to hardware. I would have thought you could
> > > permanently steal a context bank, configure it as your bypass hole, read out
> > > the previous SME configuration and tweak smmu->smrs and smmu->s2crs
> > > appropriately all together "invisibly" at that point.
> > 
> > I did this because as of 6a79a5a3842b ("iommu/arm-smmu: Call
> > configuration impl hook before consuming features") we no longer have
> > setup pgsize_bitmap as we hit cfg_probe, which means that I need to
> > replicate this logic to set up the iommu_domain.
> > 
> > If I avoid setting up an iommu_domain for the identity context, as you
> > request in patch 8, this shouldn't be needed anymore.
> > 
> > > If that can't work, I'm very curious as to what I've overlooked.
> > > 
> > 
> > I believe that will work, I will rework the patches and try it out.
> 
> Did you get a chance to rework this?
> 

Finally got a chance to dig through this properly.

Initial results where positive and with an implementation of cfg_probe
in qcom_smmu_impl I'm able to probe the arm-smmu driver just fine - and
display (e.g. efifb) stays alive.

Unfortunately as the display driver (drivers/gpu/drm/msm) is about to
probe a new iommu domain is created, which due to its match against
qcom_smmu_client_of_match[] becomes of type IOMMU_DOMAIN_IDENTITY.
This results in a S2CR of BYPASS type, which the firmware intercepts and
turns the stream into a type FAULT.

So while the cfg_probe looks very reasonable we're still in need of a
mechanism to use the fake identity context for the iommu domain
associated with the display controller.


The workings of the display driver is that it gets the iommu domain
setup for byass and then after that creates a translation context for
this same stream where it maps the framebuffer.

For testing purposes I made def_domain_type always return 0 in the qcom
impl and the result is that we get a few page faults while probing the
display driver, but these are handled somewhat gracefully and the
initialization did proceed and the system comes up nicely (but in the
case that the display driver would probe defer this leads to an storm of
faults as the screen continues to be refreshed).

TL;DR I think we still need to have a way to get the arm-smmu driver to
allow the qcom implementation to configure identity domains to use
translation - but we can make the setup of the identity context a detail
of the qcom driver.

Regards,
Bjorn
