Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6971F4CFB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2019 15:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfFTN6a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jun 2019 09:58:30 -0400
Received: from foss.arm.com ([217.140.110.172]:39850 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726686AbfFTN6a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jun 2019 09:58:30 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB885344;
        Thu, 20 Jun 2019 06:58:29 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 39AC53F718;
        Thu, 20 Jun 2019 06:58:28 -0700 (PDT)
Subject: Re: [PATCH 2/2] coresight: Abort probe for missing CPU phandle
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, alexander.shishkin@linux.intel.com,
        david.brown@linaro.org, mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1561037262.git.saiprakash.ranjan@codeaurora.org>
 <d93e28fc80227f9a385130a766a24f8f39a1dcf0.1561037262.git.saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <1ddee3c1-8299-1991-eb88-151b9c3ee180@arm.com>
Date:   Thu, 20 Jun 2019 14:58:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d93e28fc80227f9a385130a766a24f8f39a1dcf0.1561037262.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20/06/2019 14:45, Sai Prakash Ranjan wrote:
> Currently the coresight etm and cpu-debug drivers
> assume the affinity to CPU0 returned by coresight
> platform and continue the probe in case of missing
> CPU phandle. This is not true and leads to crash
> in some cases, so abort the probe in case of missing
> CPU phandle.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/hwtracing/coresight/coresight-cpu-debug.c | 3 +++
>   drivers/hwtracing/coresight/coresight-etm3x.c     | 3 +++
>   drivers/hwtracing/coresight/coresight-etm4x.c     | 3 +++
>   3 files changed, 9 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> index 07a1367c733f..43f32fa71ff9 100644
> --- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
> +++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
> @@ -579,6 +579,9 @@ static int debug_probe(struct amba_device *adev, const struct amba_id *id)
>   		return -ENOMEM;
>   
>   	drvdata->cpu = coresight_get_cpu(dev);
> +	if (drvdata->cpu == -ENODEV)
> +		return -ENODEV;

if (drvdata->cpu < 0)
	return drvdata->cpu;

Same everywhere below ?

Also, I would like to hear Mathieu's thoughts on this change. If he's OK
with it:

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com> with the change above.




