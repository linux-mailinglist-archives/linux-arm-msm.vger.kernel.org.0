Return-Path: <linux-arm-msm+bounces-50517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2AFEA54B96
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 14:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 034851885F89
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:09:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5163C20CCF0;
	Thu,  6 Mar 2025 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nvXZja6h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1556B20C499
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266557; cv=none; b=dc3OcfOhZf8SdUw0b9rxoCmSSpS7FRTdMLsphFMhQhF//f+5wsKCu4Rpb/+UJ57H962vi6wL/mp8hRRuFknOI/+Vc/jKHBjrBlNP6SIN+4jgofCrIxY8M0Y+QQpfkBUCc11B7QGKHsh0S5u9XABLYoJDrSRu4SLMpeXAOwQKBqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266557; c=relaxed/simple;
	bh=lQ4bLgx/Xb7dV5WdIP/9LUgzmdDliDNU0QvEXeaChkg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KvhjDB1+q2fb/OUlou1ri60x7jJfI+xE2r0qldnr2vG1hEtmoI/2M9RptnjOblxhdvg9SfrGJV3GwUFxWIMppCWXOD3KvlQdD26S7eYsamkJ24+ReF/6h74PZxnnN4PzcXZDqCncyivgWzEIByVcqMF3A0VztKHLXuZSjyoFtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nvXZja6h; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-438a39e659cso3534205e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 05:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741266553; x=1741871353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wsqoDlyRavkFJSHs98DYEVEa8T5jQBkRC0rqGM3dKVg=;
        b=nvXZja6h3W058JP0gK9GDknrmVnSS6BRVvi5GGISfoidtWAZCTh4wqYBYp84rvzmvl
         U4IQphjfY2LvVIv/v/Z06TIWOY+GvUpB5qscFNjCdVPbYDvgEaj0r7MJPExUU0dJni0p
         yJ8c7GjweUBBXUuBWx9er4Me6J8rji+oWsJ8rqrTWPOuea1pZsxnzhwQKVUdK9QtwQUW
         pbtTEjmeNqXHGUpNZuRdeQLfaEoSIwaDEAX45itN/f4Tvc5LEqh+TJvT5uKSZTIGaMQT
         qnXnsKDgzJ1JDjgFMPOx/Kv5LKFzo70SNM8sw2I8NaCBfyMkfB3nGJ8D7w0y3c7vSfM7
         Z6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741266553; x=1741871353;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wsqoDlyRavkFJSHs98DYEVEa8T5jQBkRC0rqGM3dKVg=;
        b=azHzpJpmuzICBrSQ2Zp5JsZIdBseqvmeAyXh/kwYjNcTG2oqU8FGHMfzFyZ6o5eCr2
         uJ88Ki2NUuDnvr3/t/H5Yd0kYQ+d7YCGEKrfMpUguGE8gtJL0C+vgFW+VTnrVwjO/ESz
         zhePysCMvwqnEVFNU7irsaIdMzjaxR2tksPwlYbsat32ABto2CD59L/yuhG3004P7XnD
         +5zQnicEiciRdUZO5nfwCSZ1KNzg7a8vrsF70rVmFGXQNWpxXJ50Oy6VbBJCEyQhsFdI
         gXzvTOPTqbz1VRhUMjiQUd7t5dmejUapQfn9apUE4vuRP8h+MGpO/FRhPpEA1/JOm5aQ
         iJ1A==
X-Forwarded-Encrypted: i=1; AJvYcCUIkoVUQ9YlwPiD78s39lm59XqOg37zpNh9Nl0IkGCrxO528hGWgv9WtOHd2w+px/njs9thfiIZ8wcgLsxS@vger.kernel.org
X-Gm-Message-State: AOJu0YxAahYvfUA9obgA8pmuNT/LEsFg/SHSZ529/ga722Fwho+HYon7
	hZkm6ka1hOiAMCbtLO8ixRFlBoUNfP9RXbl0Is5Yp1lwavy2T5Avs62BKdQEF9M=
X-Gm-Gg: ASbGncuFzY9vF+XObgkQFyEq2Udabbx9rBVkvJxvzIA5iEtA2Fk73WN9PKjL93zanoH
	T/38Wgc1W2k4+YUNmkqSAqeQRFXuAm1GFpynwENtO2C8hQvj0pvsDe4zC0Vs4+TM95AGmhjcvWK
	Xn4qH6dGkJ0iGI3CwQJ7Cm3ULrAXTnHkkid0PStd0GhTBeflwOvuqipTLASFoaY+BOyKpkZyP4Z
	ji9//yFVPMItnsMZ0+wNy2n28viw3FJpgzqfMW6r04EbdboftiLS1yvyYoChnySG1XjkKQ1/TRi
	cU8zdBd3JY8rGRRCY1nFsSqkHi5yCeJjUTVyLoEENGwffxcOzh7+QQnM
X-Google-Smtp-Source: AGHT+IFLFXYFESVup+3/A1k5fskkTgTCcGh5Je+8XfcKozlGc0Q7+yDf2TTStBe7ALPfXh4EIIRipQ==
X-Received: by 2002:a05:600c:5119:b0:43b:c390:b773 with SMTP id 5b1f17b1804b1-43bd29b41f8mr52753005e9.24.1741266553182;
        Thu, 06 Mar 2025 05:09:13 -0800 (PST)
Received: from [192.168.1.101] ([37.167.199.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfb16sm2012881f8f.29.2025.03.06.05.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 05:09:12 -0800 (PST)
Message-ID: <f1baa968-68ff-4118-a353-c6e71e4df629@linaro.org>
Date: Thu, 6 Mar 2025 14:09:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/7] media: platform: qcom/iris: split
 iris_vpu_power_off_controller in multiple steps
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <20250305-topic-sm8x50-iris-v10-v2-2-bd65a3fc099e@linaro.org>
 <24fd8e60-e782-0625-7d90-513cd2a3ea19@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <24fd8e60-e782-0625-7d90-513cd2a3ea19@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/03/2025 14:06, Dikshita Agarwal wrote:
> 
> 
> On 3/6/2025 12:35 AM, Neil Armstrong wrote:
>> In order to support vpu33, the iris_vpu_power_off_controller needs to be
>> reused and extended, but the AON_WRAPPER_MVP_NOC_LPI_CONTROL cannot be
>> set from the power_off_controller sequence like vpu2 and vpu3 so
>> split the power_off_controller into 3 steps:
>> - iris_vpu_power_off_controller_begin
>> - iris_vpu_power_off_controller_end
>> - iris_vpu_power_off_controller_disable
>>
> NAK.
> I don't think splitting the API into these small functions is beneficial in
> this case, The extracted parts are too trivial to justify separate
> functions, and this actually makes the flow harder to follow rather than
> improving re-usability or clarity.
> If there is no clear or significant re-use case, I'd prefer keeping the
> logic consolidated in single API to maintain readability.

Right I agree, I tried to do my best and reuse code, and this is the result.

So what would be the next step ? I can:
- move iris_vpu_power_off_controller into vpu2, and add it into the vpu3 ops
- re-implement it for vpu33 as v1

Neil

> 
> Thanks,
> Dikshita
>> And use them in a common iris_vpu_power_off_controller() for
>> vpu2 and vpu3 based platforms.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 46 ++++++++++++++++------
>>   1 file changed, 33 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..d6ce92f3c7544e44dccca26bf6a4c95a720f9229 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -211,33 +211,29 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>>   	return -EAGAIN;
>>   }
>>   
>> -static int iris_vpu_power_off_controller(struct iris_core *core)
>> +static void iris_vpu_power_off_controller_begin(struct iris_core *core)
>>   {
>> -	u32 val = 0;
>> -	int ret;
>> -
>>   	writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
>> +}
>>   
>> -	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> -
>> -	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>> -				 val, val & BIT(0), 200, 2000);
>> -	if (ret)
>> -		goto disable_power;
>> +static int iris_vpu_power_off_controller_end(struct iris_core *core)
>> +{
>> +	u32 val = 0;
>> +	int ret;
>>   
>>   	writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
>>   
>>   	ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
>>   				 val, val & BIT(0), 200, 2000);
>>   	if (ret)
>> -		goto disable_power;
>> +		return ret;
>>   
>>   	writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
>>   
>>   	ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
>>   				 val, val == 0, 200, 2000);
>>   	if (ret)
>> -		goto disable_power;
>> +		return ret;
>>   
>>   	writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
>>   	       core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>> @@ -245,10 +241,34 @@ static int iris_vpu_power_off_controller(struct iris_core *core)
>>   	writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>>   	writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>>   
>> -disable_power:
>> +	return 0;
>> +}
>> +
>> +static void iris_vpu_power_off_controller_disable(struct iris_core *core)
>> +{
>>   	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>>   	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>>   	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +}
>> +
>> +static int iris_vpu_power_off_controller(struct iris_core *core)
>> +{
>> +	u32 val = 0;
>> +	int ret;
>> +
>> +	iris_vpu_power_off_controller_begin(core);
>> +
>> +	writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>> +				 val, val & BIT(0), 200, 2000);
>> +	if (ret)
>> +		goto disable_power;
>> +
>> +	iris_vpu_power_off_controller_end(core);
>> +
>> +disable_power:
>> +	iris_vpu_power_off_controller_disable(core);
>>   
>>   	return 0;
>>   }
>>


