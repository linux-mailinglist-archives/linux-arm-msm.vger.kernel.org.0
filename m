Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F84C9CA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2019 12:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729433AbfJCKtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Oct 2019 06:49:09 -0400
Received: from foss.arm.com ([217.140.110.172]:41264 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727756AbfJCKtJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Oct 2019 06:49:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 428721000;
        Thu,  3 Oct 2019 03:49:08 -0700 (PDT)
Received: from [10.37.12.210] (unknown [10.37.12.210])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A282B3F706;
        Thu,  3 Oct 2019 03:49:04 -0700 (PDT)
Subject: Re: [PATCHv9 2/3] arm64: dts: qcom: msm8998: Add Coresight support
To:     daniel.thompson@linaro.org, mathieu.poirier@linaro.org
Cc:     saiprakash.ranjan@codeaurora.org, jeffrey.l.hugo@gmail.com,
        mark.rutland@arm.com, rnayak@codeaurora.org,
        alexander.shishkin@linux.intel.com, linux-arm-msm@vger.kernel.org,
        marc.w.gonzalez@free.fr, linux-kernel@vger.kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        agross@kernel.org, sibis@codeaurora.org, leo.yan@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm-owner@vger.kernel.org
References: <cover.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <90114e06825e537c3aafd3de5c78743a9de6fadc.1564550873.git.saiprakash.ranjan@codeaurora.org>
 <CAOCk7NrK+wY8jfHdS8781NOQtyLm2RRe1NW2Rm3_zeaot0Q99Q@mail.gmail.com>
 <16212a577339204e901cf4eefa5e82f1@codeaurora.org>
 <CAOCk7NohO67qeYCnrjy4P0KN9nLUiamphHRvj-bFP++K7khPOw@mail.gmail.com>
 <fa5a35f0e993f2b604b60d5cead3cf28@codeaurora.org>
 <CAOCk7NodWtC__W3=AQfXcjF-W9Az_NNUN0r8w5WmqJMziCcvig@mail.gmail.com>
 <5b8835905a704fb813714694a792df54@codeaurora.org>
 <CANLsYkxPOOorqcnPrbhZLzGV9Y7EGWUUyxvi-Cm5xxnzhx=Ecg@mail.gmail.com>
 <20191003102023.qk6ik5vmatheaofs@holly.lan>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <57349bda-0e86-5fe0-3be0-55b12748c346@arm.com>
Date:   Thu, 3 Oct 2019 11:52:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20191003102023.qk6ik5vmatheaofs@holly.lan>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/03/2019 11:20 AM, Daniel Thompson wrote:
> On Wed, Oct 02, 2019 at 09:03:59AM -0600, Mathieu Poirier wrote:
>> On Tue, 1 Oct 2019 at 12:05, Sai Prakash Ranjan
>> <saiprakash.ranjan@codeaurora.org> wrote:
>>>
>>> On 2019-10-01 11:01, Jeffrey Hugo wrote:
>>>> On Tue, Oct 1, 2019 at 11:52 AM Sai Prakash Ranjan
>>>> <saiprakash.ranjan@codeaurora.org> wrote:
>>>>>
>>>>>
>>>>> Haan then likely it's the firmware issue.
>>>>> We should probably disable coresight in soc dtsi and enable only for
>>>>> MTP. For now you can add a status=disabled for all coresight nodes in
>>>>> msm8998.dtsi and I will send the patch doing the same in a day or
>>>>> two(sorry I am travelling currently).
>>>>
>>>> This sounds sane to me (and is what I did while bisecting the issue).
>>>> When you do create the patch, feel free to add the following tags as
>>>> you see fit.
>>>>
>>>> Reported-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>>>> Tested-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
>>>
>>> Thanks Jeffrey, I will add them.
>>> Hope Mathieu and Suzuki are OK with this.
>>
>> The problem here is that a debug and production device are using the
>> same device tree, i.e msm8998.dtsi.  Disabling coresight devices in
>> the DTS file will allow the laptop to boot but completely disabled
>> coresight blocks on the MTP board.  Leaving things as is breaks the
>> laptop but allows coresight to be used on the MTP board.  One of three
>> things can happen:
>>
>> 1) Nothing gets done and production board can't boot without DTS modifications.
>> 2) Disable tags are added to the DTS file and the debug board can't
>> use coresight without modifications.
>> 2) The handling of the debug power domain is done properly on the
>> MSM8998 rather than relying on the bootloader to enable it.
>> 3) The DTS file is split or reorganised to account for debug/production devices.
> 
> msm8998.dtsi is a SoC include file. Can't whatever default it adopts be
> reversed in the board include files such as msm8998-mtp.dtsi or
> msm8998-clamshell.dtsi ?

Or like Mathieu said, all the Coresight specific nodes could be moved in
to say, msm8998-coresight.dtsi and could be included into the platforms
where it actually works.

Suzuki
