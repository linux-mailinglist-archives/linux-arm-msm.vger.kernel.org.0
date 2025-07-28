Return-Path: <linux-arm-msm+bounces-66861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7500FB13BBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59439165DEA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 13:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D06626A0EE;
	Mon, 28 Jul 2025 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPAYhBMj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DA2269B08
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753710319; cv=none; b=KqKqZXDEPUoEr23Nd2qKHKvAWQO9HvENW2ZPSuwheMNsigdlgVfaTqJ50C9MHmyXHlbQ4OvX3Bso0dVEWteTwGQ0SbtA833CbcfSZhCwLw8Mi8gy2XZNO04ptczURYClfp4j8IHMJ3Fy0iDT89iVng3dqOQMirdiWedcr/bYrG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753710319; c=relaxed/simple;
	bh=qNY+H8nKrwqU1NbbXJfOEkBbcio8zn4qCa6RuSXOmis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=baKiyNCgCLO55Ep//6/5FUZFJRDeVQ/QMZ/2LopBaSb9iAKRJhRob7UTOt+lVOdJHBWEA0xiW8kVXklq6SMQ2//DJNImmkEi5/RJYIbFXsMR/QhYt6JxGoUl6hQkBsEI1T3HBGUq1pNeyWOdALuZGb3CzzWuHx0FGFffJRZoe9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lPAYhBMj; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-614fd1a5790so3819048a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 06:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753710316; x=1754315116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9af25jiuQ+ume924hKd7aFYy7n3IXrPlhC5QmLXxXw=;
        b=lPAYhBMjU8cqtDqNcGVTpxwxvqxl4gLnDQK4TtTP69ToSd0mYGzwh6Xri925oJXXql
         BjUVt8x8oNnkV7d9d5j+5brgjRbyiUeNgXY6SwIQjxglE/nOmqsErh8FP3DR9aF53g7K
         GmAIrQGuiAmJ8hRKI/x8zTeAUwdRKvTYETWqdmC73y40Gfm7uL6NDAH+brDJc0/UszOU
         +d2wFqoE80cbXXSOtP/Nl3NkM0lx3C0J0CGBeDLUX3ac1hBOTtskRpfsTohHclw6Iwre
         5yGXAJ8Ds51Cv5bTq8Djhvwzmb2087KnuHNblUwK10e3aYfVejdbJiLnXbKZtP8eUkDL
         j0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753710316; x=1754315116;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9af25jiuQ+ume924hKd7aFYy7n3IXrPlhC5QmLXxXw=;
        b=MKsW6jR5J/fN4gTAzs6dUhGzhAWRN2M/zJP0WNkzNTmqc9OpqXGPJ8Q9f42pWThOGZ
         lmrK9VnYVQnDiTwVsgCIvStHcPL3WydEUUuIZ1HJ+oiBOP3fFsxwiCzl2Iw19fixxjqy
         4AudjSdOQEyfghDkLeLrod6cJ9pv6H55q6OgExkp3vhiwNn8aYugk5ZrcxfNQU5Uxror
         knWGLm7SZzC14g/uY/tgR75Dj+zqJ+JTX6PkCs6bFop+9kWEbR98JRh4a9xMW6WOytCa
         /XGULZRffztDNWU9FIOFurLxYHevEvpiVoyQaQGLn6P5gImDS3T2AyHDVm8LbbyT4z84
         +z+A==
X-Forwarded-Encrypted: i=1; AJvYcCV4cl3Tbbcu8AuthE4PCtfgz/+hB9zVsRIft/kNGUb7Dt+DLgtvBw1VkVzGD2spAbu7H4wKcumEq5ILC3XN@vger.kernel.org
X-Gm-Message-State: AOJu0YwAJj8EhyR5FVx3F2b0eFIjQlPTy8RilVRPzlwdvuh5qf0wQETn
	hnEQnJbhzFthYsLlIoJMklWgkUBWrnX2klZ2FP9vLVvQstMW6F4vo7zRyN362/UfDTI=
X-Gm-Gg: ASbGncuY+JuQ6YnyN0ZmalZwehG6vpDQMy9jCG7RJkaD7d5fuDg33VFvTiIzi9SWdkg
	XpVqu/k0jggowkSGtWiTDGTUR/GPf7+AkHDe/at3FiSCwstNrRQr6ElIr5iz9zR3QVYIffQvctw
	mPUmLt5dmby99ZueY8O+wCYLxYu6Nehx8gnUIIjFGtagqDQypdO1/uuIVds+x6WyneLOeWSCm3v
	ph1NgmO92eF1foINxzy41es8Ba7uS8fMfZqYxu9+C3JbENdQ+sfvvDqiwwEKExvRbHoWv7l2svJ
	+z1nUx+0cv8nFxumN6xjyWHnF2O5Swy1Gp1NzcoM4PkeDG+1YptVZ6kcwD72e/69ICn5lsGZWQL
	443e+9dOujy6q5no4WOHvws+R0BmnT1X577L4hmwPgQqLPUlFpT7OGiXBRyB7Wa9Qt+2PkgDFEA
	==
X-Google-Smtp-Source: AGHT+IGd4Pa4ABn1UyusTYa3khDC/gbx26sr8pR3MExOOmpWYpRCLXp+2l8s5LKNuAnc9BeHFM/egQ==
X-Received: by 2002:a17:907:7f93:b0:aed:745:a139 with SMTP id a640c23a62f3a-af618f0233cmr1323576166b.33.1753710315686;
        Mon, 28 Jul 2025 06:45:15 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa4cc9sm426634466b.107.2025.07.28.06.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 06:45:15 -0700 (PDT)
Message-ID: <63a0e35d-8e26-410c-ac44-225c8d8b37a9@linaro.org>
Date: Mon, 28 Jul 2025 14:45:14 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] media: qcom: camss: Rename camss-vfe-780.c to
 camss-vfe-gen3.c
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
 <20250703171938.3606998-3-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250703171938.3606998-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/2025 18:19, Vikram Sharma wrote:
> Rename the file camss-vfe-780.c to camss-vfe-gen3.c to enable
> reuse of VFE logic across multiple SoCs.
> 
> The SA8775P SoC includes VFE 690, which is very similar to
> VFE 780, with only minor differences in register bitfields.
> Rename prepares the codebase for supporting additional SoCs
> without duplicating VFE logic.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/Makefile             |  2 +-
>   .../qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c}   |  8 ++++----
>   drivers/media/platform/qcom/camss/camss-vfe.h          |  2 +-
>   drivers/media/platform/qcom/camss/camss.c              | 10 +++++-----
>   4 files changed, 11 insertions(+), 11 deletions(-)
>   rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (96%)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index ee869e69521a..76845a456c45 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -19,7 +19,7 @@ qcom-camss-objs += \
>   		camss-vfe-17x.o \
>   		camss-vfe-480.o \
>   		camss-vfe-680.o \
> -		camss-vfe-780.o \
> +		camss-vfe-gen3.o \
>   		camss-vfe-gen1.o \
>   		camss-vfe.o \
>   		camss-video.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> similarity index 96%
> rename from drivers/media/platform/qcom/camss/camss-vfe-780.c
> rename to drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> index b9812d70f91b..93d16b0951e9 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> @@ -1,6 +1,6 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module v780 (SM8550)
> + * Qualcomm MSM Camera Subsystem - VFE (Video Front End) Module gen3
>    *
>    * Copyright (c) 2024 Qualcomm Technologies, Inc.
>    */
> @@ -113,14 +113,14 @@ static inline void vfe_reg_update_clear(struct vfe_device *vfe,
>   	camss_reg_update(vfe->camss, vfe->id, port_id, true);
>   }
>   
> -static const struct camss_video_ops vfe_video_ops_780 = {
> +static const struct camss_video_ops vfe_video_ops_gen3 = {
>   	.queue_buffer = vfe_queue_buffer_v2,
>   	.flush_buffers = vfe_flush_buffers,
>   };
>   
>   static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
>   {
> -	vfe->video_ops = vfe_video_ops_780;
> +	vfe->video_ops = vfe_video_ops_gen3;
>   }
>   
>   static void vfe_global_reset(struct vfe_device *vfe)
> @@ -140,7 +140,7 @@ static int vfe_halt(struct vfe_device *vfe)
>   	return 0;
>   }
>   
> -const struct vfe_hw_ops vfe_ops_780 = {
> +const struct vfe_hw_ops vfe_ops_gen3 = {
>   	.global_reset = vfe_global_reset,
>   	.hw_version = vfe_hw_version,
>   	.isr = vfe_isr,
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
> index a23f666be753..02d9162ffd93 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.h
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.h
> @@ -244,7 +244,7 @@ extern const struct vfe_hw_ops vfe_ops_4_8;
>   extern const struct vfe_hw_ops vfe_ops_170;
>   extern const struct vfe_hw_ops vfe_ops_480;
>   extern const struct vfe_hw_ops vfe_ops_680;
> -extern const struct vfe_hw_ops vfe_ops_780;
> +extern const struct vfe_hw_ops vfe_ops_gen3;
>   
>   int vfe_get(struct vfe_device *vfe);
>   void vfe_put(struct vfe_device *vfe);
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 1431e08dc04a..310b5cd8de5f 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2371,7 +2371,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   			.is_lite = false,
>   			.has_pd = true,
>   			.pd_name = "ife0",
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -2395,7 +2395,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   			.is_lite = false,
>   			.has_pd = true,
>   			.pd_name = "ife1",
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -2419,7 +2419,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   			.is_lite = false,
>   			.has_pd = true,
>   			.pd_name = "ife2",
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -2441,7 +2441,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.is_lite = true,
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
> @@ -2463,7 +2463,7 @@ static const struct camss_subdev_resources vfe_res_8550[] = {
>   		.vfe = {
>   			.line_num = 4,
>   			.is_lite = true,
> -			.hw_ops = &vfe_ops_780,
> +			.hw_ops = &vfe_ops_gen3,
>   			.formats_rdi = &vfe_formats_rdi_845,
>   			.formats_pix = &vfe_formats_pix_845
>   		}
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

