Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8CD31E0CEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 13:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390142AbgEYL05 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 07:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390250AbgEYL04 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 07:26:56 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B72C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:26:56 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id n11so11678787qkn.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=T1fKqU8yBUFbJU2PRqwWpgtp0OICg+fgV2aVzC2pyQc=;
        b=v6YOqjskJeLREg51fQN8z62C4OyqkRKFXSpGnf29v23Buz6SoiP4y/AeQpXdUnUfID
         AxtyaocQK41lFi0hRSydg+Okk6LTUsfSz9br5yTmS84soPguR9U+qY+EiisHstp5Mvhd
         C4XJCCM95KStdyjD+q5CPgDeFz0X8EocdmVBL+ZQbz2dMUlHjDbqPjI3z5thA7qgA0bR
         098+qOQ9iVKYa2uls5C4GZ3jNbSoVYfw1ZqJQ4J9DP96CrBytK5XAA36BI8ma6treTYM
         d2TIu6fTgtURVscYqL5WbRPxc7NiUhZpTXavHCajAOQDRv9PYsnC5C1QZ3KCKmNfeHhY
         LLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T1fKqU8yBUFbJU2PRqwWpgtp0OICg+fgV2aVzC2pyQc=;
        b=D7H7gXUC9K8E3uM12PiIKvOE+UZbHYFM5yMA8AsYjPExgQlWLExtSu3xiD1peB1NFz
         nGD2/APYWH/qKDWZf++6anIfhjhRGHYFt18lKgQ+2jFplTCYzIqXrWjOPmqXXnfggeFS
         l7xdYkaoJHRjDFDpIt76WuEBp3zCVXcrFAIf03Q1L7KzDPDb4eUg35cek3m8eXlKTfEs
         ynHAYEcpxitsrSfq7K3crBnXu9HG02mUEfvt3gQZjkOBXCOan+XqA7e2vaaJYKy6xBjd
         6PDHdWuJ+GkbUsS1C4mzpACksS4BGTS1tU7M2qRQk+Ogc3nf81L3uId407EOJ6krcu0K
         Ch6g==
X-Gm-Message-State: AOAM532LhQ40NEHd1gOAN5bbXZjWrKNLTnpmEq+dZekr+qJbn+HW+jyu
        yMmeiE7x6fXP5X0TYj1c5GA2jg==
X-Google-Smtp-Source: ABdhPJxpBlQiX8GNl/gIPb3yZevRM4hOesOdox3MTNk3wD1YG3ZiAmCYBxjvFhr9+2MV9uxAvSusDA==
X-Received: by 2002:a37:de16:: with SMTP id h22mr21922901qkj.195.1590406015505;
        Mon, 25 May 2020 04:26:55 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id w9sm14204059qtn.29.2020.05.25.04.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 04:26:54 -0700 (PDT)
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250: add apps_smmu node
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-3-jonathan@marek.ca>
 <42f39eeb2af9c82a551a417c62ea21d7@codeaurora.org>
 <0f58e2fd-ef55-cf38-d403-4782662aa89e@marek.ca>
 <2a35f3b85d8311fb4298aaea82236967@codeaurora.org>
 <c9c21e4c-fc89-5a74-fa78-203e5fb64e27@marek.ca>
 <72d771390af9a68759d3f81cb79e46a6@codeaurora.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <33b34a58-46d2-80ec-1d79-8e02aa5ae026@marek.ca>
Date:   Mon, 25 May 2020 07:27:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <72d771390af9a68759d3f81cb79e46a6@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/25/20 7:17 AM, Sai Prakash Ranjan wrote:
> Hi,
> 
> On 2020-05-25 16:38, Jonathan Marek wrote:
>> On 5/25/20 6:54 AM, Sai Prakash Ranjan wrote:
>>> On 2020-05-25 15:39, Jonathan Marek wrote:
>>>> Hi,
>>>>
>>>> On 5/25/20 5:42 AM, Sai Prakash Ranjan wrote:
>>>>> Hi Jonathan,
>>>>>
>>>>> On 2020-05-24 08:08, Jonathan Marek wrote:
>>>>>> Add the apps_smmu node for sm8250. Note that adding the iommus 
>>>>>> field for
>>>>>> UFS is required because initializing the iommu removes the bypass 
>>>>>> mapping
>>>>>> that created by the bootloader.
>>>>>>
>>>>>
>>>>> This statement doesn't seem right, you can just say since the 
>>>>> bypass is disabled
>>>>> by default now, we need to add this property to enable translation 
>>>>> and avoid global faults.
>>>>>
>>>>
>>>> If I use this patch [1] then the UFS iommu property isn't needed. In
>>>> downstream, the identity (bypass?) stream mapping is inherited from
>>>> the bootloader, and UFS is used without any iommu property. Setting
>>>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n doesn't make it work on its own
>>>> (without the UFS iommu property), so there's more to it than just
>>>> "bypass is disabled by default now".
>>>>
>>>> https://patchwork.kernel.org/patch/11310757/
>>>>
>>>
>>> "iommus" property is not about inheriting stream mapping from 
>>> bootloader,
>>> it is used to enable SMMU address translation for the corresponding
>>> master when specified. So when you have disabled bypass, i.e.,
>>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y or via cmdline 
>>> "arm-smmu.disable_bypass=1"
>>> and iommus property with SID and mask is not specified, then it will 
>>> result
>>> in SMMU global faults.
>>>
>>> Downstream has bypass 
>>> enabled(ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n),so you
>>> won't see any global faults if you do not have iommus property.
>>>
>>> Patch in your link is for display because of the usecase for splash 
>>> screen
>>> on android and some other devices where the bootloader will configure 
>>> SMMU,
>>> it has not yet merged and not likely to get merged in the current state.
>>>
>>> So yes "there is *not* much more to it than bypass is disabled by 
>>> default now"
>>> and you have to specify "iommus" for the master devices or you should 
>>> enable bypass,
>>> i.e., ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n or arm-smmu.disable_bypass=n
>>>
>>> Try without the patch in the link and without iommus for UFS and
>>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y and you will see.
>>>
>>> -Sai
>>
>> I know that the "iommus" property is not about inheriting stream
>> mapping. Probing the iommu removes the stream mapping created by the
>> bootloader, the iommus property is added so that new mappings are
>> created to replace what was removed.
>>
>> You seem to be under the impression that the SM8150/SM8250 bootloader
>> does not configure SMMU. It does, for both UFS and SDHC, just like it
>> does for display/splash screen on some devices.
>>
> 
> It could be that bootloader does configure SMMU for UFS and SDHC, but the
> upstream SMMU driver doesnt allow to inherit stream mapping from the 
> bootloader
> yet, so adding iommus property based on the assumption that it is 
> inherited seems
> wrong.
> 

I never said adding the iommus property is for inheriting stream 
mapping. I mentioned inheriting to say UFS works without the iommus 
property on downstream (it inherits a identity/bypass mapping).

>> With either value of ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT, it will not
>> work without the iommus property.
> 
> I'm pretty sure that if you have ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n and
> without iommus, it should work.
> 

It doesn't work, with either ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n or 
ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y.

> -Sai
> 
