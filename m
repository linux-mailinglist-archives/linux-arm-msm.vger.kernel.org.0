Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0D94C1A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 21:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730294AbfFSToB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 15:44:01 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45717 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726230AbfFSToB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 15:44:01 -0400
Received: by mail-wr1-f67.google.com with SMTP id f9so459728wre.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2019 12:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qz5txo1KwkBvBHoDyJ3LT+c6ecU35PqENjJXCaNsN/o=;
        b=QTRhVOuP+ncTHLfMxLPNc7mDSZnu0vzHbnraWFzAEt4Gq58i6kr6Af9MIRYtqqMN9+
         tBB6MdEBt8e+jejDZgSRWNhVlLHH5cT6nqYzZAt8peiOkb8L/WtFRFx6APoEOdh/MGdj
         qzLPqmoqgYlA2/FqJVapOf5UoZvFrNDYbvbKy+w56YpyEuRsP2S6gALxkzKhKckKxWop
         5sL+kR8Z3QMoHhQMLoPSnNlDtXzBlhUv8XXhHBdTFKb8vc981suz8A6d424kiQuS5r5e
         Pv0D1B1jCGYHvhNHRUr2ribEIvlQ3yskPVd9YLIHw779vgXoZONr3opkQxkTqrZJ1Mvz
         BD6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qz5txo1KwkBvBHoDyJ3LT+c6ecU35PqENjJXCaNsN/o=;
        b=mTiaV6npBIL2z6ejwSp6OV44l6UwqZhz7Y5a4VRMShw5vPK+/wAwBTkBR9qqjv+Piq
         W/mnnhFBucW0rSfOxJK18IZ33joCMod5kBr1air/p9gTUc14jjTYvEp0R0uYybeJoJ5Q
         hCy2upLdyGs7hgA24lng2caWykpuCxtuUWjPN07tYBt0B1v3QJgATbOkPSvwIfPZXJBi
         scQIKjGA2OcljFtGno8sahBbm3VyEgq+nhpeaDAJLty/usJTnfohxjCVJFLMWtuRYLbH
         1RmTeQ+btWHeEIZjRHsfhTgBEuaPuJBCaLDY+G/kkvmqCMtD/PbTfPY9JPto2HethMTg
         c5ow==
X-Gm-Message-State: APjAAAU7Q0xEV+5hyiJ4itcZszuxY7LiliWj7w8DAc6wFXW2hgFG/ZJU
        rwgaDg1vHC+rwc47QetEyykukBgqPvw=
X-Google-Smtp-Source: APXvYqwAjh2mhC/drFhVM9X6mlNr0Hfoa9dHcXKRFDDNQxdHBW5hqlCqwoOuHP+jxNEmI+iXmqA4yw==
X-Received: by 2002:a05:6000:146:: with SMTP id r6mr75973646wrx.237.1560973439075;
        Wed, 19 Jun 2019 12:43:59 -0700 (PDT)
Received: from [192.168.1.6] (14.red-79-146-87.dynamicip.rima-tde.net. [79.146.87.14])
        by smtp.gmail.com with ESMTPSA id g2sm2452057wmh.0.2019.06.19.12.43.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 12:43:58 -0700 (PDT)
Subject: Re: [PATCH] regulator: qcom_spmi: Fix math of
 spmi_regulator_set_voltage_time_sel
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190619185636.10831-1-jeffrey.l.hugo@gmail.com>
 <20190619190557.GL4814@minitux>
From:   Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <871848c2-d600-fb20-1d5d-c196ea5aba44@linaro.org>
Date:   Wed, 19 Jun 2019 21:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190619190557.GL4814@minitux>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/19/19 21:05, Bjorn Andersson wrote:
> On Wed 19 Jun 11:56 PDT 2019, Jeffrey Hugo wrote:
> 
>> spmi_regulator_set_voltage_time_sel() calculates the amount of delay
>> needed as the result of setting a new voltage.  Essentially this is the
>> absolute difference of the old and new voltages, divided by the slew rate.
>>
>> The implementation of spmi_regulator_set_voltage_time_sel() is wrong.
>>
>> It attempts to calculate the difference in voltages by using the
>> difference in selectors and multiplying by the voltage step between
>> selectors.  This ignores the possibility that the old and new selectors
>> might be from different ranges, which have different step values.  Also,
>> the difference between the selectors may encapsulate N ranges inbetween,
>> so a summation of each selector change from old to new would be needed.
>>
>> Lets avoid all of that complexity, and just get the actual voltage
>> represented by both the old and new selector, and use those to directly
>> compute the voltage delta.  This is more straight forward, and has the
>> side benifit of avoiding issues with regulator implementations that don't
>> have hardware register support to get the current configured range.
>>
>> Fixes: e92a4047419c ("regulator: Add QCOM SPMI regulator driver")
>> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Reported-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
>> Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Tested on EVB-4000 using the cpufreq patchset that I still need to
repost v3  [1]

Tested-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>


[1] https://patchwork.kernel.org/cover/10784383/

> 
>> ---
>>  drivers/regulator/qcom_spmi-regulator.c | 8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
>> index 13f83be50076..877df33e0246 100644
>> --- a/drivers/regulator/qcom_spmi-regulator.c
>> +++ b/drivers/regulator/qcom_spmi-regulator.c
>> @@ -813,14 +813,10 @@ static int spmi_regulator_set_voltage_time_sel(struct regulator_dev *rdev,
>>  		unsigned int old_selector, unsigned int new_selector)
>>  {
>>  	struct spmi_regulator *vreg = rdev_get_drvdata(rdev);
>> -	const struct spmi_voltage_range *range;
>>  	int diff_uV;
>>  
>> -	range = spmi_regulator_find_range(vreg);
>> -	if (!range)
>> -		return -EINVAL;
>> -
>> -	diff_uV = abs(new_selector - old_selector) * range->step_uV;
>> +	diff_uV = abs(spmi_regulator_common_list_voltage(rdev, new_selector) -
>> +		      spmi_regulator_common_list_voltage(rdev, old_selector));
>>  
>>  	return DIV_ROUND_UP(diff_uV, vreg->slew_rate);
>>  }
>> -- 
>> 2.17.1
>>
> 

