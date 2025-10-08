Return-Path: <linux-arm-msm+bounces-76334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E652BC3D9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DACDE4E9DD7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD3EA2EC576;
	Wed,  8 Oct 2025 08:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mW93nNJx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328F823E330
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912369; cv=none; b=hm4ELj8F1jc+mUY21BhrbEXqZz77rF+WN8Mu0FuXKT6Mg8hZ03cS2M7Z3sytBNDL3lv01PJd3QhdSox/KRaZ52rJ8NozxODs4Kn1SJNf0RTm3bCGrS0vN9Qdw7t0bCppnGAq2kiYFA58nMOG5BGcmQwjEcIC/kYVkzcbPFRiYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912369; c=relaxed/simple;
	bh=8OfX1olNym2yuDElCFo+y+N8czgO6/khDBIoAQrlzsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mU4Upcwwjq14YV0C39W2BT2NNH3/i/rdN6VY7YtZq1/z59cvlSmisOsxQxfxHZ13Q5LZKcepnlyH58zXKuf0v8jWPIzeoQytrcNzvMdivstL9oFKg0bZbKkqIrSWFU3pyLopfHeN6mm+TF4GU0MKay6e5+ZPUY19Af4LhJ2Wr6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mW93nNJx; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e42deffa8so70969485e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759912364; x=1760517164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8s4t9BjYm06noPeILdvIoWKkJuRRVPbdNb9iIdV8a8A=;
        b=mW93nNJxrUT6YqyqJPnaI9Wd9sbiKCZO8dMJlaiQOAjLZAt7D1QjbL7koKXw0ZjFTc
         ylyTKUc+XtbrFFR0HdDif6CFcKUnyjOgn/bZ+uhTsuZ7IjYUshBuMWz9y7SDw3gKE/me
         l3FgQgW3VZLqXH1WIWEU88upjMm75tZfjgrg7b/8T8NonWEk8VUKf3r6LrlL0TH0wGfZ
         /5VRXU9sVA5aQHmUa5+4HVkepdKJEcCkwP7BYhsHPS94JSHUSA8ZSFQVa93gLJWH4auE
         VyZkYsbN+OzEATamh9wvlyyduic3N37hwSEKQet/qxCS8D0xIxEpjHGxyY/Ls954dq0S
         053A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912364; x=1760517164;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8s4t9BjYm06noPeILdvIoWKkJuRRVPbdNb9iIdV8a8A=;
        b=J7VsbXnc1f9wUZrKJpxCMgDKqg5heDwNHievsSyz09DO1nxNttB94g7xN5kphks4NV
         +94zsmSPC5/InSgMzgbidQrMEpp517V+L70nd+xngNO/9xnL5IFzXaHa0xIAPbi96cdG
         APYbiTZnQEvDPAM+OazzL0u+nwaJmHa7/NO8pJzuLkpA7Y94el0pZPgWyOK/OxwbL97l
         qMUe2zNA2u38qaP4kWx/LabifgjszruB+zI2vNI3pD8bpFajhgOwQ0Li75zPh9NzmYfy
         LVUms1PxLJyiHsiqz0yF7A72vx/KkQOKrYOSXZ7mN0dnP+KWfiRYFbwdb1rXFUkyS1Nj
         lGpw==
X-Forwarded-Encrypted: i=1; AJvYcCUuiC+3BW37QQ9RDKgFjXNe4Q2IQCPmfk8FZ2NHhU1bav9D0NmVTpHcdeNiy1L8fTyWDglWSYzsttsZ9Ii0@vger.kernel.org
X-Gm-Message-State: AOJu0YwwWQxQe7BwlwLFWAHYbfd7PMwpI3HvUX21yxid8Jhnt6IfOgQH
	ToypqNoOyv2fdfUPtU0zpuIXwXNiHbOxUtw3r+364vmWuYjHZdoJhBuXC4qkssMqYSg=
X-Gm-Gg: ASbGncuUvPnWXcWMXzEIT2f/JY3J137e2HIF9CHLnGm62Ov6LMLNeSVaXhK1yeGFsWJ
	8JAJrOTfPG7jG5EXCHg4NzIRuhzRngJEu464vKdJYrUiHYsNcYKcuS3vrVqx6jhtW/WtRP51UpS
	Hjg4DhBOGhpaFsIPogNVnhQIXfxBQIbCc8J/VugvXl2XDymyMrZLFz5epcj4aO+zq2qkicoo4dV
	U5ogMyHWDBWMlTOvLqYqenPdDc7jkaaALBBFwtlylggZInCqJGm8bphRoiS6ZSEnlQpHqOO1JtJ
	4nRiu7Nv1E7JNDK7abfr8NLVJLMqpOlTgT5CFyDasIwl+rGvx7GOmdLVECDsB6JL1yHYYejP/Gt
	43JPKn1DlAfI+gnLJeYjjnv5QAOEZ03wGUucMpYU3I8EJBsX/Vq3XK+S+wsj2FOwEEZgERs1C0x
	UOK2pYO7HSEfjyXOp/
X-Google-Smtp-Source: AGHT+IFEhXVT1pfSNTwPur3KNe2uf9XZsC40/sb4jcVizQ0HFclkkqo2tT3ku67t+UACu1zLc9b1yA==
X-Received: by 2002:a05:600c:3b2a:b0:461:8bdb:e8 with SMTP id 5b1f17b1804b1-46fa9b06c50mr19760695e9.30.1759912364417;
        Wed, 08 Oct 2025 01:32:44 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9bf8288sm28037695e9.2.2025.10.08.01.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:32:43 -0700 (PDT)
Message-ID: <a0bf546d-e91a-49f9-a06c-8ef1186a9eae@linaro.org>
Date: Wed, 8 Oct 2025 09:32:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] media: iris: turn platform caps into constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <FhzvOpI3xnjmzE7G_aLgkpk24bRAD2ad_O2BvQLHWV6C-W2WK5EpE1CDMS_yp87JZwsfuMf0f9egHDu8bOp3Tg==@protonmail.internalid>
 <20251008-iris-sc7280-v1-1-def050ba5e1f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251008-iris-sc7280-v1-1-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2025 05:32, Dmitry Baryshkov wrote:
> Make all struct platform_inst_fw_cap instances constant, they are not
> modified at runtime.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_ctrls.c            | 2 +-
>   drivers/media/platform/qcom/iris/iris_platform_common.h  | 4 ++--
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c    | 4 ++--
>   drivers/media/platform/qcom/iris/iris_platform_qcs8300.h | 4 ++--
>   drivers/media/platform/qcom/iris/iris_platform_sm8250.c  | 4 ++--
>   5 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
> index 754a5ad718bc37630bb861012301df7a2e7342a1..9da050aa1f7ce8152dfa46a706e2c27adfb5d6ce 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -301,7 +301,7 @@ int iris_ctrls_init(struct iris_inst *inst)
> 
>   void iris_session_init_caps(struct iris_core *core)
>   {
> -	struct platform_inst_fw_cap *caps;
> +	const struct platform_inst_fw_cap *caps;
>   	u32 i, num_cap, cap_id;
> 
>   	caps = core->iris_platform_data->inst_fw_caps_dec;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 58d05e0a112eed25faea027a34c719c89d6c3897..17ed86bf78bb3b0bc3f0862253fba6505ac3d164 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -215,9 +215,9 @@ struct iris_platform_data {
>   	const char *fwname;
>   	u32 pas_id;
>   	struct platform_inst_caps *inst_caps;
> -	struct platform_inst_fw_cap *inst_fw_caps_dec;
> +	const struct platform_inst_fw_cap *inst_fw_caps_dec;
>   	u32 inst_fw_caps_dec_size;
> -	struct platform_inst_fw_cap *inst_fw_caps_enc;
> +	const struct platform_inst_fw_cap *inst_fw_caps_enc;
>   	u32 inst_fw_caps_enc_size;
>   	struct tz_cp_config *tz_cp_config_data;
>   	u32 core_arch;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 36d69cc73986b74534a2912524c8553970fd862e..cbf38e13f89e5c4c46e759fbb86777854d751552 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -19,7 +19,7 @@
>   #define VIDEO_ARCH_LX 1
>   #define BITRATE_MAX				245000000
> 
> -static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	{
>   		.cap_id = PROFILE_H264,
>   		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> @@ -203,7 +203,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
>   	},
>   };
> 
> -static struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
>   	{
>   		.cap_id = PROFILE_H264,
>   		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> index 35ea0efade73caa687d300779c5b1dc3b17a0128..87517361a1cf4b6fe53b8a1483188670df52c7e7 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_qcs8300.h
> @@ -5,7 +5,7 @@
> 
>   #define BITRATE_MAX				245000000
> 
> -static struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
>   	{
>   		.cap_id = PROFILE_H264,
>   		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> @@ -189,7 +189,7 @@ static struct platform_inst_fw_cap inst_fw_cap_qcs8300_dec[] = {
>   	},
>   };
> 
> -static struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_qcs8300_enc[] = {
>   	{
>   		.cap_id = PROFILE_H264,
>   		.min = V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index 16486284f8acccf6a95a27f6003e885226e28f4d..e29cba993fde922b579eb7e5a59ae34bb46f9f0f 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -17,7 +17,7 @@
>   #define BITRATE_PEAK_DEFAULT	(BITRATE_DEFAULT * 2)
>   #define BITRATE_STEP		100
> 
> -static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>   	{
>   		.cap_id = PIPE,
>   		.min = PIPE_1,
> @@ -38,7 +38,7 @@ static struct platform_inst_fw_cap inst_fw_cap_sm8250_dec[] = {
>   	},
>   };
> 
> -static struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
> +static const struct platform_inst_fw_cap inst_fw_cap_sm8250_enc[] = {
>   	{
>   		.cap_id = STAGE,
>   		.min = STAGE_1,
> 
> --
> 2.47.3
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

