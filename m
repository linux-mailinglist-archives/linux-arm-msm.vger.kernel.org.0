Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 207161E0DD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 13:53:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390441AbgEYLwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 07:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390306AbgEYLwu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 07:52:50 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B6CC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:52:49 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id 205so4079581qkg.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q/QKo3tmpgjQwDSs+a91HPTk7Dk4PisvAkttzNO5a1c=;
        b=PRCtLRgriOJQ+O5+tLzSioEsRXz9b1qDAcTlJs/k3JUOGchxeS+RNxvodZyPNFQ6RZ
         9Pf1mszqeuLcQbyg4EVPggdUYDY2LR6Ehef7SuGBUsp7tAKd6riuu17HHbXLUju+IQTw
         2sEtF/wBIIuBvYQr480uEc1xaveHawm3FJC6T2UB91nHkXc+ZRiHDxbvfiOYgUyoGjVP
         uUc4t6KcLCwR5zKSI6luk+ewhGwXTTlgy+uRgeefItDCa4QrZwuqsSSuwfH47bpeioif
         /0jTtCBZxH5PtdLhTlnElfkLJjLHFlMrXa3uDxkUgD4rWqkopiHH1h5Kf0aGWCHHqumm
         2tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q/QKo3tmpgjQwDSs+a91HPTk7Dk4PisvAkttzNO5a1c=;
        b=h/XTeVE8BrZnj5JATbAxg6mXzA0Wz6YYEGqELa1Bb2W8xGvvorDGkwvI85xWB3wusq
         4mx3MYYlHvtCuNngqU1ly1hFEqM+8jfexDeYa7TfPMjZGPFtaizUtKlDVJ2GUgg3motL
         A9PNXWL/scJQCofJC/3/9Tjngr9Bk4KYBStN4Z7VfRqDAxEG/dEhfRy61bISn7jfS3JD
         M5hpUZ77P0aARz+76i7HPZOZ1mFxdRSTURgxvvA52QEQX/MaSiQfyeBOS3pP6yeshNg7
         aCB9PSNAHig89vLF1PhdWBYoVHSRyqOtQyM3B/oO5yZpExJjvRS9+stoAH5T4zFnOBxZ
         KQFQ==
X-Gm-Message-State: AOAM531eMH4kyZ4XVxJRIdhZg6d8J9NlG2fJO5aUi7hVaK3FfyE5CrI8
        Fr3YMuBqFb73dNBayXNxuOxX0g==
X-Google-Smtp-Source: ABdhPJyRuhlxmvJNL/aTtwVkWUOKs1cHj+khjE3HpQ+6YJmG1M+K2VJqHfBnPYCadqZeRE/p7pIchg==
X-Received: by 2002:a37:664a:: with SMTP id a71mr4889090qkc.428.1590407569108;
        Mon, 25 May 2020 04:52:49 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id f7sm14126864qtg.96.2020.05.25.04.52.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 04:52:48 -0700 (PDT)
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
 <33b34a58-46d2-80ec-1d79-8e02aa5ae026@marek.ca>
 <1adedb96a999a08809afe62416e80075@codeaurora.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <8f9a5750-7909-4be7-6780-198d8c242af3@marek.ca>
Date:   Mon, 25 May 2020 07:53:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1adedb96a999a08809afe62416e80075@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/25/20 7:40 AM, Sai Prakash Ranjan wrote:
> On 2020-05-25 16:57, Jonathan Marek wrote:
>> On 5/25/20 7:17 AM, Sai Prakash Ranjan wrote:
>>> Hi,
>>>
>>> On 2020-05-25 16:38, Jonathan Marek wrote:
>>>> On 5/25/20 6:54 AM, Sai Prakash Ranjan wrote:
>>>>> On 2020-05-25 15:39, Jonathan Marek wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 5/25/20 5:42 AM, Sai Prakash Ranjan wrote:
>>>>>>> Hi Jonathan,
>>>>>>>
>>>>>>> On 2020-05-24 08:08, Jonathan Marek wrote:
>>>>>>>> Add the apps_smmu node for sm8250. Note that adding the iommus 
>>>>>>>> field for
>>>>>>>> UFS is required because initializing the iommu removes the 
>>>>>>>> bypass mapping
>>>>>>>> that created by the bootloader.
>>>>>>>>
>>>>>>>
>>>>>>> This statement doesn't seem right, you can just say since the 
>>>>>>> bypass is disabled
>>>>>>> by default now, we need to add this property to enable 
>>>>>>> translation and avoid global faults.
>>>>>>>
>>>>>>
>>>>>> If I use this patch [1] then the UFS iommu property isn't needed. In
>>>>>> downstream, the identity (bypass?) stream mapping is inherited from
>>>>>> the bootloader, and UFS is used without any iommu property. Setting
>>>>>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n doesn't make it work on its own
>>>>>> (without the UFS iommu property), so there's more to it than just
>>>>>> "bypass is disabled by default now".
>>>>>>
>>>>>> https://patchwork.kernel.org/patch/11310757/
>>>>>>
>>>>>
>>>>> "iommus" property is not about inheriting stream mapping from 
>>>>> bootloader,
>>>>> it is used to enable SMMU address translation for the corresponding
>>>>> master when specified. So when you have disabled bypass, i.e.,
>>>>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y or via cmdline 
>>>>> "arm-smmu.disable_bypass=1"
>>>>> and iommus property with SID and mask is not specified, then it 
>>>>> will result
>>>>> in SMMU global faults.
>>>>>
>>>>> Downstream has bypass 
>>>>> enabled(ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n),so you
>>>>> won't see any global faults if you do not have iommus property.
>>>>>
>>>>> Patch in your link is for display because of the usecase for splash 
>>>>> screen
>>>>> on android and some other devices where the bootloader will 
>>>>> configure SMMU,
>>>>> it has not yet merged and not likely to get merged in the current 
>>>>> state.
>>>>>
>>>>> So yes "there is *not* much more to it than bypass is disabled by 
>>>>> default now"
>>>>> and you have to specify "iommus" for the master devices or you 
>>>>> should enable bypass,
>>>>> i.e., ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n or 
>>>>> arm-smmu.disable_bypass=n
>>>>>
>>>>> Try without the patch in the link and without iommus for UFS and
>>>>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y and you will see.
>>>>>
>>>>> -Sai
>>>>
>>>> I know that the "iommus" property is not about inheriting stream
>>>> mapping. Probing the iommu removes the stream mapping created by the
>>>> bootloader, the iommus property is added so that new mappings are
>>>> created to replace what was removed.
>>>>
>>>> You seem to be under the impression that the SM8150/SM8250 bootloader
>>>> does not configure SMMU. It does, for both UFS and SDHC, just like it
>>>> does for display/splash screen on some devices.
>>>>
>>>
>>> It could be that bootloader does configure SMMU for UFS and SDHC, but 
>>> the
>>> upstream SMMU driver doesnt allow to inherit stream mapping from the 
>>> bootloader
>>> yet, so adding iommus property based on the assumption that it is 
>>> inherited seems
>>> wrong.
>>>
>>
>> I never said adding the iommus property is for inheriting stream
>> mapping. I mentioned inheriting to say UFS works without the iommus
>> property on downstream (it inherits a identity/bypass mapping).
>>
> 
> Your commit description says "adding the iommus field for UFS is required
> because initializing the iommu removes the bypass mapping that created 
> by the
> bootloader". So here it would mean like iommus property for UFS is not for
> enabling address translation by SMMU for UFS but to avoid removing mappings
> created by the bootloader which is not exactly what iommus property is for.
> 

I guess the commit message is ambiguous, that's not what I meant. Is 
"Now that the kernel initializes the iommu, the bypass mappings set by 
the bootloader are cleared. Adding the iommus property is required so 
that new mappings are created for UFS." better?

>>>> With either value of ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT, it will not
>>>> work without the iommus property.
>>>
>>> I'm pretty sure that if you have ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n 
>>> and
>>> without iommus, it should work.
>>>
>>
>> It doesn't work, with either ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n or
>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y.
>>
> 
> Ok since you are very sure about this, I will try with your patches on
> SM8150 MTP tomorrow since I do not have access to one now.
> Also just to make sure, please remove all the extra SMMU patches you have
> in your tree which are not yet merged or from downstream kernel.
> 

FYI, I have a branch [1] integrating patches for upstream. All the 
patches up to 34fff8a519cc075933 ("arm64: dts: qcom: add sm8250 GPU 
nodes") have been submitted (and the patches after that are unnecessary 
for testing on sm8150).

[1] https://github.com/flto/linux/commits/sm8x50-upstream

> -Sai
> 
