Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA32F1FD03D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 17:03:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgFQPDc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 11:03:32 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:48598 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726491AbgFQPDb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 11:03:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592406210; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3AFzlHE002JKH4sqLw68GR2u+wU+FRloVI3U+58b50c=; b=RqTm7m7hyM8Vj041BFokABTLrM5HScTorcUxXXwvPdNlPhGhVartfhcXwrOkOAoboA418FdX
 JcjwHvip2EQHNhEYonoufoubD6FkidCKdRLKzvN0gcP3MvALlEVLRR2RG4fgJyJdtjhTOlF9
 /4nDkNU0hNlVjohKLBGghCzo7j4=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5eea30b8c76a4e7a2a2081a2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Jun 2020 15:03:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CFE7FC433CA; Wed, 17 Jun 2020 15:03:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E629BC433C9;
        Wed, 17 Jun 2020 15:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E629BC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 3/4] nvmem: qfprom: Add fuse blowing support
To:     Douglas Anderson <dianders@chromium.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        linux-kernel@vger.kernel.org
References: <20200617145116.247432-1-dianders@chromium.org>
 <20200617074930.v3.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <559d8a23-ec50-30ab-3ff6-ce524d1b6be8@codeaurora.org>
Date:   Wed, 17 Jun 2020 09:03:16 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200617074930.v3.3.I68222d0b5966f652f29dd3a73ab33551a6e3b7e0@changeid>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/17/2020 8:51 AM, Douglas Anderson wrote:
> From: Ravi Kumar Bokka <rbokka@codeaurora.org>
> 
> This patch adds support for blowing fuses to the qfprom driver if the
> required properties are defined in the device tree.
> 
> Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Please double-check that I got the major/minor version logic right
> here.  I don't have documentation for this, but Srinivas mentioned
> that it was at address 0x6000 and I happened to find an "8" and a "7"
> on sc7180 so I assumed that was the major and minor version.
> 
> Changes in v3:
> - Don't provide "reset" value for things; just save/restore.
> - Use the major/minor version read from 0x6000.
> - Reading should still read "corrected", not "raw".
> - Added a sysfs knob to allow you to read "raw" instead of "corrected"
> - Simplified the SoC data structure.
> - No need for quite so many levels of abstraction for clocks/regulator.
> - Don't set regulator voltage.  Rely on device tree to make sure it's right.
> - Properly undo things in the case of failure.
> - Don't just keep enabling the regulator over and over again.
> - Enable / disable the clock each time
> - Polling every 100 us but timing out in 10 us didn't make sense; swap.
> - No reason for 100 us to be SoC specific.
> - No need for reg-names.
> - We shouldn't be creating two separate nvmem devices.
> 
>   drivers/nvmem/qfprom.c | 314 +++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 303 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/nvmem/qfprom.c b/drivers/nvmem/qfprom.c
> index 8a91717600be..486202860f84 100644
> --- a/drivers/nvmem/qfprom.c
> +++ b/drivers/nvmem/qfprom.c
> @@ -3,57 +3,349 @@
>    * Copyright (C) 2015 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>    */
>   
> +#include <linux/clk.h>
>   #include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/kernel.h>
>   #include <linux/module.h>
>   #include <linux/mod_devicetable.h>
> -#include <linux/io.h>
>   #include <linux/nvmem-provider.h>
>   #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +
> +/* Blow timer clock frequency in Mhz */
> +#define QFPROM_BLOW_TIMER_OFFSET 0x03c
> +
> +/* Amount of time required to hold charge to blow fuse in micro-seconds */
> +#define QFPROM_FUSE_BLOW_POLL_US	10
> +#define QFPROM_FUSE_BLOW_TIMEOUT_US	100
> +
> +#define QFPROM_BLOW_STATUS_OFFSET	0x048
> +#define QFPROM_BLOW_STATUS_BUSY		0x1
> +#define QFPROM_BLOW_STATUS_READY	0x0
> +
> +#define QFPROM_ACCEL_OFFSET		0x044
> +
> +#define QFPROM_VERSION_OFFSET		0x0
> +#define QFPROM_MAJOR_VERSION_SHIFT	28
> +#define QFPROM_MAJOR_VERSION_MASK	0xf
> +#define QFPROM_MINOR_VERSION_SHIFT	16
> +#define QFPROM_MINOR_VERSION_MASK	0xf

Minor looks wrong.  Documentation says bits 27:16 are the minor version, 
and bits 15:0 are step.  I think your minor mask needs to be 0xfff.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
