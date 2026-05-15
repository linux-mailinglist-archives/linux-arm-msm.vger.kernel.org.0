Return-Path: <linux-arm-msm+bounces-107765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFK7A7fxBmohpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:13:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEA754D1BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 12:13:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60D043150F71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 09:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3AB42EEC1;
	Fri, 15 May 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ky5v5luO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17B940DFC5
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 09:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838182; cv=none; b=bWN0ht6PSZOGSFrXLUBcZ2TSVK+ssrk189a8UQjfIT8ero4swPDSbB1xo1Q/HcIHqfm+Ih6hBOMw3/KMiXvQENiIHRGqDt6qNNfpxZO5bTlIDODxk3ot/gLKQonqUA4h8drzydTUQawcK+g8uy+Cuan75mSLd6lMKCw5OMOKOGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838182; c=relaxed/simple;
	bh=EU+HmJT6nnrW+H8x6Cnl4CrlEA7rDTKbZqUrmoYkGSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HslCM3BjiaJMQeYo5BJxz8NvsnEOiln5hOuRfMxVi7wfVtbKcv57xeEmItD4jJRftX8QJ8NRQsJ51ZJfd+X8F1A54TzGMs2cMQSClWljA34w0zVex9L2s/KEW8AJyv9PCvkQiKVOHaJUfrBJix0uH7noQEuBmHQrbuwxWY4xlDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ky5v5luO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so78121315e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 02:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778838179; x=1779442979; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVDGicVJg59XTncijfQC7XsfDc3wPf8gJrlfL/wbLsg=;
        b=ky5v5luOR6Z+r7B5K49YoovWpN8lfcX1hhNBr/YluhS10Ine9Yb5ehwd3l/3c2wxbQ
         NZurzrcBYCFs+66FSqX6tazSj4f+D/DXw7khkITJd0Hz8FwtBP10CB+j9y0EABAVOgEt
         F054QqgmNZ3yycBdg2voToyd93okhfm3+g7ORRRdhDPFsj8dbXO7N475h3kbFBumKbnX
         n7aDTFrE6wavnx034IyHxyuFJwWgSDmYPIB9PqlsaVJ7bALyzIZEdPwbg2MzqntEaPM+
         lQ03C9RmMfa2D7TK4X9rMDCMl9F0h0RaKzD6wY53ocf4+gxXLFSlhFO8A558MNj8Hi8i
         SKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778838179; x=1779442979;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVDGicVJg59XTncijfQC7XsfDc3wPf8gJrlfL/wbLsg=;
        b=I4ItUIJT02HZgHDIHyLfG0WLp3pVUCkLvGjlYMQBEAtJlvvx+y9tvdcaaEzXq0jBqM
         Aq4DzEE1fdXVSWmWJn2Upi1RGmRAgUOggyzsnWZ70Iy5szSxtWUW19dQBJOr6lG1M0TK
         A8d9jFa9T9kUdK4iwnQI4+RWrfD7it+aJGWVlG3EGLMnSHiLXz5vywr8VqWa+Z1btEoq
         Y5n0X65F38om8u6AQtM/KtE7gPTvHRpfLvl4YJKDEve1vMFMXPv+djL525R466NrTQ6a
         y2r35N4ayi+f7aQbdlQtadpPTJCTxvgne4UVCRyj9t+wl6iAzuLoCVsomQJuaRWyUD+u
         gQbg==
X-Forwarded-Encrypted: i=1; AFNElJ/CV3P4+vSyCaaCsGE745kvftw5e3Dga7N6NoU3lc/YQ6xVLdbAEY4sr4H+yp2bGFAEeVt34oOXGlXKX5UN@vger.kernel.org
X-Gm-Message-State: AOJu0YwMghJOEuEI7Zvnh9XoErTd5V050ETRXQnlQm7e0qWyiQlaFMyE
	rWVbF0dt/D7+njaa3LeCCstWeM+EvJynaAHUHDb8QZr/o+zLJdO7crnB71vnyxkmung=
X-Gm-Gg: Acq92OEB05pzEi4khWSkZf12LQEyULBmY0X22KCa+DCBdIuiCtfMCkkcs8trVcCdSjr
	1W7UnaIBMpHyzIktvXNUufMdTK8nTENf6lhJvejVIXw7OCfdGDydLyk/3/W1e4zgaPgnw9gACp7
	8XZ3sjqCb8eHWas+WYpzJWaiqEFKY2OME9ydkQsTVtUZWExGhiR8tkN0UldUnu0iCLM9/HO/ohY
	VDQNnBLyjrS781PEcO83z9NYYSi3mJJESeljPYCv0o0zSmDKRzX6CrxtdJ1x0apRYSkQJFHt4zC
	QY4nO/bgBYlzRgPaZErNqCnI0+rctHLaE1NtQs/9y3JYBEoQcvaZm/euU9wxHryMFWbboofKaVa
	Go4pFX/ycf5YTVLN4LgtDI5xAjFX7se+qPj0zwsaZSClTjtGfjY4EhOBA9cWRaLFPVEy8bzTAnQ
	O8/HwlgfCNQC3oJuCmg7BERtekGTZL4t2YpdI=
X-Received: by 2002:a05:600c:34c7:b0:48a:54fd:54ea with SMTP id 5b1f17b1804b1-48fe60ecd93mr47471195e9.12.1778838179190;
        Fri, 15 May 2026 02:42:59 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.168.101])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0fe248dsm12825790f8f.30.2026.05.15.02.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 02:42:58 -0700 (PDT)
Message-ID: <5d4fd84d-59e2-48c1-9982-0c3ad932bd15@linaro.org>
Date: Fri, 15 May 2026 10:42:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] media: qcom: iris: vdec: update find_format to
 handle 8bit and 10bit formats
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <0boIejkDZLA5Kw9uSWxeZX3GforfnPgAo7E27fY_Nnp4VjgHo8d9b70ojS2zrG-xk4dDT__EyunCPPEgJh1Niw==@protonmail.internalid>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-5-7fc049b93042@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 9CEA754D1BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107765-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On 11/05/2026 10:20, Neil Armstrong wrote:
> The 10bit pixel format can be only used when the decoder identifies the
> stream as decoding into 10bit pixel format buffers, so update the
> find_format helper to filter the formats and only allow the proper
> formats when setting or trying a capture format.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h |  1 +
>   drivers/media/platform/qcom/iris/iris_vdec.c            | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5a489917580e..cd3509da4b75 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -18,6 +18,7 @@ struct iris_inst;
> 
>   #define REGISTER_BIT_DEPTH(luma, chroma)	((luma) << 16 | (chroma))
>   #define BIT_DEPTH_8				REGISTER_BIT_DEPTH(8, 8)
> +#define BIT_DEPTH_10				REGISTER_BIT_DEPTH(10, 10)
>   #define CODED_FRAMES_PROGRESSIVE		0x0
>   #define DEFAULT_MAX_HOST_BUF_COUNT		64
>   #define DEFAULT_MAX_HOST_BURST_BUF_COUNT	256
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index eea69f937147..f4d9951ed04c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -99,6 +99,16 @@ find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>   	if (i == size || fmt[i].type != type)
>   		return NULL;
> 
> +	if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
> +		if (iris_fmt_is_8bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value == BIT_DEPTH_10)
> +			return NULL;
> +
> +		if (iris_fmt_is_10bit(fmt[i].pixfmt) &&
> +		    inst->fw_caps[BIT_DEPTH].value != BIT_DEPTH_10)
> +			return NULL;
> +	}
> +
>   	return &fmt[i];
>   }
> 
> 
> --
> 2.34.1
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

