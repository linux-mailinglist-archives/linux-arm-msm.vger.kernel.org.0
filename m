Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00AFA434B9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 14:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbhJTM4W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 08:56:22 -0400
Received: from foss.arm.com ([217.140.110.172]:59878 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229817AbhJTM4W (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 08:56:22 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA1551FB;
        Wed, 20 Oct 2021 05:54:07 -0700 (PDT)
Received: from [10.57.23.81] (unknown [10.57.23.81])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 83E853F73D;
        Wed, 20 Oct 2021 05:54:06 -0700 (PDT)
Subject: Re: [PATCH] PM: EM: do not allow pd creation prior to debugfs
 initialization
To:     Chandrasekhar L <clingutla@codeaurora.org>
Cc:     rafael.j.wysocki@intel.com, qperret@google.com,
        daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20211019152819.6141-1-clingutla@codeaurora.org>
 <e01188a0-1dc7-db57-309f-f49390216875@arm.com>
 <0c42bec7-4358-a8d6-b1db-f52218a8e59a@codeaurora.org>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <c2d9dfa8-d7ac-d9ca-fab8-3d93c6a9e0bc@arm.com>
Date:   Wed, 20 Oct 2021 13:54:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0c42bec7-4358-a8d6-b1db-f52218a8e59a@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/20/21 1:03 PM, Chandrasekhar L wrote:
> Thanks Lukasz for comment.
> For any reason (ex: HW dependency, etc), if  init_call level of cpufreq/devfreq driver changed
> prior to fs_init call, we would land there right?

It's not the same triggering point, so we should be safe.

> 
> One of such example is, 'drivers/cpufreq/qcom-cpufreq-hw.c' uses postcore_initcall().

It uses the postcore_initcall to probe and register a driver into
the cpufreq framework. Then the cpufreq framework later constructs the
'policy' and calls your cpufreq_driver::init() function that your
driver provided during registration. Thus, these are two different
phases. It used to be true that if a driver required to use an
'advanced' EM registration with custom private 'em_data_callback',
we put the registration call into that .init() code [1] (old [2]).
Recently Viresh added a dedicated callback for this, which IMO
is good and avoids confusion where to put that custom registration
code.

In your driver code, there is also this callback but using a
generic function [3]. It's a 'simple' EM, which is based on OPP
framework helper. A few drivers use that option, if their platform
doesn't need the 'advanced' EM (but that's not in $subject).

Regards,
Lukasz


[1] 
https://elixir.bootlin.com/linux/v5.15-rc1/source/drivers/cpufreq/scmi-cpufreq.c#L249
[2] 
https://elixir.bootlin.com/linux/v5.14/source/drivers/cpufreq/scmi-cpufreq.c#L192
[3] 
https://elixir.bootlin.com/linux/v5.15-rc6/source/drivers/cpufreq/qcom-cpufreq-hw.c#L561
