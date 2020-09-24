Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B8FF2775EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Sep 2020 17:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728395AbgIXPzL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Sep 2020 11:55:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728574AbgIXPzL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Sep 2020 11:55:11 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E3F5C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2020 08:55:11 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id o8so3628000otl.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2020 08:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BFQYGakvszSZQYEiK77qmVljG0V+wrRK/T3GO3bZxA4=;
        b=VuYM/Sxtj92l9I7qft+wT7jbFfT5vZNLK8wgvLXr8W0wjputBXVcePPAvaI+sKwdv2
         bH4N0JJWo33SnqLzRC1fZbF0hRkFxmfqgEc4IHi1hVHB3Fy5EsfE6p2K8PvvMTwvUO6b
         9dUZIZYKqOWqyX/6f49oJ2/bXQPDOhNowqmZNQr3+sWHQqVSXVZnFVVpP3cc4ixi06m+
         TyS7AJO+fPZVMp/o356dNl29HmfqXU3xV/wr1dPTCU9YV33lDqN3S/FcY7VoNLuqRiDr
         T76jWbUSgh9HkVtgoxw65kl9/4u2P6dZIejODFmlWo6SkLGdgLmwrtvRTusn5irWQFTB
         Tc/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BFQYGakvszSZQYEiK77qmVljG0V+wrRK/T3GO3bZxA4=;
        b=aV8kXysJt+PZkmd5lGYjpgUot2JCa7LyLRexLAcyk9INsOWIHUhVWYXo0gbV1oXHO4
         ETEJQxnVJVg8CBmPVCd+fUsjiCra2JiC6J9WcmYICX0MS9n0y4ceDt4VSapf+0+9f8gZ
         3VmRQsooL77eJJqG8+UjSbGTaxMk/oVdiiJlYw6W2OTDUSflUvJEstR+y18ysWk7bzPN
         KiZlqLzCXgb8WEpbYoPd1CHM/eZoTlypnTsLmsX0RxMX94lMzFxEU6hEjxwO4Xp/oSnd
         5CZ1qXaumC/i1cju7QBW/bOIMEftqnkTS9UnBvDNO1VTDQnv0mV0oSMobZ4vQIEon3w1
         8DnA==
X-Gm-Message-State: AOAM530b2FKduWZLT33Op85gu/LfaBa1KBC5M4lHG5tINLEBXYzppbRP
        eaDTxqY/gnExEMdUdumoJccxlg==
X-Google-Smtp-Source: ABdhPJwFHBL2FKeccMlXLdOu/LTSXUl23rU0UsGy8dJd/nIuZMvT3wS2wgBvDcqgNEUZ6Q8WAUKisQ==
X-Received: by 2002:a05:6830:610:: with SMTP id w16mr178455oti.353.1600962910817;
        Thu, 24 Sep 2020 08:55:10 -0700 (PDT)
Received: from yoga (99-135-181-32.lightspeed.austtx.sbcglobal.net. [99.135.181.32])
        by smtp.gmail.com with ESMTPSA id p8sm907633oot.29.2020.09.24.08.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 08:55:10 -0700 (PDT)
Date:   Thu, 24 Sep 2020 10:55:07 -0500
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
Message-ID: <20200924155507.GE40811@yoga>
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

On Mon 21 Sep 16:08 CDT 2020, Will Deacon wrote:

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

Unfortunately not, I hope to get to this shortly.

Thanks,
Bjorn
