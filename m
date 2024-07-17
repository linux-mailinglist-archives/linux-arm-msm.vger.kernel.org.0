Return-Path: <linux-arm-msm+bounces-26418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 475BB93395D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF8322830F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 08:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F28E39FDD;
	Wed, 17 Jul 2024 08:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hlA+2e0s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7481536AE0
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 08:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721206138; cv=none; b=QCjeWuOLk1pN2KmZ3Nhf0dWMS1OboyqJlZF5nBXwm+7g8TLbXt7mjxHcC1KnsDreqGgm+22WMrOgYIqLV0nkntdj0ILEHHj3dBGw4qixezgTyVAR46zIf+N5R2rA3yjuTShanr08UjPxBSRu44+kf0HnxV+rt+CWFC50Bmalv8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721206138; c=relaxed/simple;
	bh=nzY12LURqFreLOoRBBXVuGx3rnSdBx0T3NTka/Pqc2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V0HtRuh+RNYzZCQLiLY3Rn9RarnB/Kc8+YhaxkLjTnE97xHydfaRch0AgUVHpGztgmf2qxJADRS9qN952WSUbodBTW9hTf1VK6x8aNLTT76X1rvA07idZmcxYUBJJ+uTrL85ohRDOVaNCLOPjA8uwhmt/DmqVvVdGd6djfaPOYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hlA+2e0s; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a77e392f59fso758058466b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 01:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721206135; x=1721810935; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7DDc4nTJlk2bAuTF2yCWZzs3gZ7/jN3H28zpX2VIZt8=;
        b=hlA+2e0sb4seKBKvC1S9KFRwuH1/GBtKvKqSWcjv89hRvjvNJlu3KpxlCk/P46vqHu
         gRQgybVbqud46SUeovTmYYen+guyXAAtDTKH5qH8Gt0Yz1NxAS4Bc3OXJPsfgd3BAPvo
         ZjYxlHBgctcxoth/euhy1TCdCtnhtfNYz9exewW3J/akYL36LKNBROfzLBuId5SHqE92
         8gFfzz6MfULLBCrPPtRpRnTyFB5wImjdNu0v83e/NydHvRc1gZBYswdR9WTNN8AWysgz
         wNzg8bUQNk0WS4ZRLueyekYn5ndV2Q1OP9VYrOX9i18fzL+zWSt61YvNP/ZoP6VZMycF
         X59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721206135; x=1721810935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7DDc4nTJlk2bAuTF2yCWZzs3gZ7/jN3H28zpX2VIZt8=;
        b=p7Hnz1zHShyPZgudKRKpeHU/eB+4RxyEu2G0jBj/fEY1ql59gs66Nh+saXHqgNHTgf
         YVtndICMkITDvUoHIXQYCwf04IqwB/LSCaH29zNdfVIFq7Pg1blG05FiCnAWuQ0KchTT
         sqQcblBHL6HtLKnNUdUIIdeInWwPSouxA+7zi6aXL7LI5TdjspQrh/oSE7CEutDzMcEF
         EoIvw9Wd4xW3gNi8Dc4eYYAnkj2vkDE7n0+++MZkbw8lC5NJY43q7g8ah9qSZDcikSDY
         GV6cGTy8PJEXCRUtdzOr+6ch1FqIVjNmVxmm3g5APgSn0w/wqk/gThJbBWmhHa/nIHA3
         qqSw==
X-Forwarded-Encrypted: i=1; AJvYcCVR2eUezVmX4t54tx0vlfHJ9by8i4EaC3diTxeVxVjUmiXY0P6Wtq2JWrBZHtXL+8hmR/iqbsdFcksdcq42MnfuPhuSPPAaMgDOVCCcaw==
X-Gm-Message-State: AOJu0YzLiE52cADKQt8p7OtKhsbYMhKA0uYuYycs5BtB6p2OaaZJo5Ky
	vF9Kn1W0jGnPOZuQsM2hnLYp1gP9mgafYnxwpNehkxdu1dapYzMLbvm2M8e0lUE=
X-Google-Smtp-Source: AGHT+IHu8Af9F4tmhilVJBIgUg2laG6m+AW+q4qGN50kHMWoNZJ6AmGkL4NyGOMEhLGaxm6C7PnH2g==
X-Received: by 2002:a17:907:d301:b0:a77:e0ed:8c2 with SMTP id a640c23a62f3a-a7a01352bccmr69171166b.71.1721206134724;
        Wed, 17 Jul 2024 01:48:54 -0700 (PDT)
Received: from [192.168.0.6] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7ff89esm421513566b.158.2024.07.17.01.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 01:48:54 -0700 (PDT)
Message-ID: <86068581-0ce7-47b5-b1c6-fda4f7d1037f@linaro.org>
Date: Wed, 17 Jul 2024 09:49:18 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: camcc-sc8280xp: Remove always-on GDSC
 hard-coding
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dmitry.baryshkov@linaro.org, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240715-linux-next-24-07-13-sc8280xp-camcc-fixes-v1-1-fadb5d9445c1@linaro.org>
 <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f0d4b7a3-2b61-3d42-a430-34b30eeaa644@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17/07/2024 07:32, Satya Priya Kakitapalli (Temp) wrote:
> 
> On 7/15/2024 8:29 PM, Bryan O'Donoghue wrote:
>> We have both shared_ops for the Titan Top GDSC and a hard-coded always on
>> whack the register and forget about it in probe().
>>
>> @static struct clk_branch camcc_gdsc_clk = {}
>>
>> Only one representation of the Top GDSC is required. Use the CCF
>> representation not the hard-coded register write.
>>
>> Fixes: ff93872a9c61 ("clk: qcom: camcc-sc8280xp: Add sc8280xp CAMCC")
>> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # Lenovo X13s
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/clk/qcom/camcc-sc8280xp.c | 7 +------
>>   1 file changed, 1 insertion(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/camcc-sc8280xp.c 
>> b/drivers/clk/qcom/camcc-sc8280xp.c
>> index 479964f91608..f99cd968459c 100644
>> --- a/drivers/clk/qcom/camcc-sc8280xp.c
>> +++ b/drivers/clk/qcom/camcc-sc8280xp.c
>> @@ -3031,19 +3031,14 @@ static int camcc_sc8280xp_probe(struct 
>> platform_device *pdev)
>>       clk_lucid_pll_configure(&camcc_pll6, regmap, &camcc_pll6_config);
>>       clk_lucid_pll_configure(&camcc_pll7, regmap, &camcc_pll7_config);
>> -    /* Keep some clocks always-on */
>> -    qcom_branch_set_clk_en(regmap, 0xc1e4); /* CAMCC_GDSC_CLK */
> 
> 
> As I mentioned on [1], this change might break the GDSC functionality. 
> Hence this shouldn't be removed.

How would it break ?

We park the clock to XO it never gets turned off this way.

---
bod

