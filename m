Return-Path: <linux-arm-msm+bounces-50368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 331FCA50136
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 15:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 437D41891882
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 14:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0430120A5F0;
	Wed,  5 Mar 2025 14:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kdZvO571"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F32833C9
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 14:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741183229; cv=none; b=XMVgB5t8ppjW2UxYnE/wjjZc022Aa/r22BU62bQrathH1VhgfZWmdXEHzSOQHwTIuloQmQunUgPxmsVfRYjawKm83s5IEUb7VAZEP3x9COOq2GUB1w5jwzINTrdhYQy4yD8Qk06uDi/MeD0f9TyTUatqMcJE/yXzljjXmo7OuD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741183229; c=relaxed/simple;
	bh=3uE6O9+OMtO9KKfUcwFgZC3jS5wjKZyHMi3ZKTb4doI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rhoaw7OluilPpP2fyvYtF3NJqVQ/DU5o7fDKVjErfCCjrOkj5TVIcFYKh7Gjkyd8s1tZYfacMEnvCb7/jhu37tlcNoUq8QumPgR8FLrGR8AmvyxqVG9oReARcw9BwafqRzka/W0rpL6gI+tuFi0Gxb5W8MgtCPMbwqLH24jYWKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kdZvO571; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-439ac3216dcso46640755e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 06:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741183226; x=1741788026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEOTVdW5mbmG1SH49zjQPimhaGo3cH2LcLTefqDmKZ8=;
        b=kdZvO571Oml38/3VhAImQK1fdX86v/gq9me4gqQ6QA2Ft2EheT61Gbf+fqRYaB2Vqp
         406d+av639OFvufH39tJNkJkeDK2tfCTAzljx2CNVUU/8mrh0Aek2mP36c0EN/tZ3i9D
         /b2Gc//6wIovJam58UoCY1qfAlFY7lT2ahfMzwQzJX0FOdTw+/hy31cPDlLecGnGv8h2
         dfAnjOw3voAGInVHeSYpoSRhVyRgHTL1pCzKT/6XAXRjH4f9oW6lNW1Hj9r2Tc/+3pO2
         JwNPwrV7ekhS0FzyJ+jul/Zwdcd6qWmLyl6axPGAYQEgkfJR8jivwKQre50NVWQixcnQ
         Khng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741183226; x=1741788026;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OEOTVdW5mbmG1SH49zjQPimhaGo3cH2LcLTefqDmKZ8=;
        b=hnt115QJr6t5wq1+1aDUqqUh10vpXJpWOX5p9TmH2/gOTQPE0Lf60uLc9v/IsqmQPP
         HW+uyM7BUc05zR2eipTMwU7HtmyjXmJ2VB8wm9HNnGpTxprE5TGgGTO+1/DYmPGCoTiS
         qODmrA4UNO1J/1V2raZkI1lTeOzdc3U8hbKCaJ9BgmprINwtMMN6RSu5JX3glaV7b24Q
         SqWr0jrlzeTkBgGXtnyWssp2chDoGucOtyV0s+/AiwUKvSgJVWdR6mXcZlcVaJ5Z1J2N
         vxuE9AMkG9gniSaoIL7YEZeA2ZfMjSFecgPpMAvUWGMJj4kecCrcUzd3QXH0vUDBd7VJ
         Wa4A==
X-Forwarded-Encrypted: i=1; AJvYcCWkLQWbXl+mPjPqVzXCTrpXNklyuexnCa3vzwViVVLQAs0GLzK6q2sXkd+bGgFMWjqMQGzGPUVZ/cn3kRO3@vger.kernel.org
X-Gm-Message-State: AOJu0YxH6PM/Tqkgsa+j0FuiL5Kgwo6PxX5O9fz3qA+v2To7YuVB/EMV
	jh6SLhuroVDN3XcWzvTbpk0SqX3K3a+xt8hAWM04UYigctL4lyNLb8Sa6QpkqAw=
X-Gm-Gg: ASbGncvFSM1BpY/0tWv+bHYW4dQHUmuVskN3Lv6tdSG0wK5r5t9FSPtK+qlYsAqp2bA
	CrNjntCeN7wyfVxxQDy8v/0L/Q+MwMffk0QzynREptlXjBox9mdVM62WPkinfiXX2pg3/GFYFob
	7RZPD241AZsAXceoyf++pzX8nUvYd/Q/hYVrtP4kQz192eD3ExfLak18K9u/naqTZXv5/rjqfF5
	c40kirTG9bisVmeKhRxQt8IKouyqgCxNcTvjVo8u8e3YDtjL+51scnSnN0NUawjU80FIwjIncWH
	mYQNRzDHz/YN0RntYiXXHxnqKaqpDz04NOyN/oMRdLg/p2n0dukJPqld1NEC/7Jq/vV0LkycWfs
	9ginacJiMzmKLb08YdUmvSQ==
X-Google-Smtp-Source: AGHT+IEReBSsHwW2Ufp4roAlOCuIrRN3Y+e+hlgUVdVtzv8a9dKMAQl8hlmn8cRKDkmT1V7HUqArkA==
X-Received: by 2002:a05:600c:4747:b0:43b:caac:595d with SMTP id 5b1f17b1804b1-43bd29b3c72mr21338975e9.23.1741183225322;
        Wed, 05 Mar 2025 06:00:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:d001:4ab2:d11a:658b? ([2a01:e0a:982:cbb0:d001:4ab2:d11a:658b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e46f580bsm20805289f8f.0.2025.03.05.06.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 06:00:25 -0800 (PST)
Message-ID: <f2d012de-827d-46d6-a9c9-d31dce65fbc2@linaro.org>
Date: Wed, 5 Mar 2025 15:00:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [RFC PATCH 03/12] media: iris: Set mandatory properties for HEVC
 and VP9 decoders.
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org
Cc: hverkuil@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-4-quic_dikshita@quicinc.com>
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
In-Reply-To: <20250305104335.3629945-4-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 11:43, Dikshita Agarwal wrote:
> Subscribe and set mandatory properties to the firmware for HEVC and VP9
> decoders.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   .../platform/qcom/iris/iris_hfi_common.h      |  1 +
>   .../qcom/iris/iris_hfi_gen1_command.c         |  4 +-
>   .../qcom/iris/iris_hfi_gen2_command.c         | 83 +++++++++++++++++--
>   .../qcom/iris/iris_hfi_gen2_response.c        |  7 ++
>   .../platform/qcom/iris/iris_platform_common.h | 16 +++-
>   .../platform/qcom/iris/iris_platform_sm8250.c |  4 +-
>   .../platform/qcom/iris/iris_platform_sm8550.c | 61 ++++++++++++--
>   7 files changed, 151 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index b2c541367fc6..9e6aadb83783 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -140,6 +140,7 @@ struct hfi_subscription_params {
>   	u32	color_info;
>   	u32	profile;
>   	u32	level;
> +	u32	tier;
>   };
>   
>   u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 1e774b058ab9..a160ae915886 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -784,8 +784,8 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
>   			iris_hfi_gen1_set_bufsize},
>   	};
>   
> -	config_params = core->iris_platform_data->input_config_params;
> -	config_params_size = core->iris_platform_data->input_config_params_size;
> +	config_params = core->iris_platform_data->input_config_params_default;
> +	config_params_size = core->iris_platform_data->input_config_params_default_size;
>   
>   	if (V4L2_TYPE_IS_OUTPUT(plane)) {
>   		for (i = 0; i < config_params_size; i++) {
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index a3ebcda9a2ba..5b4c89184297 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -192,7 +192,7 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst)
>   						  sizeof(u64));
>   }
>   
> -static int iris_hfi_gen2_set_bit_dpeth(struct iris_inst *inst)
> +static int iris_hfi_gen2_set_bit_depth(struct iris_inst *inst)

Please move typo fixes to separate patch with Fixes tag.

Neil

>   {
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
>   	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> @@ -407,6 +407,23 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst)
>   						  sizeof(u64));
>   }
>   
> +static int iris_hfi_gen2_set_tier(struct iris_inst *inst)
> +{
> +	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> +	u32 port = iris_hfi_gen2_get_port(V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	u32 tier = inst->fw_caps[TIER].value;
> +
> +	inst_hfi_gen2->src_subcr_params.tier = tier;
> +
> +	return iris_hfi_gen2_session_set_property(inst,
> +						  HFI_PROP_TIER,
> +						  HFI_HOST_FLAGS_NONE,
> +						  port,
> +						  HFI_PAYLOAD_U32_ENUM,
> +						  &tier,
> +						  sizeof(u32));
> +}
> +
>   static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 plane)
>   {
>   	struct iris_core *core = inst->core;
> @@ -418,7 +435,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>   		{HFI_PROP_BITSTREAM_RESOLUTION,       iris_hfi_gen2_set_bitstream_resolution   },
>   		{HFI_PROP_CROP_OFFSETS,               iris_hfi_gen2_set_crop_offsets           },
>   		{HFI_PROP_CODED_FRAMES,               iris_hfi_gen2_set_coded_frames           },
> -		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_dpeth              },
> +		{HFI_PROP_LUMA_CHROMA_BIT_DEPTH,      iris_hfi_gen2_set_bit_depth              },
>   		{HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT, iris_hfi_gen2_set_min_output_count       },
>   		{HFI_PROP_PIC_ORDER_CNT_TYPE,         iris_hfi_gen2_set_picture_order_count    },
>   		{HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
> @@ -426,11 +443,25 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>   		{HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
>   		{HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
>   		{HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
> +		{HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>   	};
>   
>   	if (V4L2_TYPE_IS_OUTPUT(plane)) {
> -		config_params = core->iris_platform_data->input_config_params;
> -		config_params_size = core->iris_platform_data->input_config_params_size;
> +		if (inst->codec == V4L2_PIX_FMT_H264) {
> +			config_params = core->iris_platform_data->input_config_params_default;
> +			config_params_size =
> +				core->iris_platform_data->input_config_params_default_size;
> +		} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +			config_params = core->iris_platform_data->input_config_params_hevc;
> +			config_params_size =
> +				core->iris_platform_data->input_config_params_hevc_size;
> +		} else if (inst->codec == V4L2_PIX_FMT_VP9) {
> +			config_params = core->iris_platform_data->input_config_params_vp9;
> +			config_params_size =
> +				core->iris_platform_data->input_config_params_vp9_size;
> +		} else {
> +			return -EINVAL;
> +		}
>   	} else {
>   		config_params = core->iris_platform_data->output_config_params;
>   		config_params_size = core->iris_platform_data->output_config_params_size;
> @@ -600,8 +631,21 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   		return 0;
>   	}
>   
> -	change_param = core->iris_platform_data->input_config_params;
> -	change_param_size = core->iris_platform_data->input_config_params_size;
> +	if (inst->codec == V4L2_PIX_FMT_H264) {
> +		change_param = core->iris_platform_data->input_config_params_default;
> +		change_param_size =
> +			core->iris_platform_data->input_config_params_default_size;
> +	} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +		change_param = core->iris_platform_data->input_config_params_hevc;
> +		change_param_size =
> +			core->iris_platform_data->input_config_params_hevc_size;
> +	} else if (inst->codec == V4L2_PIX_FMT_VP9) {
> +		change_param = core->iris_platform_data->input_config_params_vp9;
> +		change_param_size =
> +			core->iris_platform_data->input_config_params_vp9_size;
> +	} else {
> +		return -EINVAL;
> +	}
>   
>   	payload[0] = HFI_MODE_PORT_SETTINGS_CHANGE;
>   
> @@ -648,6 +692,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   				payload_size = sizeof(u32);
>   				payload_type = HFI_PAYLOAD_U32;
>   				break;
> +			case HFI_PROP_LUMA_CHROMA_BIT_DEPTH:
> +				payload[0] = subsc_params.bit_depth;
> +				payload_size = sizeof(u32);
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
>   			case HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT:
>   				payload[0] = subsc_params.fw_min_count;
>   				payload_size = sizeof(u32);
> @@ -673,6 +722,11 @@ static int iris_hfi_gen2_subscribe_change_param(struct iris_inst *inst, u32 plan
>   				payload_size = sizeof(u32);
>   				payload_type = HFI_PAYLOAD_U32;
>   				break;
> +			case HFI_PROP_TIER:
> +				payload[0] = subsc_params.tier;
> +				payload_size = sizeof(u32);
> +				payload_type = HFI_PAYLOAD_U32;
> +				break;
>   			default:
>   				prop_type = 0;
>   				ret = -EINVAL;
> @@ -709,8 +763,21 @@ static int iris_hfi_gen2_subscribe_property(struct iris_inst *inst, u32 plane)
>   		subscribe_prop_size = core->iris_platform_data->dec_input_prop_size;
>   		subcribe_prop = core->iris_platform_data->dec_input_prop;
>   	} else {
> -		subscribe_prop_size = core->iris_platform_data->dec_output_prop_size;
> -		subcribe_prop = core->iris_platform_data->dec_output_prop;
> +		if (inst->codec == V4L2_PIX_FMT_H264) {
> +			subcribe_prop = core->iris_platform_data->dec_output_prop_avc;
> +			subscribe_prop_size =
> +				core->iris_platform_data->dec_output_prop_avc_size;
> +		} else if (inst->codec == V4L2_PIX_FMT_HEVC) {
> +			subcribe_prop = core->iris_platform_data->dec_output_prop_hevc;
> +			subscribe_prop_size =
> +				core->iris_platform_data->dec_output_prop_hevc_size;
> +		} else if (inst->codec == V4L2_PIX_FMT_VP9) {
> +			subcribe_prop = core->iris_platform_data->dec_output_prop_vp9;
> +			subscribe_prop_size =
> +				core->iris_platform_data->dec_output_prop_vp9_size;
> +		} else {
> +			return -EINVAL;
> +		}
>   	}
>   
>   	for (i = 0; i < subscribe_prop_size; i++)
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 809bf0f238bd..6846311a26c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -580,6 +580,7 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>   	}
>   
>   	inst->fw_caps[POC].value = subsc_params.pic_order_cnt;
> +	inst->fw_caps[TIER].value = subsc_params.tier;
>   
>   	if (subsc_params.bit_depth != BIT_DEPTH_8 ||
>   	    !(subsc_params.coded_frames & HFI_BITMASK_FRAME_MBS_ONLY_FLAG)) {
> @@ -664,6 +665,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>   		inst_hfi_gen2->src_subcr_params.crop_offsets[0] = pkt->payload[0];
>   		inst_hfi_gen2->src_subcr_params.crop_offsets[1] = pkt->payload[1];
>   		break;
> +	case HFI_PROP_LUMA_CHROMA_BIT_DEPTH:
> +		inst_hfi_gen2->src_subcr_params.bit_depth = pkt->payload[0];
> +		break;
>   	case HFI_PROP_CODED_FRAMES:
>   		inst_hfi_gen2->src_subcr_params.coded_frames = pkt->payload[0];
>   		break;
> @@ -682,6 +686,9 @@ static int iris_hfi_gen2_handle_session_property(struct iris_inst *inst,
>   	case HFI_PROP_LEVEL:
>   		inst_hfi_gen2->src_subcr_params.level = pkt->payload[0];
>   		break;
> +	case HFI_PROP_TIER:
> +		inst_hfi_gen2->src_subcr_params.tier = pkt->payload[0];
> +		break;
>   	case HFI_PROP_PICTURE_TYPE:
>   		inst_hfi_gen2->hfi_frame_info.picture_type = pkt->payload[0];
>   		break;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 67204cddd44a..433ce9b00c68 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -174,14 +174,22 @@ struct iris_platform_data {
>   	u32 num_vpp_pipe;
>   	u32 max_session_count;
>   	u32 max_core_mbpf;
> -	const u32 *input_config_params;
> -	unsigned int input_config_params_size;
> +	const u32 *input_config_params_default;
> +	unsigned int input_config_params_default_size;
> +	const u32 *input_config_params_hevc;
> +	unsigned int input_config_params_hevc_size;
> +	const u32 *input_config_params_vp9;
> +	unsigned int input_config_params_vp9_size;
>   	const u32 *output_config_params;
>   	unsigned int output_config_params_size;
>   	const u32 *dec_input_prop;
>   	unsigned int dec_input_prop_size;
> -	const u32 *dec_output_prop;
> -	unsigned int dec_output_prop_size;
> +	const u32 *dec_output_prop_avc;
> +	unsigned int dec_output_prop_avc_size;
> +	const u32 *dec_output_prop_hevc;
> +	unsigned int dec_output_prop_hevc_size;
> +	const u32 *dec_output_prop_vp9;
> +	unsigned int dec_output_prop_vp9_size;
>   	const u32 *dec_ip_int_buf_tbl;
>   	unsigned int dec_ip_int_buf_tbl_size;
>   	const u32 *dec_op_int_buf_tbl;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 5c86fd7b7b6f..5f74e57f04fc 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -137,9 +137,9 @@ struct iris_platform_data sm8250_data = {
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
>   	.max_core_mbpf = (8192 * 4352) / 256,
> -	.input_config_params =
> +	.input_config_params_default =
>   		sm8250_vdec_input_config_param_default,
> -	.input_config_params_size =
> +	.input_config_params_default_size =
>   		ARRAY_SIZE(sm8250_vdec_input_config_param_default),
>   
>   	.dec_ip_int_buf_tbl = sm8250_dec_ip_int_buf_tbl,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> index 29bc50785da5..779c71885f51 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -254,9 +254,10 @@ static struct tz_cp_config tz_cp_config_sm8550 = {
>   	.cp_nonpixel_size = 0x24800000,
>   };
>   
> -static const u32 sm8550_vdec_input_config_params[] = {
> +static const u32 sm8550_vdec_input_config_params_default[] = {
>   	HFI_PROP_BITSTREAM_RESOLUTION,
>   	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
>   	HFI_PROP_CODED_FRAMES,
>   	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
>   	HFI_PROP_PIC_ORDER_CNT_TYPE,
> @@ -265,6 +266,26 @@ static const u32 sm8550_vdec_input_config_params[] = {
>   	HFI_PROP_SIGNAL_COLOR_INFO,
>   };
>   
> +static const u32 sm8550_vdec_input_config_param_hevc[] = {
> +	HFI_PROP_BITSTREAM_RESOLUTION,
> +	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +	HFI_PROP_PROFILE,
> +	HFI_PROP_LEVEL,
> +	HFI_PROP_TIER,
> +	HFI_PROP_SIGNAL_COLOR_INFO,
> +};
> +
> +static const u32 sm8550_vdec_input_config_param_vp9[] = {
> +	HFI_PROP_BITSTREAM_RESOLUTION,
> +	HFI_PROP_CROP_OFFSETS,
> +	HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	HFI_PROP_BUFFER_FW_MIN_OUTPUT_COUNT,
> +	HFI_PROP_PROFILE,
> +	HFI_PROP_LEVEL,
> +};
> +
>   static const u32 sm8550_vdec_output_config_params[] = {
>   	HFI_PROP_COLOR_FORMAT,
>   	HFI_PROP_LINEAR_STRIDE_SCANLINE,
> @@ -274,11 +295,19 @@ static const u32 sm8550_vdec_subscribe_input_properties[] = {
>   	HFI_PROP_NO_OUTPUT,
>   };
>   
> -static const u32 sm8550_vdec_subscribe_output_properties[] = {
> +static const u32 sm8550_vdec_subscribe_output_properties_avc[] = {
>   	HFI_PROP_PICTURE_TYPE,
>   	HFI_PROP_CABAC_SESSION,
>   };
>   
> +static const u32 sm8550_vdec_subscribe_output_properties_hevc[] = {
> +	HFI_PROP_PICTURE_TYPE,
> +};
> +
> +static const u32 sm8550_vdec_subscribe_output_properties_vp9[] = {
> +	HFI_PROP_PICTURE_TYPE,
> +};
> +
>   static const u32 sm8550_dec_ip_int_buf_tbl[] = {
>   	BUF_BIN,
>   	BUF_COMV,
> @@ -322,19 +351,33 @@ struct iris_platform_data sm8550_data = {
>   	.num_vpp_pipe = 4,
>   	.max_session_count = 16,
>   	.max_core_mbpf = ((8192 * 4352) / 256) * 2,
> -	.input_config_params =
> -		sm8550_vdec_input_config_params,
> -	.input_config_params_size =
> -		ARRAY_SIZE(sm8550_vdec_input_config_params),
> +	.input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
>   	.output_config_params =
>   		sm8550_vdec_output_config_params,
>   	.output_config_params_size =
>   		ARRAY_SIZE(sm8550_vdec_output_config_params),
>   	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
>   	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> -	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
> -	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
> -
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
>   	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
>   	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,


