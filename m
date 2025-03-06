Return-Path: <linux-arm-msm+bounces-50424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2815EA53F03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 01:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAF3A16B38A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 00:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F31E24C6E;
	Thu,  6 Mar 2025 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hRns9hmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A31224EA
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 00:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741220245; cv=none; b=gy3cmhuKjye+nMccoxTQ3EWBYBIJIVoOLoyMsfKMjJINFQ5djPsUWt7HAfNZaMvFXWdu8vHLbP0f7XKgkzWrRHtTQqvKxvlHtD/w+3Kxf2eldwWNyBi340ecCkLVFSc9rPTXJRQFDzWRol1JrVWpUlZFcIR7H6IX3sRFxmFRxVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741220245; c=relaxed/simple;
	bh=iis0dEbMvplE+HTqIDwr32u7CAgdtwromyyJ56mSjoU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UKLjtQC9erpqSEn15G70Y7/J7+9U343ZINiJwGbu41SrHnG1vC3mQCElulxXI1+hU6wESnViwu+0B7tM8E1DM4GocbjLfipF+almSE5AsYlxmytkLBFze1i7XMWU6jkMUomloVgrfUI05piuTs5siu6TOfMIfHT2v2ijZUe87ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hRns9hmp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43bdc607c3fso108275e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 16:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741220241; x=1741825041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EA7wBsRO7beEhIKo4sawZdyyjGbPCorOmTM4q6A6NcQ=;
        b=hRns9hmpfO+jtjWATHPI7Kr6eP7g/AbcvGvtsJr/e4mHWErLUhLAUR9gcThT5bP0nO
         /g/mZiFn4cXoAZI3FGZvuKeTy2FZJHXwTsdReHtmGBfhHVhIsFKwR/0O6ogZd5z9U/fh
         IPxHZqt+Co0CglN27rgyx90irWforPNPjdGN9hbkwhlSwqMRNzmqKiPqE/vnYyuLD00M
         86gEWc9QBRvCDXhartggvnE6G/MlRiCc8Z0263SCjat66utixDZMLpMakYnL6qNmHu+q
         p6wq+ycas+qZiw+/Cugi2Q4sbdOftR0Qzcg3CTSYalTBjPELvz6zXYxAdAGknZR/t/Nr
         3H4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741220241; x=1741825041;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EA7wBsRO7beEhIKo4sawZdyyjGbPCorOmTM4q6A6NcQ=;
        b=q2lwHrpoPjkEbY7uSTpacpwcIpQBUPJSB23UK1KJ6QwOkWvIRsD48uG7uDoHJWgxjT
         YCd8lXsoC3ue5GkuM4zW0DReTxzU3VxZj8RRVc6sE+Q9hczahbI3GQaHe2t4Wja4Tht9
         JaDgh/oO1xDnrjVIV1F6hRbzGomannqInDTmOnT+KwEGW4DApJroCgdKSKF+e3gX6VbM
         TZfSlEDMcsG38QYv53fAMjmgDFwj6LK4y4uOXqvB0omx+aOYO4WaSFYmEZ8BSyXxvdjL
         KeyFHE/QLSut7ZWZEuq/gH5vEEpjZAZjEUwDZRwdfFrL2iAoiV4Xb6okPDiUSxqXVLJq
         ZPog==
X-Forwarded-Encrypted: i=1; AJvYcCUhewogWc9u/HSLkPLDLIYmCya04Q8d8iv8hoeNAirPQeEV86ukSozC4NTfoOZuXM8YSCfGKRXBgvGjZlCy@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1mSSw0q+aNb6a1R3Z7amf2h1LfyMBdFGBsPUYrliRpsBOV/6
	J+q/MvidnnL7Y6GgxoUeXyHtkTYOnqVQbkz5qDT+jny7FPDlsT3YKpjwHVyFD1vUHj+ofhwzgEh
	i
X-Gm-Gg: ASbGncsuwy73Fcb16B/8HJ+YBWY/2aFqvqQCw7OZpepAW455ZPGNwwa04fBTBAM85Ge
	Y2eORB9Hqqx5jK5saf+Jp9XyCT1vBR3AzHB2m6eFokG3MB9OmC4rgG2IRjLZj3Xv+ykpLS0KQ49
	RW1TiDP0hWTdIFT3mbbZQMTiECk+tAN7xE0FjC8GjJr/gvJS98O8xAzPuz4pmZsauobkA5sZs1H
	RvJ16Q1eePZpyjkgVShKZYMr4V2ULNNFROFCUxFK7RBn7v9K4HuID9RxU3lwCZPle8RKEATd2o7
	1O3+Z5wqU1rsGST6VSdJdg3Is0nAw/iqqMKmvXzYo1vmPYDhym/aQCFsQxwgCFYKfKiFvW2TqXm
	0ZmvlmPnVmw==
X-Google-Smtp-Source: AGHT+IFfPBRmNhTCUcxaJc/eEaxtG35bLgc3+iJlmBUv3iOO6fux+pmE+RD4hrwQaCfUbaDmr+QE1w==
X-Received: by 2002:a05:6000:2ac:b0:38d:da79:c27 with SMTP id ffacd0b85a97d-3911f725b24mr4225553f8f.2.1741220241070;
        Wed, 05 Mar 2025 16:17:21 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd42916a0sm32351655e9.9.2025.03.05.16.17.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Mar 2025 16:17:20 -0800 (PST)
Message-ID: <505c9ca6-7c69-4642-b03e-7df23af20484@linaro.org>
Date: Thu, 6 Mar 2025 00:17:19 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] media: iris: Add HEVC and VP9 formats for
 decoder
To: Dikshita Agarwal <quic_dikshita@quicinc.com>, quic_vgarodia@quicinc.com,
 quic_abhinavk@quicinc.com, mchehab@kernel.org
Cc: hverkuil@xs4all.nl, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250305104335.3629945-1-quic_dikshita@quicinc.com>
 <20250305104335.3629945-2-quic_dikshita@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250305104335.3629945-2-quic_dikshita@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2025 10:43, Dikshita Agarwal wrote:
> Extend the decoder driver's supported formats to include HEVC (H.265)
> and VP9. This change updates the format enumeration (VIDIOC_ENUM_FMT)
> and allows setting these formats via VIDIOC_S_FMT.
> 
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   .../qcom/iris/iris_hfi_gen1_command.c         | 18 ++++-
>   .../qcom/iris/iris_hfi_gen1_defines.h         |  2 +
>   .../qcom/iris/iris_hfi_gen2_command.c         | 16 ++++-
>   .../qcom/iris/iris_hfi_gen2_defines.h         |  3 +
>   .../media/platform/qcom/iris/iris_instance.h  |  2 +
>   drivers/media/platform/qcom/iris/iris_vdec.c  | 69 +++++++++++++++++--
>   drivers/media/platform/qcom/iris/iris_vdec.h  | 11 +++
>   drivers/media/platform/qcom/iris/iris_vidc.c  |  3 -
>   8 files changed, 113 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 64f887d9a17d..1e774b058ab9 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -26,6 +26,20 @@ static u32 iris_hfi_gen1_buf_type_from_driver(enum iris_buffer_type buffer_type)
>   	}
>   }
>   
> +static u32 iris_hfi_gen1_v4l2_to_codec_type(u32 pixfmt)
> +{
> +	switch (pixfmt) {
> +	case V4L2_PIX_FMT_H264:
> +		return HFI_VIDEO_CODEC_H264;
> +	case V4L2_PIX_FMT_HEVC:
> +		return HFI_VIDEO_CODEC_HEVC;
> +	case V4L2_PIX_FMT_VP9:
> +		return HFI_VIDEO_CODEC_VP9;
> +	default:
> +		return 0;
> +	}

Unknown is 0 here - perhaps it should be a define.

> +}
> +
>   static int iris_hfi_gen1_sys_init(struct iris_core *core)
>   {
>   	struct hfi_sys_init_pkt sys_init_pkt;
> @@ -88,16 +102,18 @@ static int iris_hfi_gen1_sys_pc_prep(struct iris_core *core)
>   static int iris_hfi_gen1_session_open(struct iris_inst *inst)
>   {
>   	struct hfi_session_open_pkt packet;
> +	u32 codec;
>   	int ret;
>   
>   	if (inst->state != IRIS_INST_DEINIT)
>   		return -EALREADY;
>   
> +	codec = iris_hfi_gen1_v4l2_to_codec_type(inst->codec);


You can return an error from this function - suggest better error 
handling is

if (!codec)
	return -EINVAL; -ENO

or some other error value that makes more sense to you.

> +static u32 iris_hfi_gen2_v4l2_to_codec_type(struct iris_inst *inst)
> +{
> +	switch (inst->codec) {
> +	case V4L2_PIX_FMT_H264:
> +		return HFI_CODEC_DECODE_AVC;
> +	case V4L2_PIX_FMT_HEVC:
> +		return HFI_CODEC_DECODE_HEVC;
> +	case V4L2_PIX_FMT_VP9:
> +		return HFI_CODEC_DECODE_VP9;
> +	default:
> +		return 0;

>   static int iris_hfi_gen2_session_set_codec(struct iris_inst *inst)
>   {
>   	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
> -	u32 codec = HFI_CODEC_DECODE_AVC;
> +	u32 codec = iris_hfi_gen2_v4l2_to_codec_type(inst);

Same comment for gen2

>   
>   	iris_hfi_gen2_packet_session_property(inst,
>   					      HFI_PROP_CODEC,
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> index 806f8bb7f505..2fcf7914b70f 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_defines.h
> @@ -104,6 +104,9 @@ enum hfi_color_format {
>   enum hfi_codec_type {
>   	HFI_CODEC_DECODE_AVC			= 1,
>   	HFI_CODEC_ENCODE_AVC			= 2,
> +	HFI_CODEC_DECODE_HEVC			= 3,
> +	HFI_CODEC_ENCODE_HEVC			= 4,
> +	HFI_CODEC_DECODE_VP9			= 5,
>   };
>   
>   enum hfi_picture_type {
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index caa3c6507006..d8f076936c2b 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -42,6 +42,7 @@
>    * @sequence_out: a sequence counter for output queue
>    * @tss: timestamp metadata
>    * @metadata_idx: index for metadata buffer
> + * @codec: codec type
>    */
>   
>   struct iris_inst {
> @@ -72,6 +73,7 @@ struct iris_inst {
>   	u32				sequence_out;
>   	struct iris_ts_metadata		tss[VIDEO_MAX_FRAME];
>   	u32				metadata_idx;
> +	u32				codec;
>   };
>   
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 4143acedfc57..cdcfe71f5b96 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -32,6 +32,7 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>   	f->fmt.pix_mp.width = DEFAULT_WIDTH;
>   	f->fmt.pix_mp.height = DEFAULT_HEIGHT;
>   	f->fmt.pix_mp.pixelformat = V4L2_PIX_FMT_H264;
> +	inst->codec = f->fmt.pix_mp.pixelformat;
>   	f->fmt.pix_mp.num_planes = 1;
>   	f->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>   	f->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_INPUT);
> @@ -67,14 +68,67 @@ void iris_vdec_inst_deinit(struct iris_inst *inst)
>   	kfree(inst->fmt_src);
>   }
>   
> +static const struct iris_fmt iris_vdec_formats[] = {
> +	[IRIS_FMT_H264] = {
> +		.pixfmt = V4L2_PIX_FMT_H264,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_HEVC] = {
> +		.pixfmt = V4L2_PIX_FMT_HEVC,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +	[IRIS_FMT_VP9] = {
> +		.pixfmt = V4L2_PIX_FMT_VP9,
> +		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> +	},
> +};
> +
> +static const struct iris_fmt *
> +find_format(struct iris_inst *inst, u32 pixfmt, u32 type)
> +{
> +	const struct iris_fmt *fmt = iris_vdec_formats;
> +	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> +	unsigned int i;

Slightly neater as a reverse christmas tree.

> +
> +	for (i = 0; i < size; i++) {
> +		if (fmt[i].pixfmt == pixfmt)
> +			break;
> +	}
> +
> +	if (i == size || fmt[i].type != type)
> +		return NULL;
> +
> +	return &fmt[i];
> +}
> +
> +static const struct iris_fmt *
> +find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
> +{
> +	const struct iris_fmt *fmt = iris_vdec_formats;
> +	unsigned int size = ARRAY_SIZE(iris_vdec_formats);
> +
> +	if (index >= size || fmt[index].type != type)
> +		return NULL;
> +
> +	return &fmt[index];
> +}
> +
>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f)
>   {
> +	const struct iris_fmt *fmt;
> +
>   	switch (f->type) {
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		f->pixelformat = V4L2_PIX_FMT_H264;
> +		fmt = find_format_by_index(inst, f->index, f->type);
> +		if (!fmt)
> +			return -EINVAL;
> +
> +		f->pixelformat = fmt->pixfmt;
>   		f->flags = V4L2_FMT_FLAG_COMPRESSED | V4L2_FMT_FLAG_DYN_RESOLUTION;
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +		if (f->index)
> +			return -EINVAL;
>   		f->pixelformat = V4L2_PIX_FMT_NV12;
>   		break;
>   	default:
> @@ -88,13 +142,15 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   {
>   	struct v4l2_pix_format_mplane *pixmp = &f->fmt.pix_mp;
>   	struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
> +	const struct iris_fmt *fmt;
>   	struct v4l2_format *f_inst;
>   	struct vb2_queue *src_q;
>   
>   	memset(pixmp->reserved, 0, sizeof(pixmp->reserved));
> +	fmt = find_format(inst, pixmp->pixelformat, f->type);
>   	switch (f->type) {
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264) {
> +		if (!fmt) {
>   			f_inst = inst->fmt_src;
>   			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
>   			f->fmt.pix_mp.height = f_inst->fmt.pix_mp.height;
> @@ -102,7 +158,7 @@ int iris_vdec_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   		}
>   		break;
>   	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_NV12) {
> +		if (!fmt) {
>   			f_inst = inst->fmt_dst;
>   			f->fmt.pix_mp.pixelformat = f_inst->fmt.pix_mp.pixelformat;
>   			f->fmt.pix_mp.width = f_inst->fmt.pix_mp.width;
> @@ -145,13 +201,14 @@ int iris_vdec_s_fmt(struct iris_inst *inst, struct v4l2_format *f)
>   
>   	switch (f->type) {
>   	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		if (f->fmt.pix_mp.pixelformat != V4L2_PIX_FMT_H264)
> +		if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
>   			return -EINVAL;
>   
>   		fmt = inst->fmt_src;
>   		fmt->type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
> -
> -		codec_align = DEFAULT_CODEC_ALIGNMENT;
> +		fmt->fmt.pix_mp.pixelformat = f->fmt.pix_mp.pixelformat;
> +		inst->codec = fmt->fmt.pix_mp.pixelformat;
> +		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;

For preference I'd choose a default assignment and then an if for 
whatever you choose as non-default.

codec_align = 16;
if (inst->codec == V4L2_PIX_FMT_HEVC)
	codec_align = 32;

>   		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
>   		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
>   		fmt->fmt.pix_mp.num_planes = 1;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.h b/drivers/media/platform/qcom/iris/iris_vdec.h
> index b24932dc511a..cd7aab66dc7c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.h
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.h
> @@ -8,6 +8,17 @@
>   
>   struct iris_inst;
>   
> +enum iris_fmt_type {
> +	IRIS_FMT_H264,

I persoanlly like to init enums = 0,


> +	IRIS_FMT_HEVC,
> +	IRIS_FMT_VP9,
> +};
> +
> +struct iris_fmt {
> +	u32 pixfmt;
> +	u32 type;
> +};
> +
>   int iris_vdec_inst_init(struct iris_inst *inst);
>   void iris_vdec_inst_deinit(struct iris_inst *inst);
>   int iris_vdec_enum_fmt(struct iris_inst *inst, struct v4l2_fmtdesc *f);
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index ca0f4e310f77..6a6afa15b647 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -249,9 +249,6 @@ static int iris_enum_fmt(struct file *filp, void *fh, struct v4l2_fmtdesc *f)
>   {
>   	struct iris_inst *inst = iris_get_inst(filp, NULL);
>   
> -	if (f->index)
> -		return -EINVAL;
> -
>   	return iris_vdec_enum_fmt(inst, f);
>   }
>   

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

