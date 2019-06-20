Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2EC14CA3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 11:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726082AbfFTJGa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 05:06:30 -0400
Received: from foss.arm.com ([217.140.110.172]:54950 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725875AbfFTJG3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 05:06:29 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12584344;
        Thu, 20 Jun 2019 02:06:29 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F6EC3F246;
        Thu, 20 Jun 2019 02:06:27 -0700 (PDT)
Subject: Re: Coresight causes synchronous external abort on msm8916
To:     saiprakash.ranjan@codeaurora.org, stephan@gerhold.net,
        mathieu.poirier@linaro.org
Cc:     david.brown@linaro.org, sibis@codeaurora.org,
        rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        agross@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, mike.leach@linaro.org
References: <20190618202623.GA53651@gerhold.net>
 <a51f117f-c48d-d3f4-c3d1-9b584e3a055f@arm.com>
 <20190619183904.GB937@gerhold.net>
 <0dcea9a1-999d-7d85-267e-c3bfcfcfa95a@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <6589bf4d-5b39-c95e-0ee5-aaf35a87b40e@arm.com>
Date:   Thu, 20 Jun 2019 10:06:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <0dcea9a1-999d-7d85-267e-c3bfcfcfa95a@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/06/2019 07:29, Sai Prakash Ranjan wrote:
> Hi Stephan,
> 
> On 6/20/2019 12:09 AM, Stephan Gerhold wrote:
>> Hi,
>>
>> On Wed, Jun 19, 2019 at 09:49:03AM +0100, Suzuki K Poulose wrote:
>>> Hi Stephan,
>>>
>>> On 18/06/2019 21:26, Stephan Gerhold wrote:
>>>> Hi,
>>>>
>>>> I'm trying to run mainline Linux on a smartphone with MSM8916 SoC.
>>>> It works surprisingly well, but the coresight devices seem to cause the
>>>> following crash shortly after userspace starts:
>>>>
>>>>        Internal error: synchronous external abort: 96000010 [#1] PREEMPT SMP
>>>
>>> ...
>>>
>>>
>>>>
>>>> In this case I'm using a simple device tree similar to apq8016-sbc,
>>>> but it also happens using something as simple as msm8916-mtp.dts
>>>> on this particular device.
>>>>      (Attached: dmesg log with msm8916-mtp.dts and arm64 defconfig)
>>>>
>>>> I can avoid the crash and boot without any further problems by disabling
>>>> every coresight device defined in msm8916.dtsi, e.g.:
>>>>
>>>> 	tpiu@820000 { status = "disabled"; };
>>>
>>> ...
>>>
>>>>
>>>> I don't have any use for coresight at the moment,
>>>> but it seems somewhat odd to put this in the device specific dts.
>>>>
>>>> Any idea what could be causing this crash?
>>>
>>> This is mostly due to the missing power domain support. The CoreSight
>>> components are usually in a debug power domain. So unless that is turned on,
>>> (either by specifying proper power domain ids for power management protocol
>>> supported by the firmware OR via other hacks - e.g, connecting a DS-5 to
>>> keep the debug power domain turned on , this works on Juno -).
>>
>> Interesting, thanks a lot!
>>
>> In this case I'm wondering how it works on the Dragonboard 410c.
>> Does it enable these power domains in the firmware?
>>     (Assuming it boots without this error...)
>>
>> If coresight is not working properly on all/most msm8916 devices,
>> shouldn't coresight be disabled by default in msm8916.dtsi?
>> At least until those power domains can be set up by the kernel.
>>
>> If this is a device-specific issue, what would be an acceptable solution
>> for mainline?
>> Can I turn on these power domains from the kernel?
>> Or is it fine to disable coresight for this device with the snippet above?
>>
>> I'm not actually trying to use coresight, I just want the device to boot :)
>> And since I am considering submitting my device tree for inclusion in
>> mainline, I want to ask in advance how I should tackle this problem.
>>
>> Thanks!
>> Stephan
>>
> 
> This doesn't seem like cpuidle or debug power domain issue, but looks

We are not yet there in the Coresight driver and we crash at AMBA bus layer
trying to read the PID of the CoreSight device. So I doubt if this is an
issue your patch trying to address. I still think this is a debug power domain
issue. More your patch below.

> like cpu affinity issue. Can you please try out this patch and let us
> know?

In general I am for the patch, breaking the "assumption" that a missing CPU
phandle gives you the affinity of "0".

> 
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index e8819d750938..9acf9f190d42 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -579,7 +579,11 @@ static int debug_probe(struct amba_device *adev,
> const struct amba_id *id)
>    	if (!drvdata)
>    		return -ENOMEM;
> 
> -	drvdata->cpu = np ? of_coresight_get_cpu(np) : 0;
> +	drvdata->cpu = np ? of_coresight_get_cpu(np) : -ENODEV;


of_coresight_get_cpu() must be modified to return -ENODEV, rather than
defaulting to 0. This is something that is required by the CTI driver too.
And lets not bring up something and assume it belongs to CPU0.

> +	if (drvdata->cpu == -ENODEV) {
> +		return -ENODEV;
> +	}
> +
>    	if (per_cpu(debug_drvdata, drvdata->cpu)) {
>    		dev_err(dev, "CPU%d drvdata has already been initialized\n",
>    			drvdata->cpu);
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x.c
> b/drivers/hwtracing/coresight/coresight-etm4x.c
> index 8bb0092c7ec2..660432acbac0 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x.c
> @@ -1107,7 +1107,10 @@ static int etm4_probe(struct amba_device *adev,
> const struct amba_id *id)
> 
>    	spin_lock_init(&drvdata->spinlock);
> 
> -	drvdata->cpu = pdata ? pdata->cpu : 0;

I believe, we should simply abort when we don't have pdata. There is no point
in registering this ETM unless we know where this is connected to.

> +	drvdata->cpu = pdata ? pdata->cpu : -ENODEV;
> +	if (drvdata->cpu == -ENODEV) {
> +		return -ENODEV;
> +       }

> 
>    	cpus_read_lock();
>    	etmdrvdata[drvdata->cpu] = drvdata;
> diff --git a/drivers/hwtracing/coresight/of_coresight.c
> b/drivers/hwtracing/coresight/of_coresight.c
> index 7045930fc958..8c1b90ba233c 100644
> --- a/drivers/hwtracing/coresight/of_coresight.c
> +++ b/drivers/hwtracing/coresight/of_coresight.c
> @@ -153,14 +153,14 @@ int of_coresight_get_cpu(const struct device_node
> *node)
>    	struct device_node *dn;
> 
>    	dn = of_parse_phandle(node, "cpu", 0);
> -	/* Affinity defaults to CPU0 */
> +	/* Affinity defaults to invalid */
>    	if (!dn)
> -		return 0;
> +		return -ENODEV;
>    	cpu = of_cpu_node_to_id(dn);
>    	of_node_put(dn);
> 
> -	/* Affinity to CPU0 if no cpu nodes are found */
> -	return (cpu < 0) ? 0 : cpu;
> +	/* Affinity to invalid if no cpu nodes are found */
> +	return (cpu < 0) ? -ENODEV : cpu;

	return cpu ?

If you split this into 3 different patches, I would be happy to Ack them.

Mathieu,

What do you think ?


Cheers
Suzuki
