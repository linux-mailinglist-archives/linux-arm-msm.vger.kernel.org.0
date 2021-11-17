Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E3F45452C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 11:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236531AbhKQKt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 05:49:26 -0500
Received: from foss.arm.com ([217.140.110.172]:55172 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231777AbhKQKt0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 05:49:26 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D07AD6E;
        Wed, 17 Nov 2021 02:46:27 -0800 (PST)
Received: from [10.57.24.78] (unknown [10.57.24.78])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F2C93F70D;
        Wed, 17 Nov 2021 02:46:25 -0800 (PST)
Subject: Re: Re: [PATCH] base: arch_topology: Use policy->max to calculate
 freq_factor
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Thara Gopinath <thara.gopinath@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
 <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <8f7397e3-4e92-c84d-9168-087967f4d683@arm.com>
Date:   Wed, 17 Nov 2021 10:46:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rafael,

On 11/16/21 7:05 PM, Rafael J. Wysocki wrote:
> On Mon, Nov 15, 2021 at 9:10 PM Thara Gopinath
> <thara.gopinath@linaro.org> wrote:
>>
>> cpuinfo.max_freq can reflect boost frequency if enabled during boot.  Since
>> we don't consider boost frequencies while calculating cpu capacities, use
>> policy->max to populate the freq_factor during boot up.
> 
> I'm not sure about this.  schedutil uses cpuinfo.max_freq as the max frequency.

Agree it's tricky how we treat the boost frequencies and also combine
them with thermal pressure.
We probably would have consider these design bits:
1. Should thermal pressure include boost frequency?
2. Should max capacity 1024 be a boost frequency so scheduler
    would see it explicitly?
- if no, then schedutil could still request boost freq thanks to
   map_util_perf() where we add 25% to the util and then
   map_util_freq() would return a boost freq when util was > 1024


I can see in schedutil only one place when cpuinfo.max_freq is used:
get_next_freq(). If the value stored in there is a boost,
then don't we get a higher freq value for the same util?
