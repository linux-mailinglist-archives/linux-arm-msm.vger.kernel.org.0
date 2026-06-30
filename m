Return-Path: <linux-arm-msm+bounces-115549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SR5+F2Q9RGqcrAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115549-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 00:04:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C38A66E842A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 00:04:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=HFHkydXl;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115549-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115549-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 47358302FEAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 22:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08AB23242D7;
	Tue, 30 Jun 2026 22:04:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC01F2380
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 22:03:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782857039; cv=none; b=CS+d0IhnHa8v4BzuonZHwnDRAz11l0m6XkZQTj5GNPM6jkSpNHcAMdVWLLRLMeO+h1zMQ9WxIUvX2avSHxl2SJhXa3YnBPzKKe9Imjl2IiPpI7fS2aQGM/WmCD1RKkD65h/akxlQxxN0kImkuGRePrtL2wsTNJ9/d7JBgUkTe3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782857039; c=relaxed/simple;
	bh=8ymipuRB9D5DQq6+y2O9ynj1qRZr8UbXvBj3NoQCjs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/nHnhAvlc3GKd/iSbnZiBSt9+FypP9w50oYrVFweRN2uqHVCOApPY/NwZnwAvfYwY+n5ITbRjFldpCXrrwb8hCfbihdMYMMBZm/kmM4F9tFlG1omIvP8JkVuOf+YlqYW9UKqjHLvae7bdLeddS3bre4mP0gYoJH1XJJneUcQ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFHkydXl; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so42057425e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 15:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782857037; x=1783461837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tw2gpsI3jiI4P6kujg/K3R9aQhlaG+bVbRj+g5z/Ff4=;
        b=HFHkydXl9qNzDuK2ivnsAQd2h53E0oIA57kLA0rrCp747uvtzYeaf9cjaQnc/F3glZ
         ta0KhSbJKwXq5FoisQqw05UFsVizPp5hTwbk1YBuU95WQOj1gAxp9khcgRDmzQMtTyXY
         1cUl7fD9mY9hSYmj1gQ7/YPYth8KxdNxaGf2GTHjXyTI9WOtyrgV/GZ46EQDBhrOh2E+
         NXc8WZLNAQm4ly8FIv8HZ/5hwl8UF+g7IsLc0ZKsDM51ghSL89fD+2aPqJblSDZ81c5O
         DmpugiOO12AHfavcKcH6nFCMC732wtx8SFZ8XVtiRPlpG57KBqgoWUqkfRn5VhChvdRw
         R/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782857037; x=1783461837;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tw2gpsI3jiI4P6kujg/K3R9aQhlaG+bVbRj+g5z/Ff4=;
        b=TFFpI0RscNQesx7Tmu4SbKmAXqDCY2tZenAnw3H8rfMUIljrYU65Q1oU30DctE8/BC
         c/qfPozTF9ycQzNtgk1VD6lVYbd9V6Yy6BDJEboaV1LraeIo21K5D88iwWcY2BzvT2aG
         s/yM2N46JKXPxaFtqTVTxkiNKLMr36nxUMmC0rQ/cRz09yXAvFZ59FP1gabY2emJ9LgZ
         a8smbgcdSGqWwq0AjmxpuFpjtMK/yGLfE0JTevu+RL2UAbgvohSllyzdtFHVVrO4b71q
         zEznCebxnfGszNEX1ZIJIsF5GVpMrxygr8Td7OUG4drdHpMi6mxQt6vDtAsRaeTbF3ZU
         i/IA==
X-Forwarded-Encrypted: i=1; AFNElJ+nNdcB85dPtw36+iqMEf1KSxrwwAACFi9fACk3f96Z3z88XTIpfAu/Tg3R9wb2pT/g+QyS86P+A+C92ctg@vger.kernel.org
X-Gm-Message-State: AOJu0YyT2y6czqq1lhShwlZNv+GUT112y7uMwtP8VmAWE+YaxS2He+cX
	HHKCu1/6eMoCE1yKacw2NlXJsJCSSzqLlWL20smsHGekvSu32Imo/T6N9LLCA0PXzq4=
X-Gm-Gg: AfdE7cmHVIvpCTT0VDvgf998W1XjwJ5wVKv21LouV+hRqbAg4pQ6vTT1yFgYBy6tSvz
	Ztu9DI/ATybUnVjuxKdHRX2Bgg+OtF9E9VnLFft8evXUzx2Xvn5Z2whWXUWD5NA5jJ1Fuvwfnrd
	FE+HL/vmPuArnhzalKOCswMeERChTzvzvdoflDLQAEP4abLo88B505yQGNGqRW8RBLR+LGSxdPm
	slT1WGg6x7UKt3pdgdGtu0lGdPTGt2rxVBzRcPa2WehcpshHWs1kilcYk3/r2KjQ4s0tLuaYUNB
	r8vivGvy03njoFFk6PdFzglt3NuvplDTfJKBoyAydrn80wUSNAYXDoHZYJtuTQUQZNQ+W2DLcr0
	wfaBm31U+ot5WNgzJ3LoLv4CsrHSlu8X2KSwDeXFY0hyOIh1873HRVQF7gYdrgGYECLbjp5UMK5
	N3/e2QwbGTJswIkm+i/ZQVY7v34A==
X-Received: by 2002:a05:600c:6290:b0:492:40f2:4d78 with SMTP id 5b1f17b1804b1-493b827ee28mr76178765e9.2.1782857036849;
        Tue, 30 Jun 2026 15:03:56 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.103.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-475643cd85dsm10663533f8f.15.2026.06.30.15.03.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 15:03:56 -0700 (PDT)
Message-ID: <9898d7cd-45fb-478d-affb-d3cf0e7df8b7@linaro.org>
Date: Tue, 30 Jun 2026 23:03:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] media: qcom: iris: use disable_irq() during power-off
To: Hungyu Lin <dennylin0707@gmail.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, abhinav.kumar@linux.dev,
 mchehab@kernel.org, konrad.dybcio@oss.qualcomm.com,
 dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <sum692CaNq_kIywmtjVJ3z0iG8qBK0eOdmOPYUaivwH3v6h9GxZZqm2_7vgbCrCOAZs-K0K9PejQsRXj1za4VA==@protonmail.internalid>
 <20260630152617.568-1-dennylin0707@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260630152617.568-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115549-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:linux-media@vger.kernel.org,m:vikash.garodia@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:mchehab@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C38A66E842A

On 30/06/2026 16:26, Hungyu Lin wrote:
> The IRQ is registered as a threaded IRQ.
> 
> Using disable_irq_nosync() in iris_vpu_power_off() does not wait
> for an already queued threaded IRQ handler to complete before
> returning.
> 
> As a result, a threaded IRQ handler may still run after the VPU has
> been powered down and access hardware registers after power-off.
> 
> Replace disable_irq_nosync() with disable_irq() so the power-off path
> waits for any in-flight threaded IRQ handler to complete before
> returning.
> 
> Fixes: bb8a95aa038e ("media: iris: implement power management")
> Cc: stable@vger.kernel.org
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> index 69e6126dc4d9..538659284c7b 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
> @@ -236,7 +236,7 @@ void iris_vpu_power_off(struct iris_core *core)
>   	iris_unset_icc_bw(core);
> 
>   	if (!iris_vpu_watchdog(core, core->intr_status))
> -		disable_irq_nosync(core->irq);
> +		disable_irq(core->irq);
>   }
> 
>   int iris_vpu_power_on_controller(struct iris_core *core)
> --
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

