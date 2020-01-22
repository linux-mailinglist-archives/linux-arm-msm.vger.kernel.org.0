Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32B5B144949
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 02:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgAVBVg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jan 2020 20:21:36 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9230 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728750AbgAVBVg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jan 2020 20:21:36 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 21D28D385F13DB2499EC;
        Wed, 22 Jan 2020 09:21:33 +0800 (CST)
Received: from [127.0.0.1] (10.177.131.64) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Wed, 22 Jan 2020
 09:21:29 +0800
Subject: Re: [PATCH -next] backlight: qcom-wled: fix unsigned comparison to
 zero
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
References: <20200120130143.35363-1-chenzhou10@huawei.com>
 <20200122003932.GA3948@builder>
CC:     <agross@kernel.org>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>,
        <b.zolnierkie@samsung.com>, <kgunda@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linux-fbdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From:   Chen Zhou <chenzhou10@huawei.com>
Message-ID: <a497400e-b734-9346-5ce8-292e051f611a@huawei.com>
Date:   Wed, 22 Jan 2020 09:21:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <20200122003932.GA3948@builder>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.131.64]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On 2020/1/22 8:39, Bjorn Andersson wrote:
> On Mon 20 Jan 05:01 PST 2020, Chen Zhou wrote:
> 
>> Fixes coccicheck warning:
>> ./drivers/video/backlight/qcom-wled.c:1104:5-15:
>> 	WARNING: Unsigned expression compared with zero: string_len > 0
>>
>> The unsigned variable string_len is assigned a return value from the call
>> to wled_configure, which may return negative error code.
>>
> 
> Afaict string_len is the return value of
> of_property_count_elems_of_size(), rather than wled_configure(). (And
> please append () to function names to make it even more obvious)
> 
> Except for that your patch looks good, so please update the commit
> message and add my Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Regards,
> Bjorn

Thanks for your review, i will fix this in next version.

Thanks,
Chen Zhou

> 
>> Fixes: 775d2ffb4af6 ("backlight: qcom-wled: Restructure the driver for WLED3")
>> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
>> ---
>>  drivers/video/backlight/qcom-wled.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
>> index d46052d..3d276b3 100644
>> --- a/drivers/video/backlight/qcom-wled.c
>> +++ b/drivers/video/backlight/qcom-wled.c
>> @@ -956,8 +956,8 @@ static int wled_configure(struct wled *wled, int version)
>>  	struct wled_config *cfg = &wled->cfg;
>>  	struct device *dev = wled->dev;
>>  	const __be32 *prop_addr;
>> -	u32 size, val, c, string_len;
>> -	int rc, i, j;
>> +	u32 size, val, c;
>> +	int rc, i, j, string_len;
>>  
>>  	const struct wled_u32_opts *u32_opts = NULL;
>>  	const struct wled_u32_opts wled3_opts[] = {
>> -- 
>> 2.7.4
>>
> 
> .
> 

