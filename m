Return-Path: <linux-arm-msm+bounces-47670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 641F0A31A6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 01:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B10801885D65
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 00:23:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7552B673;
	Wed, 12 Feb 2025 00:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VyTj5BbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495715680
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 00:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739319795; cv=none; b=Q0MucwJ8+9SBfdFq48GJ72GnAqcJa+VJJiByII/AUIifC2nstglitBaIlD+Y17IBjcLAxe4tO8GqSl2qOc35kaUHQkmo1UtWlFDI+rT3fwYl46Vc1lJGroUOo+cek+KAYSvhYZLpuQQz4G6VhnOLFr73e8RzA9uBxn9PmNAy3GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739319795; c=relaxed/simple;
	bh=Utq+Q/ZmLa394JBxgwSfGEoz74h2QKacDDwFYVqMVtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oqEcukWUp4F3KQNUHzJEJZ59rx9L+iSDLDFsdmb+Q4GRqS2/OxJ5oP87TMcttYT7MIk/vkhAUXSoBAbXUg8PW1xLWKPbRj38hYrnx2piuNxl53pn85DQLQQBvc/TTD2ubEXwrxCHDH+SlFJN87Ceg0CExjW8+2vEzwjs132mij4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VyTj5BbV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so61246115e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739319790; x=1739924590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VnlE7khDpMh69ycUOLA2IVkmrLr9T2j4fKjX7UnC4mU=;
        b=VyTj5BbVt8ExNlnlCCPGVswWkYM8Bi5btHyqtr2cpAMGpS3jd1g+jf+gmE/8FRjifH
         C83ZvnjL8RTloEX5v05k8t8fhvyIbO05P1A/+fMfIWuTDQXafTAX3IpfwR/0T0a60BMG
         LRYQu8AJLYF8g5jQc5kE+cptxD9AJ8LtJYlfSxghmT+BYb1X4hOYk9aRMQqSuxPD3Zzk
         oNfebqlkVhN81QK4hj6F1PpilOZSQXpYjaaDR5iD9vaTEH8To1a+MTbQxuPFld/FUCQI
         entkmgjnWcmqcdToAxFJHryOesbdlrIygYse+5XKCGAPukI0fmG+6Wz1cvMR4+hnEY94
         PUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739319790; x=1739924590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VnlE7khDpMh69ycUOLA2IVkmrLr9T2j4fKjX7UnC4mU=;
        b=r5DPeA/vOr6GSeGg5K6o/UNzYKrwZ/qyZ8BPte9OVJAr+HurjHLORWn9IHtI4RDG4K
         9PsxlrKuj9zdSwIwUAu0vq0QcQ7AkFYm5B/Act7B40/7+OliKqpc7qvVF+I2+RWFh/Jh
         C9awnSZhtX5LX6gEO2lmzl52HXPKnRYf5XSVrSRpercnnwKAwFBvwDFq4tkVH8IDxVNw
         Tg/72UmvoQTqF2rnARTiDUYKEUrXwGdKUAiGxuYWQAXuvJ7GGBSZU2dtdv06VDUg09Ah
         ZREEPw+vFbtEY8jObC3ijKMYGPRGuSZikmeKRmaFUZmbUdOetae7bzJvts8s5pH08tEX
         /bZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNLOI8j58RELPt8WA6xlaOcNcC9fs4btlJ8+2r6MgC//EiGWRhrDR4E3BFqyB91rykVodj3ub82ZA5U7XG@vger.kernel.org
X-Gm-Message-State: AOJu0YxdydK3R7F995iL6i+5HSfA4uJy5diL+UyMsGejgbwrVE4fCcTR
	FX+3f9QTAYlTlDHIE2C3XZhigU7ThthK9eXaaRYEsLitumnBXVN6ZCYbU7DJvsU=
X-Gm-Gg: ASbGncul18wo1YC/8TTtUzbQFI1Bx1Q1e5uhrV4DmEupOvQ+1r67ZLc5r0zkPUOpUYH
	kostOv92fWAbGkypiPk2yMpJJKAx2PwL5zVg72kXovg96IjTCe9rD7uL4I8EQ+5LMPsYc37HDi8
	541xxHavXAvzeWw6Sj3oX2PwfPOzZMCXiF/uQwTU1RQK+Wx0FYhBGIiNve1nGl59/CkKGD2r655
	6ziE8bG3Okgc2pOZuaXoF4T7o7lcNb1IAFgfeY5ZowMtDz3WBbBvk0Q8JV6H/gD4BkPDNg6J/3+
	wWcNut1VNN16L+foMlPwFoLhT0XctsJ1gzP6Kbvr5jndPK9gpDYQXXIolQ==
X-Google-Smtp-Source: AGHT+IE2XZTCvLa5wIAe0l2v3uJQ0/+yRfiX0oUpE/3gkJhHabA12Ks9gTNZMuWX4iswiWV7V4jZGw==
X-Received: by 2002:a05:600c:1ca9:b0:431:58cd:b259 with SMTP id 5b1f17b1804b1-439581d1f44mr10950255e9.31.1739319790526;
        Tue, 11 Feb 2025 16:23:10 -0800 (PST)
Received: from [192.168.0.156] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06cf2fsm3230235e9.19.2025.02.11.16.23.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 16:23:09 -0800 (PST)
Message-ID: <8ec13935-2c7f-4b4e-a1cb-b5069e8e53f4@linaro.org>
Date: Wed, 12 Feb 2025 00:23:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: venus: hfi_parser: refactor hfi packet
 parsing logic
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tomasz Figa
 <tfiga@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>
Cc: Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250207-venus_oob_2-v4-0-522da0b68b22@quicinc.com>
 <20250207-venus_oob_2-v4-2-522da0b68b22@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250207-venus_oob_2-v4-2-522da0b68b22@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/02/2025 08:24, Vikash Garodia wrote:
> words_count denotes the number of words in total payload, while data
> points to payload of various property within it. When words_count
> reaches last word, data can access memory beyond the total payload. This
> can lead to OOB access. With this patch, the utility api for handling
> individual properties now returns the size of data consumed. Accordingly
> remaining bytes are calculated before parsing the payload, thereby
> eliminates the OOB access possibilities.
> 
> Cc: stable@vger.kernel.org
> Fixes: 1a73374a04e5 ("media: venus: hfi_parser: add common capability parser")
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   drivers/media/platform/qcom/venus/hfi_parser.c | 95 +++++++++++++++++++-------
>   1 file changed, 69 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index 1cc17f3dc8948160ea6c3015d2c03e475b8aa29e..404c527329c5fa89ee885a6ad15620c9c90a99e4 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -63,7 +63,7 @@ fill_buf_mode(struct hfi_plat_caps *cap, const void *data, unsigned int num)
>   		cap->cap_bufs_mode_dynamic = true;
>   }
>   
> -static void
> +static int
>   parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   {
>   	struct hfi_buffer_alloc_mode_supported *mode = data;
> @@ -71,7 +71,7 @@ parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   	u32 *type;
>   
>   	if (num_entries > MAX_ALLOC_MODE_ENTRIES)
> -		return;
> +		return -EINVAL;
>   
>   	type = mode->data;
>   
> @@ -83,6 +83,8 @@ parse_alloc_mode(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   
>   		type++;
>   	}
> +
> +	return sizeof(*mode);
>   }
>   
>   static void fill_profile_level(struct hfi_plat_caps *cap, const void *data,
> @@ -97,7 +99,7 @@ static void fill_profile_level(struct hfi_plat_caps *cap, const void *data,
>   	cap->num_pl += num;
>   }
>   
> -static void
> +static int
>   parse_profile_level(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   {
>   	struct hfi_profile_level_supported *pl = data;
> @@ -105,12 +107,14 @@ parse_profile_level(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   	struct hfi_profile_level pl_arr[HFI_MAX_PROFILE_COUNT] = {};
>   
>   	if (pl->profile_count > HFI_MAX_PROFILE_COUNT)
> -		return;
> +		return -EINVAL;
>   
>   	memcpy(pl_arr, proflevel, pl->profile_count * sizeof(*proflevel));
>   
>   	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
>   		       fill_profile_level, pl_arr, pl->profile_count);
> +
> +	return pl->profile_count * sizeof(*proflevel) + sizeof(u32);

I'm not going to check your maths here and will instead assume you've 
corrected your own homework and these calculations are correct..

>   }
>   
>   static void
> @@ -125,7 +129,7 @@ fill_caps(struct hfi_plat_caps *cap, const void *data, unsigned int num)
>   	cap->num_caps += num;
>   }
>   
> -static void
> +static int
>   parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   {
>   	struct hfi_capabilities *caps = data;
> @@ -134,12 +138,14 @@ parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   	struct hfi_capability caps_arr[MAX_CAP_ENTRIES] = {};
>   
>   	if (num_caps > MAX_CAP_ENTRIES)
> -		return;
> +		return -EINVAL;
>   
>   	memcpy(caps_arr, cap, num_caps * sizeof(*cap));
>   
>   	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
>   		       fill_caps, caps_arr, num_caps);
> +
> +	return sizeof(*caps);
>   }
>   
>   static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,
> @@ -154,7 +160,7 @@ static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,
>   	cap->num_fmts += num_fmts;
>   }
>   
> -static void
> +static int
>   parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   {
>   	struct hfi_uncompressed_format_supported *fmt = data;
> @@ -163,7 +169,8 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   	struct raw_formats rawfmts[MAX_FMT_ENTRIES] = {};
>   	u32 entries = fmt->format_entries;
>   	unsigned int i = 0;
> -	u32 num_planes;
> +	u32 num_planes = 0;
> +	u32 size;
>   
>   	while (entries) {
>   		num_planes = pinfo->num_planes;
> @@ -173,7 +180,7 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   		i++;
>   
>   		if (i >= MAX_FMT_ENTRIES)
> -			return;
> +			return -EINVAL;
>   
>   		if (pinfo->num_planes > MAX_PLANES)
>   			break;
> @@ -185,9 +192,13 @@ parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   
>   	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
>   		       fill_raw_fmts, rawfmts, i);
> +	size = fmt->format_entries * (sizeof(*constr) * num_planes + 2 * sizeof(u32))
> +		+ 2 * sizeof(u32);
> +
> +	return size;
>   }
>   
> -static void parse_codecs(struct venus_core *core, void *data)
> +static int parse_codecs(struct venus_core *core, void *data)
>   {
>   	struct hfi_codec_supported *codecs = data;
>   
> @@ -199,21 +210,27 @@ static void parse_codecs(struct venus_core *core, void *data)
>   		core->dec_codecs &= ~HFI_VIDEO_CODEC_SPARK;
>   		core->enc_codecs &= ~HFI_VIDEO_CODEC_HEVC;
>   	}
> +
> +	return sizeof(*codecs);
>   }
>   
> -static void parse_max_sessions(struct venus_core *core, const void *data)
> +static int parse_max_sessions(struct venus_core *core, const void *data)
>   {
>   	const struct hfi_max_sessions_supported *sessions = data;
>   
>   	core->max_sessions_supported = sessions->max_sessions;
> +
> +	return sizeof(*sessions);
>   }
>   
> -static void parse_codecs_mask(u32 *codecs, u32 *domain, void *data)
> +static int parse_codecs_mask(u32 *codecs, u32 *domain, void *data)
>   {
>   	struct hfi_codec_mask_supported *mask = data;
>   
>   	*codecs = mask->codecs;
>   	*domain = mask->video_domains;
> +
> +	return sizeof(*mask);
>   }
>   
>   static void parser_init(struct venus_inst *inst, u32 *codecs, u32 *domain)
> @@ -282,8 +299,9 @@ static int hfi_platform_parser(struct venus_core *core, struct venus_inst *inst)
>   u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>   	       u32 size)
>   {
> -	unsigned int words_count = size >> 2;
> -	u32 *word = buf, *data, codecs = 0, domain = 0;
> +	u32 *words = buf, *payload, codecs = 0, domain = 0;
> +	u32 *frame_size = buf + size;
> +	u32 rem_bytes = size;
>   	int ret;
>   
>   	ret = hfi_platform_parser(core, inst);
> @@ -300,38 +318,63 @@ u32 hfi_parser(struct venus_core *core, struct venus_inst *inst, void *buf,
>   		memset(core->caps, 0, sizeof(core->caps));
>   	}
>   
> -	while (words_count) {
> -		data = word + 1;
> +	while (words < frame_size) {
> +		payload = words + 1;
>   
> -		switch (*word) {
> +		switch (*words) {
>   		case HFI_PROPERTY_PARAM_CODEC_SUPPORTED:
> -			parse_codecs(core, data);
> +			if (rem_bytes <= sizeof(struct hfi_codec_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_codecs(core, payload);
>   			init_codecs(core);
>   			break;
>   		case HFI_PROPERTY_PARAM_MAX_SESSIONS_SUPPORTED:
> -			parse_max_sessions(core, data);
> +			if (rem_bytes <= sizeof(struct hfi_max_sessions_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_max_sessions(core, payload);
>   			break;
>   		case HFI_PROPERTY_PARAM_CODEC_MASK_SUPPORTED:
> -			parse_codecs_mask(&codecs, &domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_codec_mask_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_codecs_mask(&codecs, &domain, payload);
>   			break;
>   		case HFI_PROPERTY_PARAM_UNCOMPRESSED_FORMAT_SUPPORTED:
> -			parse_raw_formats(core, codecs, domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_uncompressed_format_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_raw_formats(core, codecs, domain, payload);
>   			break;
>   		case HFI_PROPERTY_PARAM_CAPABILITY_SUPPORTED:
> -			parse_caps(core, codecs, domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_capabilities))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_caps(core, codecs, domain, payload);
>   			break;
>   		case HFI_PROPERTY_PARAM_PROFILE_LEVEL_SUPPORTED:
> -			parse_profile_level(core, codecs, domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_profile_level_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_profile_level(core, codecs, domain, payload);
>   			break;
>   		case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE_SUPPORTED:
> -			parse_alloc_mode(core, codecs, domain, data);
> +			if (rem_bytes <= sizeof(struct hfi_buffer_alloc_mode_supported))
> +				return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +			ret = parse_alloc_mode(core, codecs, domain, payload);
>   			break;
>   		default:
> +			ret = sizeof(u32);
>   			break;
>   		}
>   
> -		word++;
> -		words_count--;
> +		if (ret < 0)
> +			return HFI_ERR_SYS_INSUFFICIENT_RESOURCES;
> +
> +		words += ret / sizeof(u32);
> +		rem_bytes -= ret;
>   	}
>   
>   	if (!core->max_sessions_supported)
> 

LGTM

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

