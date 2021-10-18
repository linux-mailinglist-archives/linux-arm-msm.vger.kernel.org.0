Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61FB04325E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 20:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhJRSHD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 14:07:03 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:60919 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhJRSHC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 14:07:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634580291; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=SUWZB9KOSx7eMRkpWGVYj84V/I8WTnVES96xnJl+xhI=; b=fPKjpRY0bKeHR4y2KIr7JFjS5nwI8wInuptmhyef0dstOFx+uVp3THLjise1FTbXQjsp9TdW
 NEhCgXNTBMQCIxbPs2l9hedUzkN5aTqufJAXe8LN6ZMzyjp0AwlvnmJaXQhWSkJIR7qUUa6p
 RUnVwBH4T8zzuMl63TuwdgxC42Q=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 616db7020605239689e132f1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Oct 2021 18:03:46
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2E3AC4360C; Mon, 18 Oct 2021 18:03:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [172.20.10.6] (mobile-166-170-49-175.mycingular.net [166.170.49.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 42747C4338F;
        Mon, 18 Oct 2021 18:03:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 42747C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <f36341b8-8957-a265-59a6-f5ca9759574c@codeaurora.org>
Date:   Mon, 18 Oct 2021 11:03:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [bug report] drm/msm: dsi: Handle dual-channel for 6G as well
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <seanpaul@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>
References: <20211001123115.GE2283@kili>
 <144b8ba5-82db-fc90-1d0f-5a8e2ce45c90@codeaurora.org>
 <CAA8EJpoDfWRT48J=G5-VQcHC6Zg8D-0VujjnjQyvHD0PQ=SoKQ@mail.gmail.com>
 <1f3f3047-327e-15dd-3179-d012edfc1865@quicinc.com>
 <20211016193515.GA2083@kadam>
From:   Jessica Zhang <jesszhan@codeaurora.org>
In-Reply-To: <20211016193515.GA2083@kadam>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/16/2021 12:35 PM, Dan Carpenter wrote:
> On Fri, Oct 15, 2021 at 12:34:20PM -0700, Jessica Zhang wrote:
>> Hey Dmitry,
>>
>> On 10/15/2021 11:24 AM, Dmitry Baryshkov wrote:
>>> On Fri, 15 Oct 2021 at 04:43, Jessica Zhang <jesszhan@codeaurora.org> wrote:
>>>> Hey Dan,
>>>>
>>>> On 10/1/2021 5:31 AM, Dan Carpenter wrote:
>>>>> Hello Sean Paul,
>>>>>
>>>>> The patch a6bcddbc2ee1: "drm/msm: dsi: Handle dual-channel for 6G as
>>>>> well" from Jul 25, 2018, leads to the following
>>>>> Smatch static checker warning:
>>>>>
>>>>>         drivers/gpu/drm/msm/dsi/dsi_host.c:729 dsi_calc_clk_rate_6g()
>>>>>         warn: wrong type for 'msm_host->esc_clk_rate' (should be 'ulong')
>>>>>
>>>>> drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>        721 int dsi_calc_clk_rate_6g(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>>        722 {
>>>>>        723         if (!msm_host->mode) {
>>>>>        724                 pr_err("%s: mode not set\n", __func__);
>>>>>        725                 return -EINVAL;
>>>>>        726         }
>>>>>        727
>>>>>        728         dsi_calc_pclk(msm_host, is_bonded_dsi);
>>>>> --> 729         msm_host->esc_clk_rate = clk_get_rate(msm_host->esc_clk);
>>>>>                    ^^^^^^^^^^^^^^^^^^^^^^
>>>>> I don't know why Smatch is suddenly warning about ancient msm code, but
>>>>> clock rates should be unsigned long.  (I don't remember why).
>>>>>
>>>>>        730         return 0;
>>>>>        731 }
>>>> I'm unable to recreate the warning with Smatch. After running
>>>> build_kernel_data.sh, I ran `<path to smatch>/smatch_scripts/kchecker
>>>> drivers/gpu/drm/msm/dsi/dsi_host.c` and got the following output:
>>>>
>>>> CHECK scripts/mod/empty.c
>>>> CALL scripts/checksyscalls.sh
>>>> CALL scripts/atomic/check-atomics.sh
>>>> CHECK arch/arm64/kernel/vdso/vgettimeofday.c
>>>> CC drivers/gpu/drm/msm/dsi/dsi_host.o
>>>> CHECK drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> drivers/gpu/drm/msm/dsi/dsi_host.c:2380 msm_dsi_host_power_on() warn:
>>>> missing error code 'ret'
>>>>
>>>> Is there a specific .config you're using (that's not the default
>>>> mainline defconfig)? If so, can you please share it?
>>> Are you running your checks with ARM32 or ARM64 in mind?
>>> Note, esc_clk_rate is u32, while clk_get_rate()'s returns unsigned long.
>>> It would make sense to change all three clocks rates in msm_dsi_host
>>> struct (and several places where they are used) to unsigned long.
>> Thanks for the response. I'm aware of what's causing this issue and how to
>> fix it, but I want to also be able to recreate the warning locally with
>> Smatch.
> No, sorry, I haven't published that check.  It's just something I have
> locally.
Understood. It would be helpful for future warnings if the issue was 
reproducible using Smatch scripts available in the repo since we would 
be able to verify the fix locally.
>
> Btw, I will be offline for the next two weeks...

Gotcha, thanks for the heads up! I will release a fix ASAP for you to ack.

Best,

Jessica Zhang

> regards,
> dan carpenter
>
>
