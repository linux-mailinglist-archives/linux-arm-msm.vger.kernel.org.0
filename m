Return-Path: <linux-arm-msm+bounces-92273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kICGHRnZiWlUCQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:54:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E84D610F347
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0788E30173AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 11:35:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F6F371060;
	Mon,  9 Feb 2026 11:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zFe3IVwe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298C36F431
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770636898; cv=none; b=l+ABMnaImG1OxgvI5yJr4QLtC+B3Pa3ZQV3XI/2nH1jzifnBEsnfpwd+DOCy77EbIYrgXhE6i30FRPjoAgcg2bCR8Y28m3iuTMUfeLhqjc7UIBnxSGAsrbB/rWqJSi4zjEz+x3EthnerjZTgl2qm0fSiya59WzTJL7yrRUr2Ov8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770636898; c=relaxed/simple;
	bh=jzVkPYNeSIoMdrBE1x/sOLXr0C2f2cjy6VUr9kYNYag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJa9XrOTzMPxDDsaPX/nywlXznR4oQvCEHXLRPigsyGTTjwHdGFY1To45+/cJU94kVMeQrClt1IHuK1faIfYPb24877laELKABiE8WW/TTVGQovvaYLcK8gSb5S4wjAQuHEfyCDioD4xJ6x1mOq4TJu8WsUtMgNTIQZKj/NSxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zFe3IVwe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48039fdc8aeso26703805e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 03:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770636896; x=1771241696; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=38FYNGu3q/riOqlxe8A2OPi6B7gxgzW4SRm41XQsBIk=;
        b=zFe3IVwerQ8Sypvz6I28C313zZjFJ4laGFu3qBoNzR4udWzT7TSI4mYNsAOG1Yn6/Z
         WVu1g2ZMOjBpNsYXC4xO+eh+rcSsbhEaDfdCbJOnlQrdrsUbr93XDovGk9E95pCjEYwJ
         TRQtNCwJnse7vcz+am9IwauBzjo7hHxdO+qHG5I5CEXZfgxwGzyO55mEmUf1EY00PmUM
         lWTuPg/MbzPxxUW1RV20csjfs4UXKhXIW1/aZq8BMpaG+HYvxuHdTdDrbG6oUVUFBNIP
         qb3mqNqO8qrqaYtuzkFSjbew1F5O9/woMDIWcpsx9Tf/WDnuFxJSulu6O0ZnMGl+XzHn
         mizg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770636896; x=1771241696;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38FYNGu3q/riOqlxe8A2OPi6B7gxgzW4SRm41XQsBIk=;
        b=M7XPhPoovQwOeZ97OT2IbvUQBomV13R5GDewhLhe0iZG/w68BIcRMZ/+1+rPe4pX8X
         Ti2/Gls+VLuCP4RQmACQT/W2kbEvjFPIdhi7cftkVkXNeZl4U1OsT/54Wfs51d9RAIhR
         OgM/8IZqhc/lF+2Cq9FYWCXto4k9Fe1T7ikHoAZAqamssUTy8npPtwaWbjI7mqimtRop
         EBCSDxTNo/r0pbsYEaM8yw7DMCQI0OetJWBtCDiKXB9/85fdzkrvAfS0T49OtLBKVC+9
         9rpE+lXFWeOqm7Te/l0KrTsGTn3/P+2Slqw2EFjR3pagfnOENfw/WqQRaCt42A9yT90U
         D2Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUoJbFnmOVQppVOC0aRFWD03RLaE0ENXlkwbeTU9MErhZAiH6mNEU0lUdw/vccib3wnc7ZtAJi6hnWudsiN@vger.kernel.org
X-Gm-Message-State: AOJu0YzJNi7/FALffhZW+slHy6RIYBwTcIfN4PXepLcZhOng34vlcS7s
	hpaCkPXJm7UoCXhhQlJ+kwefYY3TEtGLwy7+OiLK8iFPo1v14hH8Kda3+PbH6td2BuoTu5kwIu+
	+vFpAO+0=
X-Gm-Gg: AZuq6aJtpDekp9aLyWkeW8+EzLFAZCioLGVuDCia8la5LzGPlXRzIyOblmOfeNr5KP0
	mT3sP3BQQxnnuSBNI6FFwJAMIIXByOcmFXupek10QAmgquK5788KPQHWF0Q7J86ti9FxEaVoot7
	WuXPBWoVoWg1Wy2A6xOUkBGBbJdsacWsJID/PCYip6UxxF7q/LpcyBldHwf9dkrRjuWvdcfezFk
	Vdy/I/zxOM0yfCu80YilRGEei6hr6744DYG3zZuamKDTO4FIRW4Wz/vYsC2AQ7Smq7iLogwRORK
	H2i3gMpsMT5e8UxPUmX1Huam0EqM+m6IiHbMfgS9vFIFmckzzWA8Mh8aIAB/saXy+HoZYY+PMJz
	iKqtoOzp0kFp39ojSyyino5BbgNYmFzxxEO/jRGiZsLrW/tb9qQaZAwpnTUJmHWz+53fEQ5G392
	ldBvjDC3UWwo68sm80sx0+ra9qxcxPdqVjULzz77FIganLTaBMaurt
X-Received: by 2002:a05:600c:3509:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4832021e93cmr157079665e9.25.1770636896134;
        Mon, 09 Feb 2026 03:34:56 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bcdfcsm27333322f8f.10.2026.02.09.03.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 03:34:55 -0800 (PST)
Message-ID: <2511ec4d-7c77-450c-ad1e-ef7dbd6ef02c@linaro.org>
Date: Mon, 9 Feb 2026 11:34:53 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: iris: Initialize HFI ops after firmware load
 in core init
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260209-iris_sc7280_gen2_support-v1-0-390000a4fa39@oss.qualcomm.com>
 <qtNLZEFPxe7U4gkh9gboQupSZke_JXk6YMIhHOvoL0Y5Kf7N5hcE30am8fxchkYXSdBrLthaEZ8p-KJb0sehYQ==@protonmail.internalid>
 <20260209-iris_sc7280_gen2_support-v1-1-390000a4fa39@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260209-iris_sc7280_gen2_support-v1-1-390000a4fa39@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-92273-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: E84D610F347
X-Rspamd-Action: no action

On 09/02/2026 09:45, Dikshita Agarwal wrote:
> The HFI command/response ops were previously initialized in probe(), but
> we don't have firmware loaded at probe time. Since HFI is tightly
> coupled to firmware, initialize the HFI ops after firmware has been
> successfully loaded and booted.

"but," not ", but"

I'll fix that for you on application.

> 
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c       | 2 ++
>   drivers/media/platform/qcom/iris/iris_hfi_common.c | 6 ++++++
>   drivers/media/platform/qcom/iris/iris_hfi_common.h | 1 +
>   drivers/media/platform/qcom/iris/iris_probe.c      | 2 --
>   4 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
> index 8406c48d635b6eba0879396ce9f9ae2292743f09..8e4cc6d6123069dea860062f0172f1e4b90cfc13 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -75,6 +75,8 @@ int iris_core_init(struct iris_core *core)
>   	if (ret)
>   		goto error_unload_fw;
> 
> +	iris_init_hfi_ops(core);
> +
>   	ret = iris_hfi_core_init(core);
>   	if (ret)
>   		goto error_unload_fw;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> index 92112eb16c11048e28230a2926dfb46e3163aada..bbca17edf281a11142d7582178cd7562be053b45 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
> @@ -74,6 +74,12 @@ u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients)
>   	}
>   }
> 
> +void iris_init_hfi_ops(struct iris_core *core)
> +{
> +	core->iris_platform_data->init_hfi_command_ops(core);
> +	core->iris_platform_data->init_hfi_response_ops(core);
> +}
> +
>   int iris_hfi_core_init(struct iris_core *core)
>   {
>   	const struct iris_hfi_command_ops *hfi_ops = core->hfi_ops;
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> index 3edb5ae582b49bea2e2408c4a5cfc0a742adc05f..498a08314cdeb65b4b621e2200aae8685f4a025b 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
> @@ -149,6 +149,7 @@ struct hfi_subscription_params {
>   u32 iris_hfi_get_v4l2_color_primaries(u32 hfi_primaries);
>   u32 iris_hfi_get_v4l2_transfer_char(u32 hfi_characterstics);
>   u32 iris_hfi_get_v4l2_matrix_coefficients(u32 hfi_coefficients);
> +void iris_init_hfi_ops(struct iris_core *core);
>   int iris_hfi_core_init(struct iris_core *core);
>   int iris_hfi_pm_suspend(struct iris_core *core);
>   int iris_hfi_pm_resume(struct iris_core *core);
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index ddaacda523ecb9990af0dd0640196223fbcc2cab..22c7b3410710328b900fc49459cd399aa0e89b02 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -252,8 +252,6 @@ static int iris_probe(struct platform_device *pdev)
>   	disable_irq_nosync(core->irq);
> 
>   	iris_init_ops(core);
> -	core->iris_platform_data->init_hfi_command_ops(core);
> -	core->iris_platform_data->init_hfi_response_ops(core);
> 
>   	ret = iris_init_resources(core);
>   	if (ret)
> 
> --
> 2.34.1
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

