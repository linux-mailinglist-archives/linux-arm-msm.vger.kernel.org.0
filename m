Return-Path: <linux-arm-msm+bounces-56741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3155AA8C24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 08:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BB46170F44
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 06:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4811AC42B;
	Mon,  5 May 2025 06:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sje229x7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807B016EB7C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 06:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746425725; cv=none; b=i38rpbT2B+ljMxNg6NPewybpeALoPqArY8XSjz4EQPjRLyPyNgbtydGkqniZ1QOHH+lYs239noob8fDvKK1weFUYU3AOxDJQlpn9mtuTWVnof3yDdEz/dgVLFpUkUxo0IOcXmUEFwwvS6f4BxtXq3iXYA0vd4XiV28aMmTThVPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746425725; c=relaxed/simple;
	bh=2Ypy5/mrMqj2QpsVf3jU3yiGqAAuyQ/KJ2bHJb5EEO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LVw9pwT85Uwc7ObZQcu/asi/myrWBjwUa1HtuIcMSdPjYz+2sgGfl8fWrbvKodW70HiV1MTwhuRHsvyhOFgSsKdunNsTy09Nm80sDWnKPzV7rV8hcksnaTAcW4KIFjIluvM8EEWUF47erATx3eF2+WjZVFiRGLC+8UzIGZ794Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sje229x7; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39127effa72so215265f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 23:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746425721; x=1747030521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TxK/pctKF6C6aazKg6OENbtkCxPaC3gyVkFcwKqIeNI=;
        b=sje229x7pyRByIT9+jkfKqy36eCKzZXJwZU01dD/8OLE6NkPVPFeFyT/BF+DsMCCb7
         rdShwM+HUzUKmSeOIirPhYuzTNZPrwovxVKrSu5CSGGUw7o/NOIpHQZzY+5utxkN0Pr9
         XDyqRaC5fNuF9zch1zMovUQfVVzd9KAJP63NZEbqZWeA9K6lQN95sD+aSXMvLfAaNis+
         70yIpZNm0ZdDAWN/or0OP/nILhP3ShCF+0tjNrn9BPrT9k5mLPcHhreO/+zVPbXpFQFR
         6c45et8Qg7wFJB/mY+5jNuhJiQ8/pzplxH04S4Sp1raeyzMWbb+7y7Sqv3uzn6o5cqGc
         YtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746425721; x=1747030521;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxK/pctKF6C6aazKg6OENbtkCxPaC3gyVkFcwKqIeNI=;
        b=JIcSiUajSEDletgCZwBtD5w12ZVfUmp94R+pt3mHuI3GFLLJg/yS8eTH26CMiAQiTt
         dsf2ugzcQ5NinHF7d1vUg24REnlkpaZqtZdoXDcqkKM7JgoupTi4mgeCR879ydzjVF8a
         jRbpHPkCQ7beCTvPKMPBmZc4cXvO6GZQcU1elMUCTBAo1UH1kkDlhWf9dFbK3uaaH0J8
         y09hlmQOV7sVC8+whKwKvp1jDHIxGz5P2Zqn/yxaaaqbTfR94vxidH++VmG34hOiEoFN
         nsdoyUKxaGuUfFe4IeOHkq3zUMA/wToPfzbFUH1KoBauuU1Jvy4/kGCJfhpxVOhq2XYF
         XmMg==
X-Forwarded-Encrypted: i=1; AJvYcCWMTRZrX4wc4+2BKLnFTlqpyNAu3wdnE3Zpz+VEwt3lqJhZC272zg3CRNzKrMDmGVyL6JzuWGWC2F8egmfT@vger.kernel.org
X-Gm-Message-State: AOJu0YyfIdwc91U80gQjx6vgA53KjlV+jv1Ha8wGmXyJRBUDpzLFpDHE
	2WkZm+IHDeMNsiortROxD3eLZS1QRzAa2OMe9hdM+ECRtCDg4NwdzX077ShEepI=
X-Gm-Gg: ASbGncvCGHhRNaomKbY1rzBLcPPy/z2y4+Y0tDJjMO9blggh0FC2rfZvgwxNdbT69tB
	cmse1ujoGGkbbQLgt3IY70Qt8lzO7KSWntJ6GXPIh+AR9I9QQaobdKoSTz44oJ6ucnFzYWNiiXy
	/Z/AuXGs7i89NBWPS+N4H81XkY7Qek0sd16crV2LHi56MzV2PzWclr70RtU1qGacNmrwLjcgos9
	ZJhBpF+Pv6mT/lXLTRWV9Ra/kzgKJdYLS9Vcs3PVRiwCtg6wa8bWcJdYgm3Ku+XS834kj9eKvXa
	H9ghQ1EdYW5tZrI01QHMCPH2lfUJnq6vIpwygKyCTlOGDpplTSLgodnZWWo=
X-Google-Smtp-Source: AGHT+IGYzpcLXDJt3YPMJwjoLaKIbfaCgKHzEcaTw+3Vcv1jOY7XPCX3Z7TVWylT+uhkc9trXq4HgA==
X-Received: by 2002:a05:6000:310b:b0:3a0:6868:8b13 with SMTP id ffacd0b85a97d-3a099ad5a51mr3279808f8f.1.1746425720738;
        Sun, 04 May 2025 23:15:20 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae79d8sm9148905f8f.42.2025.05.04.23.15.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 May 2025 23:15:19 -0700 (PDT)
Message-ID: <0e7c76ad-ebc6-4dbb-9c3d-07071443b759@linaro.org>
Date: Mon, 5 May 2025 08:15:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/24] clk: qcom: dispcc-sm8750: Fix setting rate byte
 and pixel clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-6-8cab30c3e4df@linaro.org>
 <l6hwojjbk4e7eahoqcjprzululibhgrlpsv5zi7odicwx2wuvr@6difydf2mbz4>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <l6hwojjbk4e7eahoqcjprzululibhgrlpsv5zi7odicwx2wuvr@6difydf2mbz4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/05/2025 00:42, Dmitry Baryshkov wrote:
> On Wed, Apr 30, 2025 at 03:00:36PM +0200, Krzysztof Kozlowski wrote:
>> On SM8750 the setting rate of pixel and byte clocks, while the parent
>> DSI PHY PLL, fails with:
>>
>>   disp_cc_mdss_byte0_clk_src: rcg didn't update its configuration.
>>
>> DSI PHY PLL has to be unprepared and its "PLL Power Down" bits in
>> CMN_CTRL_0 asserted.
>>
>> Mark these clocks with CLK_OPS_PARENT_ENABLE to ensure the parent is
>> enabled during rate changes.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Patch is independent and can go via separate tree. Including here for
>> complete picture of clock debugging issues.
>>
>> Changes in v5:
>> 1. New patch
>> ---
>>  drivers/clk/qcom/dispcc-sm8750.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8750.c b/drivers/clk/qcom/dispcc-sm8750.c
>> index 877b40d50e6ff5501df16edcffb6cf3322c65977..d86f3def6dd06b6f6f7a25018a856dcc86fc48eb 100644
>> --- a/drivers/clk/qcom/dispcc-sm8750.c
>> +++ b/drivers/clk/qcom/dispcc-sm8750.c
>> @@ -393,7 +393,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
>>  		.name = "disp_cc_mdss_byte0_clk_src",
>>  		.parent_data = disp_cc_parent_data_1,
>>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>> -		.flags = CLK_SET_RATE_PARENT,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
>>  		.ops = &clk_byte2_ops,
>>  	},
>>  };
>> @@ -712,7 +712,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>>  		.name = "disp_cc_mdss_pclk0_clk_src",
>>  		.parent_data = disp_cc_parent_data_1,
>>  		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
>> -		.flags = CLK_SET_RATE_PARENT,
>> +		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
> 
> I assume that these flags should be set for DSI1 clocks too.


Indeed.



Best regards,
Krzysztof

