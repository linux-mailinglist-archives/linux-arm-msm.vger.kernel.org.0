Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B578731DAE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 14:45:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233121AbhBQNpW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 08:45:22 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:39923 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233125AbhBQNpV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 08:45:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613569498; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=i3iesGdy+pkNo/AAesysK0K/0TAtTpZXxzrfQ7O+hzQ=; b=QlErKzJVVwjCcMZsfTzijtVghv8dTMjxKK5KU2CBkJx6voVYiSUjL8CiULkHdkucdVc/t57T
 msXGK1fJqP27Gic5sFsuF/KoIY4FPrw59n7pSM5Vk0xI8Rw6GqTvEfbS+yyKzEq+2y2JbAGC
 8SUWqqjOy7ePdFe1fhHBO/RykSM=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 602d1db998fd902dc2255dfc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 13:44:25
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A379BC43463; Wed, 17 Feb 2021 13:44:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.1.105] (unknown [117.217.237.23])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8F835C433C6;
        Wed, 17 Feb 2021 13:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8F835C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To:     Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210216200909.19039-1-jonathan@marek.ca>
 <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
From:   Akhil P Oommen <akhilpo@codeaurora.org>
Message-ID: <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org>
Date:   Wed, 17 Feb 2021 19:14:16 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/17/2021 8:36 AM, Rob Clark wrote:
> On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a ENOENT error,
>> to fix the case where the kernel was compiled without CONFIG_NVMEM.
>>
>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index ba8e9d3cf0fe..7fe5d97606aa 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>>
>>          cell = nvmem_cell_get(dev, "speed_bin");
>>          /*
>> -        * -ENOENT means that the platform doesn't support speedbin which is
>> -        * fine
>> +        * -ENOENT means no speed bin in device tree,
>> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
> 
> very minor nit, it would be nice to at least preserve the gist of the
> "which is fine" (ie. some variation of "this is an optional thing and
> things won't catch fire without it" ;-))
> 
> (which is, I believe, is true, hopefully Akhil could confirm.. if not
> we should have a harder dependency on CONFIG_NVMEM..)
IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw' 
property, we will see some error during boot up if we don't call 
dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev, 
"speed_bin")" is a way to test this.

If there is no other harm, we can put a hard dependency on CONFIG_NVMEM.

-Akhil.
> 
> BR,
> -R
> 
>>           */
>> -       if (PTR_ERR(cell) == -ENOENT)
>> +       if (PTR_ERR(cell) == -ENOENT || PTR_ERR(cell) == -EOPNOTSUPP)
>>                  return 0;
>>          else if (IS_ERR(cell)) {
>>                  DRM_DEV_ERROR(dev,
>> --
>> 2.26.1
>>

