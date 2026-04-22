Return-Path: <linux-arm-msm+bounces-104128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QL3XOf7R6GklQQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104128-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:49:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8DD446EE8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 15:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CADAD30063B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 13:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E203E280A5B;
	Wed, 22 Apr 2026 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bf6RhLfE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFABE266581
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865392; cv=none; b=XJwcUs159YrV1sufYYqFg0yTxsUouHtQgep1Zi7O+Vc2W1bqEdbEuX2z6HctxddY6llyFIRWxcpfQh00ZY5hcdwgqQh8I+3CrBaQGpkDUKnHXhcnyoJ1gV5wC8aHCGNdZXW1uQ0bW82Ti4NMMQOlZQU/EjnBCfmGn39sJ7lU8e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865392; c=relaxed/simple;
	bh=osBE3Oxav31oKc+/m6zSrJW8cylwlZgxyG2u9ui76pU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C9wChve3vsRYdL0oUEfFN10hUWHsl1U9BNXYguO75mneaWXDDLG3quASh73REPaAysJaebFJ3Qkhp7P6U77ZeqWQ43WBuZG1aS+GDTW5Xo74DAkEZSDsB1F5x36kFSidYKAuh15aY1w9/m+QbxOoB6Sny6P4BElMumobLwEXiOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bf6RhLfE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so68461235e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 06:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776865387; x=1777470187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Iel4FesdLoqyF+cIltg61dVP/cxi4CoyFyS3WL+YT4Y=;
        b=Bf6RhLfECYJOg0RB0tj2WCZ4rVubNLnRt7RI8eX+fPZ/KNTv993ak6OtwXOhWUY92a
         +KNlPS93HCLa+wvO9KNHyD/Tc0CmdAmwhrbk6tstCNHd2yDOV1E9IyG7bMfhXEOSngFQ
         L+SnlamoHOPyWhL+Zi9I80zKTFHx+OS+hpUefXee/0rIw8DIdi3j8/o4QFJRodfCC9dc
         ZB55I76Slcw6O8wtRuRn6u8tC9dSBxLb7hRX7A+BRXdAHzumppZEzFsZXeZQ1bZxqzx5
         9Xv3+LP09oxjUOYaT9eRgB7Dphgip0tdXOz6rNauLKAu9AajOw125nXYG+dRFbPVEP1c
         CDzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776865387; x=1777470187;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Iel4FesdLoqyF+cIltg61dVP/cxi4CoyFyS3WL+YT4Y=;
        b=O7xAJK1KuOOBy1qdR/u5uVhr7uiSkIxHHB9wTSy6R4N1Bi3hQm9D0iChoe+XBSdEqX
         fgXEawzGJ1q9ITN5KcHu9ZMh6L6s/Bqe0c35g5YX8DsMaQIDxE+ftkLwMG9rb7gwtcie
         9x6zoKjRWQ7FP78+BjYFEfXgo935L3S9pgmGQVMtSPCV2yIrfKPn+uOK3GS2B5lMBARg
         /lM+ZP+9La5QYj6zGFkaEQhwKlAwf+HFq3L4Et+Z5SUPzUynkfDRsnod2uHQmJwtROXz
         2odi0bRHHkkumYXDpHquRCN6v8ykAUsCRV+ibuXLMCOPCO2yadmalxqSPXLTRRgcJmHW
         el2w==
X-Forwarded-Encrypted: i=1; AFNElJ+g3+uqXgVWclxW/pTqlnPsrmq0AkTCdUnhaLKkwqRmy/vL2KLLNW4fnxK5Psiv4BLlWq9bHAEqRg2nNpz5@vger.kernel.org
X-Gm-Message-State: AOJu0YynXt9c7rSn4P7RiCU/Rj4Rplx0yn5bNSURRVVyWGhGUpjn6yf7
	U5a7haMlJa5PVNC6xx+zNPTQ2wt0s7jRXHK6vXOPlgmdFNyaTBJ3eWuAU7nnmaLOhMQ=
X-Gm-Gg: AeBDieuWTNl98N6WtCdzaqaydiUwUlLoHteEIQnYkgRSriA+B1NRvWcvm+E7s1Xagff
	mi95U4GMgMoLoZ+CIJCNebL6ASq2HKepmQtY22qd+qpWidfx7tB9hmadV35ok9HYT7CAJmJ8rpX
	PkhDDFgbh8V8Z1iUCzqN+65B4GPtGAFW9qdMU4J20y/pTRAGInrtKs8bf96lPv5H5nk06kKRTv/
	Oc/l7v/WImSzKrt0Oy0aBbVxUFf7kZhBWGTFZ6HY6GJBYBYq6I/4GRJgGq7qScu7AMKiI9Xnrn8
	h5P2j9YCtHad1DYwKRKJpIu039JBwyqqiMir1Ib2g6DpGT+w5PDbYihwbw7CBkD1nL1foBP57VH
	r78R5bHGYKs6fmtmpt+dBlYyHSVsTWHbdRZsPwpGsmiL/nB0arCb/kMDt69sI3WTITVYCRlalbm
	3zYP/P/RWkwaXCUG+ifq2q3TvM6rgnjnAow5p8ck8Bcjb7Pm10NDypZUZeHQqdkDStztoUpNEGy
	BZ0Z5U3qKZHXhxGfw==
X-Received: by 2002:a05:600c:3f0c:b0:48a:563c:c8e0 with SMTP id 5b1f17b1804b1-48a563cd16bmr92329805e9.1.1776865386732;
        Wed, 22 Apr 2026 06:43:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:7d92:9cde:4eb2:46d7? ([2a01:e0a:106d:1080:7d92:9cde:4eb2:46d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c01cfsm468597015e9.10.2026.04.22.06.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 06:43:06 -0700 (PDT)
Message-ID: <391c1fb3-cf0a-4255-a8a3-94010754eaf3@linaro.org>
Date: Wed, 22 Apr 2026 15:43:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260417-topic-sm8x50-iris-10bit-decoding-v2-0-c987b65a31d5@linaro.org>
 <20260417-topic-sm8x50-iris-10bit-decoding-v2-3-c987b65a31d5@linaro.org>
 <568c51fd-a229-0cd9-815d-7461606beb60@oss.qualcomm.com>
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
In-Reply-To: <568c51fd-a229-0cd9-815d-7461606beb60@oss.qualcomm.com>
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
	TAGGED_FROM(0.00)[bounces-104128-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:replyto,linaro.org:email,linaro.org:dkim,linaro.org:mid];
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
X-Rspamd-Queue-Id: 5B8DD446EE8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 11:13, Dikshita Agarwal wrote:
> 
> 
> On 4/17/2026 3:07 PM, Neil Armstrong wrote:
>> Add the necessary plumbing into the HFi Gen2 to signal the decoder
>> the right 10bit pixel format and stride when in compressed mode.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 71 +++++++++++++++++++++-
>>   .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>>   drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>>   3 files changed, 72 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> index 30bfd90d423b..d664e606e886 100644
>> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
>> @@ -481,8 +481,20 @@ static int iris_hfi_gen2_set_colorformat(struct iris_inst *inst, u32 plane)
>>   
>>   	if (inst->domain == DECODER) {
>>   		pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>> -		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> -			HFI_COLOR_FMT_NV12 : HFI_COLOR_FMT_NV12_UBWC;
>> +		switch (pixelformat) {
>> +		case V4L2_PIX_FMT_NV12:
>> +			hfi_colorformat = HFI_COLOR_FMT_NV12;
>> +			break;
>> +		case V4L2_PIX_FMT_QC08C:
>> +			hfi_colorformat = HFI_COLOR_FMT_NV12_UBWC;
>> +			break;
>> +		case V4L2_PIX_FMT_P010:
>> +			hfi_colorformat = HFI_COLOR_FMT_P010;
>> +			break;
>> +		case V4L2_PIX_FMT_QC10C:
>> +			hfi_colorformat = HFI_COLOR_FMT_TP10_UBWC;
>> +			break;
>> +		};
>>   	} else {
>>   		pixelformat = inst->fmt_src->fmt.pix_mp.pixelformat;
>>   		hfi_colorformat = pixelformat == V4L2_PIX_FMT_NV12 ?
>> @@ -517,7 +529,8 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>   	stride_uv = stride_y;
>>   	scanline_uv = scanline_y / 2;
>>   
>> -	if (pixelformat != V4L2_PIX_FMT_NV12)
>> +	if (pixelformat != V4L2_PIX_FMT_NV12 &&
>> +	    pixelformat != V4L2_PIX_FMT_P010)
>>   		return 0;
>>   
>>   	payload[0] = stride_y << 16 | scanline_y;
>> @@ -532,6 +545,57 @@ static int iris_hfi_gen2_set_linear_stride_scanline(struct iris_inst *inst, u32
>>   						  sizeof(u64));
>>   }
>>   
>> +static int iris_hfi_gen2_set_ubwc_stride_scanline(struct iris_inst *inst, u32 plane)
>> +{
>> +	u32 meta_stride_y, meta_scanline_y, meta_stride_uv, meta_scanline_uv;
>> +	u32 stride_y, scanline_y, stride_uv, scanline_uv;
>> +	u32 port = iris_hfi_gen2_get_port(inst, plane);
>> +	u32 pixelformat, width, height;
>> +	u32 payload[4];
>> +
>> +	pixelformat = inst->fmt_dst->fmt.pix_mp.pixelformat;
>> +	width = inst->fmt_dst->fmt.pix_mp.width;
>> +	height = inst->fmt_dst->fmt.pix_mp.height;
>> +
>> +	switch (pixelformat) {
>> +	case V4L2_PIX_FMT_QC08C:
>> +		stride_y = ALIGN(width, 128);
>> +		scanline_y = ALIGN(height, 32);
>> +		stride_uv = ALIGN(width, 128);
>> +		scanline_uv = ALIGN((height + 1) >> 1, 32);
>> +		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 32), 64);
>> +		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 8), 16);
>> +		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 16), 64);
>> +		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 8), 16);
>> +		break;
>> +	case V4L2_PIX_FMT_QC10C:
>> +		stride_y = ALIGN(width * 4 / 3, 256);
>> +		scanline_y = ALIGN(height, 16);
>> +		stride_uv = ALIGN(width * 4 / 3, 256);
>> +		scanline_uv = ALIGN((height + 1) >> 1, 16);
>> +		meta_stride_y = ALIGN(DIV_ROUND_UP(width, 48), 64);
>> +		meta_scanline_y = ALIGN(DIV_ROUND_UP(height, 4), 16);
>> +		meta_stride_uv = ALIGN(DIV_ROUND_UP((width + 1) >> 1, 24), 64);
>> +		meta_scanline_uv = ALIGN(DIV_ROUND_UP((height + 1) >> 1, 4), 16);
>> +		break;
>> +	default:
>> +		return 0;
>> +	}
>> +
>> +	payload[0] = stride_y << 16 | scanline_y;
>> +	payload[1] = stride_uv << 16 | scanline_uv;
>> +	payload[2] = meta_stride_y << 16 | meta_scanline_y;
>> +	payload[3] = meta_stride_uv << 16 | meta_scanline_uv;
>> +
>> +	return iris_hfi_gen2_session_set_property(inst,
>> +						  HFI_PROP_UBWC_STRIDE_SCANLINE,
>> +						  HFI_HOST_FLAGS_NONE,
>> +						  port,
>> +						  HFI_PAYLOAD_U32_ARRAY,
>> +						  &payload[0],
>> +						  sizeof(u32) * 4);
>> +}
> 
> I’m still not convinced this change is needed for non‑AV1 codecs.
> I’m concerned this may be masking an underlying alignment issue, since this
> property is not intended to be used for non‑AV1 codecs. Even FW team
> doesn't recommend setting this property for other codecs as it can lead to
> wasted memory due to over‑allocation and padding.

I don't see the issue since here we simply pass the same strides as we expect
on the drm msm and iris driver buffer calculation, as we already do for the
linear formats BTW.
It makes no sense to not call HFI_PROP_UBWC_STRIDE_SCANLINE for ubwc formats and
let the firmware use it's default undocumented strides.

Neil

> 
> Thanks,
> Dikshita


