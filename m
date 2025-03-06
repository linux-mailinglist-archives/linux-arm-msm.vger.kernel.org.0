Return-Path: <linux-arm-msm+bounces-50428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C424A53F94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 02:06:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F0C01891024
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 01:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C893554F8C;
	Thu,  6 Mar 2025 01:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FeGmXz8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA85854723
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 01:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741223157; cv=none; b=uItT7wJywq3PMMkCp58kMmDueA/HUzYSvUfB2k8i8h2tuDVCfQsaGu/XEpP2nHGEbf/Y2PIfrtdjhYv8LndpktS7MV+CMvCa9mFnqe3eRC4fnUSPAuv5N5dTJcgy/1ihRbzOoY/LT+ybQXJTz9i4U6vLZHKn+1U6sWWx9FB1JNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741223157; c=relaxed/simple;
	bh=iKZaZZ93A8EmJ6E6wiLd3eIK1XonMbv0JikYfwCMXDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AivgQkstQzVK5xxP/Eet3VIktgh2Jy0ey74Svp0y7dVOj7JKl08OY2bDMm8389jEzL4/pO/ML1EbcyRAIGRcXx/UA6XteBdo5QYTxcI7xJ3EIZwN/PviftFnmVFvHurqVuqgv85TuMH8LGqi/3VsAqT3g4nrbABjpFA8Ucj21tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FeGmXz8/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so300075e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 17:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741223154; x=1741827954; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZUbDcyt1+aw6K+SCP95Z+3ScUhwExiAJQZmJDC2tNv0=;
        b=FeGmXz8/UXatXipjY2Uf8S0HWtoTPXHgP9s1mPZMdQcLRaDzOY1Y/Usr/GwFW0Quv+
         7RoacIMDUlhlgogaXx9xhOWRSsTBoXgDXD8mzu8YbztycICfbLNA6HqiUugex6vzJ+KJ
         F2tqnxBv4Ux3lQnPcvFMfondHwWRKbfKrdRK1m9Gdfn7JdwiNhkFClUUFngfzE1+bJrb
         LglPoMgT3KEbvUJ4dt2PFXTOJXb32y3rTKewOlWtT6WYCPVYop1GZZ24WO9IYVv+LA6R
         SizlpWjXXtvKHw6KEaF7pi1CzEreXpIJIsXN6izHjEBZDiYvy2VB3kYLTDHCa9jEsZWS
         CxNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741223154; x=1741827954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUbDcyt1+aw6K+SCP95Z+3ScUhwExiAJQZmJDC2tNv0=;
        b=qff0xM6qR1vhQvTIjRKMTbGon3LHRbptGC3IQsXs+ISbHn2RveK9q1n551s20zrjhA
         jg45GLKxQLoRfRa24tEYfoHvkiJFQFp9PEU0jsEatoJKGbZV5BR+y3YcrRTtSLlmV9Tn
         pLCef5yETa4jtoT0SwVFuPn912AZPII0Shiso94MBqxejDOHsw6hslTrYB0rbQkEv1zG
         5rcV/8XLIYTVxPxo4ySjUH1VvlQ9XsTmkIBNEf3U3XKbkyzyMOHmuC6MogufkWiC/j/g
         LEIi76D1gd2Wiv5wX4oPLFyc963TP+lTLYZ/cWeLHtuGFB2lpY2ZD3bYPxyrdWnpZzZs
         LJWg==
X-Forwarded-Encrypted: i=1; AJvYcCVTxxqlxgbkhV/5QsI3J9V9puoD9/tPRAixO+aNhD3fYS13e8aY9Cq+QtWuw2zE0IO7EYPXCM19H43P7dK7@vger.kernel.org
X-Gm-Message-State: AOJu0YzXds/aUA17Mrb5SueI/xwKptZBYjXPBUUjnb9m5/GSUZfoDEmS
	zkYKOetMiL7C4ddHDVGSt7u/AO0WRjl7WGGbW53oJycUdI/g9G8hKd7vuvDSaPI=
X-Gm-Gg: ASbGncsSBCTikZsTFYSF1bXuP4gvA7Ksgoj52aN/9wzs/BBRxvucLVT+2IbVY6lJ4Ia
	qmqsBzsXhbAdCMN7/XI/0mhpPd1IX5SYIxLz+jpzySGlVDXbkpCiO2FTUS8xxksZ6EDR5iHh7FQ
	3vrXruTd0J2BtBML7Q3lE96040u68XSw39DQzwcU/hiiNEbib+gGS+XPJm/8F7A2VnFlioHjJPW
	MaO5UTTLT0guXNQ0f15USSVu7k23f/wm9qesWLH1Gx9JKDF8ADBILmv/1e9xa+w9QVVZok3IpeS
	pGVO2A5IJ5POR+ukNoWN6sEVGEK8YvwXx/nVbpDAhCozLlRb3RQWjyZqoTwEpYtPp0xCoPDdJU0
	ZLwQklPPVNg==
X-Google-Smtp-Source: AGHT+IEBE+AjJSFQ5hTzB0AD9wDUmggQ6dY7nBAGbbjumNehivZ0YmNvgBtLxJfeYy/ati/9+ylr/A==
X-Received: by 2002:a05:600c:190a:b0:43b:cbe2:ec0c with SMTP id 5b1f17b1804b1-43bd29c9377mr40663785e9.27.1741223152664;
        Wed, 05 Mar 2025 17:05:52 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfdfe2bsm206780f8f.24.2025.03.05.17.05.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 17:05:52 -0800 (PST)
Message-ID: <ac44e16c-36af-471a-b47b-bb26ccd9f018@linaro.org>
Date: Thu, 6 Mar 2025 01:05:50 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 04/12] media: iris: Add internal buffer calculation
 for HEVC and VP9 decoders
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org
Cc: hverkuil@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-5-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250305104335.3629945-5-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 10:43, Dikshita Agarwal wrote:
> Add internal buffer count and size calculations for HEVC and VP9
> decoders.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   .../media/platform/qcom/iris/iris_buffer.c    |   3 +
>   .../platform/qcom/iris/iris_vpu_buffer.c      | 397 +++++++++++++++++-
>   .../platform/qcom/iris/iris_vpu_buffer.h      |  46 +-
>   3 files changed, 432 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index e5c5a564fcb8..8c9d5b7fe75c 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -205,6 +205,9 @@ static u32 iris_bitstream_buffer_size(struct iris_inst *inst)
>   	if (num_mbs > NUM_MBS_4K) {
>   		div_factor = 4;
>   		base_res_mbs = caps->max_mbpf;
> +	} else {
> +		if (inst->codec == V4L2_PIX_FMT_VP9)
> +			div_factor = 1;
>   	}
>   
>   	/*
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index dce25e410d80..13ee93356bcb 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -31,6 +31,42 @@ static u32 hfi_buffer_bin_h264d(u32 frame_width, u32 frame_height, u32 num_vpp_p
>   	return size_h264d_hw_bin_buffer(n_aligned_w, n_aligned_h, num_vpp_pipes);
>   }
>   
> +static u32 size_h265d_hw_bin_buffer(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 product = frame_width * frame_height;
> +	u32 size_yuv, size_bin_hdr, size_bin_res;
> +
> +	size_yuv = (product <= BIN_BUFFER_THRESHOLD) ?
> +		((BIN_BUFFER_THRESHOLD * 3) >> 1) : ((product * 3) >> 1);

When I read this code I have no way of knowing if it makes sense.

#define BIN_BUFFER_THRESHOLD		(1280 * 736)

((BIN_BUFFER_THRESHOLD * 3) >> 1)

How/why is that correct ?

> +	size_bin_hdr = size_yuv * H265_CABAC_HDR_RATIO_HD_TOT;
> +	size_bin_res = size_yuv * H265_CABAC_RES_RATIO_HD_TOT;
> +	size_bin_hdr = ALIGN(size_bin_hdr / num_vpp_pipes, DMA_ALIGNMENT) * num_vpp_pipes;
> +	size_bin_res = ALIGN(size_bin_res / num_vpp_pipes, DMA_ALIGNMENT) * num_vpp_pipes;
> +
> +	return size_bin_hdr + size_bin_res;
> +}
> +
> +static u32 hfi_buffer_bin_vp9d(u32 frame_width, u32 frame_height, u32 num_vpp_pipes)
> +{
> +	u32 _size_yuv = ALIGN(frame_width, 16) * ALIGN(frame_height, 16) * 3 / 2;
> +	u32 _size = ALIGN(((max_t(u32, _size_yuv, ((BIN_BUFFER_THRESHOLD * 3) >> 1)) *
> +			VPX_DECODER_FRAME_BIN_HDR_BUDGET / VPX_DECODER_FRAME_BIN_DENOMINATOR *
> +			VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes), DMA_ALIGNMENT) +
> +			ALIGN(((max_t(u32, _size_yuv, ((BIN_BUFFER_THRESHOLD * 3) >> 1)) *
> +			VPX_DECODER_FRAME_BIN_RES_BUDGET / VPX_DECODER_FRAME_BIN_DENOMINATOR *
> +			VPX_DECODER_FRAME_CONCURENCY_LVL) / num_vpp_pipes), DMA_ALIGNMENT);

The size_yuv I guess just about makes sense but the _size component here 
is pretty hard to say whether or not this adds up.

Could you please add some comments to describe the calculations in these 
complex size/alignment clauses.

---
bod

