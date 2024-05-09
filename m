Return-Path: <linux-arm-msm+bounces-19629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E52008C1A18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 May 2024 01:56:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54A891F24230
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 23:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3978130AFA;
	Thu,  9 May 2024 23:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cr/BTd46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29B212F360
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 May 2024 23:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715298984; cv=none; b=ES5TYl2O+KcArr75+938brzwjNwZDs0bVbWsL+Jmc+jkOzV+22DJpXDE1wpaduyrftp/u37nl9wgTxMk8K+egC0fQdlx7xJzg4v00iebxjtl6OzY47Ifb7MB3vwXOOBCYQ5m3a+13yMULpXluh0Eq7GoITYVbvRzkpsbCo6na/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715298984; c=relaxed/simple;
	bh=gyzWYhvrDFaPsJx8YYqlTG3OQAfifSDKg/gu8FI8JUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRoerSP26iu9vVG8joZEhc5U2qf5u8jQ0u5mPYBE2VH9jUhtiIb3nw5pli4rwI9m4UevmUE+ufgi2PCRnJfMcMmYZNO2pUxfl2cSW+vT7HxAruLlAdeNFqcjKzydcY6xvxcNBatVSQU6FRa/fyKvNoNGKK8UXnzWxSgefRdbtOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cr/BTd46; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-41b21ed19f5so10772445e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 May 2024 16:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715298981; x=1715903781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X4J5NVwqETAunl255VwAIZlwOQM8pMKyHA9A90BXzpg=;
        b=Cr/BTd46aLBdVtACOtMJMYDjehGh+k8bFxH6BK2DAN+nir6ohw3RyWp8/h1S/2nLPv
         9TYkodg3RazQ1k5i0An1avtX9ishRod4hujGTPrDWv77HyVAvQWo2b2eG8bAkGgem5SD
         Ch6h5wkYOoS4doiq3y+sRTHa/4aXz0xru78qbWm49QiHsZbdhPN2neJJEKCiS78MfHpj
         ux4Jcg9fxAIFVnK++YidIGdkYXhoZnFvTnz8GqVIDH2eJ9AnF+ix/sOuq7O4xLTH2F08
         +c1ide6nPoR/Vd+34BSbXIvLgJAjM9A/KErvkQgS6WxwLXnjAGILTWtMi3SF9oUC+Z4C
         WdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715298981; x=1715903781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X4J5NVwqETAunl255VwAIZlwOQM8pMKyHA9A90BXzpg=;
        b=fX4l3d/pxLHv9K+IjdDMLfYt6SS5BnlYXyPpt7aWalGHAt+uSXpKt1Sqw/Tw978doC
         XW7VKDfgzoFE2GWeFV9AK4Y5sKKfCI60jN0PojeY+B43Eee5Oez/eJMt9G7J+W8f3CDb
         joiqBqfNDpOpUCnYQ/U2+0qkzc90micpeT+FKvDtK5KY48DoiW74ADfPwUD58XRuHGDa
         YGBp64dyt+OoOTAgpr5y5B51OQxNEDemEtr+MBkkObCpJZUXX1CrenzPWW2RhV8ieDfm
         sOp2QoytwRMYTMak34tAKe5Fgrt4d3DunzuAnJLk1YVX9cvz9fnaoYll5IIEz961wBQx
         CzaA==
X-Forwarded-Encrypted: i=1; AJvYcCX08kZoDXQuKc3h1MPV0g8SywTljlC9KrxJTLt/f44eZDJl7crMy8Cp5T09XWKU/wAjsDHvLxy5HlUtBwurHPphQnj2B3BveNHSLPFvrA==
X-Gm-Message-State: AOJu0YxjsBweB1prrJDjY5tYhHnC8t/DxLbzofX727lHKTn6PLwVXcnE
	K2Icl9XRdV2/NVMOQpJK15hlyB7FQkACIHqHcZJllNlIiCleOmsuB0Y1OKKUnEE=
X-Google-Smtp-Source: AGHT+IGGB+RNYg5gde97IA4ZKD1RT83vnG4jjEtROmXyTtMzVw9DYINtjj5LTGImZveTrDcbzG/afQ==
X-Received: by 2002:a05:600c:1d28:b0:418:17e9:c23f with SMTP id 5b1f17b1804b1-41feac59e0fmr8333385e9.31.1715298981352;
        Thu, 09 May 2024 16:56:21 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502bbbbf2dsm2892356f8f.100.2024.05.09.16.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 16:56:20 -0700 (PDT)
Message-ID: <a7b0a261-7a73-472c-a646-76685bc8bcef@linaro.org>
Date: Fri, 10 May 2024 00:56:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/18] media: venus: Refactor struct
 hfi_uncompressed_format_supported
To: Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Andy Walls <awalls@md.metrocast.net>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20240507-cocci-flexarray-v2-0-7aea262cf065@chromium.org>
 <20240507-cocci-flexarray-v2-13-7aea262cf065@chromium.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240507-cocci-flexarray-v2-13-7aea262cf065@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2024 17:27, Ricardo Ribalda wrote:
> plane_info is not a typical array, the data is not contiguous:
> pinfo = (void *)pinfo + sizeof(*constr) * num_planes +
> 	2 * sizeof(u32);
> 
> Replace the single element array with a single element field.
> 
> This fixes the following cocci warning:
> drivers/media/platform/qcom/venus/hfi_helper.h:1009:36-46: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   drivers/media/platform/qcom/venus/hfi_helper.h | 2 +-
>   drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
> index eb0a4c64b7ef..dee439ea4d2e 100644
> --- a/drivers/media/platform/qcom/venus/hfi_helper.h
> +++ b/drivers/media/platform/qcom/venus/hfi_helper.h
> @@ -1006,7 +1006,7 @@ struct hfi_uncompressed_plane_info {
>   struct hfi_uncompressed_format_supported {
>   	u32 buffer_type;
>   	u32 format_entries;
> -	struct hfi_uncompressed_plane_info plane_info[1];
> +	struct hfi_uncompressed_plane_info plane_info;
>   };
>   
>   struct hfi_uncompressed_plane_actual {
> diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
> index c43839539d4d..3df241dc3a11 100644
> --- a/drivers/media/platform/qcom/venus/hfi_parser.c
> +++ b/drivers/media/platform/qcom/venus/hfi_parser.c
> @@ -157,7 +157,7 @@ static void
>   parse_raw_formats(struct venus_core *core, u32 codecs, u32 domain, void *data)
>   {
>   	struct hfi_uncompressed_format_supported *fmt = data;
> -	struct hfi_uncompressed_plane_info *pinfo = fmt->plane_info;
> +	struct hfi_uncompressed_plane_info *pinfo = &fmt->plane_info;
>   	struct hfi_uncompressed_plane_constraints *constr;
>   	struct raw_formats rawfmts[MAX_FMT_ENTRIES] = {};
>   	u32 entries = fmt->format_entries;
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

