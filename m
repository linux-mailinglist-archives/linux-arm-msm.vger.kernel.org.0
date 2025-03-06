Return-Path: <linux-arm-msm+bounces-50516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5BCA54B86
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 14:07:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC21A3AAD9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 13:07:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD57920C46C;
	Thu,  6 Mar 2025 13:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QMgGpIta"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A753220C46D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741266425; cv=none; b=PyMBNtdwttrPxzKVHNmsLTrJJvGmgdixHN3CXsiggF4M4eSpaOm92UaERKIw1OJ1cMd55kWV38mpLafUfKguKHk9RpGHlJ0lD9I8YaQG1Xo7KtXtR3BL346m2QxPoYEa6bbhnf4cd9faopPdnoHSqhL2OiiGxHjoG/yNB4XQDHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741266425; c=relaxed/simple;
	bh=CPhb4UvYiZdD0dnOI1f8MPdGAz2epp8mlw9UdPa4KEQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UnDFDb0mdqKERgzdUTce7JuHOZNti4ly4h260usGasOlo1XFd9E9e8tNZfQoW6V0msuqKx7QMTmJ8RBM4wVAF8sZyvAgu/WDpuDAJ7A3OSkQlnO6JOo0d6flpjo9ydFqW2XmBbuv+g13VFRMLS5jaslkEcoaUf6U9jnJSGK1Bes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QMgGpIta; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so327158f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Mar 2025 05:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741266422; x=1741871222; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOqzd8JK+kKqwQp+QhHvZtbWkcFtqNKoCKWBtUDqbfY=;
        b=QMgGpItafEI+bA6t+8IIKPB8J8zBuGJXgC1cVKtBi011sJGdzY1niQSJljZKkWloEM
         F/prhh6zABDPn8HmHdo28xLCtgnNQKbOHfQsrJN40YdIJoia+w8Nb4w0V2Y6O9ERsif5
         fLP4tnLSNH8CABLxZ3QFT82V4lADoAab1ySLlKuE25xk6tYgpJnVKtWKqaXpuhojPHh8
         FPrEw0XZVJpxHCTvLmvEpVP8vk5HM6SAVC6rdVLfo+LR4FJBnEW34kgEm8lttaaEZxju
         KZ4Jv0KU0qWKAat3AOsIVk4LYNPJA+VeIHoj4c7EG/PLAOCcPCjru9/Cly+0UCBU7hKo
         4QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741266422; x=1741871222;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gOqzd8JK+kKqwQp+QhHvZtbWkcFtqNKoCKWBtUDqbfY=;
        b=nv2q4h3Zq3+nPw6W2I1FeKPTbNqbrE/9wF7ZbU0p69cLHHnWagnxVxqvnmzKYSH2S4
         PliUi2M6GzVw5vL9Hv7yijiddmcZuL8BsOZf+9qbsz81gyagOjVqk8/s3OXHI8fgcxf/
         70k6o5Ieblwd6DMoKJOVI2x9dqoCjGufuj32DBMNeZc1GGlK3NniUSDkUtSCM9XPEqSI
         fs9qlSNyB9lV4zX+TcPe4Q/h6AS9Dwqg7jhSI/W8pVtmJ/x0dWrhXPPewBjb77cvSX/b
         l+/AD0GrY2NS8iD7cBlmwKX8OE0PW6/9cxRdIIK7LSNLqivkveC/Il4gtWd/UNjRJkKE
         h2Kw==
X-Forwarded-Encrypted: i=1; AJvYcCV/CHQaEKVXB1woAYN5jJDzl5t1C6CyYasVpBkdpF5yaLCBm48xzwpjvDgBc3l/NEwHwD53wKgT9ux3OHv5@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/y0aHy3K6VaIBcRh3u4P1SAxpE1vdpZU7Ep9MSn0IdxtOGHN1
	e7sNyTKbjnMIet7gkqYAtMHyeitYfeLWAzoRKvF6JqfuXhfpbRr/nsMboKKp9A0=
X-Gm-Gg: ASbGnct9WRBi+6rqcDeLrWT4/Poo8kPpnojnUe0Uyi6llvbc12sFYzn5MfrNREMkoUt
	sh2MfEFSahpT5IHaGwz60ssL/1GFPgGQgkX1fbo3u6GXHaLhys56qfWluH1Oe7TxIzfOOSEN1Je
	Vclf0kmoChhUMByPGCLOM+vFxvTnTycFStIz3v7DdPKQiMKPnhma/nkHzSrFyW0TYlVna1aqK8O
	Ba9qhUEz1HJXihnA0klGLreeriCv80iSX8QwWR0A1rjreoFLrruOjWrxLpMKmwqhSSDF1bZ0ksb
	gBSbrQdC1lKvmOhUln3pcIsQ8b6c5jPMItObtVZnXvf5uDkGnR4f6+0X
X-Google-Smtp-Source: AGHT+IGrYaUresfSlBj3wh9mw8tOKjqlEjOFtJkRJ6F/uF2t5CnyzzJj9WXm02LECABvHj4rB54qEg==
X-Received: by 2002:a05:6000:1869:b0:390:fbba:e64b with SMTP id ffacd0b85a97d-3911f789f82mr8350451f8f.31.1741266421841;
        Thu, 06 Mar 2025 05:07:01 -0800 (PST)
Received: from [192.168.1.101] ([37.167.199.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb7928sm2001149f8f.1.2025.03.06.05.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 05:07:01 -0800 (PST)
Message-ID: <e90eb78c-0bfe-450f-b7ca-f008fa960b32@linaro.org>
Date: Thu, 6 Mar 2025 14:06:58 +0100
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
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305-topic-sm8x50-iris-v10-v2-0-bd65a3fc099e@linaro.org>
 <SPBTL2Mq2VFDygL8bL4vg-byfmn_GW3b6yBuJCG-0-RloybQS5iNNMZYiAKejJoPPUhp5CgkM46PXu5d3OLSRA==@protonmail.internalid>
 <20250305-topic-sm8x50-iris-v10-v2-2-bd65a3fc099e@linaro.org>
 <4cacd96b-8d71-4b0a-954b-8d6f4a769f82@linaro.org>
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
In-Reply-To: <4cacd96b-8d71-4b0a-954b-8d6f4a769f82@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 06/03/2025 13:34, Bryan O'Donoghue wrote:
> On 05/03/2025 19:05, Neil Armstrong wrote:
>> In order to support vpu33, the iris_vpu_power_off_controller needs to be
>> reused and extended, but the AON_WRAPPER_MVP_NOC_LPI_CONTROL cannot be
>> set from the power_off_controller sequence like vpu2 and vpu3 so
>> split the power_off_controller into 3 steps:
>> - iris_vpu_power_off_controller_begin
>> - iris_vpu_power_off_controller_end
>> - iris_vpu_power_off_controller_disable
>>
>> And use them in a common iris_vpu_power_off_controller() for
>> vpu2 and vpu3 based platforms.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 46 ++++++++++++++++------
>>   1 file changed, 33 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index fe9896d66848cdcd8c67bd45bbf3b6ce4a01ab10..d6ce92f3c7544e44dccca26bf6a4c95a720f9229 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -211,33 +211,29 @@ int iris_vpu_prepare_pc(struct iris_core *core)
>>       return -EAGAIN;
>>   }
>>
>> -static int iris_vpu_power_off_controller(struct iris_core *core)
>> +static void iris_vpu_power_off_controller_begin(struct iris_core *core)
>>   {
>> -    u32 val = 0;
>> -    int ret;
>> -
>>       writel(MSK_SIGNAL_FROM_TENSILICA | MSK_CORE_POWER_ON, core->reg_base + CPU_CS_X2RPMH);
>> +}
>>
>> -    writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> -
>> -    ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>> -                 val, val & BIT(0), 200, 2000);
>> -    if (ret)
>> -        goto disable_power;
>> +static int iris_vpu_power_off_controller_end(struct iris_core *core)
>> +{
>> +    u32 val = 0;
>> +    int ret;
>>
>>       writel(REQ_POWER_DOWN_PREP, core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_CONTROL);
>>
>>       ret = readl_poll_timeout(core->reg_base + WRAPPER_IRIS_CPU_NOC_LPI_STATUS,
>>                    val, val & BIT(0), 200, 2000);
>>       if (ret)
>> -        goto disable_power;
>> +        return ret;
>>
>>       writel(0x0, core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_CONTROL);
>>
>>       ret = readl_poll_timeout(core->reg_base + WRAPPER_DEBUG_BRIDGE_LPI_STATUS,
>>                    val, val == 0, 200, 2000);
>>       if (ret)
>> -        goto disable_power;
>> +        return ret;
>>
>>       writel(CTL_AXI_CLK_HALT | CTL_CLK_HALT,
>>              core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>> @@ -245,10 +241,34 @@ static int iris_vpu_power_off_controller(struct iris_core *core)
>>       writel(0x0, core->reg_base + WRAPPER_TZ_QNS4PDXFIFO_RESET);
>>       writel(0x0, core->reg_base + WRAPPER_TZ_CTL_AXI_CLOCK_CONFIG);
>>
>> -disable_power:
>> +    return 0;
>> +}
>> +
>> +static void iris_vpu_power_off_controller_disable(struct iris_core *core)
>> +{
>>       iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
>>       iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
>>       iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
>> +}
>> +
>> +static int iris_vpu_power_off_controller(struct iris_core *core)
>> +{
>> +    u32 val = 0;
>> +    int ret;
>> +
>> +    iris_vpu_power_off_controller_begin(core);
>> +
>> +    writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
>> +
>> +    ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS,
>> +                 val, val & BIT(0), 200, 2000);
>> +    if (ret)
>> +        goto disable_power;
>> +
>> +    iris_vpu_power_off_controller_end(core);
>> +
>> +disable_power:
>> +    iris_vpu_power_off_controller_disable(core);
>>
>>       return 0;
>>   }
>>
>> -- 
>> 2.34.1
>>
>>
> 
> Have you checked that rb5/sm8250 still works after this change ?

I'm on it, but it doesn't add any functional changes.

Neil

> 
> ---
> bod


