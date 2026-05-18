Return-Path: <linux-arm-msm+bounces-108113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOZhDnbCCmoI7gQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:40:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD888567E5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:40:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 605D7306FE5A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 07:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9EEE3E121A;
	Mon, 18 May 2026 07:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q1EaNd7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2EE3E0247
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089606; cv=none; b=ZELA2hXm0evXF7kkQ7Pa49zFRTT4+joQod5dxKD2iMM9oCeJrPJ51cusdG5vV6zZqTWw2A/LsElkHdMMO6GA4/IlcUhHHEPD77GlZ95yNy1N9LP8wi6Boy32byEAwTjQoo9bSuo8alZ+p6LQEJDvG6FoZLx/4lg9mpJnGifcpJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089606; c=relaxed/simple;
	bh=/JNfde5mdHiSGSpMzP/oSsfMy0pc4LJ61vF+9SM49Tk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=hLE8UfplWTjcmwBDsX11+sDBKd0p5j75S2liQXsmihHETW9jCdevZ8U4oYyYI3MKOtPUzGAFFD6UCdHB5Vco7bFRPKgoc/T6Ww8u3K6tKsJ0JMlc6XKpf0ATdWWv8p9aoir6RYM9AblxUrE5CjlAfFk3EcSztSV15DoqnABq5E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q1EaNd7Q; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso25900785e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 00:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779089603; x=1779694403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clpT2YharvcVfa0IwFBAz/k89nyFUXl+DAfU0fPRXA8=;
        b=Q1EaNd7Qmhze/6wb3Qw54OhJkTnu36u7hjaaDppo24fKze5O3i0VN+KxEJWOwJ8hSX
         deKL0TyhmsYsgk4yjEn+gpHtxK/2wEqhbKYeEOppXb7zEIO+sZhKcdxWA4KGtLCqKZkC
         Cj3HfEcvV3zVa+7tKn1OAsSO3lTMSZ16Uq5MpmzGGGV/Luwl1NKV8c3HCQAKEyn9lH2p
         g/Ytrsybl4fDn1TExuSmhTDula4aXLU/hYvEvlzit4hw5GYhP64wgEMd8zjS3OJVOEcv
         zLyOUw8nEr8S9ZaUTBfsHs7wwGuNtPnbuy6rNCMGhMupCLf3pa9HjG0lT1hC0Jy4g7QD
         TaFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089603; x=1779694403;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=clpT2YharvcVfa0IwFBAz/k89nyFUXl+DAfU0fPRXA8=;
        b=TmbPjxO3/yT1g7VcTS16Q6rkrB/oA/pgT1aBsKTRebnR3JBY7Ejd6772/awgRuIBhm
         RHSNx+N5FfbUjWmLansFtNT1roa4KQxsw4lhhTK4cWsHGOv5kGj9ku4MU+ZbEHKOu13I
         o5Izn+d6OBj59I2WtQKoIChmep8by0SJqnfw/DFmb8pB3ZaDT32o1GSVeD3G/L7STrox
         E9C10ocC6X+HHa5d+VGaInQaEJKR5RD8qBbEQeYilAnEQtd+b7OaWfpDGQ/8+GMv9dEB
         lG8Ct+gzA+IqoeCfwlExaiirvKbJchgYGF2CMKT8pRzfgB6YZ2LwKoEZ3h6l3GO0f01l
         99MQ==
X-Forwarded-Encrypted: i=1; AFNElJ9aS2bknTV7moLu3eUvyrg9cPJMWyeGdGrDdZbJke7JDwTUjZlkxi90zJS/oaQTWpr1LWa6SvIoPOSNO4Lx@vger.kernel.org
X-Gm-Message-State: AOJu0YxesXZMxXw0efKLhBBjoG7sgWFalU4DC2LttUGJPlkHprufuVsN
	9B5b5pTnlHdLn+EKJeB1fth96yAvdhCdxvpuhjU+umoL+tQ2CJ32NZ5bt1LDXLCCayA=
X-Gm-Gg: Acq92OEVIq4g1BYnWRx4QwlEKeG0GGG6zkV0DnFA3pBEHgzISbFm2Q7gr4DHxSyVWbf
	s/ga76y6p6rZl55t7/halkP4qLFvPBCjpuhc1Zi57GaIA/zy/qX0uEbktcFmuuiMBrW4S9V5WJb
	4tHkKL+MEpGIGQ2cFfCSV30DnPpClE0lBpRcbWi1tMaOWRLJD4Xy25JeUO0TBpaHsFwHeTIzMbB
	d4odZDCPRXrqRaDMlE9tS/9w55KTz5qtWbX79WCJ5XQEKtjvd9atzGdj5aSjlSupmTpiWCBM9ov
	0Uq21c6MerhT3GtxMEWy0lI0kwHmCdsx55roLBsR11Wr2IzbaUlDCCDIIz4wZNeiJAjY5Cjef1W
	PbOhqtqxXSWM7NpA8fFrUV826jotQA7Ld/lJkJk6CXNo1g3ZKu8SSk+rGj5ESsOjdJAzZ9vNCdR
	Yikv8T+6mjNglcv8SRWi3QKJMIXYJHvzT7HasG1k0z9ATrCpYBCkuzPRFVFQkNqN/0zE1g8DbGD
	3CO
X-Received: by 2002:a05:600c:848c:b0:48f:d0f1:ed28 with SMTP id 5b1f17b1804b1-48fe60e4e32mr210022875e9.1.1779089603090;
        Mon, 18 May 2026 00:33:23 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:64e2:72b:b9ed:6dcf? ([2a01:e0a:106d:1080:64e2:72b:b9ed:6dcf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5cab882sm241034035e9.13.2026.05.18.00.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 00:33:22 -0700 (PDT)
Message-ID: <fcf5054d-66da-4f9f-88f1-e49692557319@linaro.org>
Date: Mon, 18 May 2026 09:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/6] media: qcom: iris: vdec: update size and stride
 calculations for 10bit formats
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-4-7fc049b93042@linaro.org>
 <8ee8e01e-fc55-4786-9c28-48fb17bf2a44@oss.qualcomm.com>
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
In-Reply-To: <8ee8e01e-fc55-4786-9c28-48fb17bf2a44@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: CD888567E5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108113-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 5/13/26 21:05, Vikash Garodia wrote:
> 
> 
> On 5/11/2026 2:50 PM, Neil Armstrong wrote:
>> Update the gen2 response and vdec s_fmt code to take in account
>> the P010 and QC010 when calculating the width, height and stride.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_hfi_gen2_response.c    | 21 ++++++++++++++++---
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 24 +++++++++++++++++++---
>>   2 files changed, 39 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> index 8e19f61bbbf9..0541e02d7507 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
>> @@ -542,9 +542,24 @@ static void iris_hfi_gen2_read_input_subcr_params(struct iris_inst *inst)
>>       pixmp_ip->width = width;
>>       pixmp_ip->height = height;
>> -    pixmp_op->width = ALIGN(width, 128);
>> -    pixmp_op->height = ALIGN(height, 32);
>> -    pixmp_op->plane_fmt[0].bytesperline = ALIGN(width, 128);
>> +    switch (pixmp_op->pixelformat) {
>> +    case V4L2_PIX_FMT_P010:
>> +        pixmp_op->width = ALIGN(width, 128);
>> +        pixmp_op->height = ALIGN(height, 32);
>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(width * 2, 256);
>> +        break;
>> +    case V4L2_PIX_FMT_QC10C:
>> +        pixmp_op->width = roundup(width, 192);
>> +        pixmp_op->height = ALIGN(height, 16);
>> +        pixmp_op->plane_fmt[0].bytesperline = ALIGN(pixmp_op->width * 4 / 3, 256);
>> +        break;
>> +    case V4L2_PIX_FMT_NV12:
>> +    case V4L2_PIX_FMT_QC08C:
>> +        pixmp_op->width = ALIGN(width, 128);
>> +        pixmp_op->height = ALIGN(height, 32);
>> +        pixmp_op->plane_fmt[0].bytesperline = pixmp_op->width;
>> +        break;
> 
> client facing api, good to have a default here
> 
>> +    }
>>       pixmp_op->plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>>       matrix_coeff = subsc_params.color_info & 0xFF;
>> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
>> index 99d544e2af4f..eea69f937147 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -266,10 +266,28 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>>           fmt = inst->fmt_dst;
>>           fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>>           fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
>> -        fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>> -        fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>>           fmt->fmt.pix_mp.num_planes = 1;
>> -        fmt->fmt.pix_mp.plane_fmt[0].bytesperline = ALIGN(f->fmt.pix_mp.width, 128);
>> +        switch (f->fmt.pix_mp.pixelformat) {
>> +        case V4L2_PIX_FMT_P010:
>> +            fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>> +            fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>> +                ALIGN(f->fmt.pix_mp.width * 2, 256);
>> +            break;
>> +        case V4L2_PIX_FMT_QC10C:
>> +            fmt->fmt.pix_mp.width = roundup(f->fmt.pix_mp.width, 192);
> 
> ALIGN ?

ALIGN only works with Power-Of-Two numbers, so we can't use ALIGN here.

> 
>> +            fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 16);
>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>> +                ALIGN(f->fmt.pix_mp.width * 4 / 3, 256);
>> +            break;
>> +        case V4L2_PIX_FMT_NV12:
>> +        case V4L2_PIX_FMT_QC08C:
>> +            fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, 128);
>> +            fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, 32);
>> +            fmt->fmt.pix_mp.plane_fmt[0].bytesperline =
>> +                ALIGN(f->fmt.pix_mp.width, 128);
>> +            break;
>> +        }
>>           fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
>>           inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>>           inst->buffers[BUF_OUTPUT].size = fmt->fmt.pix_mp.plane_fmt[0].sizeimage;
>>
> 


