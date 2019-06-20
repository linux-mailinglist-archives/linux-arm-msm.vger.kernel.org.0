Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BC794C9E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 10:53:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbfFTIxd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 04:53:33 -0400
Received: from foss.arm.com ([217.140.110.172]:54360 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfFTIxd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 04:53:33 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39FAC344;
        Thu, 20 Jun 2019 01:53:32 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 618D33F246;
        Thu, 20 Jun 2019 01:53:31 -0700 (PDT)
Subject: Re: Coresight causes synchronous external abort on msm8916
To:     mathieu.poirier@linaro.org, stephan@gerhold.net
Cc:     david.brown@linaro.org, agross@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
 <CANLsYkxaX2=Bp_BWWUFimC-UmP3L5g=CU7tqjd+xoFVcWG38tA@mail.gmail.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <6bb74dcc-62e4-5310-5884-9c4b82ce5be9@arm.com>
Date:   Thu, 20 Jun 2019 09:53:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CANLsYkxaX2=Bp_BWWUFimC-UmP3L5g=CU7tqjd+xoFVcWG38tA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mathieu,

On 19/06/2019 21:16, Mathieu Poirier wrote:
> On Wed, 19 Jun 2019 at 12:39, Stephan Gerhold <stephan@gerhold.net> wrote:

>> In this case I'm wondering how it works on the Dragonboard 410c.
> 
> There can be two problems:
> 
> 1) CPUidle is enabled on your platform and as I pointed out before,
> that won't work.  There are patches circulating[1] to fix that problem
> but it still needs a little bit of work.
> 
> 2) As Suzuki pointed out the debug power domain may not be enabled by
> default on your platform, something I would understand if it is a
> production device.  There is nothing I can do on that front.
> 
> [1]. https://www.spinics.net/lists/arm-kernel/msg735707.html
> 
>> Does it enable these power domains in the firmware?
>>    (Assuming it boots without this error...)
> 
> The debug power domain is enabled by default on the 410c and the board
> boots without error.
> 
>>
>> If coresight is not working properly on all/most msm8916 devices,
>> shouldn't coresight be disabled by default in msm8916.dtsi?
> 
> It is in the defconfig for arm64, as such it shouldn't bother you.
> 
>> At least until those power domains can be set up by the kernel.
>>
>> If this is a device-specific issue, what would be an acceptable solution
>> for mainline?
>> Can I turn on these power domains from the kernel?
> 
> Yes, if you have the SoC's TRM.
> 
>> Or is it fine to disable coresight for this device with the snippet above?
>>
>> I'm not actually trying to use coresight, I just want the device to boot :)
>> And since I am considering submitting my device tree for inclusion in
>> mainline, I want to ask in advance how I should tackle this problem.
> 
> Simply don't enable coresight in the kernel config if the code isn't
> mature enough to properly handle the relevant power domains using the
> PM runtime API.

I don't think disabling the Coresight in kernel config will hide it.
Since the coresight components have the AMBA compatible, the AMBA bus
driver will definitely try to probe the PIDs via amba_device_try_add(),
as shown by the backtrace. I assume that is causing the problem.

Cheers
Suzuki
