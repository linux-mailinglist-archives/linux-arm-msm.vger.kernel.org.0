Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0BF63DA7AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 17:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230140AbhG2Pg2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 11:36:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:63568 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhG2Pg1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 11:36:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627572984; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ienE9t5V69kP7wLUDqkE8EWlLI8KHQuybCpWk25qo74=; b=cqmcSfHTr/jMmNgap7xfIdBHavFP4r7enlxvX6+bKIgclk8NGP7Iez6E86GiLuB5S78lM0Tr
 xe5pOYFgrmYwzBX7lOBUQuyU8zM2d0/0nuWHJ2+hezkaBgNKotBXfGYITaaNWVr/CZtcAcde
 GUTnorpRzfzRNOHb9ulFWIE3GpU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6102cae417c2b4047d4b97ea (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 15:36:04
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CE3EFC4338A; Thu, 29 Jul 2021 15:36:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [59.89.229.56])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44701C433F1;
        Thu, 29 Jul 2021 15:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44701C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH v2 2/3] drm/msm/a6xx: Use rev to identify SKU
To:     Rob Clark <robdclark@gmail.com>
Cc:     Sean Paul <sean@poorly.run>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Matthias Kaehlcke <mka@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210729200230.v2.1.I110b87677ef16d97397fb7c81c07a16e1f5d211e@changeid>
 <20210729200230.v2.2.I286ef007fcadd9e6ee3b2c0ad948f990735f9610@changeid>
 <CAF6AEGtv0R=SjwpV7NEX6-4sHTF_CxbqgFXNWN+PT9hJJb7N2A@mail.gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <cf9effea-43dc-0ea6-6e73-29e6beff607f@codeaurora.org>
Date:   Thu, 29 Jul 2021 21:05:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGtv0R=SjwpV7NEX6-4sHTF_CxbqgFXNWN+PT9hJJb7N2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/29/2021 8:57 PM, Rob Clark wrote:
> On Thu, Jul 29, 2021 at 7:33 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>
>> Use rev instead of revn to identify the SKU. This is in
>> preparation to the introduction of 7c3 gpu which won't have a
>> revn.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
>> ---
>>
>> (no changes since v1)
>>
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++------
>>   1 file changed, 5 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 183b9f9..0da1a66 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1675,11 +1675,11 @@ static u32 a618_get_speed_bin(u32 fuse)
>>          return UINT_MAX;
>>   }
>>
>> -static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
>> +static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>>   {
>>          u32 val = UINT_MAX;
>>
>> -       if (revn == 618)
>> +       if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
> 
> Looks like adreno_cmp_rev() ended up in patch 3/3 when it should have
> been in this patch..
> 
> But I guess we could also move this into adreno_is_a618() and use that here
> 
> BR,
> -R
Ahh! I reordered the patches. This is too early in the probe sequence to 
call adreno_is_axxx(), right?

-Akhil.
> 
>>                  val = a618_get_speed_bin(fuse);
>>
>>          if (val == UINT_MAX) {
>> @@ -1692,8 +1692,7 @@ static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
>>          return (1 << val);
>>   }
>>
>> -static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>> -               u32 revn)
>> +static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
>>   {
>>          u32 supp_hw = UINT_MAX;
>>          u16 speedbin;
>> @@ -1714,7 +1713,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>>          }
>>          speedbin = le16_to_cpu(speedbin);
>>
>> -       supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
>> +       supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
>>
>>   done:
>>          ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>> @@ -1785,7 +1784,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>
>>          a6xx_llc_slices_init(pdev, a6xx_gpu);
>>
>> -       ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
>> +       ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
>>          if (ret) {
>>                  a6xx_destroy(&(a6xx_gpu->base.base));
>>                  return ERR_PTR(ret);
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation.
>>

