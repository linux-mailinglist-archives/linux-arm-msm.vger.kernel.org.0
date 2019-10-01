Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B340C3E9C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 19:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbfJARbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 13:31:47 -0400
Received: from foss.arm.com ([217.140.110.172]:55214 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbfJARbr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 13:31:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2069337;
        Tue,  1 Oct 2019 10:31:46 -0700 (PDT)
Received: from [10.1.197.116] (unknown [10.1.197.116])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A01A13F706;
        Tue,  1 Oct 2019 10:31:40 -0700 (PDT)
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
 <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <450756ff-f897-7825-3424-6d5645fa9db9@arm.com>
Date:   Tue, 1 Oct 2019 18:31:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 01/10/2019 18:14, Jeffrey Hugo wrote:
> On Tue, Oct 1, 2019 at 11:04 AM Sai Prakash Ranjan
> <saiprakash.ranjan@codeaurora.org> wrote:
>>
>> On 2019-10-01 09:13, Jeffrey Hugo wrote:
>>> Sai,
>>>
>>> This patch breaks boot on the 835 laptops.  However, I haven't seen
>>> the same issue on the MTP.  I wonder, is coresight expected to work
>>> with production fused devices?  I wonder if thats the difference
>>> between the laptop and MTP that is causing the issue.
>>>
>>> Let me know what I can do to help debug.
>>>
>>
>> I did test on MSM8998 MTP and didn't face any issue. I am guessing this
>> is the same issue which you reported regarding cpuidle? Coresight ETM
> 
> Yes, its the same issue.  Right now, I need both patches reverted to boot.
> 
>> and cpuidle do not work well together since ETMs share the same power
>> domain as CPU and they might get turned off when CPU enters idle states.
>> Can you try with cpuidle.off=1 cmdline or just remove idle states from
>> DT to confirm? If this is the issue, then we can try the below patch
>> from Andrew Murray for ETM save and restore:
>>
>> https://patchwork.kernel.org/patch/11097893/
> 
> Is there still value in testing this if the idle states are removed,
> yet the coresight nodes still cause issues?
> 
> Funny enough, I'm using the arm64 defconfig which doesn't seem to
> select CONFIG_CORESIGHT, so I'm not even sure what would be binding to
> the DT devices...

That looks like potentially missing Power domain support, either in the kernel
or from the firmware.

The Coresight components are also AMBA devices (with primecell compatible)
and thus the AMBA bus layer does some probing to check the PIDRx registers
to match the driver. The AMBA layer does try to get the power to the
component, but someone is lying that it is powered.

Suzuki
