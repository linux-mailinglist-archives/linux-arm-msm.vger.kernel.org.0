Return-Path: <linux-arm-msm+bounces-56490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6570EAA7158
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 14:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C88F17A9E2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 12:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF76253326;
	Fri,  2 May 2025 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WZQNp1mr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4196724C083
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 12:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746188088; cv=none; b=U7wxaMtyKf3cxe0RmIwIpy8pesaCVOQXKgLCaR0y29JWD80zJH6wnW/NEHtcsFV1E6ximsVAPK3cl5OGk+2raIsqGfAHCXE9ewLGJ/G7Riaqgjphc1TEXM+DMS692LC2/a/hcw78yMcoSvUkS44+9p09I0nUcJAMnwWUCt+8DRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746188088; c=relaxed/simple;
	bh=HZYmVYIn1/rBiM7syr+wRrAG9d066stiloGUYRn7DDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eep4ox4+SZbmMUNokKjsBvKrow+CPgT7HWHaDEkPP2KfJCQX9SWXqs0xW/luzDGe6OVW1yBEj9wKVWUbXNxsS6QpVo9IHFNliqYpBgodyV1KZQAlmS+Prl3Pw3bwq88oCNJPggDODhyfG4s29UBZs1ymMCw/GEch5UkmFDrkW8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WZQNp1mr; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so2120819f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 05:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746188083; x=1746792883; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9/dhZTszQP4J3gm1E4yy+01r7zQbwLu4nWEf7PFly8=;
        b=WZQNp1mr8VC7MDAVTJWgK3J79P1rB9OuidbLm13wiX+ZprrZ0qfaCBaVah0JL5k10F
         rWVFknUMZBdkp60A7oQYetfFl1iCKwY2GDrDtFpvL5zCQQ/v59A3/G4xA4o0gIcQtmT3
         DlF5wbKHqCKcSBIkVpL/xWTSuAbeGUJUYokbRT9ZO2xuQDx7xiQCciPATb7kYYlPCg2g
         YddMUeQIVD9PuDpZsXZUbGP5LgBMYf01DL6b6X8Ekj69Y4fL9uh7yxmOsUYXdImkDsUd
         oDeiqN9ARfHUR4JJUAVM91paMD1xXTjXvH19Z+TUkLB2QsjgTFX4AEl1C9T0wV0h6Qcr
         8yUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188083; x=1746792883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9/dhZTszQP4J3gm1E4yy+01r7zQbwLu4nWEf7PFly8=;
        b=Ccf2VkXvDkIrZSyTpBpj55U8krOoc5YGaxJPM0DxNHWYrlWuJblek0BwLlUJWSOHgp
         uFQAzE+kDR4Y9Isq75GZldiIz0dyczJAAPNMwTF8k6eBgedzmeOB5R/wHk1JMj9eqrc/
         ro5WHSyR29JtuU3fi7ieNaV83zAM72a7lFP2dq7WUZd5UKYhjaruCinl9t1ALPkXWIzG
         HDlXvZwfx1VtL6jPv4pPS95crxs68T1PQwKtr9HYitmI/9o4AY7uwBCE3qKfUEwYcEiz
         fuv7nYfxrFftnivzhdEAbyQANslMfr9ZMlTNOEz0EM34FD13Ceu//BTfITSfhF52OGrA
         FtSw==
X-Forwarded-Encrypted: i=1; AJvYcCV6fD040y1KutpfDFocq2Cvvy6NcORHY/z7mvKfYgJBNiP387ML03riJgjzt04LJy4qZiXyvUXHkBocLvg2@vger.kernel.org
X-Gm-Message-State: AOJu0YzaUKlIggoFHReDD8PXX0xxKKdBgWAvKLB8kk5RmxrjXwGzaLtj
	rWIbTAQqmjgLUYyOxIkjjW8zv1386C+AXEq9GgIWrxjX1JOyjLUn2xQ2RUAjkCs=
X-Gm-Gg: ASbGnct7GgxWFHgym6e+YPDgOh1/Hno8NErDix8Yjm2zMrSCa5xftyBb14ymsQiIqaq
	Sox7fJ9gBpUT4z2Wj+4U8/7HRv2HMf2EwDii84YMfzzeeAoBI4vpK/e/HvYB28vgSiw+5pm/Qcp
	/my5dcTGC55Jzz3pOHcWJ2vgqSdhjy4PdgvaRdLxlpE/4DYIqbkTkt2sIFZTQUewy8uNaDEcy5F
	CHkIuKnG6re79eFpRzMiwTDBeTLYvzHrp+4yw5dU3e6BrOomrZZZtfoPK+Yw4Rkm6UquxUdW1ze
	c8hZ75VsRTVr7ZzGx75tqjendXZO5FP5ZtjJWd2Tdq5X7TI/Cb8F5ZEmshqk+hMeaMf/LIC4Z6b
	01+dAbA==
X-Google-Smtp-Source: AGHT+IEmgqcEFRtHrXSw4fQDalGgiK4l0caLdup6FQi2z7S6MyjWPzeXMWBgDXMYxCLrm+F9zlpjxA==
X-Received: by 2002:a05:6000:2dc3:b0:391:3d12:9afa with SMTP id ffacd0b85a97d-3a099ad9754mr1845534f8f.21.1746188083483;
        Fri, 02 May 2025 05:14:43 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3ccdsm2029587f8f.38.2025.05.02.05.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 05:14:42 -0700 (PDT)
Message-ID: <8e0bc60a-35fe-4a78-a710-3642842fa5f5@linaro.org>
Date: Fri, 2 May 2025 13:14:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] media: iris: Skip destroying internal buffer if
 not dequeued
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 20250417-topic-sm8x50-iris-v10-v7-0-f020cb1d0e98@linaro.org,
 20250424-qcs8300_iris-v5-0-f118f505c300@quicinc.com, stable@vger.kernel.org
References: <20250502-qcom-iris-hevc-vp9-v3-0-552158a10a7d@quicinc.com>
 <20250502-qcom-iris-hevc-vp9-v3-1-552158a10a7d@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250502-qcom-iris-hevc-vp9-v3-1-552158a10a7d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/05/2025 20:13, Dikshita Agarwal wrote:
> Firmware might hold the DPB buffers for reference in case of sequence
> change, so skip destroying buffers for which QUEUED flag is not removed.
> Also, make sure that all buffers are released during streamoff.
> 
> Cc: stable@vger.kernel.org
> Fixes: 73702f45db81 ("media: iris: allocate, initialize and queue internal buffers")
> Reviewed-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
> ---
>   drivers/media/platform/qcom/iris/iris_buffer.c | 20 +++++++++++++++-
>   drivers/media/platform/qcom/iris/iris_buffer.h |  3 ++-
>   drivers/media/platform/qcom/iris/iris_vdec.c   |  4 ++--
>   drivers/media/platform/qcom/iris/iris_vidc.c   | 33 ++++++++++++++++++++++++--
>   4 files changed, 54 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> index e5c5a564fcb8..981fedb000ed 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> @@ -376,7 +376,7 @@ int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buf
>   	return 0;
>   }
>   
> -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
> +static int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane, bool force)
>   {
>   	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
>   	struct iris_buffer *buf, *next;
> @@ -396,6 +396,14 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>   	for (i = 0; i < len; i++) {
>   		buffers = &inst->buffers[internal_buf_type[i]];
>   		list_for_each_entry_safe(buf, next, &buffers->list, list) {
> +			/*
> +			 * during stream on, skip destroying internal(DPB) buffer
> +			 * if firmware did not return it.
> +			 * during close, destroy all buffers irrespectively.
> +			 */
> +			if (!force && buf->attr & BUF_ATTR_QUEUED)
> +				continue;
> +
>   			ret = iris_destroy_internal_buffer(inst, buf);
>   			if (ret)
>   				return ret;
> @@ -405,6 +413,16 @@ int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane)
>   	return 0;
>   }
>   
> +int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane)
> +{
> +	return iris_destroy_internal_buffers(inst, plane, true);
> +}
> +
> +int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
> +{
> +	return iris_destroy_internal_buffers(inst, plane, false);
> +}
> +
>   static int iris_release_internal_buffers(struct iris_inst *inst,
>   					 enum iris_buffer_type buffer_type)
>   {
> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
> index c36b6347b077..00825ad2dc3a 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.h
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.h
> @@ -106,7 +106,8 @@ void iris_get_internal_buffers(struct iris_inst *inst, u32 plane);
>   int iris_create_internal_buffers(struct iris_inst *inst, u32 plane);
>   int iris_queue_internal_buffers(struct iris_inst *inst, u32 plane);
>   int iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_buffer *buffer);
> -int iris_destroy_internal_buffers(struct iris_inst *inst, u32 plane);
> +int iris_destroy_all_internal_buffers(struct iris_inst *inst, u32 plane);
> +int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane);
>   int iris_alloc_and_queue_persist_bufs(struct iris_inst *inst);
>   int iris_alloc_and_queue_input_int_bufs(struct iris_inst *inst);
>   int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 4143acedfc57..9c049b9671cc 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -408,7 +408,7 @@ int iris_vdec_streamon_input(struct iris_inst *inst)
>   
>   	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>   
> -	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	ret = iris_destroy_dequeued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
>   	if (ret)
>   		return ret;
>   
> @@ -496,7 +496,7 @@ int iris_vdec_streamon_output(struct iris_inst *inst)
>   
>   	iris_get_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>   
> -	ret = iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	ret = iris_destroy_dequeued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>   	if (ret)
>   		return ret;
>   
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index ca0f4e310f77..a8144595cc78 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -221,6 +221,33 @@ static void iris_session_close(struct iris_inst *inst)
>   		iris_wait_for_session_response(inst, false);
>   }
>   
> +static void iris_check_num_queued_internal_buffers(struct iris_inst *inst, u32 plane)
> +{
> +	const struct iris_platform_data *platform_data = inst->core->iris_platform_data;
> +	struct iris_buffer *buf, *next;
> +	struct iris_buffers *buffers;
> +	const u32 *internal_buf_type;
> +	u32 internal_buffer_count, i;
> +	u32 count = 0;
> +
> +	if (V4L2_TYPE_IS_OUTPUT(plane)) {
> +		internal_buf_type = platform_data->dec_ip_int_buf_tbl;
> +		internal_buffer_count = platform_data->dec_ip_int_buf_tbl_size;
> +	} else {
> +		internal_buf_type = platform_data->dec_op_int_buf_tbl;
> +		internal_buffer_count = platform_data->dec_op_int_buf_tbl_size;
> +	}
> +
> +	for (i = 0; i < internal_buffer_count; i++) {
> +		buffers = &inst->buffers[internal_buf_type[i]];
> +		list_for_each_entry_safe(buf, next, &buffers->list, list)
> +			count++;
> +		if (count)
> +			dev_err(inst->core->dev, "%d buffer of type %d not released",
> +				count, internal_buf_type[i]);
> +	}
> +}
> +
>   int iris_close(struct file *filp)
>   {
>   	struct iris_inst *inst = iris_get_inst(filp, NULL);
> @@ -233,8 +260,10 @@ int iris_close(struct file *filp)
>   	iris_session_close(inst);
>   	iris_inst_change_state(inst, IRIS_INST_DEINIT);
>   	iris_v4l2_fh_deinit(inst);
> -	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> -	iris_destroy_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>   	iris_remove_session(inst);
>   	mutex_unlock(&inst->lock);
>   	mutex_destroy(&inst->ctx_q_lock);
> 

I left some comments in the previous cycle

https://lore.kernel.org/linux-arm-msm/a056266e-612d-4abf-916f-3db49b00dbde@linaro.org

I don't see those addressed in this cycle. Can you give some feedback 
from your POV.

---
bod

