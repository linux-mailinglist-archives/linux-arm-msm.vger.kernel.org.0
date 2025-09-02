Return-Path: <linux-arm-msm+bounces-71506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D976FB3F681
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 09:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A969C3A1E70
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 07:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8627D18DB0D;
	Tue,  2 Sep 2025 07:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bHLgwrtZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BA42D5948
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 07:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756797693; cv=none; b=dJlV8ePWJtmDrlexy7+nvmcdAyzkFl2hgvNHt8wlC63yK0E6iwO7Nv1ECwDFkWxbhhSJdxzmKPgbDsqBt5DOj+vkOp4X02xrYvQ4KTWnWnWInyiMuybsKaaitaxBx75tYVKS8sCoqhkWy0/94p67zmNEowXEguN568TI0RKeCLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756797693; c=relaxed/simple;
	bh=kJQxpjCqlZ7Pn+nGmMNgJY5WLRB7Y9Hxgi5pF4rG57M=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ffnWOCgnIHAy0lt3u+K2PDx+3Ddw30m/3HQsprK+rqdjI94PMgPfT37vtVP/YP9rem/BTUWMxnKw6L+ZwpobVXCgCC4Z74FCkfUArr/aKkOicsrd667PW7d3nVVWwfZuxqIoeAPn50FYvSR/IO6LScZNGlLAExPdfx8x8tFvmM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bHLgwrtZ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45b82a21e6bso22438525e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 00:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756797690; x=1757402490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GZYc2gTwotRCPfxF9ccmYJXr1x0xjgtdsup+yVwJgik=;
        b=bHLgwrtZVxuIqM9EmXg4yLdp4PU5Ycb4BnalikCpjQ3vSOTSiHZwDhQv1tHxGXD1H+
         mSllZVyCgr77forLbhdgt/rYoB9STSAW/YLfLy69aVxZai8GsCoeq3QhIMR25UbPqA4u
         59OB/oj6UFsBMJ087gcGfUsAg7DEh/aje679Gs7g/oYjnWf7f+MkRfLVOkKbl4j6aJ9z
         UauoBI1fMFwz5dFBYTSc9n54aD42HIu3XShTj64x3XAwJ94XVM7GjUbC+z4owKSOp2vQ
         N2aJFrQZcxCkpOQ659F58BezSjLbBWj97cnMR6OOUbtZlLB/HBxm53310h+c1hG3OF3A
         M4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756797690; x=1757402490;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GZYc2gTwotRCPfxF9ccmYJXr1x0xjgtdsup+yVwJgik=;
        b=LfGtZV/vhJXh6ymfaxB2gIlwWSm4IsB51gHEmN5C+m7bci4zvI89qMFZ3c+xHGaAQA
         Qtebeb5Tz55Yf9BrfFPGEmhAhe+wjxbEkfnP+HclfvY9mGEyhdIbpL2E57krJVPtUt9z
         QsX2V3nzta1Vj5zo/HiDmB1vEzrBHlStD1rKA1hoeg2q7gTTaLMe9bsuF64Ll+vQ6ODB
         UhzMaiBBZ7Ffds/USRn2b1neVhoQQP6VSlgGQCmF++qCfwI6ZzCpNtIttXp2X+lEz0nu
         /bnYckNSsrYvaY76U8E32oMEhOyaNq/BidHiP9c1Ii1bkEW2C+XkqQEkXsn8Zmwj8Gul
         BYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4AtTSSFW5tSfGyI0oTY+UVPU9OzQVfQlHLsXlQ8TlWNCEIswJcQt9yzYTqG5CYV+ecpZjnWsEEx2K+zyO@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx0Ejlr6ggw+V4tyfdSQWSrQZ8IizJl/4NSWXTzKLblek8Uc3p
	JNNAeTlkYLaGNU/2rMLTjCSvrldTcJu7OADgPV+JLqw/T5zDE6zPKhvYREew0VUU0LeWZbAwoC+
	KKwj3kXs=
X-Gm-Gg: ASbGncuG5NihRRvE2lyDEgv+bTLPyIT5SiwF4hoaHwgYVcjUHQJSN/vFSw0wkjH9xgi
	ugmiTBtG6xNuhCrPkYgbNW89kyUh3xTdXN5F9VW2YjvsSwxtRtCB8nE57cqjWq8Te4/VxBhwvFN
	pM4ZmDQclsOivom0gR1+Kym8o64YbHgXfMI+0cjwGt0gQE/BheW0BlDbPmXalw/Je1je+o7BSyk
	Xn0GYs8NLt9O/t5yp4pBNNAVy6RWdVdjcSqJwnhnc3v+4rnyTnOcyAoWZyYrTRD3RLp2bDlvOWl
	FLwonIviJIbhLISfe2tcf+0i8xGC64FkZiNWWtvrvDfRWxiAIQwxwf3HY+xanQKe06FkfcRC6q9
	YYeIIuucNCyed94xyaA4ehIXTNvIQECA21rUT6WhMvo79/5cIqYaf1QBsQy/pwthpLwF1/5ylnQ
	mT+xtmegAxLw==
X-Google-Smtp-Source: AGHT+IHq00ORljR0KDxbkjVA0MVKRvj1935Y8BKUCMpGbUUQyrOr6bxBI5vFXiIzg53u3RPHNHLPJA==
X-Received: by 2002:a05:600c:a4c:b0:45b:7bba:c7a6 with SMTP id 5b1f17b1804b1-45b85598aaemr78529095e9.32.1756797689609;
        Tue, 02 Sep 2025 00:21:29 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939? ([2a01:e0a:3d9:2080:5c8d:8a1e:ea2b:c939])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34491a7fsm18001654f8f.57.2025.09.02.00.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 00:21:29 -0700 (PDT)
Message-ID: <61742417-9230-4786-960c-9c9baf253e74@linaro.org>
Date: Tue, 2 Sep 2025 09:21:28 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] media: iris: add VPU33 specific encoding buffer
 calculation
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250901-topic-sm8x50-iris-encoder-v3-hevc-debug-v2-1-c65406bbdf68@linaro.org>
 <a9e5271b-104b-b7b6-2c85-04d40c735a73@quicinc.com>
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
In-Reply-To: <a9e5271b-104b-b7b6-2c85-04d40c735a73@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2025 07:40, Dikshita Agarwal wrote:
> 
> 
> On 9/1/2025 1:25 PM, Neil Armstrong wrote:
>> The VPU33 found in the SM8650 Platform requires some slighly different
>> buffer calculation for encoding to allow working with the latest
>> firwware uploaded on linux-firmware at [1].
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=ece445af91bbee49bf0d8b23c2b99b596ae6eac7
>>
>> Suggested-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>> [2] https://lore.kernel.org/all/20250825-iris-video-encoder-v4-0-84aa2bc0a46b@quicinc.com/
>> ---
>> Changes in v2:
>> - Removed calculation fix for hevc encoding, as it was added in common code
>> - Link to v1: https://lore.kernel.org/r/20250822-topic-sm8x50-iris-encoder-v3-hevc-debug-v1-1-633d904ff7d3@linaro.org
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c     |   2 +-
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     |   2 +-
>>   .../platform/qcom/iris/iris_platform_common.h      |   2 +
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |   4 +
>>   .../platform/qcom/iris/iris_platform_sm8250.c      |   2 +
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 110 ++++++++++++++++++++-
>>   drivers/media/platform/qcom/iris/iris_vpu_buffer.h |   3 +-
>>   7 files changed, 118 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index 8891a297d384b018b3cc8313ad6416db6317798b..c0900038e7defccf7de3cb60e17c71e36a0e8ead 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -284,7 +284,7 @@ static void iris_fill_internal_buf_info(struct iris_inst *inst,
>>   {
>>   	struct iris_buffers *buffers = &inst->buffers[buffer_type];
>>   
>> -	buffers->size = iris_vpu_buf_size(inst, buffer_type);
>> +	buffers->size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, buffer_type);
>>   	buffers->min_count = iris_vpu_buf_count(inst, buffer_type);
>>   }
>>   
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index 29cf392ca2566da286ea3e928ce4a22c2e970cc8..e1788c266bb1080921f17248fd5ee60156b3143d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -911,7 +911,7 @@ static int iris_hfi_gen1_set_bufsize(struct iris_inst *inst, u32 plane)
>>   
>>   	if (iris_split_mode_enabled(inst)) {
>>   		bufsz.type = HFI_BUFFER_OUTPUT;
>> -		bufsz.size = iris_vpu_buf_size(inst, BUF_DPB);
>> +		bufsz.size = inst->core->iris_platform_data->get_vpu_buffer_size(inst, BUF_DPB);
>>   
>>   		ret = hfi_gen1_set_property(inst, ptype, &bufsz, sizeof(bufsz));
>>   		if (ret)
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 96fa7b1bb592441e85664da408ea4ba42c9a15b5..7057c4cd1a9ebefa02c855014e5f19993da58e38 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -7,6 +7,7 @@
>>   #define __IRIS_PLATFORM_COMMON_H__
>>   
>>   #include <linux/bits.h>
>> +#include "iris_buffer.h"
>>   
>>   struct iris_core;
>>   struct iris_inst;
>> @@ -189,6 +190,7 @@ struct iris_platform_data {
>>   	void (*init_hfi_command_ops)(struct iris_core *core);
>>   	void (*init_hfi_response_ops)(struct iris_core *core);
>>   	struct iris_inst *(*get_instance)(void);
>> +	u32 (*get_vpu_buffer_size)(struct iris_inst *inst, enum iris_buffer_type buffer_type);
>>   	const struct vpu_ops *vpu_ops;
>>   	void (*set_preset_registers)(struct iris_core *core);
>>   	const struct icc_info *icc_tbl;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index cf4b92f534b272a0a1ac2a0e7bb9316501374332..78a04e76de7c00703b84bd3c1c6e9a884ee7cebe 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -8,6 +8,7 @@
>>   #include "iris_hfi_gen2.h"
>>   #include "iris_hfi_gen2_defines.h"
>>   #include "iris_platform_common.h"
>> +#include "iris_vpu_buffer.h"
>>   #include "iris_vpu_common.h"
>>   
>>   #include "iris_platform_qcs8300.h"
>> @@ -738,6 +739,7 @@ struct iris_platform_data sm8550_data = {
>>   	.get_instance = iris_hfi_gen2_get_instance,
>>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>   	.vpu_ops = &iris_vpu3_ops,
>>   	.set_preset_registers = iris_set_sm8550_preset_registers,
>>   	.icc_tbl = sm8550_icc_table,
>> @@ -827,6 +829,7 @@ struct iris_platform_data sm8650_data = {
>>   	.get_instance = iris_hfi_gen2_get_instance,
>>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu33x_buf_size,
>>   	.vpu_ops = &iris_vpu33_ops,
>>   	.set_preset_registers = iris_set_sm8550_preset_registers,
>>   	.icc_tbl = sm8550_icc_table,
>> @@ -916,6 +919,7 @@ struct iris_platform_data qcs8300_data = {
>>   	.get_instance = iris_hfi_gen2_get_instance,
>>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>   	.vpu_ops = &iris_vpu3_ops,
>>   	.set_preset_registers = iris_set_sm8550_preset_registers,
>>   	.icc_tbl = sm8550_icc_table,
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> index 978d0130d43b5f6febb65430a9bbe3932e8f24df..16486284f8acccf6a95a27f6003e885226e28f4d 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
>> @@ -9,6 +9,7 @@
>>   #include "iris_resources.h"
>>   #include "iris_hfi_gen1.h"
>>   #include "iris_hfi_gen1_defines.h"
>> +#include "iris_vpu_buffer.h"
>>   #include "iris_vpu_common.h"
>>   
>>   #define BITRATE_MIN		32000
>> @@ -317,6 +318,7 @@ struct iris_platform_data sm8250_data = {
>>   	.get_instance = iris_hfi_gen1_get_instance,
>>   	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>>   	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
>> +	.get_vpu_buffer_size = iris_vpu_buf_size,
>>   	.vpu_ops = &iris_vpu2_ops,
>>   	.set_preset_registers = iris_set_sm8250_preset_registers,
>>   	.icc_tbl = sm8250_icc_table,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> index 34a9094201ccd11d30a776f284ede8248d8017a9..9cb7701722c3644ef4c369fa58490ac83258ea7e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
>> @@ -867,6 +867,34 @@ u32 size_vpss_line_buf(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>>   		      (((((max_t(u32, (frame_width_coded),
>>   				 (frame_height_coded)) + 3) >> 2) << 5) + 256) * 16)), 256);
>>   }
>> +static inline
>> +u32 size_vpss_line_buf_vpu33x(u32 num_vpp_pipes_enc, u32 frame_height_coded,
>> +			      u32 frame_width_coded)
>> +{
>> +	u32 vpss_4tap_top = 0, vpss_4tap_left = 0, vpss_div2_top = 0;
>> +	u32 vpss_div2_left = 0, vpss_top_lb = 0, vpss_left_lb = 0;
>> +	u32 size_left = 0, size_top = 0;
>> +
>> +	vpss_4tap_top = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
>> +	vpss_4tap_top >>= 2;
>> +	vpss_4tap_top <<= 4;
>> +	vpss_4tap_top += 256;
> 
> Would it be better if combined?
> vpss_4tap_top = ((((max(frame_width_coded, frame_height_coded) * 2) + 3) >>
> 2) << 4) + 256;

Probably, but I don't know how to format it correctly.

Neil

> 
> Thanks,
> Dikshita
> 
>> +	vpss_4tap_left = (((8192 + 3) >> 2) << 5) + 64;
>> +	vpss_div2_top = max_t(u32, frame_width_coded, frame_height_coded) + 3;
>> +	vpss_div2_top >>= 2;
>> +	vpss_div2_top <<= 4;
>> +	vpss_div2_top += 256;
>> +	vpss_div2_left = (max_t(u32, frame_width_coded, frame_height_coded) * 2) + 3;
>> +	vpss_div2_left >>= 2;
>> +	vpss_div2_left <<= 5;
>> +	vpss_div2_left += 64;
>> +	vpss_top_lb = (frame_width_coded + 1) << 3;
>> +	vpss_left_lb = (frame_height_coded << 3) * num_vpp_pipes_enc;
>> +	size_left = (vpss_4tap_left + vpss_div2_left) * 2 * num_vpp_pipes_enc;
>> +	size_top = (vpss_4tap_top + vpss_div2_top) * 2;
>> +
>> +	return ALIGN(size_left + size_top + vpss_top_lb + vpss_left_lb, DMA_ALIGNMENT);
>> +}
>>   


