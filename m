Return-Path: <linux-arm-msm+bounces-109067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE4DGaUND2qSEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:50:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED285A6497
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 15:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBCE13147757
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463661C84DC;
	Thu, 21 May 2026 12:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mynaPeiI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4CC3D45F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368284; cv=none; b=ito/Grfp13UISHtYXnmu+f8fdLtAKTvPcVFjsc5VWjMNvcyQLsIEFvpi2EaQsd9mKmo7xLlaHjy0Ij2+fXQ0rpK74zKMZMvsUx5uyEcGnFG587o+7p4k+NaMBEUEZ8d2k1STQHtXeA9W6y2ub/9hRqFmkuqhafLpJN0xc1b6rQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368284; c=relaxed/simple;
	bh=14LJ5CLZqx0/2eEPwTtKM9AwLYxUCsecgICz5wwcJCo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VaKWqgB2bd+azwZfI8xSqN7uUdRlXHz54m6i7Wy6GFsMq8QHomSCnJkTLyZKmuG29u1iBZ+Kufu3Uz/q9HpJayazl27ONg1bUz434Mp1qe7oCxFoYFaa9Al5whHERVofi0vUSo+Ct/xYrmM3th0Vu87tZJPAyEykEwl7CL2yMaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mynaPeiI; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490229aa522so27048045e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779368280; x=1779973080; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ij+HmZb50wrOGLgyBR5wCEH6ymGTjEYisLCldFWkgQQ=;
        b=mynaPeiICRMzMHSzwH+2HwS1QU9WYbx90D1cQBFEUD5X7mR4yYKdtd0hGtrd6RDm9Z
         b+L/xeRwucUVbasf6ptks5Z2l80oyLaUn3SDAYWePysHbTp+FdJk8rcSg/rlORTGX5ts
         RoyX1lvkpketWiXCbrNOSn9jc0SIn47n4i//McyKayCIb17n99WpPWXmlwwuZMdGS18U
         Ek81/oKwzpRMIOO2miZymT4ksBO/80HQn1j2c0HOBcKjHuVkFw5zoJBLbtfVOh403pKW
         aq1ZfJ8pvp79PWBK4Hgny745iVmFHhQDCoRTsw1wumhwS1W6aI1jUbKTgxoGm7XaJ8K7
         3XwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779368280; x=1779973080;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ij+HmZb50wrOGLgyBR5wCEH6ymGTjEYisLCldFWkgQQ=;
        b=c7/dcP/MHwFeD8ddh8rPlb7tL28ryYvr7xpAKEDdkhLDydfXdOhAKtKE9ZNdLMkle1
         lSzp9iVAh7Snr8eO68eZL6oQLw9+EuiTxQFYMMX1EkeK0U73rRI0Ou9eK8ej5mtv5Si5
         BZIm0S8aWByN+rutjyZzD8ug8rrlcAsbYIkXUbh/7WL+VCsYxPK4uz20XZtA7QUd4uBj
         f5s3pabahdVLIIrKxcLjb4j/BfdJ3YGQ4KvQbaLhNdDcgK1QLCeqzqXS8VLMQ7L1Z8Ir
         NZTx1ZcYZ3CwxolNLwPrv1XImvwDgn0gmBZttktbG5dlfXqnb6FKt78coLmBbV7WXlN2
         +Qbw==
X-Forwarded-Encrypted: i=1; AFNElJ8v0rRc1LFAZQNedpfCoCmQr9U31wScNbt2td0kmVXffhWkg0ajhjGSQA0yIdwrY0Lu1raIBvDsoWTFtyYO@vger.kernel.org
X-Gm-Message-State: AOJu0YyVoeOA323O/SoIv/Lrf2jwEksJdaF/uQ4h0sR88xDb4EzsUjbH
	dHhX8Q4Xo/j3LccgQVBIxCShdPR/OTMhECUZEUagLTfVTsOUTely+mcFs18sGnu66w8=
X-Gm-Gg: Acq92OGsl8DltQKZ2UVC8FnWF2B0QASz8791FHtSXhpfhs4pRCh2iTykURdV4UoGxZG
	pEIxfKSdfZg9ldejqcLE16AoRSKOyEHHL89QWB1UpvYHlRgzVJ+kV8MUKcX9c95GwlxM3l1LTZI
	+AA2RjFJwcWbM0ZFT5dl9g5MO7FrIVFdNNHXiM432f7LMYglT2wziwLq0FSP/VgcmAS5xlsA1c8
	5jNnMjziibBS/h0/+SsK8wDV4YldQ2+0Lyq9J7rn50Gl0WIpvVkKlpx6fYxv1P2IjNK0FSljmLt
	g8brRVzDmEr8yyyKQ/NnyPModzwJFJC1E2e1GZ3osSeZKIPs6HewBzRFgsb+HIN+nJ4y8HKH9bn
	WANUbdWI7HAXztd+GAvXo++MWwBYwJClx16ZI2FDyptN9xvjjxqZNA8u2QX4NTC5787PiWGD3+x
	zaX0+cR3n7cBBSZ8YynGW/jwOuq22f1OMKPJBF7qJmru6JRmO9p+1KMkcmstW3EVEdXQ5TFmAHg
	oBgKFU=
X-Received: by 2002:a05:600c:4654:b0:48e:635a:18d9 with SMTP id 5b1f17b1804b1-4903608439fmr27803815e9.15.1779368279923;
        Thu, 21 May 2026 05:57:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b? ([2a01:e0a:106d:1080:7e6c:bb76:ade5:7e8b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49035f52a0dsm15092125e9.24.2026.05.21.05.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 05:57:59 -0700 (PDT)
Message-ID: <d69f2c50-732f-41cc-86fe-9eabae7b6d71@linaro.org>
Date: Thu, 21 May 2026 14:57:58 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-3-7fc049b93042@linaro.org>
 <b6ab2112-c89a-4ac4-8525-e913ed0b5313@oss.qualcomm.com>
 <febaa0cf-eecf-40ea-b243-4f03646af918@linaro.org>
 <c770444d-be66-47e3-83bc-be477d4e07cd@oss.qualcomm.com>
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
In-Reply-To: <c770444d-be66-47e3-83bc-be477d4e07cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109067-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:replyto,linaro.org:email,linaro.org:mid,linaro.org:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 9ED285A6497
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/21/26 11:44, Vikash Garodia wrote:
> 
> On 5/18/2026 1:02 PM, Neil Armstrong wrote:
>> On 5/13/26 20:50, Vikash Garodia wrote:
>>>
>>> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>>>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>>>> the right 10bit pixel format and stride when in compressed mode.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 75 +++++++++++ ++++++++++-
>>>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>>>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>>>   3 files changed, 76 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> index 30bfd90d423b..89de8c366836 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>>>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>>>>       if (inst->domain == DECODER) {
>>>>           pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>>>> -        hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>>> -            HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>>>> +        switch (pixelformat) {
>>>> +        case V4L2_PIX_FMT_NV12:
>>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12;
>>>> +            break;
>>>> +        case V4L2_PIX_FMT_QC08C:
>>>> +            hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>>>> +            break;
>>>> +        case V4L2_PIX_FMT_P010:
>>>> +            hfi_colorformat = HFI_COLOR_FMT_P010;
>>>> +            break;
>>>> +        case V4L2_PIX_FMT_QC10C:
>>>> +            hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>>>> +            break;
>>>> +        };
>>>
>>> semicolon ?
>>
>> Ack
>>
>>>
>>>>       } else {
>>>>           pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>>>           hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>>>> @@ -517,7 +529,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>>       stride_uv = stride_y;
>>>>       scanline_uv = scanline_y / 2;
>>>> -    if (pixelformat != V4L2_PIX_FMT_NV12)
>>>> +    if (pixelformat != V4L2_PIX_FMT_NV12 &&
>>>> +        pixelformat != V4L2_PIX_FMT_P010)
>>>>           return 0;
>>>>       payload[0] = stride_y << 16 | scanline_y;
>>>> @@ -532,6 +545,61 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>>>                             sizeof(u64));
>>>>   }
>>>> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst *inst, u32 plane)
>>>> +{
>>>> +    u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
>>>> +    u32 stride_y, scanline_y, stride_uv, scanline_uv;
>>>> +    u32 port = iris_hfi_gen2_get_port(inst, plane);
>>>> +    u32 pixelformat, width, height;
>>>> +    u32 payload[4];
>>>> +
>>>> +    if (inst->domain != DECODER ||
>>>> +        inst->fmt_src->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_AV1)
>>>
>>> whats the restriction with AV1 here ?
>>
>> This restriction is used in downstream driver and Dikshita reported we shouldn't
>> call HFI_PROP_UBWC_STRIDE_SCANLINE except for AV1.
>>
>> Could you please check if it's necessary ?
>>
> I discussed this with firmware folks. As per them, this interface is effective for AV1, and for others, it might lead to higher size due to host demanded alignment.
> 
> As per firmware team,
> "While the documentation states it is applicable "for AV1 ONLY", sending it for HEVC, VP9, or H.264 will physically work—forcing the UBWC output buffers into the Host's fixed stride layout. However, because older codecs handle resolution changes natively by triggering a standard Port Settings Change (PSC) to reallocate buffers, using this property for them is largely unnecessary and will persist statically, potentially leading to wasted memory due to over-allocated padding"

Thanks a lot for asking, I will leave it as is for now until we have a stride issue we can enable it for other codecs.

Neil

> 
> Regards,
> Vikash


