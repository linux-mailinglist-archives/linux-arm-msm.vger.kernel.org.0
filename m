Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E522B2D53B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2019 07:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbfE2F5S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 May 2019 01:57:18 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:33968 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfE2F5R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 May 2019 01:57:17 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EE64D60795; Wed, 29 May 2019 05:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559109436;
        bh=74Ne9sS3vTkaD1mJsi9vabiBu9b2KjBQaNeK5Xh8kGI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZS5kwl9p9omyxADk65Nf5iKFRGfND8XHq2UDHz8d59MZAecFVTIOFxcROO9Ig/jZq
         D6IRrGSMi0Uaylok6Ezt64S3YGWbE55OSyAu5Hu+miXQPWbR8MlYelIjaAQihMbu0y
         A7uopP5u5fDbL8ky7zDy9X1OJbMZjwfeb4GA52AM=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.129.124] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vivek.gautam@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A66396029B;
        Wed, 29 May 2019 05:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1559109436;
        bh=74Ne9sS3vTkaD1mJsi9vabiBu9b2KjBQaNeK5Xh8kGI=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ZS5kwl9p9omyxADk65Nf5iKFRGfND8XHq2UDHz8d59MZAecFVTIOFxcROO9Ig/jZq
         D6IRrGSMi0Uaylok6Ezt64S3YGWbE55OSyAu5Hu+miXQPWbR8MlYelIjaAQihMbu0y
         A7uopP5u5fDbL8ky7zDy9X1OJbMZjwfeb4GA52AM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A66396029B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=vivek.gautam@codeaurora.org
Subject: Re: [PATCH 1/1] drm/panel: truly: Add additional delay after pulling
 down reset gpio
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>, airlied@linux.ie,
        thierry.reding@gmail.com, daniel@ffwll.ch
Cc:     Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20190527102616.28315-1-vivek.gautam@codeaurora.org>
 <7dfcf294-6ab1-c1ce-352d-dfdeec4347af@free.fr>
From:   Vivek Gautam <vivek.gautam@codeaurora.org>
Message-ID: <e260c253-66af-cb09-f685-8bf62f0d5547@codeaurora.org>
Date:   Wed, 29 May 2019 11:27:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <7dfcf294-6ab1-c1ce-352d-dfdeec4347af@free.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/28/2019 2:13 PM, Marc Gonzalez wrote:
> On 27/05/2019 12:26, Vivek Gautam wrote:
>
>> MTP SDM845 panel seems to need additional delay to bring panel
>> to a workable state. Running modetest without this change displays
>> blurry artifacts.
>>
>> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
>> ---
>>   drivers/gpu/drm/panel/panel-truly-nt35597.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
>> index fc2a66c53db4..aa7153fd3be4 100644
>> --- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
>> +++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
>> @@ -280,6 +280,7 @@ static int truly_35597_power_on(struct truly_nt35597 *ctx)
>>   	gpiod_set_value(ctx->reset_gpio, 1);
>>   	usleep_range(10000, 20000);
>>   	gpiod_set_value(ctx->reset_gpio, 0);
>> +	usleep_range(10000, 20000);
> I'm not sure usleep_range() makes sense with these values.
>
> AFAIU, usleep_range() is typically used for sub-jiffy sleeps, and is based
> on HRT to generate an interrupt.
>
> Once we get into jiffy granularity, it seems to me msleep() is good enough.
> IIUC, it would piggy-back on the jiffy timer interrupt.
>
> In short, why not just use msleep(10); ?

I am just maintaining the symmetry across older code.

Thanks
Vivek
>
> Regards.

