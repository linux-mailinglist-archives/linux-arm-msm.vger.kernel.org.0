Return-Path: <linux-arm-msm+bounces-69058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B446B25593
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 23:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 618577AC42B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 21:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 298FA3009D1;
	Wed, 13 Aug 2025 21:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XM6yJV9B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1EE3009C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 21:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755120929; cv=none; b=eGMFcqrMhe+KAt+B3VIYLkIMXLJrvFtrG5VigXJW4ne5t6e5xqgkI9JEPNoxK1QTVfxE9cCjv2twPzQuuBNyFG8or80/HDRxT1/ykZNS7NZ81oW430i+rf6cxbtnZbEADUFVYGzZg+w3L5UeoSksm6zAXG06hZLrNgUaIBAmfHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755120929; c=relaxed/simple;
	bh=JGDu2T4AA+CwFqW1EWB3SqKUF4ftHO3YFhNGuUoTrXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eOO53VPTJEyTNFnYDopM/2608csQfbo0YNwwwHWaJJ4ZnePnOvfohSPWdO8otDmOIR7diswwtBoppPpegsd4U4nTdXWHS6pod+7GWjLuuT1o7oy414EnqG4CYdTcj08T5aUfNGqjaMwYgrTNPBoIuCENSp7tgRzbQVxx3yGYLwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XM6yJV9B; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b9e4147690so129049f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 14:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755120925; x=1755725725; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1XmXvWLJhlSpXOiiF4u4DdYe3hF2nbQcNLrAb9SCIeY=;
        b=XM6yJV9BoOnoRAkb5h86O8AqyjJ0vfzee/TziE2sAtZcEQi7STm390P1mSz5eCs8CO
         /LYLBDbAneeruufG9ECE0OHRq2T8riYy+Oh3PCtVcdalXsKzF+V4/nC469rs+ICActbw
         bI4/UiU4wXFdd7znphMoNbzv5/yBDedA+YdR+cweWw66w5FXc1CSXeMluDdrFB8tJAsh
         x+3MkJX3+r43WGJJsSORTiOQJtpe4NsmDwLv+f0kwEvNQeLmV6TQls/abr6bBVCAhHOz
         wmYjKrcMnwOed80/aeIvTeAIxLRN5vy2FpdiPnqfBTQBxXfI0BAL8ECWLNwXZP9E+71+
         9xIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755120925; x=1755725725;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1XmXvWLJhlSpXOiiF4u4DdYe3hF2nbQcNLrAb9SCIeY=;
        b=UYmOn0dCUTSJ5AzpA8nz2SNbRtv8fGwogits9cNJLkaJVBzwans6WRoQbIfBsHwp+z
         lN1HY/YC1qB5GqE94xyhdkqNjbtKgUNaBi1tL8rueLiNQzZUC5ja/jKbiINd/OIqMnUe
         qYckMG77OQI49lbKFdwfi9RaIBp05YcFHtRm1MKv6gECo/ZTebh93dk4OQ2IyiOdq9oQ
         qp5/p9GWTmIPyZu9uBqublXkprOHKlkCE9ziLuxk5aIFhptafSokqk++hUrdhkUua7h5
         TwHODUg0nY1VrOezpwDYT0oNufppPGfEitB4P34QA318+JZEWClw1so+jPuFFjiTJb69
         yFFg==
X-Forwarded-Encrypted: i=1; AJvYcCWkGCvvghDQYJfiFSmAOlFx+nv7lWJ7rLCR+/wJ7VbBwBsvnJf+NGsXmBzj2fStWl9vv275PMKKuoxRAPRW@vger.kernel.org
X-Gm-Message-State: AOJu0YzislMv2ou2EXNRex6eMX8W0/no3WfOnO8B1wo4EL/FvZ3Ioha1
	LqXhuEP7BbtLAmOGrTtGVqZTuGP8MUG04n3CaprXzGT6lk8DzZTeMD2cMtBrX8Em/gc=
X-Gm-Gg: ASbGncvK5XcBJpN782l64BKjkdMRjlVQj1HAxS8gvcXgWySGuROBrV9bZrZtZ2S0voH
	MhzNlE3uqruy0vwisTCyAnJkc5sRaDeDRrdS0DTYJVqkoBkATAIQkmdHLbOC+uZq3rNXxsTjMg2
	FxBFWfVXvs6JW44AmO+JndSr6vfIUfJquj61fNI4nqARnh1w8yRToGHWgBg1aZhLrV4TvYx+Hpo
	IJVPyTs5kBLjhE4DFOzzhorZNDAXwUDbbW/9QHvME4+71Uqv1XYRnZXASsg8Jmh2VVKOTrNYNRQ
	6zExj0CLluQ8EpzUOqowTTMzeiwp+AQ5ql4P4lVsb66Gupy5s3b4r1fmjqrmuu61ces10BgxDBJ
	ibQ0QcyhG0kQPqpuD4xbWx4tvuWdG5FGtjJGXUEnn5CPF4sZW8aDYbyTG74J/Em++
X-Google-Smtp-Source: AGHT+IEXpcW7O5Udyxtt77HddjjtyRdwKlGTXAk1h299MQ76Ljg2rx6jkkZiaE782uOxs2v38udmMg==
X-Received: by 2002:a05:6000:25c6:b0:3a4:dc2a:924e with SMTP id ffacd0b85a97d-3b9e7438457mr554485f8f.6.1755120925461;
        Wed, 13 Aug 2025 14:35:25 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm48738067f8f.39.2025.08.13.14.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:35:24 -0700 (PDT)
Message-ID: <0a049417-6545-4cdb-95cb-cf41c810b57c@linaro.org>
Date: Wed, 13 Aug 2025 22:35:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] media: qcom: camss: enable vfe 690 for qcs8300
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-6-quic_vikramsa@quicinc.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250813053724.232494-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/08/2025 06:37, Vikram Sharma wrote:
> The vfe in qcs8300 is version 690, it is same as vfe used in
> lemans(sa8775p). vfe gen3 have support for vfe 690.
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>   drivers/media/platform/qcom/camss/camss-vfe-gen3.c | 3 ++-
>   drivers/media/platform/qcom/camss/camss-vfe.c      | 2 ++
>   2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> index f2001140ead1..22579617def7 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
> @@ -13,7 +13,8 @@
>   #include "camss-vfe.h"
>   
>   #define IS_VFE_690(vfe) \
> -	    (vfe->camss->res->version == CAMSS_8775P)
> +	    ((vfe->camss->res->version == CAMSS_8775P) \
> +	    || (vfe->camss->res->version == CAMSS_8300))

I'd really prefer a patch setting the CSID and VFE versions as 
properties of their respective data-structures.

BUT, again this will do for now.

>   
>   #define BUS_REG_BASE_690 \
>   	    (vfe_is_lite(vfe) ? 0x480 : 0x400)
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
> index 99cbe09343f2..1d40184d7d04 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -344,6 +344,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
>   	case CAMSS_8x96:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:
> @@ -1974,6 +1975,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
>   	case CAMSS_7280:
>   	case CAMSS_8250:
>   	case CAMSS_8280XP:
> +	case CAMSS_8300:
>   	case CAMSS_845:
>   	case CAMSS_8550:
>   	case CAMSS_8775P:

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

