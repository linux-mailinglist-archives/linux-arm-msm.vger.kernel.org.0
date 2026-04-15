Return-Path: <linux-arm-msm+bounces-103232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GNKeOuc/32kxRAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:36:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 626684016AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:36:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3BD8430877AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 07:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E87D3242CF;
	Wed, 15 Apr 2026 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w6iwkGK0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F441A8F84
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 07:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776238563; cv=none; b=KIMsISChZwZ67nVS56qWjqG+UNqzchpA7c7oWgM1Lzgnop7ej1zH7nXDZSobEkHIVMqor9YdPlVuXvpz2lYrLYr1zRVf9Jq719dKyJjMKe9Psd4EN5K+Pv42M/lQzXvhM7R4Nh7umDyKFClX6l53/doyaHkMR4eYda2lNfFZ3+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776238563; c=relaxed/simple;
	bh=tztQiF9AFq7P5qpbPimA9DqSoKcs+HcugZW1l/nqyWU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZkPUw/srEPUsevKuU1HxkHdJ8o53pIZeIuKJvVuwidzDe13EXH537JtIRbn+z26suxS9c+AWD+f64EXVgGAcudehWHHmHT43ChbelpqWnnBN4gIL4X25SYbGUYJZDXbolejx02nBwRn58uK4GRgj2Y04zKsWIUrb2SP/AcMlZHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w6iwkGK0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso77941335e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 00:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776238560; x=1776843360; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gdb9XYGr2HVOrPIaTOy7veH01B5O/TgjD3eQj9X645g=;
        b=w6iwkGK0ZjvFuyHt9dBPUcyUM68EbDKJbIT0bI14kq8phJZPhM9YmhlWndJXzH+TI3
         S0VHl876eB24QOlpFEzGZfVPoIecaYleKMsb1u8MeixEXucrlgZGhcfnGXqtIMrER0Jv
         L52H+rdQ0XMik5HaD8pE+ShjUqhgJkS9NZauyhJUtfNrI0QABehb4z75EHt0Q4s81IMp
         crvwjFBmQ32r10JbIlin8MhY9lvB98XoiVaJjZ9wrCTEL63sMK4mKb3fWnlz4oRU73p6
         gLCVzp5d0K19fILZL/tDKshgrmrBikAEjFp4LHpw/lXEmleS9QCi8nt1BWgTy0DI5EeS
         tQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776238560; x=1776843360;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gdb9XYGr2HVOrPIaTOy7veH01B5O/TgjD3eQj9X645g=;
        b=W2mFzc1acIjJ8ib5ljLAzy3Pyikd49vme2DLXPHQYQh9tKcPx9UoOUCJrmx0lQ0kmN
         /FVKfylK6HSOe1fRDlO/ITyWZ2geNA6IT1V5gubN/ALJbrCnO5ABOFgi93I2PDDIk3Fb
         D2Qseklr6F6+Kkygr9ucru33b0uYlN2bT61QUdVyiZufOATtEitSK+K2DdjtZVFu31Vh
         B301Mt+w+9zFg8heL8Np3qkQRrakpqx1qEgR1QBptE/cyMyMzAolFGcEqKQIuSbmIQm0
         +ZCuSg8NB2TBKyG07gs/BjTXbHc9vn4BgDFnF1t/Vhz87XQLgrzb0FmOBpnGiGP7TmXf
         OKNw==
X-Forwarded-Encrypted: i=1; AFNElJ+H8AJvee3RpJmxkcXCua5MIbLSzhs1z0g4ClPvYFkI8gjXdv06PFAh+1zx06hRR89L0PG2FAH+DpXpDPr4@vger.kernel.org
X-Gm-Message-State: AOJu0YyLNEBY2zmKCqLkCORTvs/uXfE4ZL/0n9y1u4AgGbkTAWq6cIgO
	DFNJD8vPXoWICtQrkKl+afexnt07jQToSdPf7Je+R35P/GEryNB+Hd6J/twz0KpYUF8=
X-Gm-Gg: AeBDieu/bDcNELQtdnXFlRbMuYu0gxeG24jvXvqOF1EBXKZbTPNEneBLNbK8xwVu9J/
	T/acAPZJQgAYz6JVtWoOoPSc2xlkyiv+FGwW9tkcqdMMPXcLtwUqV4dEkHE6hjC53A425oVQZhU
	aTsiW2wkj6i6gBDzVQwbOYQ+CSEE3aREQpaqN0W7aMq8v8EO6Gh11Oi4/ZBdfCqHTaeFDck0Hm5
	i9iP/0HJ/zGet8ht8W4uVhVHdNxKUbU3oTAyze9cEXgVTThX8/E6pJrjW9nmjeEyyMG30BiYIdv
	5XPbrdvCyXrFB/6grrX0zC8q+BQFUW+LdK5pZeJFCXATahJwU5a7PPmwA+pJkCtyQRY2Hxr6fez
	WiQbU3Zebyuy0GDmm+peTZadtLfBz+sOGmhbuqfl9TS9fv89cvHSKFWjck/48EuToUmLIH5PD3x
	KPorGuJmZy0ZF4IFWVRgvmyOdhovu6hVLE+O7o0ldurltfH8s16bAge8gglO7yOO9oqAjkCoFfY
	5vzR0ozEB0QzGob1Q==
X-Received: by 2002:a05:600c:8706:b0:488:b9c6:11ba with SMTP id 5b1f17b1804b1-488d6890cf9mr282323265e9.28.1776238559882;
        Wed, 15 Apr 2026 00:35:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:1c29:ca2f:5699:2fdf? ([2a01:e0a:106d:1080:1c29:ca2f:5699:2fdf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488eddba112sm116771345e9.0.2026.04.15.00.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 00:35:59 -0700 (PDT)
Message-ID: <fd6e7780-12eb-4fb3-bd83-ccbfbc1c09e8@linaro.org>
Date: Wed, 15 Apr 2026 09:35:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH RFC 6/7] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260408-topic-sm8x50-iris-10bit-decoding-v1-0-428c1ec2e3f3@linaro.org>
 <20260408-topic-sm8x50-iris-10bit-decoding-v1-6-428c1ec2e3f3@linaro.org>
 <faa04229-1070-3a2f-94e6-a7e238fb8121@oss.qualcomm.com>
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
In-Reply-To: <faa04229-1070-3a2f-94e6-a7e238fb8121@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103232-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 626684016AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 4/15/26 08:39, Vishnu Reddy wrote:
> 
> On 4/8/2026 10:13 PM, Neil Armstrong wrote:
>> The 10bit pixel format can be only used when the decoder identifies the
>> stream as decoding into 10bit pixel format buffers, so update the
>> find_format helpers to filter the formats.
> 
> This series breaks the v4l2 compliance tests for the existing platforms.
> Decoder failed for below:
> VIDIOC_S_FMT: FAIL
> Cropping: FAIL
> Composing: FAIL
> Encoder streaming tests failed.
> Please check once.

Sure I'll run the test before posting v2.

Neil

> 
> Regards,
> Vishnu Reddy.
> 
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>>   drivers/media/platform/qcom/iris/iris_vdec.c       | 41 ++++++++++++++++++++--
>>   2 files changed, 40 insertions(+), 2 deletions(-)
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
>> index ca0518c27834..bfc13c1044c7 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
>> @@ -105,6 +105,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>>       if (i == size || fmt[i].type != type)
>>           return NULL;
>> +    if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
>> +        if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_8)
>> +            return NULL;
>> +
>> +        if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>> +            return NULL;
>> +    }
>> +
>>       return &fmt[i];
>>   }
>> @@ -113,6 +123,7 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>>   {
>>       const struct iris_fmt *fmt = NULL;
>>       unsigned int size = 0;
>> +    unsigned int i, k = 0;
>>       switch (type) {
>>       case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>> @@ -127,10 +138,36 @@ find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>>           return NULL;
>>       }
>> -    if (index >= size || fmt[index].type != type)
>> +    if (index >= size)
>>           return NULL;
>> -    return &fmt[index];
>> +    if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
>> +        if (fmt[index].type != type)
>> +            return NULL;
>> +
>> +        return &fmt[index];
>> +    }
>> +
>> +    /* Loop over the valid capture formats and return the index */
>> +    for (i = 0; i < size; i++) {
>> +        if (fmt[i].type != type)
>> +            continue;
>> +
>> +        if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
>> +            continue;
>> +
>> +        if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
>> +            inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
>> +            continue;
>> +
>> +        if (k == index)
>> +            return &fmt[i];
>> +
>> +        k++;
>> +    }
>> +
>> +    return NULL;
>>   }
>>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>>


