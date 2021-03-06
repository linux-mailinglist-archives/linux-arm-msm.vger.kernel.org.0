Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8C932FB49
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 16:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230511AbhCFPBg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 Mar 2021 10:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbhCFPB2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 Mar 2021 10:01:28 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39950C06174A
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 Mar 2021 07:01:28 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id l12so7297777edt.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Mar 2021 07:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VpvLVXBiTEsa/PBM9ITTWtxz9hZ9Ki5SE/hgW8uahas=;
        b=WupEUS+T5692Lf2k8o56FQ/Ey1sxfZkHzh2JKV6EqWrs1H/mI8PmBNBu6bvAp6kb4d
         ZfKbsP3U1ZXprNVgSKnvK8d4BEkyM+QrCu4GZCESvym5S9Dke7wb7zrzCHE17N9QK1hx
         e3evHVt7ttrVr27Pe5LXoBfCq/MD3zNoBp0UnIswkAh9k4TNdbFgRDRqIY1adgEgFaOL
         FjEX4myMCAtTNGiepMGIgvnmsNCMQRU3/qiFYAfO1f0IO6YsDgo4HiUaVo0AXUqfqv7x
         mxHC7IDbOBtTcuTNPRX9JPUuIfnI05d+qoK8MsHydgFhSn/lFPuYRPxdmImxUrnrRA3M
         uuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VpvLVXBiTEsa/PBM9ITTWtxz9hZ9Ki5SE/hgW8uahas=;
        b=eBvsDNdKkOLrYTD/kMdTUbinT3+Plw5VRT26sWG3OEOOi0Isx+secMEOs4BLipwSWb
         V43bptj1DampebEBTtqizZIHGHLP3fw74JxAr44tkbRb+HKTBMD58K5wnY6HdlDmSe9v
         PoDKFt70RZsFCo8uJaK7i1douav/zmQl5b4Q/ZUbCT0rkHEhd7xDfYNtXLaD4uJnfrqk
         DhYwclptFj9EKfNTrmovMRH9F7y9Lkk8krYqrsKCe54QAkQYpocAhhViYDXR3f2XJdYq
         YkP+fjORIhUrkPGbomWwPStIDNeRNNegRn+f6hDleJ4TEjvfKe8Oj9bhGlIs8QXjXOu0
         zvEw==
X-Gm-Message-State: AOAM53178F1/2lo5RTUUP/d0fgiv2yxgw6OgYH8Whe9YwbxUmi5ozQTo
        yt/EIYb9xua0DsnytQKfPuJkbA==
X-Google-Smtp-Source: ABdhPJxWrifYqmG5mfpo/Uo1XqgTf8zXoRtHqnp8LzjkyC8lptLbBiUg1e3iVJMOelBL4P2EXB55Cw==
X-Received: by 2002:aa7:c709:: with SMTP id i9mr2293788edq.319.1615042886758;
        Sat, 06 Mar 2021 07:01:26 -0800 (PST)
Received: from [192.168.1.16] (95-43-196-84.ip.btc-net.bg. [95.43.196.84])
        by smtp.googlemail.com with ESMTPSA id t27sm3296256ejc.62.2021.03.06.07.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Mar 2021 07:01:26 -0800 (PST)
Subject: Re: [PATCH 04/25] media: venus: core,pm: Vote for min clk freq during
 venus boot
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     dikshita@codeaurora.org, jonathan@marek.ca, vgarodia@codeaurora.org
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
 <20210222160300.1811121-5-bryan.odonoghue@linaro.org>
 <21b09fd4-0b4c-3acb-ece2-f1a710bbd3fd@linaro.org>
Message-ID: <94133e43-d250-7359-6cfe-c4956f5185dc@linaro.org>
Date:   Sat, 6 Mar 2021 17:01:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <21b09fd4-0b4c-3acb-ece2-f1a710bbd3fd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/23/21 3:25 PM, Stanimir Varbanov wrote:
> 
> 
> On 2/22/21 6:02 PM, Bryan O'Donoghue wrote:
>> From: Dikshita Agarwal <dikshita@codeaurora.org>
>>
>> Vote for min clk frequency for core clks during prepare and enable clocks
>> at boot sequence. Without this the controller clock runs at very low value
>> (9.6MHz) which is not sufficient to boot venus.
>>
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>  drivers/media/platform/qcom/venus/pm_helpers.c | 14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
>> index 4f5d42662963..767cb00d4b46 100644
>> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
>> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
>> @@ -41,10 +41,24 @@ static int core_clks_get(struct venus_core *core)
>>  static int core_clks_enable(struct venus_core *core)
>>  {
>>  	const struct venus_resources *res = core->res;
>> +	const struct freq_tbl *freq_tbl = NULL;
>> +	unsigned int freq_tbl_size = 0;
>> +	unsigned long freq = 0;
> 
> no need to initialize to zero.
> 
>>  	unsigned int i;
>>  	int ret;
>>  
>> +	freq_tbl = core->res->freq_tbl;
>> +	freq_tbl_size = core->res->freq_tbl_size;
> 
> could you initialize those at the variables declaration?
> 
>> +	if (!freq_tbl)
>> +		return -EINVAL;
>> +
>> +	freq = freq_tbl[freq_tbl_size - 1].freq;
>> +
>>  	for (i = 0; i < res->clks_num; i++) {
>> +		ret = clk_set_rate(core->clks[i], freq);
> 
> I'm not sure that we have to set the rate for all core->clks[i] ?

Confirmed. This produces regressions on db410c (I haven't tested on
other platforms yet).

> 
>> +		if (ret)
>> +			goto err;
>> +
>>  		ret = clk_prepare_enable(core->clks[i]);
>>  		if (ret)
>>  			goto err;
>>
> 

-- 
regards,
Stan
