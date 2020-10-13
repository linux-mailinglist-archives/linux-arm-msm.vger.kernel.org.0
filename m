Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C2C728D28B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 18:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgJMQr7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 12:47:59 -0400
Received: from foss.arm.com ([217.140.110.172]:34274 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727696AbgJMQr7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 12:47:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87E2331B;
        Tue, 13 Oct 2020 09:47:58 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0E823F719;
        Tue, 13 Oct 2020 09:47:56 -0700 (PDT)
Subject: Re: [PATCH v3 6/8] iommu/arm-smmu: Add impl hook for inherit boot
 mappings
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200904155513.282067-1-bjorn.andersson@linaro.org>
 <20200904155513.282067-7-bjorn.andersson@linaro.org>
 <0bfcc8f7-d054-616b-834b-319461b1ecb9@arm.com> <20200913032559.GT3715@yoga>
 <20200921210814.GE3811@willie-the-truck> <20201012073152.GA2998@yoga>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <40b24ccc-8dc4-8bbe-3a85-68a6b62b448d@arm.com>
Date:   Tue, 13 Oct 2020 17:47:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201012073152.GA2998@yoga>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-12 08:31, Bjorn Andersson wrote:
> On Mon 21 Sep 23:08 CEST 2020, Will Deacon wrote:
> 
>> On Sat, Sep 12, 2020 at 10:25:59PM -0500, Bjorn Andersson wrote:
>>> On Fri 11 Sep 12:13 CDT 2020, Robin Murphy wrote:
>>>> On 2020-09-04 16:55, Bjorn Andersson wrote:
>>>>> Add a new operation to allow platform implementations to inherit any
>>>>> stream mappings from the boot loader.
>>>>
>>>> Is there a reason we need an explicit step for this? The aim of the
>>>> cfg_probe hook is that the SMMU software state should all be set up by then,
>>>> and you can mess about with it however you like before arm_smmu_reset()
>>>> actually commits anything to hardware. I would have thought you could
>>>> permanently steal a context bank, configure it as your bypass hole, read out
>>>> the previous SME configuration and tweak smmu->smrs and smmu->s2crs
>>>> appropriately all together "invisibly" at that point.
>>>
>>> I did this because as of 6a79a5a3842b ("iommu/arm-smmu: Call
>>> configuration impl hook before consuming features") we no longer have
>>> setup pgsize_bitmap as we hit cfg_probe, which means that I need to
>>> replicate this logic to set up the iommu_domain.
>>>
>>> If I avoid setting up an iommu_domain for the identity context, as you
>>> request in patch 8, this shouldn't be needed anymore.
>>>
>>>> If that can't work, I'm very curious as to what I've overlooked.
>>>>
>>>
>>> I believe that will work, I will rework the patches and try it out.
>>
>> Did you get a chance to rework this?
>>
> 
> Finally got a chance to dig through this properly.
> 
> Initial results where positive and with an implementation of cfg_probe
> in qcom_smmu_impl I'm able to probe the arm-smmu driver just fine - and
> display (e.g. efifb) stays alive.
> 
> Unfortunately as the display driver (drivers/gpu/drm/msm) is about to
> probe a new iommu domain is created, which due to its match against
> qcom_smmu_client_of_match[] becomes of type IOMMU_DOMAIN_IDENTITY.
> This results in a S2CR of BYPASS type, which the firmware intercepts and
> turns the stream into a type FAULT.
> 
> So while the cfg_probe looks very reasonable we're still in need of a
> mechanism to use the fake identity context for the iommu domain
> associated with the display controller.

Yes, we'll still need some kind of hook somewhere to make identity 
domains work at all - my point about cfg_probe was to keep the 
reservation and configuration of the special identity context, plus the 
handling of the initial SME state, simple and entirely internal to the 
impl. In terms of where said hook should be, TBH it might actually work 
out pretty clean to simply hook GR0 register accesses so you can rewrite 
between S2CR bypass entries and translation entries targeting your 
reserved context on-the-fly. Failing that, something to massage "type" 
and "cbndx" in arm_smmu_domain_add_master() would be the next best 
option, I think.

Robin.

> The workings of the display driver is that it gets the iommu domain
> setup for byass and then after that creates a translation context for
> this same stream where it maps the framebuffer.
> 
> For testing purposes I made def_domain_type always return 0 in the qcom
> impl and the result is that we get a few page faults while probing the
> display driver, but these are handled somewhat gracefully and the
> initialization did proceed and the system comes up nicely (but in the
> case that the display driver would probe defer this leads to an storm of
> faults as the screen continues to be refreshed).
> 
> TL;DR I think we still need to have a way to get the arm-smmu driver to
> allow the qcom implementation to configure identity domains to use
> translation - but we can make the setup of the identity context a detail
> of the qcom driver.
> 
> Regards,
> Bjorn
> 
