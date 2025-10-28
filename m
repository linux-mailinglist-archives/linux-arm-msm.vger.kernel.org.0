Return-Path: <linux-arm-msm+bounces-79231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6D1C15DE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 477D73A019B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 16:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7890D287510;
	Tue, 28 Oct 2025 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R/yzjAPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178328689B
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 16:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669053; cv=none; b=Pr7U9D9GMzYAn2Z2LIf3RQdcc6BS1GYzWFRETKpSWY4JYombWYhRFlQyfEAHlSOAFb7LhsgLsa2xMJTmeBIifS6f6D7c9vxeUWxbMQDQIzHhDct1fIZ65FKy8OBFpuxfnC0jeMj87rqYJC/Vv39TNEuMvYqk59OvFZjXkIhhLmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669053; c=relaxed/simple;
	bh=s5hMutLaI7nwCrTj1SFXEAHlQONk8k/auDD71vMg5iw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GTVzdg4woAQIW7Bzz4z6qHSu6POOeYC/IdpvqzcUa5b55+u4k9h+G8YeYO7Y8vWyZtLb+/SftNp42A2TNElwMIhm/CTPuwYgvIXpD9JkfFFsks1DXlF+bU5RHNtZHcVpgqb2DDtT69zTGGvkdSQ03zHb/aa1LYLAeXiF2ug/Zz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R/yzjAPk; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42421b1514fso4430639f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 09:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761669050; x=1762273850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVDiJVDBM3r7hMEfWoSSKv9hUr+ASYoSn4j0qVsMf88=;
        b=R/yzjAPkCXLRbWxAx+5QdPaCHsQ44cFYejALdfikmCu2zpB/M4fX0TWvzm9BzOPgmp
         IMNbu6kjHIm3kzhFSRXlGC+H73g32FNivurKNBA8p4mm0DIm+Q4pTB3qJtCpXcKtwE6S
         VOz4zhwARoDAmJhO18otOKxpYtQml3Jd/hJiaR//RFQcixsRx2A6288zGoV6nT/4aRRD
         GTsbxq2wJFOmw3Aw6txW1x0LM4Zi73t1DQ+Ep0Rzkbo/x/fh6FgU+DrTh6LP+m6pBEZZ
         2UNm6ksaokKDp4cdy3zmEhMz/0m5KBIS0Eu1LdYRvHizKXrvFYanaMmWk4KPEmRLjrjL
         cgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761669050; x=1762273850;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fVDiJVDBM3r7hMEfWoSSKv9hUr+ASYoSn4j0qVsMf88=;
        b=Ns5WStb0rblZyo7rq7YcU879WHxjCRN302jl6I9bn1aXvgKCVtt49MgtsX/GJgKMXM
         1DHaF90fsxSAu12S9KtJRm7TObbJu3dAzFjtVgyoovf+Joa11xMUo3NwNKTZ+CUmosWU
         SPk4hRzi0S/4pKxf6ygzehpoSD12fPvmNzIeRCjEn5G6PKkrfv7ZhuFSSSQ4Ihj0k+F9
         o75Kt3FCRGe//v4X4yXcpJc5WHzeMpDjyJhLhzNpJCZGb7KMvRA3faSnMxcN5JM3XdpO
         RTqqVUV00YOL296dsQgbiR5kjQZJQi1/XfcVgBbwX7ODiCNI5sY6AxS/wo3cw4dh5J1r
         N5SA==
X-Forwarded-Encrypted: i=1; AJvYcCVRKJm6ydGct6KUOWZsIjvfj9Sl01v04cX7MGbGK7uQdlwvZ2OG6pUHMNBuUpnLjP3fDOiC2JKtmCEU0ZFp@vger.kernel.org
X-Gm-Message-State: AOJu0YwrKnos6E0ghV9E1mlxZz0VuekCEFzrRA/w+bBaeN68timHezdv
	dKqHAiSyil8bZS9cZN3tGVeDNaB1fAgnqF7HVW0rKLGWN1/eWdwvRIk/oFLeTbQwWk8=
X-Gm-Gg: ASbGncvplkR8BI5B278SrYpGvmYFQmuJkxJSJPwUqzpBcfo14tcbR0q+UtRHz6giLsM
	ySpIZ/rnDV7GE6g1xor1cY5leZO9zfnnQnfChuB12QTfe96LHowC5RLVhLZzb5thqZ+2DWDVGt5
	LJB2+tJcOoYOd2tBsEABfoS/jfzi9yNML495ViWc21J5mP4BJoTlNW/zRY3xOM5o3lfBJvzJiDR
	geYsaS3zzNIvHLkhDU5a0B9u5gl0wfmBUwi91i9dyLbBNJoN7Tc7PaXoWiKmWvPWT68EGNmCj6/
	yUtdXtC91Hh7BCA1SfBnSoQH7UcGJOQB0uZrQLBb0OhtTFCfb8meFcX9v0E9Llx7YePaxqD4w5s
	oAZi/fw6evU2MWBfgEtswXFSlaM8iIXr8jKYGoT0rGaK1VTQy6D33pCD/FFzE4m7PCiWPAJTQwm
	bKEyxMez51L/rdbFQsDLr0U4cB76Ey7LbJ/jSBb7aYIvF7rhFGJA==
X-Google-Smtp-Source: AGHT+IHt5ENMuRews3EQD4323nqKT3XHbXjD4V1NWnBfQQRfoInlYT9Drol6JmNVL5oSuEzT2fSBAg==
X-Received: by 2002:a05:6000:2dc6:b0:428:bb7:174f with SMTP id ffacd0b85a97d-429a7e519efmr3769774f8f.26.1761669049257;
        Tue, 28 Oct 2025 09:30:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:ebe6:df10:d28d:aa5? ([2a01:e0a:cad:2140:ebe6:df10:d28d:aa5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm21243901f8f.47.2025.10.28.09.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:30:48 -0700 (PDT)
Message-ID: <321f5289-64c0-48f1-91b5-c45e82396ca9@linaro.org>
Date: Tue, 28 Oct 2025 17:30:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
 <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
 <73955d58-544c-4299-a099-bfd9e5912a40@kernel.org>
 <636a1f99-acd4-4904-8fae-f159646cc1a0@kernel.org>
 <f4d80be9-986f-4d37-9c25-725eff7bb653@quicinc.com>
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
In-Reply-To: <f4d80be9-986f-4d37-9c25-725eff7bb653@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/28/25 13:27, Pavan Kondeti wrote:
> On Tue, Oct 28, 2025 at 12:07:40PM +0100, Krzysztof Kozlowski wrote:
>> On 28/10/2025 12:04, Krzysztof Kozlowski wrote:
>>> On 28/10/2025 11:58, Hrishabh Rajput wrote:
>>>>
>>>> On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
>>>>> On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
>>>>>> +
>>>>>> +static int __init gunyah_wdt_init(void)
>>>>>> +{
>>>>>> +	struct arm_smccc_res res;
>>>>>> +	struct device_node *np;
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	/* Check if we're running on a Qualcomm device */
>>>>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
>>>>> I don't think you implemented my feedback. This again is executed on
>>>>> every platform, e.g. on Samsung, pointlessly.
>>>>>
>>>>> Implement previous feedback.
>>>>
>>>> Do you want us to add platform device from another driver which is
>>>> probed only on Qualcomm devices (like socinfo from previous discussion)
>>>> and get rid of the module init function entirely? As keeping anything in
>>>> the module init will get it executed on all platforms.
>>>
>>> Instead of asking the same can you read previous discussion? What is
>>> unclear here:
>>> https://lore.kernel.org/all/3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org/
>>> ?
>>>
>>>>
>>>>
>>>> With this patch version, we have tried to reduce the code execution on
>>>> non-Qualcomm devices (also tried the alternative as mentioned in the
>>>> cover letter). Adding platform device from another driver as described
>>>> above would eliminate it entirely, please let us know if you want us to
>>>> do that.
>>>
>>> Why do I need to repeat the same as last time?
>>
>>
>> Now I see that you completely ignored previous discussion and sent THE
>> SAME approach.
> 
> Our intention is not to waste reviewers time at all. It is just a
> misunderstanding on what your comment is about. Let me elaborate further
> not to defend our approach here but to get a clarity so that we don't
> end up in the same situation when v4 is posted.
> 
> https://lore.kernel.org/all/b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org/
> 
> You mentioned here
> 
> ```
> To me socinfo feels even better. That way only, really only qcom devices
> will execute this SMC.
> ```
> 
> We interpreted this comment as `avoid executing this SMC on non qcom
> devices`. That is exactly what we have done in the current patch. since
> `smem` is not present on non qcom devices, we don't make a SMC. In fact
> we don't even create platform device/driver.
> 
> Please help us understand if the better approach is to just register
> platform driver here and let qcom specific code add the platform device.
> 
> Also, please help me understand why would non qcom platform who care
> about performance load all modules that can be built w/ ARM64. There
> will be many init calls and platform drivers registerd but they never
> get probed at all since their platform does not support. I am not
> defending our aproach, but trying to understand the rationale behind our
> approach vs alternatives.

+static int __init gunyah_wdt_init(void)

will be called on ___all____ arm64 systems which uses the vanilla arm64 defconfig,
while we could say the first call of "of_find_compatible_node()" would fail on all
non-qcom platforms this is still unacceptable.

The solution is to attach the wdt init to something only probed on qcom
platforms (not the module init, the _probe_ which is mapped to a DT compatible)
and very generic like socinfo which could accept HYP stuff.

You could also setup the HYP WDT from the qcom scm driver since the
communication is smc based.

Neil

> 
>>
>> NAK. It is waste of our time if you keep ignoring reviewers and force us
>> to re-iterate the same over and over again.
>>
> Thanks for your time and valuable feedback. I am told getting negative
> feedback is better than no feedback from reviewers in my upstream training :-)
> 
> We will incorporate your feedback in the next version based on your
> answer to the above question.
> 
> Thanks,
> Pavan


