Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB182224E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 16:10:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728865AbgGPOKN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 10:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727044AbgGPOKM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 10:10:12 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59218C061755;
        Thu, 16 Jul 2020 07:10:12 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a21so6694641ejj.10;
        Thu, 16 Jul 2020 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UgByZr2tdGXMxqTrpo6Qkdxy8e0b0j8qrLrKzyPeff4=;
        b=p/oY63OM+jm2WcLptMiuLRuvaLTNDJmdQ/usKdVo5BQ2xnnssf+08/52kx3SBxP7Y3
         I47BFQ3ap6TYnx/2SbzKSeaghmr1JlKhjgMB2gECCOTUXVuRqY3qYqlFDpx63eV9Kd9v
         k+yZoMOvct+w+jptYyDvwmFbIfP5gXFnp+bAG8MaeZvMVxGZpqG8vZ2obkaDb8nu+nHm
         kBYZtuaFIGRbH/GkbGUfwFWXsCtYIV3RxDWgSFlSmtAH6OXNgsvRF5d4RqklcxD092Gw
         vrF7juWcsMx/odaCP1UN3JQWRXNWhAP5y16WC13irLPuEXdTsRf1ehSNCrxLTT9+ogdJ
         6oRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UgByZr2tdGXMxqTrpo6Qkdxy8e0b0j8qrLrKzyPeff4=;
        b=lr6wtU6P5KverM3Bn3Jo89ngUSv3z3ITt3mT3YM8dfAcKgbak9w+CwrmiWw04xZ1Nl
         CWNWPrLZWyRHe93wJtNOmUbJH/bIPdvIr7O7mSK0OhKY0BOLdytXxfXQlSIhoxm+eKku
         t77WCvCmLg2lCIfFGdHNtVk+SsFdBl7SY+xLLU5wBXDS2FfHshz5Id/IWAWMhD1rkx+D
         pnwKQ3ZqgGeOXh7dvIQa6NrZfdr8RNZVpw7LUwVzT2X23zu4Ox4vuba2frWmdOk9a4sO
         /PZ1Jyb2Jymu6F6HFZx/m2Vf7PTY4tIsw12BnBBseUBB/AhwPmtUfIORGYLWNES2HGoO
         G+YQ==
X-Gm-Message-State: AOAM531223y4BeJkuhB6rgx0mlwvmoq4oZz97SrP8D2KwxW4rSDC1QPf
        Id2qsbOG3hc1yIOAiq+hZyhU37nTAdylkPEJj1A=
X-Google-Smtp-Source: ABdhPJyz8imIlovqA4rnHstW4ckjKTIH95Kru8h/9+b4cY5spXHzvx8IM2dpEFBVY9OsnhnhxXdZW6/cN3g6oedlr7k=
X-Received: by 2002:a17:906:328d:: with SMTP id 13mr3973061ejw.71.1594908610972;
 Thu, 16 Jul 2020 07:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200626200042.13713-1-jcrouse@codeaurora.org>
 <20200626200042.13713-5-jcrouse@codeaurora.org> <20200713150901.GA3072@willie-the-truck>
 <20200713171917.GA3815@jcrouse1-lnx.qualcomm.com> <20200716085053.GB6771@willie-the-truck>
In-Reply-To: <20200716085053.GB6771@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 16 Jul 2020 07:10:43 -0700
Message-ID: <CAF6AEGtf2Ts5_S-3DDA0i_ega-MjJK5tyy=peW6ar0c1ZD72Rw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v9 4/7] iommu/arm-smmu: Add a pointer to the
 attached device to smmu_domain
To:     Will Deacon <will@kernel.org>
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        John Stultz <john.stultz@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 16, 2020 at 1:51 AM Will Deacon <will@kernel.org> wrote:
>
> On Mon, Jul 13, 2020 at 11:19:17AM -0600, Jordan Crouse wrote:
> > On Mon, Jul 13, 2020 at 04:09:02PM +0100, Will Deacon wrote:
> > > On Fri, Jun 26, 2020 at 02:00:38PM -0600, Jordan Crouse wrote:
> > > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > > index 5f2de20e883b..d33cfe26b2f5 100644
> > > > --- a/drivers/iommu/arm-smmu.h
> > > > +++ b/drivers/iommu/arm-smmu.h
> > > > @@ -345,6 +345,7 @@ struct arm_smmu_domain {
> > > >   struct mutex                    init_mutex; /* Protects smmu pointer */
> > > >   spinlock_t                      cb_lock; /* Serialises ATS1* ops and TLB syncs */
> > > >   struct iommu_domain             domain;
> > > > + struct device                   *dev;   /* Device attached to this domain */
> > >
> > > This really doesn't feel right to me -- you can generally have multiple
> > > devices attached to a domain and they can come and go without the domain
> > > being destroyed. Perhaps you could instead identify the GPU during
> > > cfg_probe() and squirrel that information away somewhere?
> >
> > I need some help here. The SMMU device (qcom,adreno-smmu) will have at least two
> > stream ids from two different platform devices (GPU and GMU) and I need to
> > configure split-pagetable and stall/terminate differently on the two domains.
>
> Hmm. How does the GPU driver know which context bank is assigned to the GPU
> and which one is assigned to the GMU? I assume it needs this information so
> that it can play its nasty tricks with the TTBR registers?
>
> I ask because if we need to guarantee stability of the context-bank
> assignment, then you could match on that in the ->init_context() callback,
> but now I worry that it currently works by luck :/

Yeah, it is basically by luck right now.. some sort of impl callback
which was passed the dev into impl->init_context() might do the trick
(ie. then the impl could match on compat string)

BR,
-R

> Do we need to add an extra callback to allocate the context bank?
>
> Will
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
