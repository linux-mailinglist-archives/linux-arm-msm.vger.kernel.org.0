Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1036E4E3AD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 11:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbfFUJhP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 05:37:15 -0400
Received: from foss.arm.com ([217.140.110.172]:53634 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbfFUJhP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 05:37:15 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 68334142F;
        Fri, 21 Jun 2019 02:37:14 -0700 (PDT)
Received: from [10.37.13.79] (unknown [10.37.13.79])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2ED413F246;
        Fri, 21 Jun 2019 02:37:12 -0700 (PDT)
Subject: Re: [PATCHv2 2/2] coresight: Abort probe if cpus are not available
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        alexander.shishkin@linux.intel.com, david.brown@linaro.org,
        mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1561054498.git.saiprakash.ranjan@codeaurora.org>
 <65050e4cb2b0433f3cb9b1ca0bf6ec49d0751086.1561054498.git.saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <d6e6a32e-4e15-5bc8-42f9-6cfe72fc0910@arm.com>
Date:   Fri, 21 Jun 2019 10:40:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <65050e4cb2b0433f3cb9b1ca0bf6ec49d0751086.1561054498.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/20/2019 07:31 PM, Sai Prakash Ranjan wrote:
> Currently coresight etm and cpu-debug will go ahead with
> the probe even when corresponding cpus are not available
> and error out later in the probe path. In such cases, it
> is better to abort the probe earlier.
> 
> Without this, setting *nosmp* will throw below errors:
> 
>   [    5.910622] coresight-cpu-debug 850000.debug: Coresight debug-CPU0 initialized
>   [    5.914266] coresight-cpu-debug 852000.debug: CPU1 debug arch init failed
>   [    5.921474] coresight-cpu-debug 854000.debug: CPU2 debug arch init failed
>   [    5.928328] coresight-cpu-debug 856000.debug: CPU3 debug arch init failed
>   [    5.935330] coresight etm0: CPU0: ETM v4.0 initialized
>   [    5.941875] coresight-etm4x 85d000.etm: ETM arch init failed
>   [    5.946794] coresight-etm4x: probe of 85d000.etm failed with error -22
>   [    5.952707] coresight-etm4x 85e000.etm: ETM arch init failed
>   [    5.958945] coresight-etm4x: probe of 85e000.etm failed with error -22
>   [    5.964853] coresight-etm4x 85f000.etm: ETM arch init failed
>   [    5.971096] coresight-etm4x: probe of 85f000.etm failed with error -22

That is expected. What else do you expect ?

> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/hwtracing/coresight/coresight-platform.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 8b03fa573684..3f4559596c6b 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -168,6 +168,9 @@ static int of_coresight_get_cpu(struct device *dev)
>   	cpu = of_cpu_node_to_id(dn);
>   	of_node_put(dn);
>   
> +	if (num_online_cpus() <= cpu)
> +		return -ENODEV;

That is a pointless and terribly wrong check. What if you have only 2
online CPUs (CPU0 and CPU4) and you were processing the ETM for CPU4 ?

More over you should simply let the driver handle a case where the CPU
is not online. May be the driver could register a hotplug notifier and
bring itself up when the CPU comes online.

So, please drop this patch.

Kind regards
Suzuki
