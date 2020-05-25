Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A52F01E0C7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 13:07:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390052AbgEYLHj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 07:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390053AbgEYLHj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 07:07:39 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6CF1C08C5C0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:07:38 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id a23so13545974qto.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HSB/A5wTXwyvLKDijeXz5/FNNvg8hhhAbIMoKrm4UiE=;
        b=tqAML2cntz10h8/qsX0mvoLMoNjakThxLXnZaCSronsSIFU3tOcm4Y9s1h6KuYHN7W
         p9OOeCn94JUMtmtEM48pfNHy+f0SYrTIg5Vz28bLy+t1f9HP8sDHe1N9RJUfEiow6lUe
         s1Tf+Bw53MDVejuI05WHIrLTJHHVrqh2dFnWpAgLjMGmN/gkVRknEEtBKdfMVSe6I1/z
         VubuBhtVZ4sxCfp/gneEl8IHC1yH66Pe3/ObOaiYd8AIrVW/76zJCsZEVhJ6cKgf4g2m
         ghDNc/7JOcEvlJ8YzNJfi9NGERvE2y41YyAVLtwY8caRJ61B73T0Qdk3Fx3Z+++awyOs
         utuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HSB/A5wTXwyvLKDijeXz5/FNNvg8hhhAbIMoKrm4UiE=;
        b=nJpuyYVuhp9hI0LBKCmLF6j3PKM2qMPcmznAkic5S8X5xxqIc8+MHvlRDfYjVC73nk
         nw+8Lh8pkFuPTM90wGOoeBzMaxZUMN+Sz3AOt5wnHeFiGLbvDJTkqMv0KXHMr64le9Ht
         5Tj+tAJiLgEkpRbJbVuukDTMiOWLn/MWEgA6NzojTypZl/9jLPt0D7UGqUBhKWbo60b7
         3ISitUzB3GauFpTTWojCM0+65fk7APdVctfWGOjCQEuKdvFHXmS1wttNKylPe9YQE1jn
         UVH9mA8L/AEYFFSUogS5jaPQr5sw4tYFbcvLE395F05hUvbpJsnJlP7wU96KfJz70sZ1
         R3Aw==
X-Gm-Message-State: AOAM533gN3Zx/TUIptTfswssmAfEk0YWJHDfqw0bIrziQxMVZze1Lc2U
        wbsIT9Mi/K/xfuRC/7AVB+VQTw==
X-Google-Smtp-Source: ABdhPJxkadPSVTT9Aa3m7eIXJIh9YpLm11TWNgowDMOmvZ9E7DCMVorNlRUFBnVy9DaBz9NGGehl3g==
X-Received: by 2002:ac8:8f7:: with SMTP id y52mr28040889qth.104.1590404857900;
        Mon, 25 May 2020 04:07:37 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 78sm10783797qkg.65.2020.05.25.04.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2020 04:07:37 -0700 (PDT)
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
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <c9c21e4c-fc89-5a74-fa78-203e5fb64e27@marek.ca>
Date:   Mon, 25 May 2020 07:08:04 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <2a35f3b85d8311fb4298aaea82236967@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/25/20 6:54 AM, Sai Prakash Ranjan wrote:
> On 2020-05-25 15:39, Jonathan Marek wrote:
>> Hi,
>>
>> On 5/25/20 5:42 AM, Sai Prakash Ranjan wrote:
>>> Hi Jonathan,
>>>
>>> On 2020-05-24 08:08, Jonathan Marek wrote:
>>>> Add the apps_smmu node for sm8250. Note that adding the iommus field 
>>>> for
>>>> UFS is required because initializing the iommu removes the bypass 
>>>> mapping
>>>> that created by the bootloader.
>>>>
>>>
>>> This statement doesn't seem right, you can just say since the bypass 
>>> is disabled
>>> by default now, we need to add this property to enable translation 
>>> and avoid global faults.
>>>
>>
>> If I use this patch [1] then the UFS iommu property isn't needed. In
>> downstream, the identity (bypass?) stream mapping is inherited from
>> the bootloader, and UFS is used without any iommu property. Setting
>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n doesn't make it work on its own
>> (without the UFS iommu property), so there's more to it than just
>> "bypass is disabled by default now".
>>
>> https://patchwork.kernel.org/patch/11310757/
>>
> 
> "iommus" property is not about inheriting stream mapping from bootloader,
> it is used to enable SMMU address translation for the corresponding
> master when specified. So when you have disabled bypass, i.e.,
> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y or via cmdline 
> "arm-smmu.disable_bypass=1"
> and iommus property with SID and mask is not specified, then it will result
> in SMMU global faults.
> 
> Downstream has bypass enabled(ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n),so you
> won't see any global faults if you do not have iommus property.
> 
> Patch in your link is for display because of the usecase for splash screen
> on android and some other devices where the bootloader will configure SMMU,
> it has not yet merged and not likely to get merged in the current state.
> 
> So yes "there is *not* much more to it than bypass is disabled by 
> default now"
> and you have to specify "iommus" for the master devices or you should 
> enable bypass,
> i.e., ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n or arm-smmu.disable_bypass=n
> 
> Try without the patch in the link and without iommus for UFS and
> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y and you will see.
> 
> -Sai

I know that the "iommus" property is not about inheriting stream 
mapping. Probing the iommu removes the stream mapping created by the 
bootloader, the iommus property is added so that new mappings are 
created to replace what was removed.

You seem to be under the impression that the SM8150/SM8250 bootloader 
does not configure SMMU. It does, for both UFS and SDHC, just like it 
does for display/splash screen on some devices.

With either value of ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT, it will not 
work without the iommus property.
