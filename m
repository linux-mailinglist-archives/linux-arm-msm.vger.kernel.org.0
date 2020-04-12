Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (unknown [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE0E41A6115
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 01:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbgDLXMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 19:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.18]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726185AbgDLXMi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 19:12:38 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D8ECAC0A88B5;
        Sun, 12 Apr 2020 16:12:38 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 653811FB;
        Sun, 12 Apr 2020 16:12:38 -0700 (PDT)
Received: from [10.37.12.1] (unknown [10.37.12.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE55C3F73D;
        Sun, 12 Apr 2020 16:12:36 -0700 (PDT)
Subject: Re: [PATCH] coresight: tmc: Read TMC mode only when TMC hw is enabled
To:     saiprakash.ranjan@codeaurora.org, mathieu.poirier@linaro.org,
        mike.leach@linaro.org, swboyd@chromium.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20200409113538.5008-1-saiprakash.ranjan@codeaurora.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <9a792e3e-5a17-156d-4b59-4a3ec8f9993e@arm.com>
Date:   Mon, 13 Apr 2020 00:17:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200409113538.5008-1-saiprakash.ranjan@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sai,

On 04/09/2020 12:35 PM, Sai Prakash Ranjan wrote:
> Reading TMC mode register in tmc_read_prepare_etb without
> enabling the TMC hardware leads to async exceptions like
> the one in the call trace below. This can happen if the
> user tries to read the TMC etf data via device node without
> setting up source and the sink first which enables the TMC
> hardware in the path. So make sure that the TMC is enabled
> before we try to read TMC data.

So, one can trigger the same SError by simply :

$ cat /sys/bus/coresight/device/tmc_etb0/mgmt/mode


And also :

> 
>   Kernel panic - not syncing: Asynchronous SError Interrupt
>   CPU: 7 PID: 2605 Comm: hexdump Tainted: G S                5.4.30 #122
>   Call trace:
>    dump_backtrace+0x0/0x188
>    show_stack+0x20/0x2c
>    dump_stack+0xdc/0x144
>    panic+0x168/0x36c
>    panic+0x0/0x36c
>    arm64_serror_panic+0x78/0x84
>    do_serror+0x130/0x138
>    el1_error+0x84/0xf8
>    tmc_read_prepare_etb+0x88/0xb8
>    tmc_open+0x40/0xd8
>    misc_open+0x120/0x158
>    chrdev_open+0xb8/0x1a4
>    do_dentry_open+0x268/0x3a0
>    vfs_open+0x34/0x40
>    path_openat+0x39c/0xdf4
>    do_filp_open+0x90/0x10c
>    do_sys_open+0x150/0x3e8
>    __arm64_compat_sys_openat+0x28/0x34
>    el0_svc_common+0xa8/0x160
>    el0_svc_compat_handler+0x2c/0x38
>    el0_svc_compat+0x8/0x10
> 
> Fixes: 4525412a5046 ("coresight: tmc: making prepare/unprepare functions generic")
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>   drivers/hwtracing/coresight/coresight-tmc.c | 5 +++++
>   drivers/hwtracing/coresight/coresight-tmc.h | 1 +
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc.c b/drivers/hwtracing/coresight/coresight-tmc.c
> index 1cf82fa58289..7bae69748ab7 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc.c
> @@ -62,11 +62,13 @@ void tmc_flush_and_stop(struct tmc_drvdata *drvdata)
>   
>   void tmc_enable_hw(struct tmc_drvdata *drvdata)
>   {
> +	drvdata->enable = true;
>   	writel_relaxed(TMC_CTL_CAPT_EN, drvdata->base + TMC_CTL);
>   }
>   
>   void tmc_disable_hw(struct tmc_drvdata *drvdata)
>   {
> +	drvdata->enable = false;
>   	writel_relaxed(0x0, drvdata->base + TMC_CTL);
>   }
>   
> @@ -102,6 +104,9 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
>   {
>   	int ret = 0;
>   
> +	if (!drvdata->enable)
> +		return -EINVAL;
> +

Does this check always guarantee that the TMC is enabled when
we actually get to reading the MODE ? This needs to be done
under the spinlock.

Cheers
Suzuki



