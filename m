Return-Path: <linux-arm-msm+bounces-75648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9863BAFA87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 10:36:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73C884A3914
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 08:36:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59BA727A456;
	Wed,  1 Oct 2025 08:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pEsieVBT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D5B1494CC
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 08:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307811; cv=none; b=oKaqM9X4wMHl5yusZd39Fs2poC0/GL/7TsXbG8dU8MLwCPTHuIJc5c0Bxe5NC2y3bEMZTKZ4S+J92EO1oUGYeD7cjQzkzMH7qhRwa+U+XQrBd8fMuJkZ1zFl6FN03z35avf0qkpzUEwnVfN+Qkm1qAOd38jUNgl9hZvlvgYwJr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307811; c=relaxed/simple;
	bh=RynI9bUlJ13dlMFG/7puo6KtS8WS+rD4jC6Vm6YMxZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTUYvJZj85hFlp8F1HhO9QS+4MVVTNSO7Vat9wBd9lSP1KXkoKoNwSTh2AB9qd8wK895bvn3vO+IAoHMl0bOwadRXnfSsP/oX0X1AbVOLxhYW+ms89hVYogOiWmhI+rqqn/RCodkM5VGHn0yHjsHLHKW4PbvhTE6J6ylbonUJmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pEsieVBT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso5704629f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 01:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759307807; x=1759912607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5rfQKnt8PZxCCsf5IwsAfDzra+/k8Dn5E1VERhXE4Q=;
        b=pEsieVBTDBqRS2jtu626P0v/eIah5Khv3cZ1kS/1VBTcNiy0ib3iDwkSvo8A6dC+2t
         X9pvxU9VgAWddKJ8wlrA1+z7+iImmPpZa5jAAMMaUdNgdYB2H7pt4EYOxFDPZ+uYGycv
         +NfIEY9NroBtCONC/XyU0BceEGYIlVHsR9qcLLD1FRjFkpfE6QqmQ3BdQzss1as8ONZ6
         aPv7zWD83Kiix8PFsIAvS4fmNC30qKq0UhRn6oxwYKZ8+30FQeXMnmDhM0KrKITjbeFR
         FHGPEWrXSBltgRf16AkyQ7NTTKag6G875IWhVyceFcU6G4szJAqagegtdorQIxia9D5v
         S0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307807; x=1759912607;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r5rfQKnt8PZxCCsf5IwsAfDzra+/k8Dn5E1VERhXE4Q=;
        b=LoQg3HihlVWt0ulEOwIsE+/RXLrUjrehiq1AwsO24HKtv4Cr3Q5+a2p4odo7C16G2U
         rStlEtkOSlFQYREEgO4F+VFkZraQBza3Go87UtSx30Cb9fbWCElSnzZHuo62h+yBGVDf
         PuJh5vRrK1ic+LPDJKin8RYC6rE93NqZ2Z5np6bHdT+vxXHcdDHGYLNSWuqlcw9axJpj
         2xhOnWkOguJuGCmnCOjRAw5x1WLqBD5jQL4FOT1I2wnVSfKL8+2obGOlZN/jVkHtSRC8
         BKjs6BxDZ/0UybGr/jN81KgNuWsZOpnVZrGYbSsT2Q/CRP/CuX4CI4ChhoAjieF2tF7G
         VPWw==
X-Forwarded-Encrypted: i=1; AJvYcCW2/2zuxw0j/Baj4u5H/WJ9EqBQYs1hzZQLvIO8rgv+803q0NyjISuEP1BJTyfsthKo8CMZflp0CF+G2lW8@vger.kernel.org
X-Gm-Message-State: AOJu0YwdSXnpzBXzeaEfRUJAmzGm4GXEevhaUsppzMGRSCW/k+GfZViJ
	bJPjwxJC3tdsUTefvRKR0zEztoGfmKI88owiIOIbTa3cjGtmn62njS+Df8CxkFoUXQs=
X-Gm-Gg: ASbGncsm5iwbJUIEA6Re9+7gHpG4biHUEuLXf5q5KIvzL57Nn0K6JAwosKN2cmj8pMj
	S532fFXJtyx/NGhT6qldg7eLhJzt3gJ2anDMgKbv5r8nPGhONi12g67pwd9XdVIlXZBzVT5oWNf
	s48xBvxSJAp8+mMMv/dDMrDdy6f+r9iRVXwGeEoAgx6wk37kc9EK9dM0HWiGaY8M1TIu6B32qj7
	83OaXIu/nY4J5Dfv2TTiU/LbEEujbf1E7cUbIScmuIDjP2WGdNUUuTyPu+aNv5bWnqFpwDztbgN
	jtAGoIRPsKWoaydzW57Q/WNvOk6FcMTDU+LmJ+qMwqAmSeluvl48ER6LeU92rsAIJWg0UmG6yLc
	MdZVIfqnLHdkCrasqbC2hLFWBXNq7IbkbNLWD3ndz2UEMaV7gIYzH97yK9HYgNSDJk9ziROwOn0
	Loule82U0SOwytgdlgUnQXUO0=
X-Google-Smtp-Source: AGHT+IGFS8tI1pJ1m2+L4eOg0pK1nXBcC3wC0cp96dwuhngvZGIsLfMftZ/NkfC1ffuZcYF2gzOImA==
X-Received: by 2002:a5d:64c8:0:b0:3f9:6657:d05 with SMTP id ffacd0b85a97d-425577ed5demr1897437f8f.12.1759307806742;
        Wed, 01 Oct 2025 01:36:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f45f:c590:9006:d394? ([2a01:e0a:3d9:2080:f45f:c590:9006:d394])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fc5603381sm28149581f8f.31.2025.10.01.01.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:36:46 -0700 (PDT)
Message-ID: <5e7f20ee-7960-4a1b-bbf2-b5f5330e1527@linaro.org>
Date: Wed, 1 Oct 2025 10:36:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] media: iris: Add support for QC08C format for decoder
To: Bryan O'Donoghue <bod@kernel.org>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250919-video-iris-ubwc-enable-v1-0-000d11edafd8@oss.qualcomm.com>
 <OyMR2y907eHs6rnnO6bzy52LY_t8KXKscM-nTPu48x3NCYFU4mza-uz0HqnQlYqPg2JtDB8AhCtGAa26Cbq4PA==@protonmail.internalid>
 <20250919-video-iris-ubwc-enable-v1-1-000d11edafd8@oss.qualcomm.com>
 <27e36fdb-3107-4e7b-b402-fd72ea5c4d61@kernel.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
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
In-Reply-To: <27e36fdb-3107-4e7b-b402-fd72ea5c4d61@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/24/25 15:28, Bryan O'Donoghue wrote:
> On 19/09/2025 16:47, Dikshita Agarwal wrote:
>> Introduce handling for the QC08C format in the decoder.
>> Update format checks and configuration to enable decoding of QC08C
>> streams.
> 
> Since QC08C is a Qualcomm specific pixel format, you should detail in your commit log exactly what the packing/ordering of pixels is.
> 
> In other words tell the reader more about QC08C.

This has been upstreamed 3y ago for venus, which is the same as iris:
https://lore.kernel.org/all/20220117155559.234026-1-stanimir.varbanov@linaro.org/

No need to re-explain it for iris, the format is the same.

Neil

> 
>>
>> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_buffer.c     |  5 +-
>>   .../platform/qcom/iris/iris_hfi_gen1_command.c     | 12 +++--
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 18 ++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>   drivers/media/platform/qcom/iris/iris_instance.h   |  7 ++-
>>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  3 +-
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 61 ++++++++++++++++++----
>>   8 files changed, 89 insertions(+), 19 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
>> index c0900038e7defccf7de3cb60e17c71e36a0e8ead..83dcf49e57ec1473bc4edd26c48ab0b247d23818 100644
>> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
>> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
>> @@ -261,7 +261,10 @@ int iris_get_buffer_size(struct iris_inst *inst,
>>           case BUF_INPUT:
>>               return iris_dec_bitstream_buffer_size(inst);
>>           case BUF_OUTPUT:
>> -            return iris_yuv_buffer_size_nv12(inst);
>> +            if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
> 
> It'd be nice to get a pointer to the final level of indireciton you need generally, instead of these very->long->lists->of.indirections.
> 
> Please consider getting a final pointer as much as possible especially in functions where you end up writing those long chains over and over again.
> 
>> +                return iris_yuv_buffer_size_qc08c(inst);
>> +            else
>> +                return iris_yuv_buffer_size_nv12(inst);
>>           case BUF_DPB:
>>               return iris_yuv_buffer_size_qc08c(inst);
>>           default:
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> index e1788c266bb1080921f17248fd5ee60156b3143d..e458d3349ce09aadb75d056ae84e3aab95f03078 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
>> @@ -774,20 +774,21 @@ static int iris_hfi_gen1_set_raw_format(struct iris_inst *inst, u32 plane)
>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>           if (iris_split_mode_enabled(inst)) {
>>               fmt.buffer_type = HFI_BUFFER_OUTPUT;
>> -            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> -                HFI_COLOR_FORMAT_NV12_UBWC : 0;
>> +            fmt.format = HFI_COLOR_FORMAT_NV12_UBWC;
>>
>>               ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>               if (ret)
>>                   return ret;
>>
>>               fmt.buffer_type = HFI_BUFFER_OUTPUT2;
>> -            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
>> +            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> +                HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>>
>>               ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>           } else {
>>               fmt.buffer_type = HFI_BUFFER_OUTPUT;
>> -            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FORMAT_NV12 : 0;
>> +            fmt.format = pixelformat == V4L2_PIX_FMT_NV12 ?
>> +                HFI_COLOR_FORMAT_NV12 : HFI_COLOR_FORMAT_NV12_UBWC;
>>
>>               ret = hfi_gen1_set_property(inst, ptype, &fmt, sizeof(fmt));
>>           }
>> @@ -806,6 +807,9 @@ static int iris_hfi_gen1_set_format_constraints(struct iris_inst *inst, u32 plan
>>       const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_CONSTRAINTS_INFO;
>>       struct hfi_uncompressed_plane_actual_constraints_info pconstraint;
>>
>> +    if (inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C)
>> +        return 0;
>> +
>>       pconstraint.buffer_type = HFI_BUFFER_OUTPUT2;
>>       pconstraint.num_planes = 2;
>>       pconstraint.plane_format[0].stride_multiples = 128;
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 4ce71a14250832440099e4cf3835b4aedfb749e8..5ad202d3fcdc57a2b7b43de15763a686ce0f7bd7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -422,6 +422,20 @@ static int iris_hfi_gen2_set_level(struct iris_inst *inst, u32 plane)
>>                             sizeof(u32));
>>   }
>>
>> +static int iris_hfi_gen2_set_opb_enable(struct iris_inst *inst, u32 plane)
>> +{
>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>> +    u32 opb_enable = iris_split_mode_enabled(inst);
>> +
>> +    return iris_hfi_gen2_session_set_property(inst,
>> +                          HFI_PROP_OPB_ENABLE,
>> +                          HFI_HOST_FLAGS_NONE,
>> +                          port,
>> +                          HFI_PAYLOAD_U32,
>> +                          &opb_enable,
>> +                          sizeof(u32));
>> +}
>> +
>>   static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>>   {
>>       u32 port = iris_hfi_gen2_get_port(inst, plane);
>> @@ -429,7 +443,8 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>>
>>       if (inst->domain == DECODER) {
>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
>> +        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> +            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>       } else {
>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>           hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ? HFI_COLOR_FMT_NV12 : 0;
>> @@ -527,6 +542,7 @@ static int iris_hfi_gen2_session_set_config_params(struct iris_inst *inst, u32 p
>>           {HFI_PROP_SIGNAL_COLOR_INFO,          iris_hfi_gen2_set_colorspace             },
>>           {HFI_PROP_PROFILE,                    iris_hfi_gen2_set_profile                },
>>           {HFI_PROP_LEVEL,                      iris_hfi_gen2_set_level                  },
>> +        {HFI_PROP_OPB_ENABLE,                 iris_hfi_gen2_set_opb_enable             },
> 
> 
> As I read this code I end up asking myself "what does OPB" mean ?
> 
> For preference the introduction of OPB would be its own patch with its own commit log that explains OPB as an individual thing.
> 
> You can enable your QC08C format as an additional step.
> 
> 
>>           {HFI_PROP_COLOR_FORMAT,               iris_hfi_gen2_set_colorformat            },
>>           {HFI_PROP_LINEAR_STRIDE_SCANLINE,     iris_hfi_gen2_set_linear_stride_scanline },
>>           {HFI_PROP_TIER,                       iris_hfi_gen2_set_tier                   },
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> index aa1f795f5626c1f76a32dd650302633877ce67be..1b6a4dbac828ffea53c1be0d3624a033c283c972 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
>> @@ -91,6 +91,7 @@ enum hfi_seq_header_mode {
>>   #define HFI_PROP_BUFFER_MARK            0x0300016c
>>   #define HFI_PROP_RAW_RESOLUTION        0x03000178
>>   #define HFI_PROP_TOTAL_PEAK_BITRATE        0x0300017C
>> +#define HFI_PROP_OPB_ENABLE            0x03000184
>>   #define HFI_PROP_COMV_BUFFER_COUNT        0x03000193
>>   #define HFI_PROP_END                0x03FFFFFF
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
>> index 5982d7adefeab80905478b32cddba7bd4651a691..11134f75c26dd1f6c92ba72fbf4e56e41a72de64 100644
>> --- a/drivers/media/platform/qcom/iris/iris_instance.h
>> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
>> @@ -15,12 +15,17 @@
>>   #define DEFAULT_WIDTH 320
>>   #define DEFAULT_HEIGHT 240
>>
>> -enum iris_fmt_type {
>> +enum iris_fmt_type_out {
>>       IRIS_FMT_H264,
>>       IRIS_FMT_HEVC,
>>       IRIS_FMT_VP9,
>>   };
>>
>> +enum iris_fmt_type_cap {
>> +    IRIS_FMT_NV12,
>> +    IRIS_FMT_UBWC,
>> +};
>> +
>>   struct iris_fmt {
>>       u32 pixfmt;
>>       u32 type;
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> index 36d69cc73986b74534a2912524c8553970fd862e..69c952c68e939f305f25511e2e4763487ec8e0de 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
>> @@ -691,6 +691,7 @@ static const u32 sm8550_venc_input_config_params[] = {
>>   };
>>
>>   static const u32 sm8550_vdec_output_config_params[] = {
>> +    HFI_PROP_OPB_ENABLE,
>>       HFI_PROP_COLOR_FORMAT,
>>       HFI_PROP_LINEAR_STRIDE_SCANLINE,
>>   };
>> diff --git a/drivers/media/platform/qcom/iris/iris_utils.c b/drivers/media/platform/qcom/iris/iris_utils.c
>> index 85c70a62b1fd2c409fc18b28f64771cb0097a7fd..e2f1131de43128254d8211343771e657e425541e 100644
>> --- a/drivers/media/platform/qcom/iris/iris_utils.c
>> +++ b/drivers/media/platform/qcom/iris/iris_utils.c
>> @@ -34,7 +34,8 @@ int iris_get_mbpf(struct iris_inst *inst)
>>
>>   bool iris_split_mode_enabled(struct iris_inst *inst)
>>   {
>> -    return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12;
>> +    return inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_NV12 ||
>> +        inst->fmt_dst->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC08C;
>>   }
>>
>>   void iris_helper_buffers_done(struct iris_inst *inst, unsigned int type,
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..7fa745c6bf8950d192c2d2fc1770c4b6fd7b8c4c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -67,7 +67,7 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>>       kfree(inst->fmt_src);
>>   }
>>
>> -static const struct iris_fmt iris_vdec_formats[] = {
>> +static const struct iris_fmt iris_vdec_formats_out[] = {
>>       [IRIS_FMT_H264] = {
>>           .pixfmt = V4L2_PIX_FMT_H264,
>>           .type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
>> @@ -82,12 +82,35 @@ static const struct iris_fmt iris_vdec_formats[] = {
>>       },
>>   };
>>
>> +static const struct iris_fmt iris_vdec_formats_cap[] = {
>> +    [IRIS_FMT_NV12] = {
>> +        .pixfmt = V4L2_PIX_FMT_NV12,
>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>> +    },
>> +    [IRIS_FMT_UBWC] = {
>> +        .pixfmt = V4L2_PIX_FMT_QC08C,
>> +        .type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
>> +    },
>> +};
>> +
>>   static const struct iris_fmt *
>>   find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>   {
>> -    unsigned int size = ARRAY_SIZE(iris_vdec_formats);
>> -    const struct iris_fmt *fmt = iris_vdec_formats;
>> +    const struct iris_fmt *fmt = NULL;
>> +    unsigned int size = 0;
>>       unsigned int i;
>> +    switch (type) {
>> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +        fmt = iris_vdec_formats_out;
>> +        size = ARRAY_SIZE(iris_vdec_formats_out);
>> +        break;
>> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        fmt = iris_vdec_formats_cap;
>> +        size = ARRAY_SIZE(iris_vdec_formats_cap);
>> +        break;
>> +    default:
>> +        return NULL;
>> +    }
>>
>>       for (i = 0; i < size; i++) {
>>           if (fmt[i].pixfmt == pixfmt)
>> @@ -103,8 +126,21 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>   static const struct iris_fmt *
>>   find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>>   {
>> -    const struct iris_fmt *fmt = iris_vdec_formats;
>> -    unsigned int size = ARRAY_SIZE(iris_vdec_formats);
>> +    const struct iris_fmt *fmt = NULL;
>> +    unsigned int size = 0;
>> +
>> +    switch (type) {
>> +    case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> +        fmt = iris_vdec_formats_out;
>> +        size = ARRAY_SIZE(iris_vdec_formats_out);
>> +        break;
>> +    case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        fmt = iris_vdec_formats_cap;
>> +        size = ARRAY_SIZE(iris_vdec_formats_cap);
>> +        break;
>> +    default:
>> +        return NULL;
>> +    }
>>
>>       if (index >= size || fmt[index].type != type)
>>           return NULL;
>> @@ -126,9 +162,10 @@ int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>>           f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
>>           break;
>>       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -        if (f->index)
>> +        fmt = find_format_by_index(inst, f->index, f->type);
>> +        if (!fmt)
>>               return -EINVAL;
>> -        f->pixelformat = V4L2_PIX_FMT_NV12;
>> +        f->pixelformat = fmt->pixfmt;
>>           break;
>>       default:
>>           return -EINVAL;
>> @@ -157,7 +194,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>>           }
>>           break;
>>       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> -        if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
>> +        if (!fmt) {
>>               f_inst = inst->fmt_dst;
>>               f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>>               f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>> @@ -238,10 +275,11 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>>           inst->crop.height = f->fmt.pix_mp.height;
>>           break;
>>       case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>> +        if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
>> +            return -EINVAL;
>> +
>>           fmt = inst->fmt_dst;
>>           fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>> -        if (fmt->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12)
>> -            return -EINVAL;
>>           fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>>           fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>>           fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>> @@ -268,7 +306,8 @@ int iris_vdec_validate_format(struct iris_inst *inst, u32 pixelformat)
>>   {
>>       const struct iris_fmt *fmt = NULL;
>>
>> -    if (pixelformat != V4L2_PIX_FMT_NV12) {
>> +    fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>> +    if (!fmt) {
>>           fmt = find_format(inst, pixelformat, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>>           if (!fmt)
>>               return -EINVAL;
>>
>> -- 
>> 2.34.1
>>
> 


