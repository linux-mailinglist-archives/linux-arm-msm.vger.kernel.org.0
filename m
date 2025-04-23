Return-Path: <linux-arm-msm+bounces-55170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E71DA99415
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 18:08:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE1254C0105
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 15:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D97A293B6F;
	Wed, 23 Apr 2025 15:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qvwcrzs3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F544293B54
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423224; cv=none; b=kIhHIDi1wikdsIeRZ47xNGWylVV//wmEfD+PtPEOnC2R+iAXR3ov/v1SeqFbp+ygYFDxi0GgwOl0EVtrjUT98Y2dOzvj8l4YzDMsd9hijWXxQJBS4x8owkrxNsuUR/PI5Oo/LaSBrOMDJbxf6oWKl2+T8v1Cqr9zrBlaVeUV4f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423224; c=relaxed/simple;
	bh=FtiD49evKkopHgyw79yvN2VUvaXY9BdMZt1P9TMHan0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AD/E3nOlEawZwPByzHnHPj84GjvyoyukVjIDMnbndQGwujiPQmvRLX02FMAocqP30Srd51o44o5DBB0q+DLZVv6nLupsVE5KqScEXklZkn7cDivrPUbdM0YogBCb6qYGCi3FAMELrloBDlYNLrPodGniS1eWKVIiMtAEPBvZY8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qvwcrzs3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so9280435e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 08:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745423220; x=1746028020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBSNViqkuRI/TRt0mXtEOajIQeER8Kt922Qarfmg8nI=;
        b=Qvwcrzs3C/DxvzoXW53FbxpIy91iWwKzS2RMUOTrgvFVmtud7fUGDl0NcSP27Yobyr
         ZosGeB9hRtWK+fFFpfn3P9Ky+9YSZwcMrfL6ge7egBkafTGYQvRSXKqc+avWIj/+TJ+o
         GteuiDcXQDh+/aGXfG0x/bdMRb//ti1MSl4dSrhWMGqpzIO9WFdKlRJjHaT2watJGFrb
         tjkjYp9XqQGiTzIbzkbc1L5a/HZiJfmunLfOZNRqiSuWrO8Lmx+8Sw9XX15irDlKxpLK
         aUzNH3+ONO7Wf1lqTNidFl4oCNNK0XOX5gLYgHH1ggp6xF/cvQN1jQT8RFtWerkbyya9
         wFvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423220; x=1746028020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RBSNViqkuRI/TRt0mXtEOajIQeER8Kt922Qarfmg8nI=;
        b=F9xziYcKbjKgsDQjl/juWXty4NdIPiTHREdcGPYWyG+jc4qoT7JqtP/qsCDSNpsCT1
         1nbw9R9ZxdjV1VHvs127Dr2R+kMrsGX9KWuiLbBEYoH3HAgeB1RqBeVGtn0V5OmFkYxY
         4ldjuFwg+KpMXYorMf4VMUgtft2cdNTmE6k6XPcbSnCT3AP6T2lx2nCJbo+ehWS+uzT+
         NY/oQk61wLgYHq1Ra7LJa8CLO2MV/lhk6Z7ItURYLCI2ZQe/ZCQISmY1ywRUB60e0lNL
         hDlZKxa4cxZ06QkLsCiCL3cGaNxM8473PCE3LEw+5Lihaw0v2JaLTqB447+MTuV+3NvU
         tI2w==
X-Forwarded-Encrypted: i=1; AJvYcCXEXNSrEHa8PKwmfoCeNhWnwYGbq4+6bpseylwbTZcs7rNZX66ha6QKRxpBbTFC+576OflyRyyo/gq9U444@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSbF99ceohD+MTI0sLPSbRbjUPHSgQ1B6Ntie1LwkO13L97Wy
	Q6Rjd2kzSM6WHVHFugzdAIZWMAPqLK4e7Ilgms3eCreUtn0v4lIptu2xhf8KatE=
X-Gm-Gg: ASbGncuWDTucFdoVE/jJBFREd/Kr+5GAVWpvTdWhWk4HYaDUfUvq4sQ8f9gdGIsF0hA
	V1mHvDFjOnAmlQFT/AF5IpZIu70qPWpgtMi7e2ThKrhS5JpyCkMUQWTSGJvHiaytaV5Ubbpr88r
	4X6kztVajdqhRWYJFjfwUET/GuaM1EAblVoxU+YsC5fapjJZQSiGbSPhh1xeOjlAFBuk0K6zmpA
	PFEXcYzw5TseMZP/O4Zg8jjcnxeaAXNIyrCJT4jUPWhhGdjCdivahB8wgBwq6r/ATHB7MNGB+rH
	czmjqUT40gd/vDBozuNSyPcGZ32hqNjaZitf8k/5sFbvCSxVFQCX4ZrqXxV+gilw+Nvy/nR6eHG
	+BqUnAw==
X-Google-Smtp-Source: AGHT+IGRqlscROTF97YUT2JPZD4gVqvUUJgeFoJfDaqI0Nb77xbcn8oHZZ3WiZAALXwanMaTLSpX2A==
X-Received: by 2002:a5d:584e:0:b0:39c:266b:feec with SMTP id ffacd0b85a97d-3a06723be72mr3609275f8f.7.1745423220282;
        Wed, 23 Apr 2025 08:47:00 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43d006sm19443328f8f.56.2025.04.23.08.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 08:46:59 -0700 (PDT)
Message-ID: <43f08fc9-6287-4df0-8d09-6572241621e8@linaro.org>
Date: Wed, 23 Apr 2025 16:46:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: iris: add qcs8300 platform data
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250423-qcs8300_iris-v3-0-d7e90606e458@quicinc.com>
 <20250423-qcs8300_iris-v3-2-d7e90606e458@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250423-qcs8300_iris-v3-2-d7e90606e458@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/04/2025 16:39, Vikash Garodia wrote:
> Add platform data for QCS8300, which has different capabilities compared
> to SM8550. Introduce a QCS8300 header that defines these capabilities
> and fix the order of compat strings.
> 
> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |   1 +
>   .../media/platform/qcom/iris/iris_platform_gen2.c  |  57 ++++++++++
>   .../platform/qcom/iris/iris_platform_qcs8300.h     | 124 +++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  16 ++-
>   4 files changed, 192 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 6bc3a7975b04d612f6c89206eae95dac678695fc..3191a910653ce4bd71de9a0b4465fd583602adf6 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -36,6 +36,7 @@ enum pipe_type {
>   extern struct iris_platform_data sm8250_data;
>   extern struct iris_platform_data sm8550_data;
>   extern struct iris_platform_data sm8650_data;
> +extern struct iris_platform_data qcs8300_data;
>   
>   enum platform_clk_type {
>   	IRIS_AXI_CLK,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5ff82296ee8ea5ad3954bd2254594048adcb8404..723e9f4cef42408168aca22b34ccd0a674a4fd25 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -11,6 +11,7 @@
>   #include "iris_vpu_common.h"
>   
>   #include "iris_platform_sm8650.h"
> +#include "iris_platform_qcs8300.h"

This is out of order, reviewing the header I don't believe there's any 
dependency in qcs8300.h on sm8650.h that justifies.

qcs8300.h
sm8650.h


>   
>   #define VIDEO_ARCH_LX 1
>   
> @@ -326,3 +327,59 @@ struct iris_platform_data sm8650_data = {
>   	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
>   	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
>   };
> +
> +/*
> + * Shares most of SM8550 data except:
> + * - inst_caps to platform_inst_cap_qcs8300
> + * - inst_fw_caps to inst_fw_cap_qcs8300
> + */
> +struct iris_platform_data qcs8300_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.vpu_ops = &iris_vpu3_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = sm8550_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = sm8550_pmdomain_table,
> +	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = sm8550_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(sm8550_clk_table),
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xe0000000 - 1,
> +	.fwname = "qcom/vpu/vpu30_p4_s6.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.inst_caps = &platform_inst_cap_qcs8300,
> +	.inst_fw_caps = inst_fw_cap_qcs8300,
> +	.inst_fw_caps_size = ARRAY_SIZE(inst_fw_cap_qcs8300),
> +	.tz_cp_config_data = &tz_cp_config_sm8550,
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 2,
> +	.max_session_count = 16,
> +	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
> +	.input_config_params =
> +		sm8550_vdec_input_config_params,
> +	.input_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params),
> +	.output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop = sm8550_vdec_subscribe_output_properties,
> +	.dec_output_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_output_properties),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..f82355d72fcffe7e361bd30877cccb83fe9b549f
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +static struct platform_inst_fw_cap inst_fw_cap_qcs8300[] = {
> +	{
> +		.cap_id = PROFILE,
> +		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> +		.max = V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
> +			BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH),
> +		.value = V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +		.hfi_id = HFI_PROP_PROFILE,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = LEVEL,
> +		.min = V4L2_MPEG_VIDEO_H264_LEVEL_1_0,
> +		.max = V4L2_MPEG_VIDEO_H264_LEVEL_6_2,
> +		.step_or_mask = BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B)  |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_5_2) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_0) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_1) |
> +			BIT(V4L2_MPEG_VIDEO_H264_LEVEL_6_2),
> +		.value = V4L2_MPEG_VIDEO_H264_LEVEL_6_1,
> +		.hfi_id = HFI_PROP_LEVEL,
> +		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
> +		.set = iris_set_u32_enum,
> +	},
> +	{
> +		.cap_id = INPUT_BUF_HOST_MAX_COUNT,
> +		.min = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.max = DEFAULT_MAX_HOST_BURST_BUF_COUNT,
> +		.step_or_mask = 1,
> +		.value = DEFAULT_MAX_HOST_BUF_COUNT,
> +		.hfi_id = HFI_PROP_BUFFER_HOST_MAX_COUNT,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +	{
> +		.cap_id = STAGE,
> +		.min = STAGE_1,
> +		.max = STAGE_2,
> +		.step_or_mask = 1,
> +		.value = STAGE_2,
> +		.hfi_id = HFI_PROP_STAGE,
> +		.set = iris_set_stage,
> +	},
> +	{
> +		.cap_id = PIPE,
> +		.min = PIPE_1,
> +		.max = PIPE_2,
> +		.step_or_mask = 1,
> +		.value = PIPE_2,
> +		.hfi_id = HFI_PROP_PIPE,
> +		.set = iris_set_pipe,
> +	},
> +	{
> +		.cap_id = POC,
> +		.min = 0,
> +		.max = 2,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_PIC_ORDER_CNT_TYPE,
> +	},
> +	{
> +		.cap_id = CODED_FRAMES,
> +		.min = CODED_FRAMES_PROGRESSIVE,
> +		.max = CODED_FRAMES_PROGRESSIVE,
> +		.step_or_mask = 0,
> +		.value = CODED_FRAMES_PROGRESSIVE,
> +		.hfi_id = HFI_PROP_CODED_FRAMES,
> +	},
> +	{
> +		.cap_id = BIT_DEPTH,
> +		.min = BIT_DEPTH_8,
> +		.max = BIT_DEPTH_8,
> +		.step_or_mask = 1,
> +		.value = BIT_DEPTH_8,
> +		.hfi_id = HFI_PROP_LUMA_CHROMA_BIT_DEPTH,
> +	},
> +	{
> +		.cap_id = RAP_FRAME,
> +		.min = 0,
> +		.max = 1,
> +		.step_or_mask = 1,
> +		.value = 1,
> +		.hfi_id = HFI_PROP_DEC_START_FROM_RAP_FRAME,
> +		.flags = CAP_FLAG_INPUT_PORT,
> +		.set = iris_set_u32,
> +	},
> +};
> +
> +static struct platform_inst_caps platform_inst_cap_qcs8300 = {
> +	.min_frame_width = 96,
> +	.max_frame_width = 4096,
> +	.min_frame_height = 96,
> +	.max_frame_height = 4096,
> +	.max_mbpf = (4096 * 2176) / 256,
> +	.mb_cycles_vpp = 200,
> +	.mb_cycles_fw = 326389,
> +	.mb_cycles_fw_vpp = 44156,
> +	.num_comv = 0,
> +};
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 7cd8650fbe9c09598670530103e3d5edf32953e7..6bc072c573e85b6d348e7d31509e8551ee0d1f16 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -335,16 +335,20 @@ static const struct dev_pm_ops iris_pm_ops = {
>   };
>   
>   static const struct of_device_id iris_dt_match[] = {
> +#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> +	{
> +		.compatible = "qcom,sm8250-venus",
> +		.data = &sm8250_data,
> +	},
> +#endif
> +	{
> +		.compatible = "qcom,qcs8300-iris",
> +		.data = &qcs8300_data,
> +	},

same comment q should come before s in our ordered lists.

>   	{
>   		.compatible = "qcom,sm8550-iris",
>   		.data = &sm8550_data,
>   	},
> -#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
> -		{
> -			.compatible = "qcom,sm8250-venus",
> -			.data = &sm8250_data,
> -		},
> -#endif

This part is right but should probably be a separate patch fixing the 
existing ordering.

>   	{
>   		.compatible = "qcom,sm8650-iris",
>   		.data = &sm8650_data,
> 
---bod

