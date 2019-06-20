Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B12B4CFA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 15:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfFTNzX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 09:55:23 -0400
Received: from foss.arm.com ([217.140.110.172]:39692 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbfFTNzX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 09:55:23 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E2D90344;
        Thu, 20 Jun 2019 06:55:22 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55DE23F718;
        Thu, 20 Jun 2019 06:55:21 -0700 (PDT)
Subject: Re: [PATCH 1/2] coresight: Set affinity to invalid for missing CPU
 phandle
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        andy.gross@linaro.org, david.brown@linaro.org, mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <49d6554536047b9f5526c4ea33990b7c904673d3.1561037262.git.saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <f7a3592b-7ed7-b011-9ae1-dc2ca0e49ae4@arm.com>
Date:   Thu, 20 Jun 2019 14:55:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <49d6554536047b9f5526c4ea33990b7c904673d3.1561037262.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Sai,

Thanks for the patch. Please could you change the subject to :

"coresight: Do not default to CPU0 for missing CPU phandle"

On 20/06/2019 14:45, Sai Prakash Ranjan wrote:
> Affinity defaults to CPU0 in case of missing CPU phandle
> and this leads to crashes in some cases because of such
> wrong assumption. Fix this by returning -ENODEV in

Thats not the right justification. Causing crashes is due to
bad DT/firmware. I would be happy with something like :

"Coresight platform support assumes that a missing \"cpu\" phandle
defaults to CPU0. This could be problematic and unnecessarily binds
components to CPU0, where they may not be. Let us make the DT binding
rules a bit stricter by not defaulting to CPU0 for missing "cpu"
affinity information."

Also, you must

1) update the devicetree/bindings document to reflect the same.
2) update the drivers to take appropriate action on the missing CPU
    where they are expected (e.g, CPU-debug, etm*), to prevent
    breaking a bisect.


> coresight platform for such cases and then handle it
> in the coresight drivers.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/hwtracing/coresight/coresight-platform.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 3c5ceda8db24..b1ea60c210e1 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -160,15 +160,17 @@ static int of_coresight_get_cpu(struct device *dev)
>   
>   	if (!dev->of_node)
>   		return 0;
> +
>   	dn = of_parse_phandle(dev->of_node, "cpu", 0);
> -	/* Affinity defaults to CPU0 */
> +
> +	/* Affinity defaults to invalid if no cpu nodes are found*/

The code is self explanatory here. You could drop the comment.

>   	if (!dn)
> -		return 0;
> +		return -ENODEV;
> +
>   	cpu = of_cpu_node_to_id(dn);
>   	of_node_put(dn);
>   
> -	/* Affinity to CPU0 if no cpu nodes are found */
> -	return (cpu < 0) ? 0 : cpu;
> +	return cpu;
>   }
>   

Suzuki
