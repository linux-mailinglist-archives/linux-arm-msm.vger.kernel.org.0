Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60F841E0D75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 13:40:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390185AbgEYLkR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 07:40:17 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:45242 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388729AbgEYLkR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 07:40:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590406815; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=M1GrxEVViC7nsdD2GmuqB+q1eg2wgb/h9tkBCfod5wk=;
 b=ptA14LEdwzAVTExZ3OAd+yIpnA+/Z143FvkCqZckriu9/1Hr6KQO/8wdTSWMaq2wEEh3z0HC
 5dafVlwOiHwmSN+4lZl/uJUTHBVSWIyBm9Qw7YHWGAoNx37faYPvEQqHhjYgtFObmO44JCnV
 SFUrtoG0t90FFC7thFqeHX2R3S8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ecbae958075f6e58cac5e02 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 May 2020 11:40:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E4315C433CA; Mon, 25 May 2020 11:40:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 30A02C433C9;
        Mon, 25 May 2020 11:40:04 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 25 May 2020 17:10:04 +0530
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 2/6] arm64: dts: qcom: sm8250: add apps_smmu node
In-Reply-To: <33b34a58-46d2-80ec-1d79-8e02aa5ae026@marek.ca>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200524023815.21789-3-jonathan@marek.ca>
 <42f39eeb2af9c82a551a417c62ea21d7@codeaurora.org>
 <0f58e2fd-ef55-cf38-d403-4782662aa89e@marek.ca>
 <2a35f3b85d8311fb4298aaea82236967@codeaurora.org>
 <c9c21e4c-fc89-5a74-fa78-203e5fb64e27@marek.ca>
 <72d771390af9a68759d3f81cb79e46a6@codeaurora.org>
 <33b34a58-46d2-80ec-1d79-8e02aa5ae026@marek.ca>
Message-ID: <1adedb96a999a08809afe62416e80075@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-05-25 16:57, Jonathan Marek wrote:
> On 5/25/20 7:17 AM, Sai Prakash Ranjan wrote:
>> Hi,
>> 
>> On 2020-05-25 16:38, Jonathan Marek wrote:
>>> On 5/25/20 6:54 AM, Sai Prakash Ranjan wrote:
>>>> On 2020-05-25 15:39, Jonathan Marek wrote:
>>>>> Hi,
>>>>> 
>>>>> On 5/25/20 5:42 AM, Sai Prakash Ranjan wrote:
>>>>>> Hi Jonathan,
>>>>>> 
>>>>>> On 2020-05-24 08:08, Jonathan Marek wrote:
>>>>>>> Add the apps_smmu node for sm8250. Note that adding the iommus 
>>>>>>> field for
>>>>>>> UFS is required because initializing the iommu removes the bypass 
>>>>>>> mapping
>>>>>>> that created by the bootloader.
>>>>>>> 
>>>>>> 
>>>>>> This statement doesn't seem right, you can just say since the 
>>>>>> bypass is disabled
>>>>>> by default now, we need to add this property to enable translation 
>>>>>> and avoid global faults.
>>>>>> 
>>>>> 
>>>>> If I use this patch [1] then the UFS iommu property isn't needed. 
>>>>> In
>>>>> downstream, the identity (bypass?) stream mapping is inherited from
>>>>> the bootloader, and UFS is used without any iommu property. Setting
>>>>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n doesn't make it work on its 
>>>>> own
>>>>> (without the UFS iommu property), so there's more to it than just
>>>>> "bypass is disabled by default now".
>>>>> 
>>>>> https://patchwork.kernel.org/patch/11310757/
>>>>> 
>>>> 
>>>> "iommus" property is not about inheriting stream mapping from 
>>>> bootloader,
>>>> it is used to enable SMMU address translation for the corresponding
>>>> master when specified. So when you have disabled bypass, i.e.,
>>>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y or via cmdline 
>>>> "arm-smmu.disable_bypass=1"
>>>> and iommus property with SID and mask is not specified, then it will 
>>>> result
>>>> in SMMU global faults.
>>>> 
>>>> Downstream has bypass 
>>>> enabled(ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n),so you
>>>> won't see any global faults if you do not have iommus property.
>>>> 
>>>> Patch in your link is for display because of the usecase for splash 
>>>> screen
>>>> on android and some other devices where the bootloader will 
>>>> configure SMMU,
>>>> it has not yet merged and not likely to get merged in the current 
>>>> state.
>>>> 
>>>> So yes "there is *not* much more to it than bypass is disabled by 
>>>> default now"
>>>> and you have to specify "iommus" for the master devices or you 
>>>> should enable bypass,
>>>> i.e., ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n or 
>>>> arm-smmu.disable_bypass=n
>>>> 
>>>> Try without the patch in the link and without iommus for UFS and
>>>> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y and you will see.
>>>> 
>>>> -Sai
>>> 
>>> I know that the "iommus" property is not about inheriting stream
>>> mapping. Probing the iommu removes the stream mapping created by the
>>> bootloader, the iommus property is added so that new mappings are
>>> created to replace what was removed.
>>> 
>>> You seem to be under the impression that the SM8150/SM8250 bootloader
>>> does not configure SMMU. It does, for both UFS and SDHC, just like it
>>> does for display/splash screen on some devices.
>>> 
>> 
>> It could be that bootloader does configure SMMU for UFS and SDHC, but 
>> the
>> upstream SMMU driver doesnt allow to inherit stream mapping from the 
>> bootloader
>> yet, so adding iommus property based on the assumption that it is 
>> inherited seems
>> wrong.
>> 
> 
> I never said adding the iommus property is for inheriting stream
> mapping. I mentioned inheriting to say UFS works without the iommus
> property on downstream (it inherits a identity/bypass mapping).
> 

Your commit description says "adding the iommus field for UFS is 
required
because initializing the iommu removes the bypass mapping that created 
by the
bootloader". So here it would mean like iommus property for UFS is not 
for
enabling address translation by SMMU for UFS but to avoid removing 
mappings
created by the bootloader which is not exactly what iommus property is 
for.

>>> With either value of ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT, it will not
>>> work without the iommus property.
>> 
>> I'm pretty sure that if you have ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n 
>> and
>> without iommus, it should work.
>> 
> 
> It doesn't work, with either ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=n or
> ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT=y.
> 

Ok since you are very sure about this, I will try with your patches on
SM8150 MTP tomorrow since I do not have access to one now.
Also just to make sure, please remove all the extra SMMU patches you 
have
in your tree which are not yet merged or from downstream kernel.

-Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
