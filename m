Return-Path: <linux-arm-msm+bounces-81571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8B7C56B52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD8BD3BADC8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2C22FDC30;
	Thu, 13 Nov 2025 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbAGd2Rl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A292D7DC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763027415; cv=none; b=WYRC5vhN4E5rSZOoJJT18yd3XSRhTdnBQKyc5D3+7MtXAOGyeGPH4vyT7L0I3gfiltN3sJNUEv5inxUlU9xh2rPBtB8hdl5KarHxKB/Mcp5CqsWif6ehG26MqNDjjI52S8oI7+IMvCk8VnSlXMcTkMx5l9hiqCkB94zWYddT4QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763027415; c=relaxed/simple;
	bh=XpBw9jNdihDIQ+USWx2ZINXrg3bak+lbfxXKptjyquk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMSRR2V62TQSigme3yC4Aug0Co6fhA5vlVQqIGq/TL91w/gPXmNGFwl84SHOa0uEWmau1Nlha40exFoEFYUFlpQ2iEYKe/3uDQcyCQrJe/jADRhLobreH0P8OaYOYxU2/Q7zcWgZX6VU6AABv/PzZtzerBxAlKAM94HGNR/4DyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbAGd2Rl; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4710a1f9e4cso4487795e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 01:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763027410; x=1763632210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QTjxXNOoSuI+2dGtGVFoKKzr99l+pBctFnCDAf+KgU=;
        b=VbAGd2Rlt432SioPtslSKXqrKQUN/+yGi+VrznRgkDGkaW+qoBkvYFAXLwScGF7P8B
         5kt1mZIiuhpRQqQld8TFnnGnAwOP7oWZ/9ARHcA1Jh6MnpXhEe2hCGmKSGvgtGbSWe6F
         DdFpcAL/rDHwcMglniWa55IrmPF4nvRy+cNSJbi/6tRvdLL6g8UvfhNjMcO3RWGhgCCQ
         gZ1WcsqaI2CPWzXFuUK/J48Qx72SQn8JmzKDSgOQgiQ7QMYSCeBd2TkgbHsPMgXgLGS/
         ekQFxzV45iWhWsVrXjl0uGTvpggJjk2AJGXl3NQgS5d1/FvAny/Dyn1o9Kc6anf10pmO
         pusg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763027410; x=1763632210;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2QTjxXNOoSuI+2dGtGVFoKKzr99l+pBctFnCDAf+KgU=;
        b=l0v7Lc3PggicsUn+e7OpD8OmGvG9RU2azxzhyh1BTfe/Mvy0T4cWJmkit+yzYxe5Lt
         O3hZZeKYyBRZ8T9cSERFb3qKpq7mi0ab/lHYRZ4hAZDllqJzAfBGIZSWMl+AWWYqbC8N
         zGuYoaD5j9U1CKvCZuIozQhAYB3HwZ5UtC7j8GaJvUNv+LLFYEIzT60VGz5yrt1cSazS
         d2Oq17OEHW9ZPqWoBDn8fbFlEDHTAnJ/10g3OEZ3ITWOZbWxz27rsw/7ToTjqpDPJjno
         a6MBHJdPZRT3ToOt2ZSVm6blIikiOolSMulh3m6uELPUfNA/8o/YP4835zNV2PGozQbq
         di9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUeMtMAu1FLLyTIZdiIIpjTLxqc65pmDHVXqNX+A/jIODesa8zh18wnnnFgKFsW0b/biwYfnqdDdmqGlQcH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4zZiqkuzkTHAgd5e4DDUElD5/9KDI69Oq8L+S8vkt9HPczCul
	RQ2kRNQxVTAUp2dJIudnM7PEY2Wucs7uUCUYEEKaLvt8Krx8xkJ7ks3Wr0Zu7eb6vSI=
X-Gm-Gg: ASbGncur57ta2mpWa0Yn57A9owPBgDmzBy5b1mK+9Rt2vcXwS46Xz8uP3OVH6ZqdAN+
	JBgay+blewIqCRsks4HvhWzhbGxXANTwbpEW9KTbtTTh/z4GpWPCuxOc3Z1wh6yM+ArBtJ5oIGE
	bLqU0YvimEHdl6QR32iHLlRgw9OzdERkAM0aIn9l0NNvoT5IkeCzanzdU6sW7zbjdiIewRyL23S
	n0pZjLQ/fTQYYBNM2o3QQGRO9Hg5vYDBujuG4TNGXqDue6wu9dQ9+nmKJvCA9Wwo5FAi7A4AL8d
	iPQQJc1NzjT9j1Xv1HHa8kImNh343Rdjyh6nsuseJgs64DE5/KxCXXUrercVwnzuAYr+45gUXzO
	PAn6xYUq71u2wCjfET2f/ye57TsemREgDaNsCGKx25MGmjoXTOHln+HspV2DyNa3/7HJiOwnsPa
	d4MHV3ndbyug7lHo2xAtB5ojpKbf1R0lOP86qdPIaF5ja8GpDZVaBs
X-Google-Smtp-Source: AGHT+IHoIg7Efgxy6dw+w+8oXHxjzD+pmw7q6YswFEs7wPLTvdZP4dszLcwCRxeAHF9fQzgBhCOi9A==
X-Received: by 2002:a05:600c:4695:b0:471:c72:c7f8 with SMTP id 5b1f17b1804b1-477870858b6mr59904005e9.21.1763027409874;
        Thu, 13 Nov 2025 01:50:09 -0800 (PST)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e798sm77714465e9.10.2025.11.13.01.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:50:09 -0800 (PST)
Message-ID: <e043ca0b-aeb1-4343-aa53-895e7c1992c4@linaro.org>
Date: Thu, 13 Nov 2025 09:50:07 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] media: qcom: iris: Add scale support for encoder
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 quic_qiweil@quicinc.com, quic_renjiang@quicinc.com
References: <20251110-iris_encoder_enhancements-v5-0-1dbb19968bd5@oss.qualcomm.com>
 <HaNbXZ7myaf8gi5D0BP71ZDWX9lWp7A-KDu3_afxIoadFrHH7UIQIe__QGQbeUgeUUysuUHpldVtEdpFOTZnrA==@protonmail.internalid>
 <20251110-iris_encoder_enhancements-v5-3-1dbb19968bd5@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251110-iris_encoder_enhancements-v5-3-1dbb19968bd5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2025 10:23, Wangao Wang wrote:
> Add members enc_scale_width, enc_scale_height to the struct iris_inst to
> support scale requirements.
> 
> Add output width and height settings in iris_venc_s_fmt_output to
> enable scaling functionality.
> 
> Add VPSS buffer to platform data, which the scale function requires.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_hfi_gen2_command.c     | 12 +++++------
>   .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 ++
>   drivers/media/platform/qcom/iris/iris_instance.h   |  4 ++++
>   .../media/platform/qcom/iris/iris_platform_gen2.c  | 12 +++++++++++
>   drivers/media/platform/qcom/iris/iris_venc.c       | 23 +++++++++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  9 +++++----
>   6 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> index 30c0cbe22d1d34b5bbbc6bdbd3881dd43a6ff647..8945e94ec9e87750fc87bebf63f4fbb634d8571a 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
> @@ -194,8 +194,8 @@ static int iris_hfi_gen2_set_bitstream_resolution(struct iris_inst *inst, u32 pl
>   		payload_type = HFI_PAYLOAD_U32;
>   	} else {
>   		codec_align = inst->codec == V4L2_PIX_FMT_HEVC ? 32 : 16;
> -		resolution = ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) << 16 |
> -			ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align);
> +		resolution = ALIGN(inst->enc_scale_width, codec_align) << 16 |
> +			ALIGN(inst->enc_scale_height, codec_align);
>   		inst_hfi_gen2->dst_subcr_params.bitstream_resolution = resolution;
>   		payload_type = HFI_PAYLOAD_32_PACKED;
>   	}
> @@ -237,10 +237,10 @@ static int iris_hfi_gen2_set_crop_offsets(struct iris_inst *inst, u32 plane)
>   			left_offset = inst->crop.left;
>   			top_offset = inst->crop.top;
>   		} else {
> -			bottom_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.height, codec_align) -
> -					inst->fmt_dst->fmt.pix_mp.height);
> -			right_offset = (ALIGN(inst->fmt_dst->fmt.pix_mp.width, codec_align) -
> -					inst->fmt_dst->fmt.pix_mp.width);
> +			bottom_offset = (ALIGN(inst->enc_scale_height, codec_align) -
> +					inst->enc_scale_height);
> +			right_offset = (ALIGN(inst->enc_scale_width, codec_align) -
> +				       inst->enc_scale_width);
>   			left_offset = 0;
>   			top_offset = 0;
>   		}
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> index 2f1f118eae4f6462ab1aa1d16844b34e6e699f1e..dc3e606b6ab429a1d15536fa8316afb1e384d674 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
> @@ -54,6 +54,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
>   			return BUF_SCRATCH_2;
>   	case HFI_BUFFER_PERSIST:
>   		return BUF_PERSIST;
> +	case HFI_BUFFER_VPSS:
> +		return BUF_VPSS;
>   	default:
>   		return 0;
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index a9892988c10bc28e9b2d8c3b5482e99b5b9af623..0b36092fe4e7296da2f66aecf9083f7f1edc5459 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -66,6 +66,8 @@ struct iris_fmt {
>    * @hfi_rc_type: rate control type
>    * @enc_raw_width: source image width for encoder instance
>    * @enc_raw_height: source image height for encoder instance
> + * @enc_scale_width: scale width for encoder instance
> + * @enc_scale_height: scale height for encoder instance
>    */
> 
>   struct iris_inst {
> @@ -106,6 +108,8 @@ struct iris_inst {
>   	u32				hfi_rc_type;
>   	u32				enc_raw_width;
>   	u32				enc_raw_height;
> +	u32				enc_scale_width;
> +	u32				enc_scale_height;
>   };
> 
>   #endif
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..d3306189d902a1f42666010468c9e4e4316a66e1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -729,6 +729,10 @@ static const u32 sm8550_dec_op_int_buf_tbl[] = {
>   	BUF_DPB,
>   };
> 
> +static const u32 sm8550_enc_ip_int_buf_tbl[] = {
> +	BUF_VPSS,
> +};
> +
>   static const u32 sm8550_enc_op_int_buf_tbl[] = {
>   	BUF_BIN,
>   	BUF_COMV,
> @@ -816,6 +820,8 @@ struct iris_platform_data sm8550_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> 
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> @@ -908,6 +914,8 @@ struct iris_platform_data sm8650_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> 
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> @@ -989,6 +997,8 @@ struct iris_platform_data sm8750_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> 
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> @@ -1077,6 +1087,8 @@ struct iris_platform_data qcs8300_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> 
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
>   	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 7ad747d2272f029e69a56572a188a032f898a3fb..f573408a3fc66e1bbc7814a8fc7953158e043fce 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -70,6 +70,8 @@ int iris_venc_inst_init(struct iris_inst *inst)
> 
>   	inst->enc_raw_width = DEFAULT_WIDTH;
>   	inst->enc_raw_height = DEFAULT_HEIGHT;
> +	inst->enc_scale_width = DEFAULT_WIDTH;
> +	inst->enc_scale_height = DEFAULT_HEIGHT;
> 
>   	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
>   	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> @@ -188,15 +190,32 @@ int iris_venc_try_fmt(struct iris_inst *inst, struct v4l2_format *f)
> 
>   static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
>   {
> +	const struct iris_fmt *venc_fmt;
>   	struct v4l2_format *fmt;
> +	u32 codec_align;
> 
>   	iris_venc_try_fmt(inst, f);
> 
> -	if (!(find_format(inst, f->fmt.pix_mp.pixelformat, f->type)))
> +	venc_fmt = find_format(inst, f->fmt.pix_mp.pixelformat, f->type);
> +	if (!venc_fmt)
>   		return -EINVAL;
> 
> +	codec_align = venc_fmt->pixfmt == V4L2_PIX_FMT_HEVC ? 32 : 16;
> +
>   	fmt = inst->fmt_dst;
>   	fmt->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
> +	/*
> +	 * If output format size != input format size,
> +	 * it is considered a scaling case,
> +	 * and the scaled size needs to be saved.
> +	 */
> +	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
> +	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
> +		inst->enc_scale_width = f->fmt.pix_mp.width;
> +		inst->enc_scale_height = f->fmt.pix_mp.height;
> +		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> +		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
> +	}
>   	fmt->fmt.pix_mp.num_planes = 1;
>   	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>   	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
> @@ -254,6 +273,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
> 
>   	inst->enc_raw_width = f->fmt.pix_mp.width;
>   	inst->enc_raw_height = f->fmt.pix_mp.height;
> +	inst->enc_scale_width = f->fmt.pix_mp.width;
> +	inst->enc_scale_height = f->fmt.pix_mp.height;
> 
>   	if (f->fmt.pix_mp.width != inst->crop.width ||
>   	    f->fmt.pix_mp.height != inst->crop.height) {
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> index 4463be05ce165adef6b152eb0c155d2e6a7b3c36..db5adadd1b39c06bc41ae6f1b3d2f924b3ebf150 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_buffer.c
> @@ -1131,10 +1131,11 @@ static u32 iris_vpu_enc_arp_size(struct iris_inst *inst)
> 
>   inline bool is_scaling_enabled(struct iris_inst *inst)
>   {
> -	return inst->crop.left != inst->compose.left ||
> -		inst->crop.top != inst->compose.top ||
> -		inst->crop.width != inst->compose.width ||
> -		inst->crop.height != inst->compose.height;
> +	struct v4l2_pix_format_mplane *dst_fmt = &inst->fmt_dst->fmt.pix_mp;
> +	struct v4l2_pix_format_mplane *src_fmt = &inst->fmt_src->fmt.pix_mp;
> +
> +	return dst_fmt->width != src_fmt->width ||
> +		dst_fmt->height != src_fmt->height;
>   }
> 
>   static inline
> 
> --
> 2.43.0
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

