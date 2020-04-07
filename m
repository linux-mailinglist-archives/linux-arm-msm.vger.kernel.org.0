Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D4F81A0E14
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 15:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgDGND1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 09:03:27 -0400
Received: from foss.arm.com ([217.140.110.172]:56054 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726562AbgDGND1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 09:03:27 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0839E31B;
        Tue,  7 Apr 2020 06:03:27 -0700 (PDT)
Received: from [10.37.12.154] (unknown [10.37.12.154])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F210D3F68F;
        Tue,  7 Apr 2020 06:03:24 -0700 (PDT)
Subject: Re: [RFC PATCH] coresight: dynamic-replicator: Fix handling of
 multiple connections
To:     saiprakash.ranjan@codeaurora.org
Cc:     mike.leach@linaro.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        swboyd@chromium.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20200405102819.28460-1-saiprakash.ranjan@codeaurora.org>
 <CAJ9a7VgQzK1XSCvLwuqODwkWfvo=6Wwps7Db+pL5xYDeCuktrg@mail.gmail.com>
 <6c0f45488f8a44bf860759e00fcabd09@codeaurora.org>
 <906d374d-a4d6-f2f2-6845-88b97a5ff7d9@arm.com>
 <39a2b3fff165a108fa59d72b630b5f14@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <bb209f80-ac02-6321-dac4-ebf9ee6fa9a0@arm.com>
Date:   Tue, 7 Apr 2020 14:08:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <39a2b3fff165a108fa59d72b630b5f14@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/07/2020 12:29 PM, Sai Prakash Ranjan wrote:
> Hi Suzuki,
> 
> Thanks for looking into this issue.
> 
> On 2020-04-07 15:54, Suzuki K Poulose wrote:
>> On 04/07/2020 10:46 AM, Sai Prakash Ranjan wrote:
>>
>> There seems to be two replicators back to back here. What is connected
>> to the other output of both of them ? Are there any TPIUs ? What happens
>> if you choose a sink on the other end of "swao_replicator" (ETB ?)
>>
> 
> The other outport of swao replicator is connected to EUD which is a
> QCOM specific HW which can be used as a sink like USB.
> And the other outport of other replicator(replicator_out) is connected to
> TPIU.
> 
>> After boot, what do the idfilter registers read for both the 
>> replicators ?
>>
> 
> Added some prints in replicator_probe.
> 
>   replicator probe ret=-517 devname=6046000.replicator idfilter0=0x0 
> idfilter1=0x0
>   replicator probe ret=0 devname=6b06000.replicator idfilter0=0xff 
> idfilter1=0xff
>   replicator probe ret=0 devname=6046000.replicator idfilter0=0xff 
> idfilter1=0xff

Curious to see how the idfilterX is set to 0:
	 if that is never used.
		Or
	 if the user doesn't reset it back to 0xff.

Does your test ever touch EUD (enable the port for EUD at
swao-replicator) ? What are the values before you run your test ?


Suzuki
