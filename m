Return-Path: <linux-arm-msm+bounces-76502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5EBC6F12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Oct 2025 01:48:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26FF1401F3B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 23:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D2C82C3769;
	Wed,  8 Oct 2025 23:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EKdXmlgU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FFB259C80
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 23:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759967288; cv=none; b=CsODXgBPRmGTr0W7x9yqmi4MhaACyVNbknKxaCgrhAV9XdhPikJ+6FdqfiXd2z17+8L3NGtHkvegqLAao8BhuQc/a0eppbjL8Bwh753xIyn8b2w3XxbUhT9KNULzZE7V3RSy1qZUZp53OIihRsBPLbmu8LnNpOW+o75aK3sD/tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759967288; c=relaxed/simple;
	bh=8ZTU7ZI4dOQz+oWLWUmekV68DhahEks06RCGsIgh8c0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCj7PrZGQgtu+F8HpIKOP4gz8WAAujjg4EWAAcJ5wmFRd3BSZHtjitFybO0j+8ekL7X3MKh7S5ZLStUk634eVDBIYmnvsMXhegFdkTRAQr7WtEoNgh4Y/w6AT/ZfmgibV/CqayMOd/25V6j5ITk3rbBZXKuRniG4nX1dTi6IhJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EKdXmlgU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3c68ac7e18aso313058f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 16:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759967284; x=1760572084; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tfHx0KfaapEjiwM0tW/YvvhxPGY3AJttLQVN9hlDJ6Y=;
        b=EKdXmlgUSGAwcnI9H3URtsGBW6A/eS668ZAQ+bPEtgG03sExA5mx9f8R/dwlIQP2GQ
         R+Sqa0UR37CbtHZAxakCjyEFPCRPF42snlhMDAXBr6XR4Q34lhL+nT5AYeeNkwi5otMS
         fOoBKsmDnvtpIYKrfwIMob++4PngWB/xuaiE8Cci45fvf02jMaPKTmFy4iCYv5uYliVd
         YlIKf3zqO5/P6fF5mNQKu5DV69IF0dZBKzjGXiijHojGbj7x+FXcUKIPM/BMRDSPpR0n
         OHizspKHWtQl5ohymuoKAvT70c98DDimZfI1HzJp/trVvMEEGFa8egEjMnUuBONGFakv
         Ct5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759967284; x=1760572084;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tfHx0KfaapEjiwM0tW/YvvhxPGY3AJttLQVN9hlDJ6Y=;
        b=SuhnhuPVtno2lRQ3GOrSS/bRlo5vy/5VJkq6NNlOZMODKYfOmapVVtpsUuzk7qxlS0
         LH7UGAPeqkcbvySskkhRAJT3gHnyEHHXdK28TTUol70jS4aZY8KHDoUt9a35sjPeTh1d
         doHKYzUDTNuQK5XX0foVHFmZQRRVWkGS1xOGL+VoUo6rIIjqySGDOfTCEbtddmQJimlV
         MPz0QAnB7KHLadCqA3IWQbDWP6w84FPri08RknIymaH8ptUgGa+iOTSJe7qcaGfSUOJy
         yqJnwdKytQ0KtrVBPPTx9vXSRnMJ1hYmN7zEhGDt6VLsBQuKODrIlRJf3fspDGHu+iHz
         hSIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGc3fSLmuLvjmTwxtlQVHw6BKLCofafVmIIUq799RRYivI0csDS5hkAReaJjmqJSrdANJ6CLY4asxEhCTV@vger.kernel.org
X-Gm-Message-State: AOJu0YxOjyPMg3EjvSdLVG/VjFSLqHA4jyyICu2Q0GKkAH3R673j5Jqt
	cOJy4ARBlDT/mB/WuKGZvq2VyqmjJJ+qnvDHsPpICnxiC86loSe/HgzaRiK3sU6A7GU=
X-Gm-Gg: ASbGncvvyBY3QDmFh7HW4SM00egJRKQww+gcCKWJi2zCmt/IUpJmGY/2ZgaRttePV3K
	bTID18l8Vr+1qKiV4CH7BsN0nsMhOrpliU7VMXliXDqiDroMfrJBO18zruiOtex09ul01W2ISqv
	GWj8edf9tH+001gNyHqATJ2f6s8dRJgF5ypy43s04Lpt0Ge4+sf+HtzDN0O2ZMpw02GDwPcH+u/
	+0OAJE7C8Oxy6IsvdHSd25jHiMs+XleXN1AdoHYTq9j7NDir+SfS47ZoiAt0q6FANC8E9oMGMdz
	ieTdruKAp+EuSpK3Abr8e0io+1HvyUeeaOcqVTSL6Oxaf/Gt8+tvDipgCzivEt6HRgJPe4fugLt
	V073GUkuLua1DA0/WZGdb7+QYUUqAge97hp2CMIXSbXk0dvkfVYHUPnQbzWIvASt/gR54vIenSf
	tz35ahamM54S6ghv9d
X-Google-Smtp-Source: AGHT+IELSJRQI78RURkVWMFub+1nmQpBtlrGEe11X4pGowAAY1G6tWSvEw45NXJ4Bm06qoUBaF4PuQ==
X-Received: by 2002:a05:6000:1a87:b0:3ee:b126:6b6 with SMTP id ffacd0b85a97d-4266e7dfee2mr2929865f8f.34.1759967284039;
        Wed, 08 Oct 2025 16:48:04 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8f011bsm32442627f8f.46.2025.10.08.16.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 16:48:02 -0700 (PDT)
Message-ID: <b58f9dd3-6ace-474f-98ad-a5b9c5f0cf17@linaro.org>
Date: Thu, 9 Oct 2025 00:48:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] media: iris: stop copying r/o data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <MNE6-NWyEnaQyvn4In-jfg6F21lf0p0GgcEsRO6lM610hKJwSHgpSoefqJ7PROY_eWIuyd08U3G5bDI8ufq0aQ==@protonmail.internalid>
 <20251008-iris-sc7280-v1-3-def050ba5e1f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251008-iris-sc7280-v1-3-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2025 05:33, Dmitry Baryshkov wrote:
> Most of the platform_inst_caps data is read-only. In order to lower the
> amount of memory consumed by the driver, store the value and the
> corresponding indice in the read-write data and use the rest via the
> pointer to r/o capability data.

corresponding index

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.h       |   4 +-
>   drivers/media/platform/qcom/iris/iris_ctrls.c      | 238 ++++++++++-----------
>   drivers/media/platform/qcom/iris/iris_instance.h   |   3 +-
>   .../platform/qcom/iris/iris_platform_common.h      |   8 +-
>   drivers/media/platform/qcom/iris/iris_vdec.c       |   5 +-
>   drivers/media/platform/qcom/iris/iris_venc.c       |   5 +-
>   6 files changed, 135 insertions(+), 128 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
> index fb194c967ad4f9b5e00cd74f0d41e0b827ef14db..b5037ae8c71921753c165a86a277a4a4b5083b30 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.h
> +++ b/drivers/media/platform/qcom/iris/iris_core.h
> @@ -115,8 +115,8 @@ struct iris_core {
>   	struct delayed_work			sys_error_handler;
>   	struct list_head			instances;
>   	/* encoder and decoder have overlapping caps, so two different arrays are required */
> -	struct platform_inst_fw_cap		inst_fw_caps_dec[INST_FW_CAP_MAX];
> -	struct platform_inst_fw_cap		inst_fw_caps_enc[INST_FW_CAP_MAX];
> +	struct platform_inst_fw_cap_value	inst_fw_caps_dec[INST_FW_CAP_MAX];
> +	struct platform_inst_fw_cap_value	inst_fw_caps_enc[INST_FW_CAP_MAX];
>   };
> 
>   int iris_core_init(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce..0e9adb3982a49cfd7cbe5110cfd5f573f0f7bb38 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -194,26 +194,28 @@ static int iris_op_s_ctrl(struct v4l2_ctrl *ctrl)
>   {
>   	struct iris_inst *inst = container_of(ctrl->handler, struct iris_inst, ctrl_handler);
>   	enum platform_inst_fw_cap_type cap_id;
> -	struct platform_inst_fw_cap *cap;
> +	unsigned int cap_idx;
>   	struct vb2_queue *q;
> 
> -	cap = &inst->fw_caps[0];
>   	cap_id = iris_get_cap_id(ctrl->id);
>   	if (!iris_valid_cap_id(cap_id))
>   		return -EINVAL;
> 
> +	cap_idx = inst->fw_caps[cap_id].idx;
> +
>   	q = v4l2_m2m_get_src_vq(inst->m2m_ctx);
>   	if (vb2_is_streaming(q) &&
> -	    (!(inst->fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
> +	    (!(inst->inst_fw_caps[cap_id].flags & CAP_FLAG_DYNAMIC_ALLOWED)))
>   		return -EINVAL;
> 
> -	cap[cap_id].flags |= CAP_FLAG_CLIENT_SET;
> +	inst->fw_caps[cap_id].client_set = true;

Why drop just this one bit - CAP_FLAG_CLIENT_SET.

Code seems neater with that bit retained in fw_caps to me, you have 
fewer LOC changed that way too.

> 
>   	inst->fw_caps[cap_id].value = ctrl->val;
> 
>   	if (vb2_is_streaming(q)) {
> -		if (cap[cap_id].set)
> -			cap[cap_id].set(inst, cap_id);
> +
> +		if (inst->inst_fw_caps[cap_idx].set)
> +			inst->inst_fw_caps[cap_idx].set(inst, cap_id);
>   	}
> 
>   	return 0;
> @@ -225,13 +227,14 @@ static const struct v4l2_ctrl_ops iris_ctrl_ops = {
> 
>   int iris_ctrls_init(struct iris_inst *inst)
>   {
> -	struct platform_inst_fw_cap *cap = &inst->fw_caps[0];
>   	u32 num_ctrls = 0, ctrl_idx = 0, idx = 0;
>   	u32 v4l2_id;
>   	int ret;
> 
>   	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> -		if (iris_get_v4l2_id(cap[idx].cap_id))
> +		unsigned int cap_idx = inst->fw_caps[idx].idx;
> +
> +		if (iris_get_v4l2_id(inst->inst_fw_caps[cap_idx].cap_id))
>   			num_ctrls++;
>   	}
> 
> @@ -245,9 +248,11 @@ int iris_ctrls_init(struct iris_inst *inst)
>   		return ret;
> 
>   	for (idx = 1; idx < INST_FW_CAP_MAX; idx++) {
> +		unsigned int cap_idx = inst->fw_caps[idx].idx;
> +		const struct platform_inst_fw_cap *cap = &inst->inst_fw_caps[cap_idx];
>   		struct v4l2_ctrl *ctrl;
> 
> -		v4l2_id = iris_get_v4l2_id(cap[idx].cap_id);
> +		v4l2_id = iris_get_v4l2_id(cap->cap_id);
>   		if (!v4l2_id)
>   			continue;
> 
> @@ -256,21 +261,21 @@ int iris_ctrls_init(struct iris_inst *inst)
>   			goto error;
>   		}
> 
> -		if (cap[idx].flags & CAP_FLAG_MENU) {
> +		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_MENU) {
>   			ctrl = v4l2_ctrl_new_std_menu(&inst->ctrl_handler,
>   						      &iris_ctrl_ops,
>   						      v4l2_id,
> -						      cap[idx].max,
> -						      ~(cap[idx].step_or_mask),
> -						      cap[idx].value);
> +						      cap[cap_idx].max,
> +						      ~(cap[cap_idx].step_or_mask),
> +						      inst->fw_caps[idx].value);
>   		} else {
>   			ctrl = v4l2_ctrl_new_std(&inst->ctrl_handler,
>   						 &iris_ctrl_ops,
>   						 v4l2_id,
> -						 cap[idx].min,
> -						 cap[idx].max,
> -						 cap[idx].step_or_mask,
> -						 cap[idx].value);
> +						 cap[cap_idx].min,
> +						 cap[cap_idx].max,
> +						 cap[cap_idx].step_or_mask,
> +						 inst->fw_caps[idx].value);
>   		}
>   		if (!ctrl) {
>   			ret = -EINVAL;
> @@ -312,14 +317,8 @@ void iris_session_init_caps(struct iris_core *core)
>   		if (!iris_valid_cap_id(cap_id))
>   			continue;
> 
> -		core->inst_fw_caps_dec[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_dec[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_dec[cap_id].max = caps[i].max;
> -		core->inst_fw_caps_dec[cap_id].step_or_mask = caps[i].step_or_mask;
> +		core->inst_fw_caps_dec[cap_id].idx = i;
>   		core->inst_fw_caps_dec[cap_id].value = caps[i].value;
> -		core->inst_fw_caps_dec[cap_id].flags = caps[i].flags;
> -		core->inst_fw_caps_dec[cap_id].hfi_id = caps[i].hfi_id;
> -		core->inst_fw_caps_dec[cap_id].set = caps[i].set;
>   	}
> 
>   	caps = core->iris_platform_data->inst_fw_caps_enc;
> @@ -330,29 +329,23 @@ void iris_session_init_caps(struct iris_core *core)
>   		if (!iris_valid_cap_id(cap_id))
>   			continue;
> 
> -		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
> -		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
> -		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
> -		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
> +		core->inst_fw_caps_enc[cap_id].idx = i;
>   		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
> -		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
> -		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
> -		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
>   	}
>   }
> 
>   static u32 iris_get_port_info(struct iris_inst *inst,
> -			      enum platform_inst_fw_cap_type cap_id)
> +			      unsigned int cap_idx)
>   {
>   	if (inst->domain == DECODER) {
> -		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
> +		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_INPUT_PORT)
>   			return HFI_PORT_BITSTREAM;
> -		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
> +		else if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_OUTPUT_PORT)
>   			return HFI_PORT_RAW;
>   	} else {
> -		if (inst->fw_caps[cap_id].flags & CAP_FLAG_INPUT_PORT)
> +		if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_INPUT_PORT)
>   			return HFI_PORT_RAW;
> -		else if (inst->fw_caps[cap_id].flags & CAP_FLAG_OUTPUT_PORT)
> +		else if (inst->inst_fw_caps[cap_idx].flags & CAP_FLAG_OUTPUT_PORT)
>   			return HFI_PORT_BITSTREAM;
>   	}
> 
> @@ -362,12 +355,13 @@ static u32 iris_get_port_info(struct iris_inst *inst,
>   int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
>   	u32 hfi_value = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32_ENUM,
>   					     &hfi_value, sizeof(u32));
>   }
> @@ -375,12 +369,13 @@ int iris_set_u32_enum(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   int iris_set_u32(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
>   	u32 hfi_value = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32,
>   					     &hfi_value, sizeof(u32));
>   }
> @@ -389,7 +384,8 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	struct v4l2_format *inp_f = inst->fmt_src;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 height = inp_f->fmt.pix_mp.height;
>   	u32 width = inp_f->fmt.pix_mp.width;
>   	u32 work_mode = STAGE_2;
> @@ -401,7 +397,7 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32,
>   					     &work_mode, sizeof(u32));
>   }
> @@ -409,12 +405,13 @@ int iris_set_stage(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>   int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 work_route = inst->fw_caps[PIPE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32,
>   					     &work_route, sizeof(u32));
>   }
> @@ -422,19 +419,13 @@ int iris_set_pipe(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	u32 hfi_id, hfi_value;
> -
> -	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		hfi_id = inst->fw_caps[PROFILE_H264].hfi_id;
> -		hfi_value = inst->fw_caps[PROFILE_H264].value;
> -	} else {
> -		hfi_id = inst->fw_caps[PROFILE_HEVC].hfi_id;
> -		hfi_value = inst->fw_caps[PROFILE_HEVC].value;
> -	}
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> +	u32 hfi_value = inst->fw_caps[cap_id].value;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32_ENUM,
>   					     &hfi_value, sizeof(u32));
>   }
> @@ -442,19 +433,13 @@ int iris_set_profile(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>   int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	u32 hfi_id, hfi_value;
> -
> -	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		hfi_id = inst->fw_caps[LEVEL_H264].hfi_id;
> -		hfi_value = inst->fw_caps[LEVEL_H264].value;
> -	} else {
> -		hfi_id = inst->fw_caps[LEVEL_HEVC].hfi_id;
> -		hfi_value = inst->fw_caps[LEVEL_HEVC].value;
> -	}
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> +	u32 hfi_value = inst->fw_caps[cap_id].value;
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32_ENUM,
>   					     &hfi_value, sizeof(u32));
>   }
> @@ -462,20 +447,19 @@ int iris_set_level(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id
>   int iris_set_profile_level_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_id)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	struct hfi_profile_level pl;
> 
> -	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		pl.profile = inst->fw_caps[PROFILE_H264].value;
> +	pl.profile = inst->fw_caps[cap_id].value;
> +	if (inst->codec == V4L2_PIX_FMT_H264)
>   		pl.level = inst->fw_caps[LEVEL_H264].value;
> -	} else {
> -		pl.profile = inst->fw_caps[PROFILE_HEVC].value;
> +	else
>   		pl.level = inst->fw_caps[LEVEL_HEVC].value;
> -	}
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					     HFI_HOST_FLAGS_NONE,
> -					     iris_get_port_info(inst, cap_id),
> +					     iris_get_port_info(inst, cap_idx),
>   					     HFI_PAYLOAD_U32_ENUM,
>   					     &pl, sizeof(u32));
>   }
> @@ -484,7 +468,8 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 header_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
> @@ -494,7 +479,7 @@ int iris_set_header_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap_
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -504,7 +489,8 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 prepend_sps_pps = inst->fw_caps[PREPEND_SPSPPS_TO_IDR].value;
>   	u32 header_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (prepend_sps_pps)
> @@ -516,7 +502,7 @@ int iris_set_header_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap_
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32_ENUM,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -526,7 +512,8 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 entropy_mode = inst->fw_caps[ENTROPY_MODE].value;
>   	u32 bitrate = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 max_bitrate;
> 
>   	if (inst->codec == V4L2_PIX_FMT_HEVC)
> @@ -541,7 +528,7 @@ int iris_set_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &bitrate, sizeof(u32));
>   }
> @@ -552,12 +539,13 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
>   	u32 rc_mode = inst->fw_caps[BITRATE_MODE].value;
>   	u32 peak_bitrate = inst->fw_caps[cap_id].value;
>   	u32 bitrate = inst->fw_caps[BITRATE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> 
>   	if (rc_mode != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR)
>   		return 0;
> 
> -	if (inst->fw_caps[cap_id].flags & CAP_FLAG_CLIENT_SET) {
> +	if (inst->fw_caps[cap_id].client_set) {
>   		if (peak_bitrate < bitrate)
>   			peak_bitrate = bitrate;
>   	} else {
> @@ -568,7 +556,7 @@ int iris_set_peak_bitrate(struct iris_inst *inst, enum platform_inst_fw_cap_type
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &peak_bitrate, sizeof(u32));
>   }
> @@ -579,7 +567,8 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>   	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>   	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>   	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 rc_mode = 0;
> 
>   	if (!frame_rc)
> @@ -595,7 +584,7 @@ int iris_set_bitrate_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32_ENUM,
>   				     &rc_mode, sizeof(u32));
>   }
> @@ -606,7 +595,8 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>   	u32 bitrate_mode = inst->fw_caps[BITRATE_MODE].value;
>   	u32 frame_rc = inst->fw_caps[FRAME_RC_ENABLE].value;
>   	u32 frame_skip = inst->fw_caps[FRAME_SKIP_MODE].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 rc_mode = 0;
> 
>   	if (!frame_rc)
> @@ -622,7 +612,7 @@ int iris_set_bitrate_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32_ENUM,
>   				     &rc_mode, sizeof(u32));
>   }
> @@ -631,7 +621,8 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 entropy_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (inst->codec != V4L2_PIX_FMT_H264)
> @@ -642,7 +633,7 @@ int iris_set_entropy_mode_gen1(struct iris_inst *inst, enum platform_inst_fw_cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -651,7 +642,8 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 entropy_mode = inst->fw_caps[cap_id].value;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 profile;
> 
>   	if (inst->codec != V4L2_PIX_FMT_H264)
> @@ -667,7 +659,7 @@ int iris_set_entropy_mode_gen2(struct iris_inst *inst, enum platform_inst_fw_cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_U32,
>   				     &entropy_mode, sizeof(u32));
>   }
> @@ -678,32 +670,33 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>   	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>   	u32 i_frame_qp = 0, p_frame_qp = 0, b_frame_qp = 0;
>   	u32 min_qp_enable = 0, client_qp_enable = 0;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		if (inst->fw_caps[MIN_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MIN_FRAME_QP_H264].client_set)
>   			min_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MIN_QP_H264].client_set))
>   			i_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MIN_QP_H264].client_set))
>   			p_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MIN_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MIN_QP_H264].client_set))
>   			b_qp_enable = 1;
>   	} else {
> -		if (inst->fw_caps[MIN_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MIN_FRAME_QP_HEVC].client_set)
>   			min_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MIN_QP_HEVC].client_set))
>   			i_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MIN_QP_HEVC].client_set))
>   			p_qp_enable = 1;
>   		if (min_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MIN_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MIN_QP_HEVC].client_set))
>   			b_qp_enable = 1;
>   	}
> 
> @@ -731,7 +724,7 @@ int iris_set_min_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_32_PACKED,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -742,32 +735,33 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
>   	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0;
>   	u32 max_qp_enable = 0, client_qp_enable;
>   	u32 i_frame_qp, p_frame_qp, b_frame_qp;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	u32 hfi_val;
> 
>   	if (inst->codec == V4L2_PIX_FMT_H264) {
> -		if (inst->fw_caps[MAX_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MAX_FRAME_QP_H264].client_set)
>   			max_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MAX_QP_H264].client_set))
>   			i_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MAX_QP_H264].client_set))
>   			p_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MAX_QP_H264].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MAX_QP_H264].client_set))
>   			b_qp_enable = 1;
>   	} else {
> -		if (inst->fw_caps[MAX_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +		if (inst->fw_caps[MAX_FRAME_QP_HEVC].client_set)
>   			max_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[I_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[I_FRAME_MAX_QP_HEVC].client_set))
>   			i_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[P_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[P_FRAME_MAX_QP_HEVC].client_set))
>   			p_qp_enable = 1;
>   		if (max_qp_enable ||
> -		    (inst->fw_caps[B_FRAME_MAX_QP_HEVC].flags & CAP_FLAG_CLIENT_SET))
> +		    (inst->fw_caps[B_FRAME_MAX_QP_HEVC].client_set))
>   			b_qp_enable = 1;
>   	}
> 
> @@ -796,7 +790,7 @@ int iris_set_max_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap_i
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_32_PACKED,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -806,7 +800,8 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	u32 i_qp_enable = 0, p_qp_enable = 0, b_qp_enable = 0, client_qp_enable;
>   	u32 i_frame_qp, p_frame_qp, b_frame_qp;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
>   	struct vb2_queue *q;
>   	u32 hfi_val;
> 
> @@ -822,18 +817,18 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   		b_qp_enable = 1;
>   	} else {
>   		if (inst->codec == V4L2_PIX_FMT_H264) {
> -			if (inst->fw_caps[I_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[I_FRAME_QP_H264].client_set)
>   				i_qp_enable = 1;
> -			if (inst->fw_caps[P_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[P_FRAME_QP_H264].client_set)
>   				p_qp_enable = 1;
> -			if (inst->fw_caps[B_FRAME_QP_H264].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[B_FRAME_QP_H264].client_set)
>   				b_qp_enable = 1;
>   		} else {
> -			if (inst->fw_caps[I_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[I_FRAME_QP_HEVC].client_set)
>   				i_qp_enable = 1;
> -			if (inst->fw_caps[P_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[P_FRAME_QP_HEVC].client_set)
>   				p_qp_enable = 1;
> -			if (inst->fw_caps[B_FRAME_QP_HEVC].flags & CAP_FLAG_CLIENT_SET)
> +			if (inst->fw_caps[B_FRAME_QP_HEVC].client_set)
>   				b_qp_enable = 1;
>   		}
>   	}
> @@ -857,7 +852,7 @@ int iris_set_frame_qp(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_32_PACKED,
>   				     &hfi_val, sizeof(u32));
>   }
> @@ -866,7 +861,8 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
>   	struct hfi_quantization_range_v2 range;
> -	u32 hfi_id = inst->fw_caps[cap_id].hfi_id;
> +	unsigned int cap_idx = inst->fw_caps[cap_id].idx;
> +	u32 hfi_id = inst->inst_fw_caps[cap_idx].hfi_id;
> 
>   	if (inst->codec == V4L2_PIX_FMT_HEVC) {
>   		range.min_qp.qp_packed = inst->fw_caps[MIN_FRAME_QP_HEVC].value;
> @@ -878,7 +874,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
> 
>   	return hfi_ops->session_set_property(inst, hfi_id,
>   					 HFI_HOST_FLAGS_NONE,
> -				     iris_get_port_info(inst, cap_id),
> +				     iris_get_port_info(inst, cap_idx),
>   				     HFI_PAYLOAD_32_PACKED,
>   				     &range, sizeof(range));
>   }
> @@ -886,7 +882,7 @@ int iris_set_qp_range(struct iris_inst *inst, enum platform_inst_fw_cap_type cap
>   int iris_set_properties(struct iris_inst *inst, u32 plane)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = inst->core->hfi_ops;
> -	struct platform_inst_fw_cap *cap;
> +	const struct platform_inst_fw_cap *cap;
>   	int ret;
>   	u32 i;
> 
> @@ -895,7 +891,9 @@ int iris_set_properties(struct iris_inst *inst, u32 plane)
>   		return ret;
> 
>   	for (i = 1; i < INST_FW_CAP_MAX; i++) {
> -		cap = &inst->fw_caps[i];
> +		unsigned int cap_idx = inst->fw_caps[i].idx;
> +
> +		cap = &inst->inst_fw_caps[cap_idx];
>   		if (!iris_valid_cap_id(cap->cap_id))
>   			continue;
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
> index 5982d7adefeab80905478b32cddba7bd4651a691..39d74bef4d188abb919c372b7529d1d0773bd96a 100644
> --- a/drivers/media/platform/qcom/iris/iris_instance.h
> +++ b/drivers/media/platform/qcom/iris/iris_instance.h
> @@ -82,7 +82,8 @@ struct iris_inst {
>   	struct completion		completion;
>   	struct completion		flush_completion;
>   	u32				flush_responses_pending;
> -	struct platform_inst_fw_cap	fw_caps[INST_FW_CAP_MAX];
> +	struct platform_inst_fw_cap_value fw_caps[INST_FW_CAP_MAX];
> +	const struct platform_inst_fw_cap *inst_fw_caps;
>   	struct iris_buffers		buffers[BUF_TYPE_MAX];
>   	u32				fw_min_count;
>   	enum iris_inst_state		state;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 5ffc1874e8c6362b1c650e912c230e9c4e3bd160..104ff38219e30e6d52476d44b54338c55ef2ca7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -148,7 +148,7 @@ enum platform_inst_fw_cap_flags {
>   	CAP_FLAG_MENU			= BIT(1),
>   	CAP_FLAG_INPUT_PORT		= BIT(2),
>   	CAP_FLAG_OUTPUT_PORT		= BIT(3),
> -	CAP_FLAG_CLIENT_SET		= BIT(4),
> +	// BIT(4)

/* BIT(4) */

>   	CAP_FLAG_BITMASK		= BIT(5),
>   	CAP_FLAG_VOLATILE		= BIT(6),
>   };
> @@ -165,6 +165,12 @@ struct platform_inst_fw_cap {
>   		   enum platform_inst_fw_cap_type cap_id);
>   };
> 
> +struct platform_inst_fw_cap_value {
> +	unsigned int idx;
> +	s64 value;
> +	bool client_set;
> +};
> +
>   struct bw_info {
>   	u32 mbs_per_sec;
>   	u32 bw_ddr;
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index ae13c3e1b426bfd81a7b46dc6c3ff5eb5c4860cb..72559497e81c30373711e9b113582039f1fb5153 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -55,8 +55,9 @@ int iris_vdec_inst_init(struct iris_inst *inst)
>   	inst->buffers[BUF_OUTPUT].min_count = iris_vpu_buf_count(inst, BUF_OUTPUT);
>   	inst->buffers[BUF_OUTPUT].size = f->fmt.pix_mp.plane_fmt[0].sizeimage;
> 
> -	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
> -	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> +	memcpy(inst->fw_caps, core->inst_fw_caps_dec,
> +	       sizeof(inst->fw_caps));
> +	inst->inst_fw_caps = core->iris_platform_data->inst_fw_caps_dec;
> 
>   	return iris_ctrls_init(inst);
>   }
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 099bd5ed4ae0294725860305254c4cad1ec88d7e..3d1d481f8048305ef9a9bf0cb435ebca68563105 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -68,8 +68,9 @@ int iris_venc_inst_init(struct iris_inst *inst)
>   	inst->operating_rate = DEFAULT_FPS;
>   	inst->frame_rate = DEFAULT_FPS;
> 
> -	memcpy(&inst->fw_caps[0], &core->inst_fw_caps_enc[0],
> -	       INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
> +	memcpy(inst->fw_caps, core->inst_fw_caps_enc,
> +	       sizeof(inst->fw_caps));
> +	inst->inst_fw_caps = core->iris_platform_data->inst_fw_caps_enc;
> 
>   	return iris_ctrls_init(inst);
>   }
> 
> --
> 2.47.3
> 


