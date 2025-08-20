Return-Path: <linux-arm-msm+bounces-69959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91CBEB2DB51
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 13:41:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1CA407AB9B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1CB2E543F;
	Wed, 20 Aug 2025 11:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vKA/DOwp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3582E2EF3
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 11:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755690056; cv=none; b=dfwjTj5rcJY0QjNFRIlqyRhDlVDBTfFjraNNQI9/HTvxjZBRLXRs13aDrajvbuDglp5lf4CxfC3sG5erCd1tjO68j8A2x4BnTcTvRemxrIlc55qoRMSQkc9wGCLXKEnt6jP4PDEczd2eGjApX1QM5XPHzUpd+7fOF5Bc6c1a6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755690056; c=relaxed/simple;
	bh=LZ9lNwKnI9igWjqDhty8BMFySOw2pytmhPSOrssKm1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myj5xCgy/HhL16PIwDRxk/h+UVMIA2tyyVD6SK/k+yk89pi0DienIsmcQMk8Ay0VSFqXSxVM76QRB/YiCf0ZYYqsKGbZK5lxpYdCWhcSnDArSWJz+C2gNroIelwJtVvWc/Jayo3DJ700DV2i1aS8DAAg1iu7aUQHUiALM9HNmnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vKA/DOwp; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1ac7c066so5138865e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 04:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755690053; x=1756294853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBsvg6YZ6d6Q45uqCriOUykxMP3lYx/MkdCJhYtl/R8=;
        b=vKA/DOwp1ZX/NVOTc2ENaLymncOv4vBvB08b5qVq6mF0zHLc3HxOI54MIz5Oyp/i+5
         8/NrMbB9hlkGOadiAbYLgIKaA17mgoRBlolxN1QpNW2QCoQR8grVS/TuH+2/rl8I53jP
         eJkbUGBTwO6izB9QVLaAPwW3zEUsVCb7dV7Bvq9y8fdyAnii37CSP71IsyCqWontGjLh
         u6DuOjV9HOVix5mxG+mpoB6AeCTq5+pBVcBXZQENo5XCsuHe/Rmg5mhl1Rv60cdNJuNs
         M+QFIJsRWUfeDj4RUfC7JPdIe4B/F1ZW3Z/1gd9MhUKLWoHAdfOa+IniVKMD8rCUKyU3
         RJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755690053; x=1756294853;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fBsvg6YZ6d6Q45uqCriOUykxMP3lYx/MkdCJhYtl/R8=;
        b=S5gQoAQDnYME3uQET2q3sCR8GDAh3yruNxDF9oSnY+KNGPZNpLoCtuVDzxqnHdcm+e
         i3Nl2eRe0owZPAemzz0yaEFT9LWP4hYIK5aKijW/Fnism32hBSdwkrGFmBoy9O3IGj96
         vUiPWOMMb7+VzbdNbXsgj1CQyj38FkSR6GxMzq5NlrCoVbvBl/e7Z9B6E+cTQ8RtEcEx
         /T2TIrH6hK19Rp94l4ziDd43u90qLo6qy6Mc2w4hV14ielprnZ9lBrqMaR/oa5HLIXsu
         fy7NfneW2zxunbTXvP5ORxsLK9V/vbsRvlQtcWTMi4SGuN+Ci2SeZU9R0Fxg36h9XbrX
         8Wyg==
X-Forwarded-Encrypted: i=1; AJvYcCUEUcTpuE769OCza7Zig1gxtoSExeBRjErBGtAiEDZ7ZZ4TgiaaCfHAUffx0Bf1Awy3JF+TeHCKm7y/U5yD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx61ryJoLXeHGxW2dnd0AtEqU8xmuMzyDxdTwvVE5GbGTZ5TGq/
	HZK0gHJEwRF0FFPNJNWqIB+3Tl49k4ZvxfOZMjUbnvTUOtL2RniW6xAGfXjr/zCZgRg=
X-Gm-Gg: ASbGncvpXRvjsr24uCQSjeTf40YLcxceJGMlP9/0i3eq+K+sAY7SsECrb5sVluq6VGh
	2RnmfSadkZwOnyeERLKA1XDXxOXa3p2rkUvz72sLEdr42cl4Zg03Nz8oAwqc/J/D420My5fSKCM
	Uh8FKGucREXvCWnmucNqAx4eAWcIxCoKt/PWRjICw3Ocwvn7E2U1mMajk/Xzr39H919yIwGiDOA
	vmEcO/23Wiuloe2yrtnS7ksktTFSgx9Xl7JutzEoQNciI+OqqsGXp3a1jkrBlEDkENapm7TPSBf
	TpPnc4RWp/xe7J0fez3B7oCA+I9a5o2ZiDMvfxBwrVPC+w3Rr1N4+oTUNcOCqs7VpncJ+UFuPT0
	zQxZMK3/7WDplklVQPrIrH0NFcyc2dlIkRyjbeII5Q1OBzvFrgulucLsAkujk9ws=
X-Google-Smtp-Source: AGHT+IHXEFwMDm2kihqAnYayZR6gT+vK15GNCQ1aLgzVsq2r159WZVA/FhKSfLtVw38Kifu9RBCDaw==
X-Received: by 2002:a05:600c:c494:b0:459:e39e:e5a5 with SMTP id 5b1f17b1804b1-45b4743654emr22623065e9.5.1755690052559;
        Wed, 20 Aug 2025 04:40:52 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47cad57asm31636555e9.24.2025.08.20.04.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 04:40:52 -0700 (PDT)
Message-ID: <c000aaa8-209c-43d2-8f41-701cfdecbce2@linaro.org>
Date: Wed, 20 Aug 2025 12:40:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/11] firmware: qcom_scm: Introduce PAS context
 initialization helper
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
References: <20250819165447.4149674-1-mukesh.ojha@oss.qualcomm.com>
 <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250819165447.4149674-2-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/08/2025 17:54, Mukesh Ojha wrote:
> Currently, remoteproc and non-remoteproc subsystems use different
> variants of the MDT loader helper API, primarily due to the handling of
> the metadata context. Remoteproc subsystems retain this context until
> authentication and reset, while non-remoteproc subsystems (e.g., video,
> graphics) do not require it.
> 
> Unify the metadata loading process for both remoteproc and
> non-remoteproc subsystems by introducing a dedicated PAS context
> initialization function.

You've introduced what PAS is in the cover letter but you haven't done 
so in the commit log where you use it.

"Peripheral Authentication Service (PAS)" should be defined in this 
patch somewhere so we know what PAS means.

> 
> By introducing qcom_scm_pas_ctx_init(), we can standardize the API usage
> across subsystems and reduce the number of parameters passed to MDT
> loader functions, improving code clarity and maintainability.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>   drivers/firmware/qcom/qcom_scm.c       | 26 ++++++++++++++++++++++++++
>   include/linux/firmware/qcom/qcom_scm.h | 11 +++++++++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 96d5cf40a74c..33187d4f4aef 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -558,6 +558,32 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
>   		dev_err(__scm->dev, "failed to set download mode: %d\n", ret);
>   }
>   
> +void *qcom_scm_pas_ctx_init(struct device *dev, u32 peripheral, phys_addr_t mem_phys,
> +			    size_t mem_size, bool save_mdt_ctx)
> +{
> +	struct qcom_scm_pas_ctx *ctx;
> +
> +	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return NULL;
> +
> +	ctx->dev = dev;
> +	ctx->peripheral = peripheral;
> +	ctx->mem_phys = mem_phys;
> +	ctx->mem_size = mem_size;
> +	ctx->save_mdt_ctx = save_mdt_ctx;
> +	ctx->metadata = NULL;
> +
> +	if (save_mdt_ctx) {

You could check metadata != NULL and drop the bool ctx->save_mdt_ctx 
entirely.

---
bod

