Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E63FF4E471
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2019 11:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbfFUJpR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Jun 2019 05:45:17 -0400
Received: from foss.arm.com ([217.140.110.172]:54754 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726210AbfFUJpR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Jun 2019 05:45:17 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D939142F;
        Fri, 21 Jun 2019 02:45:16 -0700 (PDT)
Received: from [10.37.13.79] (unknown [10.37.13.79])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5A6DC3F246;
        Fri, 21 Jun 2019 02:45:14 -0700 (PDT)
Subject: Re: [PATCHv2 1/2] coresight: Do not default to CPU0 for missing CPU
 phandle
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        leo.yan@linaro.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
        alexander.shishkin@linux.intel.com, david.brown@linaro.org,
        mark.rutland@arm.com
Cc:     rnayak@codeaurora.org, vivek.gautam@codeaurora.org,
        sibis@codeaurora.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <cover.1561054498.git.saiprakash.ranjan@codeaurora.org>
 <92a33fa58c77206b338220427e92dabbd1d197f7.1561054498.git.saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <4176442c-feb8-5245-2b27-afcdb9a6247c@arm.com>
Date:   Fri, 21 Jun 2019 10:48:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <92a33fa58c77206b338220427e92dabbd1d197f7.1561054498.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,


On 06/20/2019 07:31 PM, Sai Prakash Ranjan wrote:
> Coresight platform support assumes that a missing "cpu" phandle
> defaults to CPU0. This could be problematic and unnecessarily binds
> components to CPU0, where they may not be. Let us make the DT binding
> rules a bit stricter by not defaulting to CPU0 for missing "cpu"
> affinity information.
> 
> Also in coresight etm and cpu-debug drivers, abort the probe
> for such cases.
> 
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Please drop this tag for now.

> ---
>   Documentation/devicetree/bindings/arm/coresight.txt |  2 +-
>   drivers/hwtracing/coresight/coresight-cpu-debug.c   |  3 +++
>   drivers/hwtracing/coresight/coresight-etm3x.c       |  3 +++
>   drivers/hwtracing/coresight/coresight-etm4x.c       |  3 +++
>   drivers/hwtracing/coresight/coresight-platform.c    | 10 +++++-----
>   5 files changed, 15 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/coresight.txt b/Documentation/devicetree/bindings/arm/coresight.txt
> index 8a88ddebc1a2..c4659ba9457d 100644
> --- a/Documentation/devicetree/bindings/arm/coresight.txt
> +++ b/Documentation/devicetree/bindings/arm/coresight.txt
> @@ -88,7 +88,7 @@ its hardware characteristcs.
>   	  registers via co-processor 14.
>   
>   	* cpu: the cpu phandle this ETM/PTM is affined to. When omitted the
> -	  source is considered to belong to CPU0.
> +	  affinity is set to invalid.
>   

Please move this from the "Optional properties". It is not "Optional"
anymore with this change. Please make sure it is evident that this
is mandatory. Also please fix the bindings document for cpu-debug.txt.


>   * Optional property for TMC:
>   

> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 3c5ceda8db24..8b03fa573684 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -159,16 +159,16 @@ static int of_coresight_get_cpu(struct device *dev)
>   	struct device_node *dn;
>   
>   	if (!dev->of_node)
> -		return 0;
> +		return -ENODEV;
> +
>   	dn = of_parse_phandle(dev->of_node, "cpu", 0);
> -	/* Affinity defaults to CPU0 */
>   	if (!dn)
> -		return 0;
> +		return -ENODEV;
> +
>   	cpu = of_cpu_node_to_id(dn);
>   	of_node_put(dn);
>   

Please fix the acpi_coresight_get_cpu() for ACPI.

Rest looks fine to me.

Suzuki
