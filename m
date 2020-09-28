Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3715227AC5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Sep 2020 13:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgI1LBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Sep 2020 07:01:12 -0400
Received: from foss.arm.com ([217.140.110.172]:49382 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726504AbgI1LBM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Sep 2020 07:01:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85DFF31B;
        Mon, 28 Sep 2020 04:01:11 -0700 (PDT)
Received: from [10.57.49.135] (unknown [10.57.49.135])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A89883F6CF;
        Mon, 28 Sep 2020 04:01:09 -0700 (PDT)
Subject: Re: [PATCH 2/2] coresight: etm4x: Fix save and restore of
 TRCVMIDCCTLR1 register
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        mike.leach@linaro.org, leo.yan@linaro.org
Cc:     alexander.shishkin@linux.intel.com, peterz@infradead.org,
        coresight@lists.linaro.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, denik@google.com
References: <cover.1601222348.git.saiprakash.ranjan@codeaurora.org>
 <19e06f26c1e4b0bf48d3971e2f1fb1af27da159a.1601222348.git.saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <0e0bc2fd-0449-35bc-882a-3b942a55fda4@arm.com>
Date:   Mon, 28 Sep 2020 12:05:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <19e06f26c1e4b0bf48d3971e2f1fb1af27da159a.1601222348.git.saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On 09/27/2020 05:20 PM, Sai Prakash Ranjan wrote:
> In commit f188b5e76aae ("coresight: etm4x: Save/restore state
> across CPU low power states"), mistakenly TRCVMIDCCTLR1 register
> value was saved in trcvmidcctlr0 state variable which is used to
> store TRCVMIDCCTLR0 register value in etm4x_cpu_save() and then
> same value is written back to both TRCVMIDCCTLR0 and TRCVMIDCCTLR1
> in etm4x_cpu_restore(). There is already a trcvmidcctlr1 state
> variable available for TRCVMIDCCTLR1, so use it.
> 
> Fixes: 8b44fdfef6a2 ("coresight: etm4x: Allow etm4x to be built as a module")

Why is this commit in question ?

> Fixes: f188b5e76aae ("coresight: etm4x: Save/restore state across CPU low power states")

I believe this is the right fixes tag.

> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index de76d57850bc..abd706b216ac 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1243,7 +1243,7 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   	state->trccidcctlr1 = readl(drvdata->base + TRCCIDCCTLR1);
>   
>   	state->trcvmidcctlr0 = readl(drvdata->base + TRCVMIDCCTLR0);
> -	state->trcvmidcctlr0 = readl(drvdata->base + TRCVMIDCCTLR1);
> +	state->trcvmidcctlr1 = readl(drvdata->base + TRCVMIDCCTLR1);
>   
>   	state->trcclaimset = readl(drvdata->base + TRCCLAIMCLR);
>   
> @@ -1353,7 +1353,7 @@ static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   	writel_relaxed(state->trccidcctlr1, drvdata->base + TRCCIDCCTLR1);
>   
>   	writel_relaxed(state->trcvmidcctlr0, drvdata->base + TRCVMIDCCTLR0);
> -	writel_relaxed(state->trcvmidcctlr0, drvdata->base + TRCVMIDCCTLR1);
> +	writel_relaxed(state->trcvmidcctlr1, drvdata->base + TRCVMIDCCTLR1);
>   

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
