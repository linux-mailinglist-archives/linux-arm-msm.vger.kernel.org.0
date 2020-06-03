Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F049C1ECFAC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 14:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbgFCMVj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jun 2020 08:21:39 -0400
Received: from foss.arm.com ([217.140.110.172]:60916 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725833AbgFCMVi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jun 2020 08:21:38 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCEE531B;
        Wed,  3 Jun 2020 05:21:37 -0700 (PDT)
Received: from [10.57.0.45] (unknown [10.57.0.45])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2F1A3F305;
        Wed,  3 Jun 2020 05:21:34 -0700 (PDT)
Subject: Re: [PATCH 2/2] coresight: tmc: Add shutdown callback for TMC ETR/ETF
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        Stephen Boyd <swboyd@chromium.org>
References: <cover.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <28123d1e19f235f97555ee36a5ed8b52d20cbdea.1590947174.git.saiprakash.ranjan@codeaurora.org>
 <20200601212858.GB24287@xps15> <bf7e8ac2-51b2-d9cb-9c4f-c311297accac@arm.com>
 <1549935cf69ac3a006f32eb278821027@codeaurora.org>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <6c1a4fbd-98cb-a49c-0ced-1318d5d5e7c8@arm.com>
Date:   Wed, 3 Jun 2020 13:21:30 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <1549935cf69ac3a006f32eb278821027@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-06-03 13:00, Sai Prakash Ranjan wrote:
> Hi Robin, Mathieu
> 
> On 2020-06-03 17:07, Robin Murphy wrote:
>> On 2020-06-01 22:28, Mathieu Poirier wrote:
>>> That being said I'm sure that dependencies on an IOMMU isn't a 
>>> problem confined
>>> to coresight. I am adding Robin Murphy, who added this commit [1], to 
>>> the thread
>>> in the hope that he can provide guidance on the right way to do this.
>>
>> Right, it's not specific to CoreSight, and it's not even specific to
>> IOMMUs really. In short, blame kexec ;)
>>
> 
> Yes it is not specific to coresight, we are targeting this for all
> consumers/clients of SMMU(atleast on SC7180 SoC). We have display throwing
> NoC/interconnect errors[1] during reboot after SMMU is disabled.
> This is also not specific to kexec either as you explained here [2] about
> a case with display which is exacly what is happening in our system [1].

Sure, but those instances are begging the question of why the SMMU is 
disabled at reboot in the first place ;)

Robin.

> 
> [1] 
> https://lore.kernel.org/lkml/1591009402-681-1-git-send-email-mkrishn@codeaurora.org/ 
> 
> [2] 
> https://lore.kernel.org/lkml/5858bdac-b7f9-ac26-0c0d-c9653cef841d@arm.com/
> 
>> The fundamental thing is that devices should stop any DMA activity at
>> shutdown. For a normal poweroff you can typically get away without
>> doing so, but over kexec, ongoing DMA traffic may corrupt memory in
>> the new kernel (at worst, I think even DMA reads could potentially
>> cause unexpected cache behaviour that might lead to mishaps, given the
>> right combination of memory attributes).
>>
>> IOMMUs merely help to make the situation more serious. For similar
>> kexec reasons, they need to disable any existing translations at
>> shutdown (imagine if the second kernel didn't have an IOMMU driver).
>> And at that point, even the normal poweroff case becomes problematic,
>> because any device DMA that hasn't been shut down beforehand is now
>> not necessarily going benignly to memory as it would in the no-IOMMU
>> case above, but potentially to random physical addresses, with all the
>> hilarity ensuing that you would expect from that.
>>
> 
> Thanks,
> Sai
