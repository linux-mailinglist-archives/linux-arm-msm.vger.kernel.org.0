Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 686C14544C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 11:12:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234732AbhKQKPh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 05:15:37 -0500
Received: from foss.arm.com ([217.140.110.172]:54984 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233876AbhKQKPg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 05:15:36 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39A7BD6E;
        Wed, 17 Nov 2021 02:12:38 -0800 (PST)
Received: from [10.57.24.78] (unknown [10.57.24.78])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A08E3F70D;
        Wed, 17 Nov 2021 02:12:36 -0800 (PST)
Subject: Re: [PATCH] base: arch_topology: Use policy->max to calculate
 freq_factor
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     sudeep.holla@arm.com, gregkh@linuxfoundation.org,
        rafael@kernel.org, bjorn.andersson@linaro.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <bce694fc-432c-846b-bd96-592368d12e20@arm.com>
Date:   Wed, 17 Nov 2021 10:12:34 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20211115201010.68567-1-thara.gopinath@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/15/21 8:10 PM, Thara Gopinath wrote:
> cpuinfo.max_freq can reflect boost frequency if enabled during boot.  Since
> we don't consider boost frequencies while calculating cpu capacities, use
> policy->max to populate the freq_factor during boot up.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>   drivers/base/arch_topology.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 43407665918f..df818b439bc3 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -334,7 +334,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>   	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>   
>   	for_each_cpu(cpu, policy->related_cpus)
> -		per_cpu(freq_factor, cpu) = policy->cpuinfo.max_freq / 1000;
> +		per_cpu(freq_factor, cpu) = policy->max / 1000;
>   
>   	if (cpumask_empty(cpus_to_visit)) {
>   		topology_normalize_cpu_scale();
> 

LGTM

Reviewed-by: Lukasz Luba <lukasz.luba@armc.com>
