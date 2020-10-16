Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0BBF2903F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 13:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394785AbgJPLVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 07:21:20 -0400
Received: from foss.arm.com ([217.140.110.172]:34886 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394660AbgJPLVT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 07:21:19 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0B38ED6E;
        Fri, 16 Oct 2020 04:21:19 -0700 (PDT)
Received: from [10.57.50.28] (unknown [10.57.50.28])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1EFC43F719;
        Fri, 16 Oct 2020 04:21:16 -0700 (PDT)
Subject: Re: [PATCH] coresight: etm4x: Skip setting LPOVERRIDE bit for
 qcom,skip-power-up
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, Stephen Boyd <swboyd@chromium.org>,
        denik@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20201016101025.26505-1-saiprakash.ranjan@codeaurora.org>
From:   Suzuki Poulose <suzuki.poulose@arm.com>
Message-ID: <5c4f6f5d-b07d-0816-331f-7c7463fa99b3@arm.com>
Date:   Fri, 16 Oct 2020 12:21:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201016101025.26505-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On 10/16/20 11:10 AM, Sai Prakash Ranjan wrote:
> There is a bug on the systems supporting to skip power up
> (qcom,skip-power-up) where setting LPOVERRIDE bit(low-power
> state override behaviour) will result in CPU hangs/lockups
> even on the implementations which supports it. So skip
> setting the LPOVERRIDE bit for such platforms.
> 
> Fixes: 02510a5aa78d ("coresight: etm4x: Add support to skip trace unit power up")
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>

The fix is fine by me. Btw, is there a hardware Erratum assigned for
this ? It would be good to have the Erratum documented somewhere,
preferrably ( Documentation/arm64/silicon-errata.rst )

> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index abd706b216ac..6096d7abf80d 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -779,7 +779,7 @@ static void etm4_init_arch_data(void *info)
>   	 * LPOVERRIDE, bit[23] implementation supports
>   	 * low-power state override
>   	 */
> -	if (BMVAL(etmidr5, 23, 23))
> +	if (BMVAL(etmidr5, 23, 23) && (!drvdata->skip_power_up))
>   		drvdata->lpoverride = true;
>   	else
>   		drvdata->lpoverride = false;
> 
> base-commit: 3477326277451000bc667dfcc4fd0774c039184c
> 

