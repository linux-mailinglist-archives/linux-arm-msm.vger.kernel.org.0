Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D9D1CB2E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 17:32:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgEHPca (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 11:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727083AbgEHPca (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 11:32:30 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E31C6C061A0C;
        Fri,  8 May 2020 08:32:29 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id nv1so1565123ejb.0;
        Fri, 08 May 2020 08:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GTz5l0c00hn6EnFjS5uVptjSE/ldgre8O5ShnulBHJM=;
        b=AO3PI6cefQSmPY9BgmqyKwHSBzaduMYzVaTdFLkqa1efLEjNVN0/u65uQJMDpCBIX3
         51zgKzcQzha+y6a7/OPfRXbr6m5R3VZIGkRkyTDGYpwMb9ECK4bvbMZ+I27CNLdLRx2F
         /L36lYnM+Jq+IapA90rdEI3gOI4L3lxmsVQOXfIVklcUVPeHUY3/H9D1d4mIBDkNiIU9
         bagZT/tZj6HuIh2pldNQ/3lRVSnEFjbyTjybV8POU8uwTdVqVCb8cSKFnIB3pmdiTvm1
         rCAQLwWDd+jK0407FPY3RGYnxPBMz4sNO7Vaec1et5f5T8f3vYyj4bQZPX/GYmSL1TmQ
         ac+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GTz5l0c00hn6EnFjS5uVptjSE/ldgre8O5ShnulBHJM=;
        b=MkRMhzRsnUrVVNRNHbWDmoLIcH2eLJKsyuZ0CkRZKdxguICuDhq7QA4sJVMb7w7bG/
         opdU87icd1Qi848MdVKK+1PuqA0blHUmruar+VMNgppuk39sZA71YhhZNVKQCFfZCQW8
         pGxBG8IjO93zEQdwV7YI5f2UKG/7/Pnfa9lc/3I7bls4WXUb2MSFLGHUq1N3KD9MyGup
         0oGU8YrUxuFWrIfD2Ih8+Dl7vCzfTnEWw+XQbdf1HQ1/e3BTk98HgMXzML1y0rTrWGZ0
         Z1QUzMKaZiSuiWa8kaNzLuBKiYc3HuQpyCfeGLA5dEHRRQZrm3Dl38B5LTPMfRGPnPIm
         CYZw==
X-Gm-Message-State: AGi0PuZdg0JDq64KSLLlXlEJ81gna+dSn8OcvFo5XBOXqHdN50b3fDly
        m7HT+o5pw3ehq2rnxoPqmrUVSE4fWyzbrHmHLXk=
X-Google-Smtp-Source: APiQypJyshfUHi9pIvxw9h4TZSugZC/AW7KiccDfzWF16matIJfx7xWHDYc2iaGC9dsLuUF9c5YEOslnCiicxndfdLU=
X-Received: by 2002:a17:906:2503:: with SMTP id i3mr2165613ejb.293.1588951948487;
 Fri, 08 May 2020 08:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org> <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <20200507125357.GA31783@willie-the-truck>
In-Reply-To: <20200507125357.GA31783@willie-the-truck>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 8 May 2020 08:32:45 -0700
Message-ID: <CAF6AEGuLU+_qP8HNO1s9PTPHqJnCMHzehmcT8NiJhiAwrfSH6w@mail.gmail.com>
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
To:     Will Deacon <will@kernel.org>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 7, 2020 at 5:54 AM Will Deacon <will@kernel.org> wrote:
>
> On Thu, May 07, 2020 at 11:55:54AM +0100, Robin Murphy wrote:
> > On 2020-05-07 11:14 am, Sai Prakash Ranjan wrote:
> > > On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
> > > > Add stall implementation hook to enable stalling
> > > > faults on QCOM platforms which supports it without
> > > > causing any kind of hardware mishaps. Without this
> > > > on QCOM platforms, GPU faults can cause unrelated
> > > > GPU memory accesses to return zeroes. This has the
> > > > unfortunate result of command-stream reads from CP
> > > > getting invalid data, causing a cascade of fail.
> >
> > I think this came up before, but something about this rationale doesn't add
> > up - we're not *using* stalls at all, we're still terminating faulting
> > transactions unconditionally; we're just using CFCFG to terminate them with
> > a slight delay, rather than immediately. It's really not clear how or why
> > that makes a difference. Is it a GPU bug? Or an SMMU bug? Is this reliable
> > (or even a documented workaround for something), or might things start
> > blowing up again if any other behaviour subtly changes? I'm not dead set
> > against adding this, but I'd *really* like to have a lot more confidence in
> > it.
>
> Rob mentioned something about the "bus returning zeroes" before, but I agree
> that we need more information so that we can reason about this and maintain
> the code as the driver continues to change. That needs to be a comment in
> the driver, and I don't think "but android seems to work" is a good enough
> justification. There was some interaction with HUPCF as well.

The issue is that there are multiple parallel memory accesses
happening at the same time, for example CP (the cmdstream processor)
will be reading ahead and setting things up for the next draw or
compute grid, in parallel with some memory accesses from the shader
which could trigger a fault.  (And with faults triggered by something
in the shader, there are *many* shader threads running in parallel so
those tend to generate a big number of faults at the same time.)

We need either CFCFG or HUPCF, otherwise what I have observed is that
while the fault happens, CP's memory access will start returning
zero's instead of valid cmdstream data, which triggers a GPU hang.  I
can't say whether this is something unique to qcom's implementation of
the smmu spec or not.

*Often* a fault is the result of the usermode gl/vk/cl driver bug,
although I don't think that is an argument against fixing this in the
smmu driver.. I've been carrying around a local patch to set HUPCF for
*years* because debugging usermode driver issues is so much harder
without.  But there are some APIs where faults can be caused by the
user's app on top of the usermode driver.


BR,
-R

>
> As a template, I'd suggest:
>
> > > > diff --git a/drivers/iommu/arm-smmu.h b/drivers/iommu/arm-smmu.h
> > > > index 8d1cd54d82a6..d5134e0d5cce 100644
> > > > --- a/drivers/iommu/arm-smmu.h
> > > > +++ b/drivers/iommu/arm-smmu.h
> > > > @@ -386,6 +386,7 @@ struct arm_smmu_impl {
> > > >      int (*init_context)(struct arm_smmu_domain *smmu_domain);
> > > >      void (*tlb_sync)(struct arm_smmu_device *smmu, int page, int sync,
> > > >               int status);
>
> /*
>  * Stall transactions on a context fault, where they will be terminated
>  * in response to the resulting IRQ rather than immediately. This should
>  * pretty much always be set to "false" as stalling can introduce the
>  * potential for deadlock in most SoCs, however it is needed on Qualcomm
>  * XXXX because YYYY.
>  */
>
> > > > +    bool stall;
>
> Hmm, the more I think about this, the more I think this is an erratum
> workaround in disguise, in which case this could be better named...
>
> Will
