Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76BE132EFA9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Mar 2021 17:08:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbhCEQH4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 11:07:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhCEQHo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 11:07:44 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D77FC061574
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Mar 2021 08:07:44 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id h98so2628724wrh.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Mar 2021 08:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n3YBSX+9GTBz9qA3NiNi/utxSaoRtpOtbrHObMTyMpU=;
        b=I+WH3ObSHUGlcxTTKR2Q6/C+8BOa/zKy11x0hcWVJ3+e+RtMf8OrhLBNyh4zzJooJG
         qX//1nYg6TzZAzRys4ez/IGqUMkDZAVn7HR89epELV8C3nqwT1V6V1P/D6/ocpb9TaQd
         nJbznYpHXBHJT1qQdm1mj60Nrn2uTRE93aHji093/mHoCBrrhiRJkKaFHT0wHMMyI8e2
         831i3GA0GB85YOXAHs+M93EvCLkxScX8JoQtJOzKsQ5dzNxqltMHhybLWNvovSpZbC09
         6ujdXpgofc31dExMrwvJKpJGdpCPtqTqXBCDGc92HOkaPrgdCkjTtMjDGRbdT428dG3L
         GSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n3YBSX+9GTBz9qA3NiNi/utxSaoRtpOtbrHObMTyMpU=;
        b=FT5JH5MzJO3CPkGjyx1atOMEwP4d7b25MfaEqcN8FPMWubnE9fziDOdoBwDczSiSOW
         Oqmc7rqh3uhaIh7Lp9XM32LXR+nJsQGubbv/dCwWIGHtK+jBuTMxweHqEIHS4wOKqT6Y
         cKgZqY5Q0kLMLYTOT4dTXuQyP8s93MGsaxXhNXvw97feScIKBKCOBDVv1pEpbyNj6N0y
         5fCaTK1W2Hd7OoxXC9nFmrnsli2vutiMcoG7mew4ZLg+ILukagRpK7m5K/iW85WE8zNT
         bvigdw0rDnE6g/qbpJp3vXn3x2qmC7ElaygoN2QJp7zvvNn0U/8KJD9WQZHbYSTFkJUf
         7QPA==
X-Gm-Message-State: AOAM532euxw+Y1EOX+WHhnBiCu33bUOULlGyFRQBl5VcS0mQCp8r7kKH
        T5XZgH0buRRJvZ3MeKHLtSO6cw==
X-Google-Smtp-Source: ABdhPJwL1f8rX0BPEFPSrRZOdMatQBdBwdSZFACqtvmDxhKtVRjW6x5ffQWFhUmo5YHKRsriNv8D6Q==
X-Received: by 2002:adf:fcc9:: with SMTP id f9mr10100029wrs.420.1614960463266;
        Fri, 05 Mar 2021 08:07:43 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id f7sm2911486wmq.11.2021.03.05.08.07.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Mar 2021 08:07:42 -0800 (PST)
Subject: Re: [PATCH 2/3] nvmem: core: Allow nvmem_cell_read_u16/32/64 to read
 smaller cells
To:     Doug Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20210227002603.3260599-1-dianders@chromium.org>
 <20210226162521.2.I7c9190630cf9131b42d521aa1c5b97135012a734@changeid>
 <6537aec4-7f6e-ede9-12ea-e84bab738d7b@linaro.org>
 <CAD=FV=XnS82=62zSyOkn++kt0BD40Qp5EmZ0SWoW25Gs7nXi8g@mail.gmail.com>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5c53bb42-cce6-12f8-b624-768535c5a094@linaro.org>
Date:   Fri, 5 Mar 2021 16:07:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XnS82=62zSyOkn++kt0BD40Qp5EmZ0SWoW25Gs7nXi8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 05/03/2021 14:58, Doug Anderson wrote:
> Hi,
> 
> On Fri, Mar 5, 2021 at 2:27 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 27/02/2021 00:26, Douglas Anderson wrote:
>>> The current way that cell "length" is specified for nvmem cells is a
>>> little fuzzy. For instance, let's look at the gpu speed bin currently
>>> in sc7180.dtsi:
>>>
>>>     gpu_speed_bin: gpu_speed_bin@1d2 {
>>>       reg = <0x1d2 0x2>;
>>>       bits = <5 8>;
>>>     };
>>>
>>> This is an 8-bit value (as specified by the "bits" field). However,
>>> it has a "length" of 2 (bytes), presumably because the value spans
>>> across two bytes.
>>>
>>> When querying this value right now, it's hard for a client to know if
>>> they should be calling nvmem_cell_read_u16() or nvmem_cell_read_u8().
>>> Today they must call nvmem_cell_read_u16() because the "length" of the
>>> cell was 2 (bytes). However, if a later SoC ever came around and
>>> didn't span across 2 bytes it would be unclear.  If a later Soc
>>> specified, for instance:
>>>
>>>     gpu_speed_bin: gpu_speed_bin@100 {
>>>       reg = <0x100 0x1>;
>>>       bits = <0 8>;
>>>     };
>>>
>>> ...then the caller would need to change to try calling
>>> nvmem_cell_read_u8() because the u16 version would fail.
>>>
>>
>> If the consumer driver is expecting the sizes to span around byte to
>> many bytes
> 
> I guess in my mind that's outside of the scope of what the consumer
> should need to know.  The consumer wants a number and they know it's
> stored in nvmem.  They shouldn't need to consider the bit packing
> within nvmem.  Imagine that have a structure definition:
> 
> struct example {
>    int num1:6;
>    int num2:6;
>    int num3:6;
>    int num4:6;
> };
> struct example e;
> 
> What I think you're saying is that you should need a different syntax
> for accessing "e.num1" and "e.num4" (because they happen not to span
> bytes) compared to accessing "e.num2" and "e.num3". As it is, C
> abstracts this out and allows you not to care. You can just do:
> 
> e.num1 + e.num2 + e.num3 + e.num4
> 
> ...and it works fine even though some of those span bytes and some
> don't.  I want the same thing.
> 
> 
>> , then, Why not just call nvmem_cell_read() which should also
>> return you how many bytes it has read!
> 
> See my response to patch #1. This requires open-coding a small but
> still non-trivial bit of code for all consumers. It should be in the
> core.

I agree with that this should be in core!
But changing the exiting behavior of the apis is the one am against!
For example if we are reading a fixed size UUID or some cell like that 
we would want to validate it, allowing flexible sizes would not catch 
errors.
Also if its variable size then which apis should consumer use, should he 
use u32 or u16 based, this adds more confusion to this!

> 
> 
>>> Let's solve this by allowing clients to read a "larger" value. We'll
>>> just fill it in with 0.
>>
>> That is misleading the consumer! If the consumer is expecting a u16 or
>> u32, cell size should be of that size!!
> 
> If you think it's confusing to change the behavior of the existing
> functions, would you be opposed to me adding a new function like
> nvmem_cell_read_le_u32_or_smaller() (or provide me a better name) that
> would be flexible like this?

This should be perfectly okay!
may be something like:

int nvmem_read_variable_cell(struct device *dev, const char *cell_id, 
void *buf, size_t sz_min, size_t sz_max);

It should return number of bytes it read and fail if cell size is less 
then sz_min!

--srini
> 
> -Doug
> 
