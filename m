Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3409382A7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 13:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbhEQLCn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 07:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236621AbhEQLCm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 07:02:42 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CABB7C061756
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 04:01:24 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id r11so6290288edt.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 May 2021 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Lvflle3nqVohqWXQjoKXKJ9NFkulfQYE+SnrI7kL87A=;
        b=MoVu+reduWG5h6pq8tUmmTn9nel5GLj9nc2AA2INJyQkt984LNyYomhlVPZlvcWLZ0
         lls8s5i9XYKig0wnrEIoUv6Xe6vt1lRX76z0LJdfoVjkMHeo1jhb1EwFTIU7gsXtkZrO
         oPGk9wGC3l9H4L3m1IqSjO5dAoh7xjw7RsCrvuOaM4saQTgbFEMeZkxwU3BVpMBEJaJa
         mfA85dJvkbUF6zQTJYCMAJlLJUbpIkGw0LRj/Ddo/Iwp81xX2gpnRhDA+gDLSjBlQH9s
         Cctu54Wk3VXhpCZbSGcnTaNnMGt9Xqgk+vIqNqDiEIJ9plOt1DnhYwuKBv4N2J6Bsb5L
         n0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lvflle3nqVohqWXQjoKXKJ9NFkulfQYE+SnrI7kL87A=;
        b=tdcrYgpfgmDUmjw3rMEcKKGJPYzaQgZY1l7PQGbEjZ9HtOa159tgwlE5LLdfiErNYq
         3P77LZdS6c0oG9T24oS70itUB3/szgiFxV9PFIFLcPiqNBfP8Pz14tbuvAXX17RQL4V/
         wuGAe8YNlpqoNz5XIgqpC2EKu2GEyBQSi5xrdNziLedAZcm78pUIHecmQ1a/2w4w1Uyr
         VMRTxVhud9OfHiVuHlnLUbYZc9og8f4Qdhn4cGNmquWUycNwwtRkxwmwscpG04lR8Y3Q
         nqxOpr+567AkS8IrB2HxuV1dp8Tz2iIwVrh4IooTCs6vd74/+4YnKkIaIcAcZzsHNIh1
         OlRw==
X-Gm-Message-State: AOAM5337Ky4UXvXSAe+M2756hLujcCQbTx+UlIWf0Vt1Dw3rOOlpD2FG
        NO7fQH3gjmN8qYb22ahHZEH7/A==
X-Google-Smtp-Source: ABdhPJxuXu7WgWkMd+zcEXExrCD7oxWrKloPSisc8iLH6+Wfy13blbncOFJ5C2EvOs8X4GMgZlU2Mg==
X-Received: by 2002:aa7:d952:: with SMTP id l18mr70191962eds.83.1621249283128;
        Mon, 17 May 2021 04:01:23 -0700 (PDT)
Received: from [192.168.1.14] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id g24sm10880568eds.41.2021.05.17.04.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 04:01:22 -0700 (PDT)
Subject: Re: [PATCH][next] media: venus: hfi_msgs.h: Replace one-element
 arrays with flexible-array members
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20210211001044.GA69612@embeddedor>
 <bf31beab-dc36-23e9-757f-9729be59f7b2@embeddedor.com>
 <de8538ad-48d8-7a3c-af4f-ab31ee2da761@linaro.org>
 <f63824ee-fc8b-25cf-f3c2-c7b3947b8076@embeddedor.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <64aa38bc-62b2-79d9-156f-74a09f11f871@linaro.org>
Date:   Mon, 17 May 2021 14:01:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f63824ee-fc8b-25cf-f3c2-c7b3947b8076@embeddedor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 5/12/21 7:37 PM, Gustavo A. R. Silva wrote:
> 
> 
> On 5/12/21 06:39, Stanimir Varbanov wrote:
>> Hi,
>>
>> On 5/11/21 6:46 PM, Gustavo A. R. Silva wrote:
>>> Hi all,
>>>
>>> Friendly ping:
>>>
>>> We are about to be able to globally enable -Warray-bounds and, these are one of
>>> the last out-of-bounds warnings in linux-next.
>>>
>>> Could someone take this, please?
>>
>> This one introduces regressions, so I cannot take it. It needs some more
>> work.
> 
> Please, share with me the errors or warnings you see with this. So, I can
> have an idea of what is going on. Unfortunately, I don't have access to the
> test suite or hardware to test this.

I guess it needs more debugging, but the simple answer is that the
driver refuse to start streaming with this patch.

> 
> Thanks!
> --
> Gustavo
> 
> 
> 
>>>
>>> Thanks
>>> --
>>> Gustavo
>>>
>>> On 2/10/21 18:10, Gustavo A. R. Silva wrote:
>>>> There is a regular need in the kernel to provide a way to declare having
>>>> a dynamically sized set of trailing elements in a structure. Kernel code
>>>> should always use “flexible array members”[1] for these cases. The older
>>>> style of one-element or zero-length arrays should no longer be used[2].
>>>>
>>>> Use flexible-array members in struct hfi_msg_sys_property_info_pkt and
>>>> hfi_msg_session_property_info_pkt instead of one-element arrays.
>>>>
>>>> Also, this helps with the ongoing efforts to enable -Warray-bounds by
>>>> fixing the following warnings:
>>>>
>>>>   CC [M]  drivers/media/platform/qcom/venus/hfi_msgs.o
>>>> drivers/media/platform/qcom/venus/hfi_msgs.c: In function ‘hfi_sys_property_info’:
>>>> drivers/media/platform/qcom/venus/hfi_msgs.c:246:35: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>>>>   246 |  if (req_bytes < 128 || !pkt->data[1] || pkt->num_properties > 1)
>>>>       |                          ~~~~~~~~~^~~
>>>> drivers/media/platform/qcom/venus/hfi_msgs.c: In function ‘hfi_session_prop_info’:
>>>> drivers/media/platform/qcom/venus/hfi_msgs.c:342:62: warning: array subscript 1 is above array bounds of ‘u32[1]’ {aka ‘unsigned int[1]’} [-Warray-bounds]
>>>>   342 |  if (!req_bytes || req_bytes % sizeof(*buf_req) || !pkt->data[1])
>>>>       |                                                     ~~~~~~~~~^~~
>>>>
>>>> [1] https://en.wikipedia.org/wiki/Flexible_array_member
>>>> [2] https://www.kernel.org/doc/html/v5.9/process/deprecated.html#zero-length-and-one-element-arrays
>>>>
>>>> Link: https://github.com/KSPP/linux/issues/79
>>>> Link: https://github.com/KSPP/linux/issues/109
>>>> Build-tested-by: <lkp@intel.com>
>>>> Link: https://lore.kernel.org/lkml/6023dd80.MmTeFf8SzwX0iK7%2F%25lkp@intel.com/
>>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>>> ---
>>>>  drivers/media/platform/qcom/venus/hfi_msgs.h | 4 ++--
>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.h b/drivers/media/platform/qcom/venus/hfi_msgs.h
>>>> index 526d9f5b487b..e2d2ccfbdd24 100644
>>>> --- a/drivers/media/platform/qcom/venus/hfi_msgs.h
>>>> +++ b/drivers/media/platform/qcom/venus/hfi_msgs.h
>>>> @@ -113,7 +113,7 @@ struct hfi_msg_sys_ping_ack_pkt {
>>>>  struct hfi_msg_sys_property_info_pkt {
>>>>  	struct hfi_pkt_hdr hdr;
>>>>  	u32 num_properties;
>>>> -	u32 data[1];
>>>> +	u32 data[];
>>>>  };
>>>>  
>>>>  struct hfi_msg_session_load_resources_done_pkt {
>>>> @@ -233,7 +233,7 @@ struct hfi_msg_session_parse_sequence_header_done_pkt {
>>>>  struct hfi_msg_session_property_info_pkt {
>>>>  	struct hfi_session_hdr_pkt shdr;
>>>>  	u32 num_properties;
>>>> -	u32 data[1];
>>>> +	u32 data[];
>>>>  };
>>>>  
>>>>  struct hfi_msg_session_release_resources_done_pkt {
>>>>
>>

-- 
regards,
Stan
