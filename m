Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 304CA37707B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 May 2021 09:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhEHH4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 May 2021 03:56:09 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:17484 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbhEHH4J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 May 2021 03:56:09 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Fcfg15g9vzkXBL;
        Sat,  8 May 2021 15:52:29 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.498.0; Sat, 8 May 2021
 15:55:05 +0800
Subject: Re: [PATCH 1/1] drm/msm/dpu: Fix error return code in dpu_mdss_init()
To:     Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        "David Airlie" <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20210508024254.1877-1-thunder.leizhen@huawei.com>
 <CAE-0n51owL8RGJyz_5BUCTjrUW5m0X-DTKUx=mqRL=-4i-tMDA@mail.gmail.com>
From:   "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <4f6ab4db-958d-c2c5-7879-aa9a0d3b87ae@huawei.com>
Date:   Sat, 8 May 2021 15:55:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51owL8RGJyz_5BUCTjrUW5m0X-DTKUx=mqRL=-4i-tMDA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2021/5/8 14:09, Stephen Boyd wrote:
> Quoting Zhen Lei (2021-05-07 19:42:54)
>> Fix to return a negative error code from the error handling case instead
>> of 0, as done elsewhere in this function.
>>
>> Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>> ---
>>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>> index 06b56fec04e0..1b6c9fb500a1 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>> @@ -253,8 +253,10 @@ int dpu_mdss_init(struct drm_device *dev)
>>                 goto irq_domain_error;
>>
>>         irq = platform_get_irq(pdev, 0);
>> -       if (irq < 0)
>> +       if (irq < 0) {
>> +               ret = irq;
>>                 goto irq_error;
>> +       }
> 
> It would be even better if ret wasn't assigned to 0 at the start of this
> function.

The returned error code is not unique.

> 
>>
>>         irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
>>                                          dpu_mdss);
> 
> .
> 

