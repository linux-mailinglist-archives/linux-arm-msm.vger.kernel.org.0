Return-Path: <linux-arm-msm+bounces-70159-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A822DB2F7E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 14:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 491F016BF50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 12:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770353054F3;
	Thu, 21 Aug 2025 12:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yPmLmErG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F84D23E32B
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 12:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779240; cv=none; b=vBLyLugcRIvn6YWpIDtYT0j+9swdG4jXu4/7u/qzMeqHkTOiNt3/wFBZsnxIoP6PWGIg//KMcaEWPf4a60LkmO/wQpoT5vPDiZ8lemyh4fYZPmABfdXM4U0u//UAkjHIl6Mx4RRjDCouDoasj9DO46MtxCxJGxruloq98VpZpCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779240; c=relaxed/simple;
	bh=KUoNg1j6XBZ21HpbiTdBsUU4fj2ljmJr7W9faCfF+gE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=DuzBl85+QaoakbcyILkglczrrcerg1fORSxyxOkH96N3mNkyTH0NO0hcJzi4Wpw6qaxybDuCKasOSzJcUMN5HhNrRjz5ph58vAZFxLx3ujCMr2CSykRZ2LX2VZHnmLadJ9wcofzNK+8DJGkKT29sBxZ5MfuQ9jUpDjrU+AAODTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yPmLmErG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e4106460so839060f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 05:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779237; x=1756384037; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+4kGCl3s0E9ViSuKURoL8hRWsJIXGsI4qnbqkN+gPc=;
        b=yPmLmErGmny8jQoYNx0t0YJYf6F/8QlvA+ofmbWG+rRZiI65M/v4Q/ry/VEysEg/WJ
         8zL1LpHryT0xF8ugLOrPEfzzFnKWspkwpNiP3NHMfU4Pbad1mHaRZ/Sh9d3BvPJ27HEB
         MTT2flpf8lqtIHvdus9p661ufoAmK34TaLhRTuPP2UCxfodIxtryXIO+19G4VYxRsNt0
         1f8Jb4d3N8ZTUIpsVWh4AgkBqBibp1Yq7ts0m5BZqaJO+fpi50HEVxggcBrQfXjcg369
         /4yaD7HQPpw/Ay8Fld5RTAg9ic3Ze+Wa9gTk762CeF1VmRetvc2fijeWG/1XZHHRGd8E
         0Dhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779237; x=1756384037;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=k+4kGCl3s0E9ViSuKURoL8hRWsJIXGsI4qnbqkN+gPc=;
        b=UCumjbhH1+LXyFJoszdqi46syTprLWcwyJtYK6Yt4bVu+CWXX6h9pKri1i2NLxarHY
         6Jo0X2imFM6MqLUjM+8PllOSexLXKqeIIfkQruM29n6aOk3wU+uqjQx2n+bAKrrAD/Er
         YCYa/CQ1YFUNxBbDH/br2R46WtyCJe4IcStwe4tmeXksipuDrEEebIR2w/ubiXY+fiKw
         9e9w8WvMnfTIjjnRdoUMrnNFIVFC/KbbguEsZyA1FQ3BR2h2ss1SuHZcHYbWK+5epfGM
         0Eeva0vjY3dBell/zInTWhmxPVs+CSybuYv0w9dmOf82VA5vaIruSrkUor0WaUtIIdEQ
         snFg==
X-Forwarded-Encrypted: i=1; AJvYcCV+f84mcC6QN5R394Fvxxr0W3SmtreZzmOQBo9y5DdBrJa4NdGb7q3NbyCiFbnmuV+YwBZbzBE8Tde1qwab@vger.kernel.org
X-Gm-Message-State: AOJu0YwJLcSH8kX1k3YJDAj0LcAWkD1Gh/OsygoS/jGo81xjqBK6AGam
	slLza3Sjwm70byAooGp4HrHt2oI0rhbp1YLB8piRUYWX3N+fzhvXhjg8tcWeciNXAdQ=
X-Gm-Gg: ASbGncscF8phJHn5yZ3ie4tSnwn3T/c9+Qmv5XHYHg7yG9AeJnmuJf2tob/Dgtsy8+9
	5TB8RHsJveTkiCW4C8MtfW2/t2ecPSMzdHD5h0il4ll2cFW65/str3f93sIYhxENdMaC7fQvssx
	UNka5BymVNSUNC4rVfOvUpt4iATq2MpFDZANWL0zvJpsdyJvQo6bVG+hiSjSjes0RbS84FJkCoF
	FEkp+nFCwPddSUc9/Rb7jIj70SVa4MC+b/fXMwMne0QnTGv2uTuJDm1ChicJCU7dUcBGBWgj5lw
	1gg8MRLh02O2SfF1oC8fFze4BfUVYx1s6ppX8u7MurWFF0nZNdEiWODHLWVZug2HvFRjQzXuQ+w
	5BNkrDP4VK4C+EliteDFzweKSM2OsJJgyOTz3quQ1GTCroDrtrvMyU2qUwkYXwqQQhMC5UZzdwq
	0=
X-Google-Smtp-Source: AGHT+IGUHdxX5vJYjPrT+4pvIy+QD4GfGnnIsVKMQK5hmWxxKvraLNjQoCZwFOKEpbFAlfud1wfsaQ==
X-Received: by 2002:a05:6000:310c:b0:3b8:d69b:93b with SMTP id ffacd0b85a97d-3c4973690d8mr1993830f8f.52.1755779236531;
        Thu, 21 Aug 2025 05:27:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:443c:3616:7f17:f26d? ([2a01:e0a:3d9:2080:443c:3616:7f17:f26d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c4ccbf04fasm2121945f8f.7.2025.08.21.05.27.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 05:27:16 -0700 (PDT)
Message-ID: <802b5a3c-15c7-4291-8e3e-e598b5587fb8@linaro.org>
Date: Thu, 21 Aug 2025 14:27:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] media: iris: fix module removal if firmware download
 failed
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250820-topic-sm8x50-iris-remove-fix-v1-1-07b23a0bd8fc@linaro.org>
 <6c93b790-6d84-aec5-5b4d-2584d249f74e@quicinc.com>
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
In-Reply-To: <6c93b790-6d84-aec5-5b4d-2584d249f74e@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/08/2025 11:42, Dikshita Agarwal wrote:
> 
> 
> On 8/20/2025 10:36 PM, Neil Armstrong wrote:
>> Fix remove if firmware failed to load:
>> qcom-iris aa00000.video-codec: Direct firmware load for qcom/vpu/vpu33_p4.mbn failed with error -2
>> qcom-iris aa00000.video-codec: firmware download failed
>> qcom-iris aa00000.video-codec: core init failed
>>
>> then:
>> $ echo aa00000.video-codec > /sys/bus/platform/drivers/qcom-iris/unbind
>>
>> Triggers:
>> genpd genpd:1:aa00000.video-codec: Runtime PM usage count underflow!
>> ------------[ cut here ]------------
>> video_cc_mvs0_clk already disabled
>> WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#1: sh/542
>> <snip>
>> pc : clk_core_disable+0xa4/0xac
>> lr : clk_core_disable+0xa4/0xac
>> <snip>
>> Call trace:
>>   clk_core_disable+0xa4/0xac (P)
>>   clk_disable+0x30/0x4c
>>   iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
>>   iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
>>   iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
>>   iris_vpu_power_off+0x34/0x84 [qcom_iris]
>>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>>   iris_remove+0x20/0x48 [qcom_iris]
>>   platform_remove+0x20/0x30
>>   device_remove+0x4c/0x80
>> <snip>
>> ---[ end trace 0000000000000000 ]---
>> ------------[ cut here ]------------
>> video_cc_mvs0_clk already unprepared
>> WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#2: sh/542
>> <snip>
>> pc : clk_core_unprepare+0xf0/0x110
>> lr : clk_core_unprepare+0xf0/0x110
>> <snip>
>> Call trace:
>>   clk_core_unprepare+0xf0/0x110 (P)
>>   clk_unprepare+0x2c/0x44
>>   iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
>>   iris_vpu_power_off_hw+0x48/0x58 [qcom_iris]
>>   iris_vpu33_power_off_hardware+0x44/0x230 [qcom_iris]
>>   iris_vpu_power_off+0x34/0x84 [qcom_iris]
>>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>>   iris_remove+0x20/0x48 [qcom_iris]
>>   platform_remove+0x20/0x30
>>   device_remove+0x4c/0x80
>> <snip>
>> ---[ end trace 0000000000000000 ]---
>> genpd genpd:0:aa00000.video-codec: Runtime PM usage count underflow!
>> ------------[ cut here ]------------
>> gcc_video_axi0_clk already disabled
>> WARNING: drivers/clk/clk.c:1206 at clk_core_disable+0xa4/0xac, CPU#4: sh/542
>> <snip>
>> pc : clk_core_disable+0xa4/0xac
>> lr : clk_core_disable+0xa4/0xac
>> <snip>
>> Call trace:
>>   clk_core_disable+0xa4/0xac (P)
>>   clk_disable+0x30/0x4c
>>   iris_disable_unprepare_clock+0x20/0x48 [qcom_iris]
>>   iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
>>   iris_vpu_power_off+0x48/0x84 [qcom_iris]
>>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>>   iris_remove+0x20/0x48 [qcom_iris]
>>   platform_remove+0x20/0x30
>>   device_remove+0x4c/0x80
>> <snip>
>> ------------[ cut here ]------------
>> gcc_video_axi0_clk already unprepared
>> WARNING: drivers/clk/clk.c:1065 at clk_core_unprepare+0xf0/0x110, CPU#4: sh/542
>> <snip>
>> pc : clk_core_unprepare+0xf0/0x110
>> lr : clk_core_unprepare+0xf0/0x110
>> <snip>
>> Call trace:
>>   clk_core_unprepare+0xf0/0x110 (P)
>>   clk_unprepare+0x2c/0x44
>>   iris_disable_unprepare_clock+0x28/0x48 [qcom_iris]
>>   iris_vpu33_power_off_controller+0x17c/0x428 [qcom_iris]
>>   iris_vpu_power_off+0x48/0x84 [qcom_iris]
>>   iris_core_deinit+0x44/0xc8 [qcom_iris]
>>   iris_remove+0x20/0x48 [qcom_iris]
>>   platform_remove+0x20/0x30
>>   device_remove+0x4c/0x80
>> <snip>
>> ---[ end trace 0000000000000000 ]---
>>
>> Skip deinit if initialization never succeeded.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/iris_core.c | 10 ++++++----
>>   1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
>> index 0fa0a3b549a23877af57c9950a5892e821b9473a..8406c48d635b6eba0879396ce9f9ae2292743f09 100644
>> --- a/drivers/media/platform/qcom/iris/iris_core.c
>> +++ b/drivers/media/platform/qcom/iris/iris_core.c
>> @@ -15,10 +15,12 @@ void iris_core_deinit(struct iris_core *core)
>>   	pm_runtime_resume_and_get(core->dev);
>>   
>>   	mutex_lock(&core->lock);
>> -	iris_fw_unload(core);
>> -	iris_vpu_power_off(core);
>> -	iris_hfi_queues_deinit(core);
>> -	core->state = IRIS_CORE_DEINIT;
>> +	if (core->state != IRIS_CORE_DEINIT) {
>> +		iris_fw_unload(core);
>> +		iris_vpu_power_off(core);
>> +		iris_hfi_queues_deinit(core);
>> +		core->state = IRIS_CORE_DEINIT;
>> +	}
>>   	mutex_unlock(&core->lock);
>>   
>>   	pm_runtime_put_sync(core->dev);
>>
> 
> The iris_core_deinit() API should ideally not be called when core->state is
> in IRIS_CORE_DEINIT. Better to handle this check in the caller itself.

Checking core->state in iris_remove() won't be protected by the core->lock,
so the check and call to iris_core_deinit() should be done _after_ unregistering
the v4l2 devices to make sure there's no more users of core.

As you want, I think my approach is simpler and don't change the state if
already in deinit state.

Neil

> 
>> ---
>> base-commit: 5303936d609e09665deda94eaedf26a0e5c3a087
>> change-id: 20250820-topic-sm8x50-iris-remove-fix-76f86621d6ac
>>
>> Best regards,


