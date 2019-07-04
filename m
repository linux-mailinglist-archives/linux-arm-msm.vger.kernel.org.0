Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B13725F450
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 10:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbfGDII1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jul 2019 04:08:27 -0400
Received: from ns.iliad.fr ([212.27.33.1]:46572 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbfGDII1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jul 2019 04:08:27 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 1E46320AC3;
        Thu,  4 Jul 2019 10:08:25 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 04561206B9;
        Thu,  4 Jul 2019 10:08:25 +0200 (CEST)
Subject: Re: [PATCHv5 1/2] dt-bindings: coresight: Change CPU phandle to
 required property
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        MSM <linux-arm-msm@vger.kernel.org>
References: <cover.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <2afedb941294af7ba0658496b4aca3759a4e43ff.1561659046.git.saiprakash.ranjan@codeaurora.org>
 <CANLsYkxvh+qUDvqG45o7qh61Noq=a=BJ4-p68ipdzxYt6n5bNA@mail.gmail.com>
 <8fb5947e-acf8-faff-5594-2a32151ebee7@codeaurora.org>
 <20190704070239.GB32707@kroah.com>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <72dff807-7172-7882-83fc-d7ff4cafe39f@free.fr>
Date:   Thu, 4 Jul 2019 10:08:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190704070239.GB32707@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jul  4 10:08:25 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[ Trimming recipients list ]

On 04/07/2019 09:02, Greg Kroah-Hartman wrote:

> On Thu, Jul 04, 2019 at 12:13:40PM +0530, Sai Prakash Ranjan wrote:
>
>> On 7/4/2019 1:32 AM, Mathieu Poirier wrote:
>>
>>> Hi Greg,
>>>
>>> On Thu, 27 Jun 2019 at 12:15, Sai Prakash Ranjan wrote:
>>>>
>>>> Do not assume the affinity to CPU0 if cpu phandle is omitted.
>>>> Update the DT binding rules to reflect the same by changing it
>>>> to a required property.
>>>>
>>>> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
>>>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>>
>>> I'm all good with this patch - can you pick this up for the coming
>>> merge window?  If not I'll simply keep it in my tree for 5.4.
>>>
>>> Tested-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
>>
>> I think you missed adding Greg, adding him now ;)
> 
> I don't see any patch here for me to actually take :(

I see what you're doing here ^_^

https://lore.kernel.org/patchwork/patch/1094935/

Regards.
