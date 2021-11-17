Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E4D454B7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Nov 2021 18:01:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236705AbhKQREI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 12:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236653AbhKQREG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 12:04:06 -0500
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 285F3C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 09:01:08 -0800 (PST)
Received: by mail-qt1-x836.google.com with SMTP id l8so3274726qtk.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 09:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iAiYIGOMF32L6NjBDmRkV+DIHmZzVO0jh7boEjppR8A=;
        b=xEsm+wMYHJOujnnzTHvk82mC6Zll4hAVkH54bJEiRDEGmfrq7+1uxxHp7XRIJU0Qo4
         y1Nj5bhAfsr6KUfK72Cl2fcRMZnlCoVVT6DIEd5LscoBTMpfampHUlJVIRtPH3npSu2L
         OaOAmM2eIfdQBRHI+pi4QEvWJ/N89HVTAenLLAQRXz2KVnV0y+jDicbO19tvFWxrJ8ty
         xASGrQOjBVfH7ZSpEkYafAcfLdfmaCyFWvYWd1eM+a97dbWMw03lBYwCF5b//gt5FdtE
         XsCYvEth5fadN1sZK0qqNNd8Je2PqkgG4BooPH2KsfhJC/HavYv6QDvfmU/TgJd7oE/K
         Pn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iAiYIGOMF32L6NjBDmRkV+DIHmZzVO0jh7boEjppR8A=;
        b=Qza1c7oHjlVEv3kMdGridWR7p44769jAq7X3oTElS94idNE3GIJ7+DxknNYq7GcVtA
         AB29V59+CqPTNQjIVmVYGL6gI6yBLnpHmkkETyX88z1VstmAC+tvZGG7rJISb1NV9kDr
         pIRbMPKqndu0kFDoaYaeSbAQ/WBR7UIWyQKpxBAHUoS5wfLiVOyv/5AM6VZfLXItX3GX
         cMMESkbSISYWpRdCTL4jzh5nGQZzB40Vqu5elSsSKVJnKnQL6+nMM7zXf7TNg0m2Zq3v
         kUONfWjTbkmferbW2uSUa4qxTwEwQJlAlQTVS1/ioEzaE6Cq7es7vWcmkY6HFKFhOVvg
         fZxg==
X-Gm-Message-State: AOAM532IQLdPfaLvYSZ52AYk1koK7wbkQr8sSMan7vlTBUq5jhw3Py+w
        G7imY4VYkeazbnESAMb7nAkb9UnmhYDh2g==
X-Google-Smtp-Source: ABdhPJzAsjtjI8lNBQFjq1qZtG1MhUZx7LGEjEdnQTv4pedcnloVuLxdHPyXkr3XJhkaP3tbKmC5oQ==
X-Received: by 2002:a05:622a:1745:: with SMTP id l5mr18267208qtk.169.1637168466477;
        Wed, 17 Nov 2021 09:01:06 -0800 (PST)
Received: from [192.168.1.93] (pool-71-163-245-5.washdc.fios.verizon.net. [71.163.245.5])
        by smtp.gmail.com with ESMTPSA id s10sm134688qke.132.2021.11.17.09.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 09:01:05 -0800 (PST)
Subject: Re: [PATCH] base: arch_topology: Use policy->max to calculate
 freq_factor
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Lukasz Luba <lukasz.luba@arm.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
References: <20211115201010.68567-1-thara.gopinath@linaro.org>
 <CAJZ5v0gezoJZVH69Y7fDwa-uLhE0PaqFrzM=0bequxpE_749zg@mail.gmail.com>
 <8f7397e3-4e92-c84d-9168-087967f4d683@arm.com>
 <CAJZ5v0iRDtr5yae5UndwU2SmVL4cak=BN0irVGbgNzQiS8K3mA@mail.gmail.com>
From:   Thara Gopinath <thara.gopinath@linaro.org>
Message-ID: <af59de78-49b0-d2e6-4bf0-7c897c2fccb1@linaro.org>
Date:   Wed, 17 Nov 2021 12:01:04 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0iRDtr5yae5UndwU2SmVL4cak=BN0irVGbgNzQiS8K3mA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 11/17/21 7:49 AM, Rafael J. Wysocki wrote:
> On Wed, Nov 17, 2021 at 11:46 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>> Hi Rafael,
>>
>> On 11/16/21 7:05 PM, Rafael J. Wysocki wrote:
>>> On Mon, Nov 15, 2021 at 9:10 PM Thara Gopinath
>>> <thara.gopinath@linaro.org> wrote:
>>>>
>>>> cpuinfo.max_freq can reflect boost frequency if enabled during boot.  Since
>>>> we don't consider boost frequencies while calculating cpu capacities, use
>>>> policy->max to populate the freq_factor during boot up.
>>>
>>> I'm not sure about this.  schedutil uses cpuinfo.max_freq as the max frequency.
>>
>> Agree it's tricky how we treat the boost frequencies and also combine
>> them with thermal pressure.
>> We probably would have consider these design bits:
>> 1. Should thermal pressure include boost frequency?
> 
> Well, I guess so.
> 
> Running at a boost frequency certainly increases thermal pressure.
> 
>> 2. Should max capacity 1024 be a boost frequency so scheduler
>>      would see it explicitly?
> 
> That's what it is now if cpuinfo.max_freq is a boost frequency.
> 
>> - if no, then schedutil could still request boost freq thanks to
>>     map_util_perf() where we add 25% to the util and then
>>     map_util_freq() would return a boost freq when util was > 1024
>>
>>
>> I can see in schedutil only one place when cpuinfo.max_freq is used:
>> get_next_freq(). If the value stored in there is a boost,
>> then don't we get a higher freq value for the same util?
> 
> Yes. we do, which basically is my point.
> 
> The schedutil's response is proportional to cpuinfo.max_freq and that
> needs to be taken into account for the results to be consistent.

So IIUC, cpuinfo.max_freq is always supposed to be the highest supported 
frequency of a cpu, irrespective of whether boost is enabled or not. 
Where as policy->max is the currently available maximum cpu frequency 
which can be equal to cpuinfo.max_freq or lower (depending on whether 
boost is enabled, whether there is a constraint on policy->max placed by 
thermal etc). So in this case isn't it better for schedutil to consider 
policy->max instead of cpuinfo.max ? Like you mentioned above same 
utilization will relate to different frequencies depending on the 
maximum frequency.



> 

-- 
Warm Regards
Thara (She/Her/Hers)
