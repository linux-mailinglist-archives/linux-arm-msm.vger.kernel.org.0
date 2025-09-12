Return-Path: <linux-arm-msm+bounces-73224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EFBB542C0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:23:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 465D7AA00F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 06:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E04428314B;
	Fri, 12 Sep 2025 06:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkRAW/EP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8561228313F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 06:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757658202; cv=none; b=PBWcZ/d+TDZBRLEW69PC0eYDeUPx16RZ8+pnqWqXHKSDV27zags3L0kAUnJArSlLapIB8G6tjzIFaeNLvhM10oAQcWC4im4j6WKNNs//4SaNQFU4NHBwgEaVDfI66H6okym/Oz+TCV0h7d+kQWRfTTui9JtBLN4GpzCK+ZpZkEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757658202; c=relaxed/simple;
	bh=46xAimHlyoqtCIymW4Sk64BpdypZ4GBfRwHCV5duIC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UZGmH85mhcPlPuwTNlwWqc6O2aY9chGqRvgQsE2TfqvwR9K0iRVvsYOm08qHHV15W5WzAzHzuCGw23gKrJj/5xHP1DDnwdwj6o0JA5ojK/zkQGIfAwiFjVXUkW6yo8hmbS2o+HNx+sdUFrkWlsXMMzdJ2n4lay7YPYaDWUij0lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkRAW/EP; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f5f7feeddso277802e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 23:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757658199; x=1758262999; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKEDx0Iw+vCQWDODFkeSgabLIP6pUpT9IdwmBh+eWkU=;
        b=hkRAW/EPElrpkNv+Bbn+HDT8gj1n+yAneum3/1cM3zM0jJMIhA+j8IAnKz35oh9/Z0
         wI/SpJvPQ6EmpsBwLiwKG1UC3N832MzBgkI891zn/xlB/Lgw5bD3cTwx2jREiNE02RU/
         HfC1JjQhcexhlwRflSF3IThzFZ9vIC+B8vNCB5uywQenGPTP0YzA7aJbDGgx9RfVXMun
         9MLILb9NvlhQcVzID0ZwFDWkcx0p+oqRTswufRyZ4jPu7iv8jpZBW0ykv3oILpzxU5lC
         960IYX8qhOJ378Mc477mwyF3Gq/fJen3aMOepdx3co3nvN0JttmbgJTChSAarawZylOV
         o0bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757658199; x=1758262999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKEDx0Iw+vCQWDODFkeSgabLIP6pUpT9IdwmBh+eWkU=;
        b=wCHdnUIlwaQ2APNR2PrVuAxe11dpR5tEAB4R02DlYK71fZlNZ20I3GIETKVeWDQFrD
         1yoisbpG1ppWPpeWkfLlLsxuh5CZ7eMB4DWTbVp43XeZeLG7q7R3Pwah9kWfXN4zZVnn
         CP2gPxTihnVlPmd7x8/a3JeYZS0wADpUljXYwSkh+50lsuGMNSyNLvubDiXvRCQZFnwA
         GWNv58oe0zzvA2uM1dgLT5/E4gMMeW0fNRPh7vH+EpKiDbmBq/Gl2EZSLUE77N0Ns8Rf
         kDqGNQX/CQVTy84TVxiye6dWXpMIt7UaR7F5p7kFaj4lYx8o6xmwbL0el/0JpI6Ih8gO
         EmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2pIuFenpKnYkOMS6DjEIzvNsskKGHOIlpmFxpaUWvgScE4RJjWyLhlXuJw47YxM2sgLIKyD/4SwTPLW7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6kFaCrz1pNdCY04qpv95Ip36Igln1VNXvHzFKRNFmNkNVLPVw
	p4Odr1+1bRMNkM6767C+k3uzGpJuIrz/tv6xHwkV13LXj0m0US0vG/07oAu25cVnS02Y+p2cAVq
	ONwz5poY=
X-Gm-Gg: ASbGnctUoMdAp8PTbEbjilR2kQimLXbS/j1BdwIBCm18rG6g27r8gCQxVktgWx+bvBy
	kXjFdcDLve8QfsR4hnKtp1kXZWLpjRnMhc5F7O/cDPzevTaoZj+91+7u76g/kQvp6I2mjSAiZ4v
	DKo6sa6uH07IZAkN1aJmolS2wY05CGaN/lnKhQI9crVL9znMgKdw4saaTvD14zTvZUG1sAG1+YM
	2UoFmGg68CYlE7jO+eKZB6tsQqSZ2Xmawtvuo/B3bTUvz8asCfxf1ZJkQSdz64YVSNHChOvu1pL
	/4D+o+H85QyVAeR0kmnd0CBzDXxidJI6WZ6AcLTlp4xpNO+XI33CTyxTTEH5E6X2kcDc9d3si5d
	COtbLyit4EOYa+BVfn9B2MRmo+ReEfGszE7imXxRO6bSqwhkpczFOuU4CCuoUeJnHqqjqbt8ciH
	YG
X-Google-Smtp-Source: AGHT+IE6uLzngaA4lMyB4tnkRuP8sE8P3m558UkZVus+EtsNtSElE92g/spTLZd2SFI+K9qkH8+l3Q==
X-Received: by 2002:a05:651c:b12:b0:332:424b:210e with SMTP id 38308e7fff4ca-351339e1937mr2243141fa.0.1757658198515;
        Thu, 11 Sep 2025 23:23:18 -0700 (PDT)
Received: from [172.16.0.23] (96-132-196-88.sta.estpak.ee. [88.196.132.96])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b39db54sm6644491fa.55.2025.09.11.23.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 23:23:18 -0700 (PDT)
Message-ID: <e90501b8-6af1-4473-b4f5-2fe1f118a5b4@linaro.org>
Date: Fri, 12 Sep 2025 09:23:00 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] clk: qcom: camcc-sm8550: Specify Titan GDSC power
 domain as a parent to other
Content-Language: ru-RU
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <20250911011218.861322-2-vladimir.zapolskiy@linaro.org>
 <bsjcwbwvvw4eov4aaf4xk2bes4p4wsxvb53rsxkwhgd7bk44ix@wnbvksy6m3li>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bsjcwbwvvw4eov4aaf4xk2bes4p4wsxvb53rsxkwhgd7bk44ix@wnbvksy6m3li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/25 05:09, Bjorn Andersson wrote:
> On Thu, Sep 11, 2025 at 04:12:13AM +0300, Vladimir Zapolskiy wrote:
>> Make Titan GDSC power domain as a parent of all other GDSC power domains
>> provided by the SM8550 camera clock controller to enforce a correct
>> sequence of enabling and disabling power domains by the consumers.
>>
> 
> I don't understand which problem you're solving.
> 
> Are these GDSCs children of the titan_top and your patch is describing
> that so that when a client is enabling any one of them they will be
> enabled in order?
> 
> Are you correcting the description of the hardware? Or is this a hack to
> trick the system into performing the operations in order?
> 

Consumers of power domains are unaware of power domain hierarhy, same
with clocks for instance.

When a consumer turns on/off a power domain dependant on another one,
the parent power domain shall be turned on/off, and it shall be done
by the power domain provider (camcc in this case), if the power domain
hierarchy is set. The changes in the series establish the hierarchy,
otherwise the CAMSS driver as a CAMCC consumer is irrecoverably broken.

> 
> Please start your commit message with a problem description, then a
> description of your solution.
> 
> https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> 

I've started from "describe your changes in imperative mood" section,
I'll resend the changes with the reformulated commit messages, thank
you for review.

>> Fixes: ccc4e6a061a2 ("clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550")
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   drivers/clk/qcom/camcc-sm8550.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/clk/qcom/camcc-sm8550.c b/drivers/clk/qcom/camcc-sm8550.c
>> index 63aed9e4c362..b8ece8a57a8a 100644
>> --- a/drivers/clk/qcom/camcc-sm8550.c
>> +++ b/drivers/clk/qcom/camcc-sm8550.c
>> @@ -3204,6 +3204,8 @@ static struct clk_branch cam_cc_sfe_1_fast_ahb_clk = {
>>   	},
>>   };
>>   
>> +static struct gdsc cam_cc_titan_top_gdsc;
>> +
>>   static struct gdsc cam_cc_bps_gdsc = {
>>   	.gdscr = 0x10004,
>>   	.en_rest_wait_val = 0x2,
>> @@ -3213,6 +3215,7 @@ static struct gdsc cam_cc_bps_gdsc = {
>>   		.name = "cam_cc_bps_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3225,6 +3228,7 @@ static struct gdsc cam_cc_ife_0_gdsc = {
>>   		.name = "cam_cc_ife_0_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3237,6 +3241,7 @@ static struct gdsc cam_cc_ife_1_gdsc = {
>>   		.name = "cam_cc_ife_1_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3249,6 +3254,7 @@ static struct gdsc cam_cc_ife_2_gdsc = {
>>   		.name = "cam_cc_ife_2_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3261,6 +3267,7 @@ static struct gdsc cam_cc_ipe_0_gdsc = {
>>   		.name = "cam_cc_ipe_0_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3273,6 +3280,7 @@ static struct gdsc cam_cc_sbi_gdsc = {
>>   		.name = "cam_cc_sbi_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3285,6 +3293,7 @@ static struct gdsc cam_cc_sfe_0_gdsc = {
>>   		.name = "cam_cc_sfe_0_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> @@ -3297,6 +3306,7 @@ static struct gdsc cam_cc_sfe_1_gdsc = {
>>   		.name = "cam_cc_sfe_1_gdsc",
>>   	},
>>   	.pwrsts = PWRSTS_OFF_ON,
>> +	.parent = &cam_cc_titan_top_gdsc.pd,
>>   	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
>>   };
>>   
>> -- 
>> 2.49.0
>>

-- 
Best wishes,
Vladimir

