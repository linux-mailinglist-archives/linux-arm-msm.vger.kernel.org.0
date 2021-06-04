Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A4CF39AFA3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 03:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbhFDB1w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 21:27:52 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:3416 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhFDB1w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 21:27:52 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Fx4lC65C2z6v8r;
        Fri,  4 Jun 2021 09:23:03 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 09:26:03 +0800
Received: from [10.174.178.174] (10.174.178.174) by
 dggpeml500017.china.huawei.com (7.185.36.243) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 4 Jun 2021 09:26:02 +0800
Subject: Re: [PATCH -next] mfd: pm8008: Fix return value check in
 pm8008_probe()
To:     Guru Das Srinagesh <gurus@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Andy Gross <agross@kernel.org>
References: <20210603141357.572347-1-yangyingliang@huawei.com>
 <20210603171253.GA25742@codeaurora.org>
 <CAA8EJprf+ipk45c-niM1PAHCwn5huBEyvBpQA=dgQMohN43E5g@mail.gmail.com>
 <20210603190506.GA24042@codeaurora.org>
From:   Yang Yingliang <yangyingliang@huawei.com>
Message-ID: <bb3f9574-0869-0c49-b6fd-86c15b6858c1@huawei.com>
Date:   Fri, 4 Jun 2021 09:26:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20210603190506.GA24042@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.178.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2021/6/4 3:05, Guru Das Srinagesh wrote:
> On Thu, Jun 03, 2021 at 08:31:28PM +0300, Dmitry Baryshkov wrote:
>> On Thu, 3 Jun 2021 at 20:18, Guru Das Srinagesh <gurus@codeaurora.org> wrote:
>>> On Thu, Jun 03, 2021 at 10:13:57PM +0800, Yang Yingliang wrote:
>>>> In case of error, the function devm_regmap_init_i2c() returns ERR_PTR()
>>>> and never returns NULL. The NULL test in the return value check
>>>> should be replaced with IS_ERR().
>>>>
>>>> Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>> Acked-by: Guru Das Srinagesh <gurus@codeaurora.org>
>> Interestingly, the change does not correspond to the changelog
>> message. And the code is correct as devm_kzalloc returns NULL if I
>> remember correctly.
My bad, I sent a wong patch, I will send a new one.

Thanks,
Yang
> Thanks for pointing that out - I missed that. I would like to retract my
> Acked-by for this patch.
>
>>>> ---
>>>>   drivers/mfd/qcom-pm8008.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
>>>> index c472d7f8103c..dfefa60d693b 100644
>>>> --- a/drivers/mfd/qcom-pm8008.c
>>>> +++ b/drivers/mfd/qcom-pm8008.c
>>>> @@ -223,7 +223,7 @@ static int pm8008_probe(struct i2c_client *client)
>>>>        struct pm8008_data *chip;
>>>>
>>>>        chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
>>>> -     if (!chip)
>>>> +     if (IS_ERR(chip))
>>>>                return -ENOMEM;
>>>>
>>>>        chip->dev = &client->dev;
>>>> --
>>>> 2.25.1
>>>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry
> .
