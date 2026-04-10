Return-Path: <linux-arm-msm+bounces-102687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJdqLIT/2Gl3kwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:47:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A27C73D84F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 15:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 176F8300A25D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 13:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7D82D8DC2;
	Fri, 10 Apr 2026 13:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GtZTyJ/0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC5B30FF08
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775828844; cv=none; b=ZKAeZ8DRWqMPN6x8ilw5xeChhn7/sxARFl0TjsyP1P39atHipRZ5UBy6WN75B9DFCdxcuCOrP5j+/qpxhXxTugPioJMQ9j0aTA8SEYIe9J+XNHmg0DtlESr8JtrNZCYciC9pw93uQZi1Z2eNSEY4DLLw+oCHA5TbnaUT8NfmyUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775828844; c=relaxed/simple;
	bh=/9YLiHSlBBeuUGksZZmIRHaHg0NDtKgpl9Pv1O1q8nk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pA+JFCLh4DCnxOBNAfXpZzox1TwbuxIcuU2uGyoLqqb/Ho3Z2YNyTSt20jVAZTmteWEMcUA5A5aUWffzPxFkHjSUfj/8BkzuH3/NxPk9hXEUzHA9SdPYYmCUYCP9hbpOznQq2kmxWbT2bnbHE1W+IzZEvGFXYAvEs2q4lD35u0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GtZTyJ/0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488c21c636dso12149285e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 06:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775828841; x=1776433641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HY0v9vnNB0cSghEPTbRdLaX/P/UJ93BNk17g46Nvi8A=;
        b=GtZTyJ/0WAG4QWoU7yQ0vZA9Y3eXg71UJx+KGIBAif/TW82fYOgkhQS6vhqw1t90hf
         5jRyzMA4Nz9slTNKP6VBOOmC7GdLm3zyFi8zXcFduXnqTG9OoiErX/ibw3xhSYN7Vrmn
         PSlRytAxsq6Lfi+lK2REIp4f7P9pvVKG6dFE+jzXmDWvQOeRuARcTKv/HP6yuYoOqw/q
         WOTMHdS8NxU8SrwPcQM3kMOhZ0wZX7QIYRb5bUUPPAnIbO1yfYhLBhwqkD6gXwn21Uey
         KYwlL3A8dSNgCgbYKL6Ii0KPqqjYKD9JEsMKhGk5DPE0G0MfZbgv3+WZT+1oiF/VHkuT
         YGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828841; x=1776433641;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HY0v9vnNB0cSghEPTbRdLaX/P/UJ93BNk17g46Nvi8A=;
        b=h06xF51LDaUe08SR6O8kEEBL+nD3O5eFCFvNoOOotfeMus2/6SQESCoKzcSD1sOCJ4
         PqbrcBY+E7qUoRwx933crN+Whl7G8CbkrtdRjZ1FtG00sramHPSAw+OD0pInsHDJiU+v
         VMpa5iD5FyL2nRkIvbIPkSFbjuFdsV9RhxlWQvhfnogfih1+Lu2RqcAw6xEpToIYceZ5
         gCxhKMrNvhxoPkika61zwOu0Fj82OUED6wWr1k0D6EvaZ6UlJfyDj46WorREXGT6vCNZ
         d3jU2kNduQC0P6soLKxbyOr7SU9w7zeGsSbHJHBUGYGNzqe2IbvV9aGcMTj9i+2WuFOZ
         KDgw==
X-Forwarded-Encrypted: i=1; AJvYcCWuKe/dmDrlk7wPdCBqEvVposQriQtQFvNAb1j46dcaNEbicW+t1sZvHB81DDxQF1xVmQAyEV0IS30WRqTY@vger.kernel.org
X-Gm-Message-State: AOJu0YyazUkQ9JAUZg3VRpgxVc3FMfSqEmKZx39W4nM5ULYntYSK2JeT
	XV16EZQV8lGpUyA0XS6zIL71YBgD3UqvubsvclsGLttsN53mN9t2SunUfLZ7ygeRPdc=
X-Gm-Gg: AeBDietZbfePY7l7a06gt1no1Q67xLgLzcVJVsGCB+hWPKC3B9uSFcxUXhSE5tqVJvt
	PoV90CPZSrkIUmEWUDWmG1tHGPkV0dXqpJs/K7YnrrvAJqkHSoV9XtBoX7QWS7LJtksAmdtCsKp
	VHcNgwy2nYaUhwUwHIEeF/lzWLNCSOVldyzMbhqBSl6eUVDT2ZVBnQOhBJiZOzBvEUvAW9nhS6e
	34O7EZgaxqAXzaQMqxALEnDl8/3oxzufdD8FEgbkCTLHnB69vYg7AuQ5xC7R8LwbgjIEXKduUiA
	8AQZ71TyRgGjKAm2cFoBzEOQIbPYmU/Lbp3LVDnCp1HyiQ30GPxG2/DYc/wianrZXEqcGtWg56/
	bc6aOKnkhwfeo5kqI9QkRb9PYH0TeXfmL77693rglv4YsybUtXhL6b1gpKZll5yGP6c5ywkREWs
	4nBujw5owo5sg3MD1DEo/k3kIabkUCc4wKlrV5hHfqLcbvnsBkUFJZHFxfnaTETmr7YI6HILn3B
	pHFjdY=
X-Received: by 2002:a05:600c:674f:b0:488:a82f:bb9b with SMTP id 5b1f17b1804b1-488d68cb47amr45964215e9.30.1775828841015;
        Fri, 10 Apr 2026 06:47:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:c8e5:d5af:c912:c512? ([2a01:e0a:106d:1080:c8e5:d5af:c912:c512])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5da1341sm22552125e9.8.2026.04.10.06.47.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 06:47:20 -0700 (PDT)
Message-ID: <a4fb341e-3ba0-47b3-a901-809fb77f0aae@linaro.org>
Date: Fri, 10 Apr 2026 15:47:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 4/7] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-4-428c1ec2e3f3@linaro.org>
 <99eb55a8-6370-bf7b-f9de-e88231454b0e@oss.qualcomm.com>
 <0301bf82-0859-44cd-99df-3de997e2cff4@linaro.org>
 <7db19009-4e33-945e-789e-689b72c39aa5@oss.qualcomm.com>
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
In-Reply-To: <7db19009-4e33-945e-789e-689b72c39aa5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102687-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: A27C73D84F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 14:57, Vishnu Reddy wrote:
> 
> On 4/10/2026 5:29 PM, Neil Armstrong wrote:
>> On 4/10/26 12:10, Vishnu Reddy wrote:
>>>
>>> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>>>> Update the gen2 response and vdec s_fmt code to take in account
>>>> the P010 and QC010 when calculating the width, height and stride.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>   .../platform/qcom/iris/iris_hfi_gen2_response.c     | 19 ++++++++++++++++---
>>>>   drivers/media/platform/qcom/iris/iris_vdec.c        | 21 ++++++++++++++++++---
>>>>   2 files changed, 34 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> index 8e19f61bbbf9..d268149191ea 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>>>> @@ -542,9 +542,22 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>>>       pixmp_ip->width = width;
>>>>       pixmp_ip->height = height;
>>>> -    pixmp_op->width = ALIGN(width, 128);
>>>> -    pixmp_op->height = ALIGN(height, 32);
>>>> -    pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
>>>> +    pixmp_op->width = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
>>>> +        ALIGN(width, 192) : ALIGN(width, 128);
>>>> +    pixmp_op->height = pixmp_op->pixelformat == V4L2_PIX_FMT_QC10C ?
>>>> +        ALIGN(height, 16) : ALIGN(height, 32);
>>>> +    switch (pixmp_op->pixelformat) {
>>>> +    case V4L2_PIX_FMT_P010:
>>>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
>>>> +        break;
>>>> +    case V4L2_PIX_FMT_QC10C:
>>>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(ALIGN(width, 192) * 4 / 3, 256);
>>>> +        break;
>>>> +    case V4L2_PIX_FMT_NV12:
>>>> +    case V4L2_PIX_FMT_QC08C:
>>>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
>>>> +        break;
>>>> +    }
>>>>       pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>>>>       matrix_coeff = subsc_params.color_info & 0xFF;
>>>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> index 719217399a30..ca0518c27834 100644
>>>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>>>> @@ -272,10 +272,25 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>>>>           fmt = inst->fmt_dst;
>>>>           fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>>>           fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>>>> -        fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>>>> -        fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>>>> +        codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 192 : 128;
>>>> +        fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
>>>> +        codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 16 : 32;
>>>> +        fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
>>>>           fmt->fmt.pix_mp.num_planes = 1;
>>>> -        fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
>>>> +        switch (f->fmt.pix_mp.pixelformat) {
>>>> +        case V4L2_PIX_FMT_P010:
>>>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>>>> +                ALIGN(f->fmt.pix_mp.width * 2, 256);
>>>> +            break;
>>>> +        case V4L2_PIX_FMT_QC10C:
>>>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>>>> +                ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
>>>> +            break;
>>>> +        case V4L2_PIX_FMT_NV12:
>>>> +        case V4L2_PIX_FMT_QC08C:
>>>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline = f->fmt.pix_mp.width;
>>> In the removed code, bytesperline for NV12 and QC08C was aligned to 128 bytes.
>>> In the new code, Is that alignment missed or not required?
>>
>> The alignment is done right before:
>>     codec_align = f->fmt.pix_mp.pixelformat == V4L2_PIX_FMT_QC10C ? 192 : 128;
>>     fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
>>
>> calling ALIGN(f->fmt.pix_mp.width, 128) again is a no-op.
>>
> Here f->fmt.pix_mp.width is not aligned, fmt->fmt.pix_mp.width is aligned.
> It should be fmt->fmt.pix_mp.plane_fmt[0].bytesperline = fmt->fmt.pix_mp.width.

Indeed you're right, I did misread...

Thanks,
Neil

> 
> Thanks,
> Vishnu Reddy
>> Thanks,
>> Neil
>>
>>>> +            break;
>>>> +        }
>>>>           fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>>>>           inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>>>>           inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>>>>
>>


