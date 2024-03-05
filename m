Return-Path: <linux-arm-msm+bounces-13379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39387293A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 22:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A8581C20C5F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Mar 2024 21:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33B3129A99;
	Tue,  5 Mar 2024 21:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tf2xOb1E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF30134BD
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Mar 2024 21:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709673418; cv=none; b=AdNsupJOdMgJsw6N21Jwxz87fEw7LbetI1JcP+KdbKXntxi/v9c+D15d4083JNkBOG9jxh8GHupw7q+TeaxOprWI4EZbIEqBFESy/9c5g5HQwRnTqM4RHUxTOzW/fTrtFYnDkTusgCtco9f5/T9kbqZAnJqr01FkV8tzF6S2QtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709673418; c=relaxed/simple;
	bh=k3lbq9SSH8UrBjWLea184EF/re2YnLcUGUKOBhCs/kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+KJ9WOxcIjJFkiebwbB2VGTrOaJwoEZdE93Pe2DgLOBvoW150zrL46Ur/ZJnWs6gj31TfRF34uLUAouzDm/i5u821ViErRCntftLVcWBMVcguZkjJ4E3klB9IEI+OqztwUHJl7qtLcpzIVA+rHy3whYaUs0FBZBmPGzxF9IJLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tf2xOb1E; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5131c48055cso1429257e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Mar 2024 13:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709673415; x=1710278215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sVdcNBcoAiJYRV+66geixgS685+t5mEWuPqbixAd63s=;
        b=tf2xOb1EBY+vO9hm8WGSLQMrHT+iHTO2M80nGItdZ6xIcS5pijid4PlhT9FoOBVsnG
         lG1C3avrWGJJnU8WTuWrhas8TRtCUx8WYfTY5/S8I7thHhFDeOLiukHoRh/FFkHfSLU3
         nV7Ik4tkfQoqOZZ/UHyhTbMv5EdJl53zvSHinS6rzRM9FmVVUbb6fljkA3uvBFzW6BRc
         J8X4bB9z2ubZirvkCTwkZi3CK5LqA4AhsMfIMO6Cf8CadoHd37uBJXHARJ1oXC3EhAT8
         5IP7ENZrbMjy76FPRjQeaEe+4J3yx0iae1iMk8U+nQCUnfYc9L5whTwcEZemB23ZLJCs
         +/5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709673415; x=1710278215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sVdcNBcoAiJYRV+66geixgS685+t5mEWuPqbixAd63s=;
        b=dInpocg21z9wW/Cj7IeBKCzQZcm1aBCBG7GQ3uqCThV3u2g6AR+VhNOr0ciuXK8Hvx
         C7T/B52jdT8C+KQAiaT1Lu748jijanAL7Xt+8H9DywjtLqYOOaDUylCt3FjDQMb8+5J7
         WZrcIJcMR1DBAVZO6Z6G4hsc4gASj587/Gcl0WMOcS8p8M3Z6+h7IsgWMwG1QPTIuLG+
         MMjo0tX0KV8VoRSLA2TbWcgOgkFyMMREhhSBlxxSo1kegxPAoadSIzv3n1k/xhSons8o
         oMnGdiYHJeKJEZXcngP6CChFCqLJj7mhc2E122mQP6JFH1Vl4dsIpAyCh/AeBtqREKyU
         Br4w==
X-Forwarded-Encrypted: i=1; AJvYcCXbql33dO4udEbF6dgnjfhKc38+CV8N8TZ+fIgWrTnQyU6kfre0x5W6jgHMjgu0kyHv0aCSLwlqKEqMVqnu0+3OejmTCqdIqMy90ghW1w==
X-Gm-Message-State: AOJu0YxvEejzEbcWt4MTA44pk4SQ2FyodIa4Hs1iIQIm1JV7C/7tIZPq
	3UDWOgLi2NZ1GTys2jrjEJQxJWZtGogCA9mNhacHiq2yhZ28+BJLm+25Tf4bWtc=
X-Google-Smtp-Source: AGHT+IH3Hd0YBY5DKLui7FOvR0mfzUmy4ygWjHSTygOgSbAzcr4xkbf3ukYBlk9XCz0pNxVe8jB4HQ==
X-Received: by 2002:a05:6512:3055:b0:513:2ead:4f86 with SMTP id b21-20020a056512305500b005132ead4f86mr2610715lfb.12.1709673415066;
        Tue, 05 Mar 2024 13:16:55 -0800 (PST)
Received: from [172.30.204.154] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id i10-20020a198c4a000000b0051330fe710dsm1994042lfj.169.2024.03.05.13.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 13:16:54 -0800 (PST)
Message-ID: <d784e46d-974d-4bf3-a2d3-491e7ad19701@linaro.org>
Date: Tue, 5 Mar 2024 22:16:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] slimbus: qcom-ngd-ctrl: Reduce auto suspend delay
Content-Language: en-US
To: Viken Dadhaniya <quic_vdadhani@quicinc.com>, andersson@kernel.org,
 srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Cc: quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com,
 quic_anupkulk@quicinc.com, quic_cchiluve@quicinc.com
References: <20240304135000.21432-1-quic_vdadhani@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240304135000.21432-1-quic_vdadhani@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/4/24 14:50, Viken Dadhaniya wrote:
> Currently we have auto suspend delay of 1s which is
> very high and it takes long time to driver for runtime
> suspend after use case is done.
> 
> Hence to optimize runtime PM ops, reduce auto suspend
> delay to 100ms.
> 
> Signed-off-by: Viken Dadhaniya <quic_vdadhani@quicinc.com>
> ---

What determines 1s to be high and 100ms to be low enough? Could
you share some more reasoning?

>   drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index efeba8275a66..5de45a0e3da5 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -81,7 +81,7 @@
>   #define SLIM_USR_MC_DISCONNECT_PORT	0x2E
>   #define SLIM_USR_MC_REPEAT_CHANGE_VALUE	0x0
>   
> -#define QCOM_SLIM_NGD_AUTOSUSPEND	MSEC_PER_SEC
> +#define QCOM_SLIM_NGD_AUTOSUSPEND	(MSEC_PER_SEC / 10)

This could be a good opportunity to inline this value..

Konrad

