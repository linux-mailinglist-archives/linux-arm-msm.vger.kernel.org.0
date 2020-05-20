Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5FE91DAEE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2020 11:33:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgETJdF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 May 2020 05:33:05 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:43084 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726546AbgETJdF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 May 2020 05:33:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589967184; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=kj7KetK7iFPOosbvpCUKYMpyUHmudAmdvJ6fI1OKUq0=;
 b=kmdJ1Cwh5HgaYVfhQoAGMRtsJ+aLIQMPvu26rTkXUDL6fwcGAWWOiVFwAENQ7yJ5GtNH3jXN
 8lc56CN/ScxsNxSjo04rb6QTanWcfIE6blP+o+CgCSDVuDDBLY7kqmmOONrDOSnKfCzjQpAg
 Q5yW7rXH37omGV8KoXNoGJxd1gU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ec4f940087f08818e57a78b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 May 2020 09:32:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0BCA7C433A1; Wed, 20 May 2020 09:32:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 87D87C433CA;
        Wed, 20 May 2020 09:32:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 20 May 2020 15:02:45 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS , Joerg Roedel <joro@8bytes.org>," 
        <iommu@lists.linux-foundation.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
In-Reply-To: <CAF6AEGuzBtj+srindmOvhaom5BdS2adLaOF=v_MtguMja14V2w@mail.gmail.com>
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
 <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <20200507125357.GA31783@willie-the-truck>
 <CAF6AEGuLU+_qP8HNO1s9PTPHqJnCMHzehmcT8NiJhiAwrfSH6w@mail.gmail.com>
 <CAF6AEGvuHKObTR97XdSXjmjKB+qjQ8N1_wxM=ZU8bEkF=cXp-A@mail.gmail.com>
 <20200511173008.GA24282@jcrouse1-lnx.qualcomm.com>
 <20200518154522.GN32394@willie-the-truck>
 <5a0ad639e272026c8be57393937cda22@codeaurora.org>
 <CAF6AEGuzBtj+srindmOvhaom5BdS2adLaOF=v_MtguMja14V2w@mail.gmail.com>
Message-ID: <a801e79a0a75092c28a6646ae7fa5e36@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-19 20:41, Rob Clark wrote:
> On Tue, May 19, 2020 at 2:26 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>> 
>> Hi Will,
>> 
>> On 2020-05-18 21:15, Will Deacon wrote:
>> > On Mon, May 11, 2020 at 11:30:08AM -0600, Jordan Crouse wrote:
>> >> On Fri, May 08, 2020 at 08:40:40AM -0700, Rob Clark wrote:
>> >> > On Fri, May 8, 2020 at 8:32 AM Rob Clark <robdclark@gmail.com> wrote:
>> >> > >
>> >> > > On Thu, May 7, 2020 at 5:54 AM Will Deacon <will@kernel.org> wrote:
>> >> > > >
>> >> > > > On Thu, May 07, 2020 at 11:55:54AM +0100, Robin Murphy wrote:
>> >> > > > > On 2020-05-07 11:14 am, Sai Prakash Ranjan wrote:
>> >> > > > > > On 2020-04-22 01:50, Sai Prakash Ranjan wrote:
>> >> > > > > > > Add stall implementation hook to enable stalling
>> >> > > > > > > faults on QCOM platforms which supports it without
>> >> > > > > > > causing any kind of hardware mishaps. Without this
>> >> > > > > > > on QCOM platforms, GPU faults can cause unrelated
>> >> > > > > > > GPU memory accesses to return zeroes. This has the
>> >> > > > > > > unfortunate result of command-stream reads from CP
>> >> > > > > > > getting invalid data, causing a cascade of fail.
>> >> > > > >
>> >> > > > > I think this came up before, but something about this rationale doesn't add
>> >> > > > > up - we're not *using* stalls at all, we're still terminating faulting
>> >> > > > > transactions unconditionally; we're just using CFCFG to terminate them with
>> >> > > > > a slight delay, rather than immediately. It's really not clear how or why
>> >> > > > > that makes a difference. Is it a GPU bug? Or an SMMU bug? Is this reliable
>> >> > > > > (or even a documented workaround for something), or might things start
>> >> > > > > blowing up again if any other behaviour subtly changes? I'm not dead set
>> >> > > > > against adding this, but I'd *really* like to have a lot more confidence in
>> >> > > > > it.
>> >> > > >
>> >> > > > Rob mentioned something about the "bus returning zeroes" before, but I agree
>> >> > > > that we need more information so that we can reason about this and maintain
>> >> > > > the code as the driver continues to change. That needs to be a comment in
>> >> > > > the driver, and I don't think "but android seems to work" is a good enough
>> >> > > > justification. There was some interaction with HUPCF as well.
>> >> > >
>> >> > > The issue is that there are multiple parallel memory accesses
>> >> > > happening at the same time, for example CP (the cmdstream processor)
>> >> > > will be reading ahead and setting things up for the next draw or
>> >> > > compute grid, in parallel with some memory accesses from the shader
>> >> > > which could trigger a fault.  (And with faults triggered by something
>> >> > > in the shader, there are *many* shader threads running in parallel so
>> >> > > those tend to generate a big number of faults at the same time.)
>> >> > >
>> >> > > We need either CFCFG or HUPCF, otherwise what I have observed is that
>> >> > > while the fault happens, CP's memory access will start returning
>> >> > > zero's instead of valid cmdstream data, which triggers a GPU hang.  I
>> >> > > can't say whether this is something unique to qcom's implementation of
>> >> > > the smmu spec or not.
>> >> > >
>> >> > > *Often* a fault is the result of the usermode gl/vk/cl driver bug,
>> >> > > although I don't think that is an argument against fixing this in the
>> >> > > smmu driver.. I've been carrying around a local patch to set HUPCF for
>> >> > > *years* because debugging usermode driver issues is so much harder
>> >> > > without.  But there are some APIs where faults can be caused by the
>> >> > > user's app on top of the usermode driver.
>> >> > >
>> >> >
>> >> > Also, I'll add to that, a big wish of mine is to have stall with the
>> >> > ability to resume later from a wq context.  That would enable me to
>> >> > hook in the gpu crash dump handling for faults, which would make
>> >> > debugging these sorts of issues much easier.  I think I posted a
>> >> > prototype of this quite some time back, which would schedule a worker
>> >> > on the first fault (since there are cases where you see 1000's of
>> >> > faults at once), which grabbed some information about the currently
>> >> > executing submit and some gpu registers to indicate *where* in the
>> >> > submit (a single submit could have 100's or 1000's of draws), and then
>> >> > resumed the iommu cb.
>> >> >
>> >> > (This would ofc eventually be useful for svm type things.. I expect
>> >> > we'll eventually care about that too.)
>> >>
>> >> Rob is right about HUPCF. Due to the parallel nature of the command
>> >> processor
>> >> there is always a very good chance that a CP access is somewhere in
>> >> the bus so
>> >> any pagefault is usually a death sentence. The GPU context bank would
>> >> always
>> >> want HUPCF set to 1.
>> >
>> > So this sounds like an erratum to me, and I'm happy to set HUPCF if we
>> > detect the broken implementation. However, it will need an entry in
>> > Documentation/arm64/silicon-errata.rst and a decent comment in the
>> > driver
>> > to explain what we're doing and why.
>> >
>> 
>> AFAIK there is no erratum documented internally for this behaviour and
>> this
>> exists from MSM8996 SoC time and errata usually don't survive this 
>> long
>> across generation of SoCs and there is no point for us in disguising 
>> it.
> 
> possibly longer, qcom_iommu sets CFCFG..
> 

Oh right, I was still in college when those SoCs were released ;)

>> Is it OK if we clearly mention it as the "design limitation" or some
>> other
>> term which we can agree upon along with the description which Rob and
>> Jordan
>> provided for setting HUPCF in the driver when we add the set_hupcf
>> callback?
> 
> I'm not too picky on what we call it, but afaict it has been this way
> since the beginning of time, rather than specific to a certain SoC or
> generation of SoCs.  So it doesn't seem like the hw designers consider
> it a bug.
> 
> (I'm not sure what the expected behavior is.. nor if any other SMMU
> implementation encounters this sort of situation..)
> 

Yes, that was my point as well that its probably not counted as a bug
by the hw designers. So I'm going to post setting HUPCF on QCOM
implementation with clear comments based on yours and Jordan's 
description
of this problem, but I wanted to have a way to set this only for GPU 
context
bank and not GMU as Jordan mentioned earlier that GMU doesnt need HUPCF 
set.
I was checking as to how do we map cb to device, if it was possible then 
we can have
a compatibility thing like we did for identity mapping. Any ideas Robin?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
