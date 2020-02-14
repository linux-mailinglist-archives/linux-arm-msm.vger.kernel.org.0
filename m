Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E44315D2B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 08:17:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726048AbgBNHRT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 02:17:19 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:59310 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728881AbgBNHRS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 02:17:18 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581664638; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=sP5WtyrgrEHAKWYiObPllSAd3IaK/BsaP+Vmqe+1xh0=; b=r0exidjXFJx22G1awATevnJ9uTJOn/ozJ7Rl72fW744FN4FGu7eY9hHYFUXIZqYTr9rv+Xio
 1JGt+1RNC1mYmJDVML4HI4Et901sj2YWgo89OeAJXjx6AJXvkCs53vO7RLedQoyL/nzHoYPr
 sYOMQRptMLkkPJV2E4Z0/TjxoOI=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e46497e.7f0e2ee3a810-smtp-out-n03;
 Fri, 14 Feb 2020 07:17:18 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 119E6C4479D; Fri, 14 Feb 2020 07:17:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.204.79.15] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mojha)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4164BC4479F;
        Fri, 14 Feb 2020 07:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4164BC4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mojha@codeaurora.org
Subject: Re: [PATCH] nvmem: core: Fix msb clearing bits
To:     Shadab Naseem <snaseem@codeaurora.org>,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        neeraju@codeaurora.org
References: <1580474635-11965-1-git-send-email-snaseem@codeaurora.org>
From:   Mukesh Ojha <mojha@codeaurora.org>
Message-ID: <06a518e3-cff4-e2e0-2a4b-f4bfa2c6dcdc@codeaurora.org>
Date:   Fri, 14 Feb 2020 12:46:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1580474635-11965-1-git-send-email-snaseem@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 1/31/2020 6:13 PM, Shadab Naseem wrote:
> When clearing the msb bits of the resultant buffer, it is
> masked with the modulo of the number of bits needed with
> respect to the BITS_PER_BYTE. To mask out the buffer,
> it is passed though GENMASK of the remainder of the bits
> starting from zeroth bit. This case is valid if nbits is not
> a multiple of BITS_PER_BYTE and you are actually creating
> a GENMASK. If the nbits coming is a multiple of BITS_PER_BYTE,
> it would pass a negative value to the high bit number of
> GENMASK with zero as the lower bit number.
>
> As per the definition of the GENMASK, the higher bit number (h)
> is right operand for bitwise right shift. If the value of the
> right operand is negative or is greater or equal to the number
> of bits in the promoted left operand, the behavior is undefined.
> So passing a negative value to GENMASK could behave differently
> across architecture, specifically between 64 and 32 bit.
> Also, on passing the hard-coded negative value as GENMASK(-1, 0)
> is giving compiler warning for shift-count-overflow.
> Hence making a check for clearing the MSB if the nbits are not
> a multiple of BITS_PER_BYTE.
>
> Signed-off-by: Shadab Naseem <snaseem@codeaurora.org>
> ---
>   drivers/nvmem/core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 1e4a798..23c1547 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -926,7 +926,8 @@ static void nvmem_shift_read_buffer_in_place(struct nvmem_cell *cell, void *buf)
>   		*p-- = 0;
>   
>   	/* clear msb bits if any leftover in the last byte */
> -	*p &= GENMASK((cell->nbits%BITS_PER_BYTE) - 1, 0);
> +	if (cell->nbits%BITS_PER_BYTE)
> +		*p &= GENMASK((cell->nbits%BITS_PER_BYTE) - 1, 0);


LGTM..

Reviewed-by: mojha@codeaurora.org


Thanks
Mukesh

>   }
>   
>   static int __nvmem_cell_read(struct nvmem_device *nvmem,
