Return-Path: <linux-arm-msm+bounces-108115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAWgBF3DCmoI7gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:44:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8697B568047
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA3033008263
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 07:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984C230567A;
	Mon, 18 May 2026 07:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TihdWF8K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8F2392838
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089821; cv=none; b=fDwAdKCmEQJMC6dQ2VvAaZzIPbw+64D0WKPDHHrhzX8waKE85F2NsZvWie4oKP5IdGb4qLu/bS9qkgJbbzAoOppvjEztfKDIhW9gpDxrBHGhGov70GhBQlbc8+OtAT6k1+K4Z2cY84ztU+/dPYfz5vtI57hocs3xQXRLapudR6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089821; c=relaxed/simple;
	bh=CREgby8gydk2XjMt9hyBUmH66yl61ZnSfHvf3V74CN8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=mZe7G1bqb6vbZ2M9hIXdzeSjgy0LtYOS3ZazVMx+w6/Yz1pR/F1kuhr4ZAN/ki9Oge2VWTwVHxWv0ICAq1wtmZVTwevIC72LWjbLEIJ3RPqf6/bUJlu80dHM3K5jJa+r8xPBpSgsLqKJBm165dFsQEyDd7nDaSYMuaP2rbxBnek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TihdWF8K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso19850365e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 00:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779089818; x=1779694618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smQhrhF7Z8Az41R1WLU6ZIzGk3WR5lR7BOCD89qaBeM=;
        b=TihdWF8Kd/3d7l5P+38Yf5wZ9XpjgyS/qbMkjki5HjJXc1nf5WVbIRv9cRBJjOXxHn
         aML0YYZVkWs2j2ZEodAJiytdnkRUvUBOa00COYFfKDTaBw9HkHxmy2CRgoGY8EjXALM4
         opv0GuUv1eHoxsutIoOF1tn0YrNFCBMTuTYw9tXnxjbguMrYrE3SwbQHIyQVaSomQdNV
         dGLnJkZpCRbVzrvadCa+CJ1SsyF79GW8I9dSxJIrDG+OLYsqCOVdL5xzDXDaBMS1bY76
         KqtoNi4D3YczdkTg3uv8w1AU3YQfzDFVouJwhCSnzpW9AYHB8BBRAJ7TZ8rrZ6MTGq5V
         SXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089818; x=1779694618;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=smQhrhF7Z8Az41R1WLU6ZIzGk3WR5lR7BOCD89qaBeM=;
        b=FcDAc27WO9EuvBtsfdOitl18HIkmKZqfpmsDRAv254WG4DPJX4UXWoAvMYXBG7AJTu
         B9YFEvfrv+kAMtSxUCUd2UBDe6ywyJZw0gOOx8/imvh91lv+DVTyE+omve+0MMCQ/hvI
         GS839W+uHqopsVUsb2IGaqqtkq3TG3UK609Id6hBNtstf0tQDECf74q0YFhaGCuJhqr1
         5JW6BxOuvmTjk7fp8UIVukrJf0sBgaBXMqW/6NZWWi4VaiGDWeD/HGNREbN4fwqlprYH
         aWkDAupvW3fPfSfmUbliI7bJuuSu9S3BazTI0zGzhmt1LVcJnkyXpZLaCkVGO6DsqUVU
         gnYw==
X-Forwarded-Encrypted: i=1; AFNElJ81zHohkSvpLj7t/FEr2K9f1En4fnRAqGpDcJdUOqlSMNrwAa0PUbcYwsV5kxkh90jJ047lSzDrMRhMu3+L@vger.kernel.org
X-Gm-Message-State: AOJu0YwUQhzkDNRL0CmiabvUm4fBNNYZTlvk8KEFR5+Gr4kmm0p+OxJ7
	JXJZAn6pKPpf1Lf4lg+Rt5KaH6+7aVPaM/EWudLng6HA/ipR3uhcFVcm1kCGb1jqdh9DT56PdK/
	sZXzA
X-Gm-Gg: Acq92OEgIYN+SQSm5DjY4mYJT/m1LMFuOaIYP5b3ZAnJhZ/sLTupuIV5P8QtDRKEImC
	mSdKBPyYFdkoxAamzzQZjqtpueQKD3YXgzHKI2X0nHE5/KYr1O4hM40RdyDjuKNGj4RVY3g+KbT
	dG4g9dMvmbVKmAKpzLurdHcbt9ekicajoexQ9X6le7N0MxxvBx+oTOlLzWUHrQMGEtPwRMktpAQ
	BYU9DTdK11/Czu29nipRioxWchqLmfN3iMS8jgolqD/9FD6LXrkJV36U+0hkMR2SlNxWMKaR6Wi
	2qwg+wdl/SgnV37+Lpn4HsUKzKwmFkv8A6T59JwCmalq2KuetJG4sq1CBFvbAMGHUAez/e3q/PD
	7Th0Mfl0xUq6yFF5y0Ai3la2AayaHFdItr83n+et6i0VOGZD4+58CcLejGU3QxmUKfL+2XTbftD
	C1JBvh27y7fE4BkQ2yten94NBbU3ULPpUsD1tw2tIAVkMY6D/h8qH/CBAjoeTaTsdd5TjWgyFHZ
	pUX
X-Received: by 2002:a05:600c:4692:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-48fe6325978mr210345765e9.20.1779089817968;
        Mon, 18 May 2026 00:36:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:64e2:72b:b9ed:6dcf? ([2a01:e0a:106d:1080:64e2:72b:b9ed:6dcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48feb029180sm110722965e9.4.2026.05.18.00.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:36:57 -0700 (PDT)
Message-ID: <08eff436-4221-4bc2-9fac-2ac1b6a091ae@linaro.org>
Date: Mon, 18 May 2026 09:36:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
 <5fc62574-fae1-4bf0-b6b9-fb6fb33041f8@oss.qualcomm.com>
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
In-Reply-To: <5fc62574-fae1-4bf0-b6b9-fb6fb33041f8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8697B568047
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108115-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email,linaro.org:mid,linaro.org:replyto,linaro.org:dkim];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 5/13/26 21:27, Vikash Garodia wrote:
> 
> 
> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>> The 10bit pixel format can be only used when the decoder identifies the
>> stream as decoding into 10bit pixel format buffers, so update the
>> find_format helper to filter the formats and only allow the proper
>> formats when setting or trying a capture format.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
>>   2 files changed, 11 insertions(+)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> index 5a489917580e..cd3509da4b75 100644
>> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
>> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
>> @@ -18,6 +18,7 @@ struct iris_inst;
>>   #define REGISTER_BIT_DEPTH(luma, chroma)    ((luma) << 16 | (chroma))
>>   #define BIT_DEPTH_8                REGISTER_BIT_DEPTH(8, 8)
>> +#define BIT_DEPTH_10                REGISTER_BIT_DEPTH(10, 10)
>>   #define CODED_FRAMES_PROGRESSIVE        0x0
>>   #define DEFAULT_MAX_HOST_BUF_COUNT        64
>>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT    256
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index eea69f937147..f4d9951ed04c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>       if (i == size || fmt[i].type != type)
>>           return NULL;
>> +    if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>> +        if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
>> +            return NULL;
>> +
>> +        if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>> +            return NULL;
>> +    }
> 
> similar logic would be now needed while enumerating fmt.
> 
> VIDIOC_ENUM_FMT will now enumerate all capture formats (NV12, QC08C, QC10C..) regardless of the stream's bit depth, while VIDIOC_S_FMT will reject the wrong-depth formats.
> 
> userspace will see formats via ENUM_FMT that it cannot successfully set with S_FMT.

So initially I did that, but I reverted since it broke decoding with gstreamer when trying
to use QC10C since it requires negociating the src/sink before sending the fist buffer
and then get the source format change to switch to 10bit.

I checked and none of the other v4l2 drivers supporting 10bit does that, so it seems right
to allow enumerating all possibly supported formats and only accept the session supported
one with S_FMT.

> 
>> +
>>       return &fmt[i];
>>   }
>>
> 
> Regards,
> Vikash
> 


