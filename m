Return-Path: <linux-arm-msm+bounces-76335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECB4BC3DA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 10:33:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 953F4188B346
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 08:33:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6D12F39C8;
	Wed,  8 Oct 2025 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6aWXshp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C120A2ECEBB
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 08:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759912384; cv=none; b=YP92V/aRr6K+hkQyx2Ag+UExL9pY6hZH9DgeOpTLNKMskxfipNkNzgzCNhgKrRyiD1QMn9Zl7jD3UGvABs80BPhYa6GgXxZv0Ep+uMa3DiFEkXFFHSA5DJHbBbPmwdL+mc5WO7z3GZrVaVOvKsZ5ISHAv0bLEtb8iN6kX3TyJws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759912384; c=relaxed/simple;
	bh=2FdRN4XC/5R1gK9m2+eqi8KynMVU0ghurM6LZd7Jgs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8nxoTWNXOg4cjrDh7+72hm5zpzxSl4YWwq7zeNDE1HfoTMSOWdHp7y8wt1TVQs34YNt6OK2oXGXgc7U7UPSzh3UMjKcEKD4bIrVwxRcm+Wi6x4FtiuXvTX1vFhquPBvszVUxvBR4B/BsEMUAsMWnuzfLD/ds5CVP4rRsPxQSnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6aWXshp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso42237555e9.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759912381; x=1760517181; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8obpc78oiviT69lCe869kt2HhJ1zlsm8uDGHlOfvmwI=;
        b=G6aWXshpk25VB9D+GQ7FXFtNd7zLl9xaJH8XJKk7BGT2kj6fRbySNqHJAzRL/Icvc6
         zTZ986UFR3cH+MHADbHJvwRUGrzeRAYo20JA6fdmxRpOejoHUHqHUi+KjG4HPQjSB+5G
         lthoQ7Wq4vgnPERo7GNor4j+Zjo1HxS/ONm5kRENhAKBFRLNwCJBGqKMUcd52RUcfm97
         28WON1B54bVAsVhszlSNJzSoPnqIBMeuTXq3y3ckbdmToC8KFF5QvmwuSPpGS/wCf+mR
         WPab9j8SVtM5tPb93kJmVR/EfKKT5DXqICl+DcoS6EuaTMj0+/X1yoSUnzBO2rmcJCGE
         /1uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759912381; x=1760517181;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8obpc78oiviT69lCe869kt2HhJ1zlsm8uDGHlOfvmwI=;
        b=mqgabVUpPmj750mUyIYwssHEV9gzDP/0VgXp6Dmw/6ITkdZWHIDzOhqxQS6PhYeZJD
         EjI/xUGnGEYiri24WZSyi4TzOjXi5z4zmcGOb4HBCDbrOEgm9fJyvYdg6hl10dUC35Db
         tdXdoF739/z+s+eRnkTqgcvxVcHtUk8ZfBMjv9HD9U4cI7y3UrAm5+iedF45Qc7msphJ
         1DwnvELsnrjZIRc2IU/sPXaxo5kCsQbeO7iHg7+d8hVhjTPeL7Y0c4i6p4xTPQWQC3aK
         TBK0xViTb6NztA064X4P06I9OH76dRkJfZtP5GAHPwF1vc2zKmm6uW3oDE3nqR2kFnmH
         zOnA==
X-Forwarded-Encrypted: i=1; AJvYcCXD/E3bcJiqxfEnEUMgCYg+Eoqr8TSIOCfgYF1m1qGaqoZNcHOml/yQEv9SZkI+aZphyfZX0E3kAttbgfur@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1vzsgXIaqHYyIFFPDU/zrfSYn2gPyLfHaO2NOuoMoM+ZneF+x
	4XR/ZDG/alT5QyYOYLmsPpD9c85CvR3pYYOIUvUhBkmvJS7g66BdLJVwsnJe392axUY=
X-Gm-Gg: ASbGncvR8Z6i4msBfIKm0OPXHEmcal/wxe/dQgXDlUCOgc2LwEF/p5yzJBGAI8k8waJ
	nDJA0YchcodSE+NWt4Ocx9QK8CUNrc0NqlVMFesB7uaO0nKyl5EeVjsliD9FwJVlMDlqxzWf8mg
	TMjt9h9XtWN939UAYAUiWady5f2yt9N8DR/vQ0um0g7FZ66EfNMMp7q0R761xdxGz6a6qftKvA0
	Kup61kGH7YiLkEg/T+G9fKSSsdy2ksTcWPK8JNsh6tV1Oq+nGXogQkmHY7j6m2jvL7VysEASxgM
	iXr3F4ieqsXLp20z2TRih2JEHfOLMRMvrOUTeBf2yXsrUrGNCFmGYxIcV4q9VtVE41JYwgIUcW6
	1RgeeWJl6+absD7CS9hM/vB+JStGhIwQp9+gP5zyI1x4XkQiDzIcBGunL0XOiNOLCAOHsn2QdIe
	gc330nu7jSJaXC9bWOZAQ3QBZ7lTg=
X-Google-Smtp-Source: AGHT+IHbSEhVQrK9K26i7uVsuzXkD7oprvxvvIF6hdVes8bM1RppRrexKFd+/Xrq7JcA8RRcetZaxw==
X-Received: by 2002:a05:600c:4752:b0:46e:4e6d:79f4 with SMTP id 5b1f17b1804b1-46fa9aa48d7mr17421505e9.15.1759912381089;
        Wed, 08 Oct 2025 01:33:01 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fa9d6269asm26643745e9.15.2025.10.08.01.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 01:33:00 -0700 (PDT)
Message-ID: <e829eeaa-94c8-457f-883f-fcd9f272b287@linaro.org>
Date: Wed, 8 Oct 2025 09:32:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] media: iris: turn platform data into constants
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251008-iris-sc7280-v1-0-def050ba5e1f@oss.qualcomm.com>
 <3922bySm7KN1DJdbcqTlzVcSdHYtKZ5Esh5_UQl2tsNSBHaL1riPFeZdKfQm-k73T6f9nWXlF3mgd78x1x9drw==@protonmail.internalid>
 <20251008-iris-sc7280-v1-2-def050ba5e1f@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20251008-iris-sc7280-v1-2-def050ba5e1f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2025 05:33, Dmitry Baryshkov wrote:
> Make all struct iris_platform_data instances constant, they are not
> modified at runtime.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_platform_common.h | 10 +++++-----
>   drivers/media/platform/qcom/iris/iris_platform_gen2.c   |  8 ++++----
>   drivers/media/platform/qcom/iris/iris_platform_sm8250.c |  2 +-
>   3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 17ed86bf78bb3b0bc3f0862253fba6505ac3d164..5ffc1874e8c6362b1c650e912c230e9c4e3bd160 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -41,11 +41,11 @@ enum pipe_type {
>   	PIPE_4 = 4,
>   };
> 
> -extern struct iris_platform_data qcs8300_data;
> -extern struct iris_platform_data sm8250_data;
> -extern struct iris_platform_data sm8550_data;
> -extern struct iris_platform_data sm8650_data;
> -extern struct iris_platform_data sm8750_data;
> +extern const struct iris_platform_data qcs8300_data;
> +extern const struct iris_platform_data sm8250_data;
> +extern const struct iris_platform_data sm8550_data;
> +extern const struct iris_platform_data sm8650_data;
> +extern const struct iris_platform_data sm8750_data;
> 
>   enum platform_clk_type {
>   	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index cbf38e13f89e5c4c46e759fbb86777854d751552..b444e816355624bca8248cce9da7adcd7caf6c5b 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -737,7 +737,7 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>   	BUF_SCRATCH_2,
>   };
> 
> -struct iris_platform_data sm8550_data = {
> +const struct iris_platform_data sm8550_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> @@ -827,7 +827,7 @@ struct iris_platform_data sm8550_data = {
>    * - controller_rst_tbl to sm8650_controller_reset_table
>    * - fwname to "qcom/vpu/vpu33_p4.mbn"
>    */
> -struct iris_platform_data sm8650_data = {
> +const struct iris_platform_data sm8650_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> @@ -912,7 +912,7 @@ struct iris_platform_data sm8650_data = {
>   	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
>   };
> 
> -struct iris_platform_data sm8750_data = {
> +const struct iris_platform_data sm8750_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> @@ -998,7 +998,7 @@ struct iris_platform_data sm8750_data = {
>    * - inst_caps to platform_inst_cap_qcs8300
>    * - inst_fw_caps to inst_fw_cap_qcs8300
>    */
> -struct iris_platform_data qcs8300_data = {
> +const struct iris_platform_data qcs8300_data = {
>   	.get_instance = iris_hfi_gen2_get_instance,
>   	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> index e29cba993fde922b579eb7e5a59ae34bb46f9f0f..66a5bdd24d8a0e98b0554a019438bf4caa1dc43c 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8250.c
> @@ -314,7 +314,7 @@ static const u32 sm8250_enc_ip_int_buf_tbl[] = {
>   	BUF_SCRATCH_2,
>   };
> 
> -struct iris_platform_data sm8250_data = {
> +const struct iris_platform_data sm8250_data = {
>   	.get_instance = iris_hfi_gen1_get_instance,
>   	.init_hfi_command_ops = &iris_hfi_gen1_command_ops_init,
>   	.init_hfi_response_ops = iris_hfi_gen1_response_ops_init,
> 
> --
> 2.47.3
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

