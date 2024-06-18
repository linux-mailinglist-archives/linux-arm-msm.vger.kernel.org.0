Return-Path: <linux-arm-msm+bounces-23000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BBF190CA24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 13:47:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0B56E1C21C5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 11:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 778D6158DD6;
	Tue, 18 Jun 2024 11:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iff/+Dct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FAD158DD0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 11:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709196; cv=none; b=WqnXfv0EPnN/ImawBPapz53PceL1abq6MD0T8NQStzR68GeKJq0Un6j7Ie54mgZgYswFUdmZvTB9GCssV25W0FKBhloDZvckksR2S2pyB89Q7yY7HFdxkEu/Ggbs9UyvvVMRtcRvmnTejaW3rxxa+TuTPgPe1wl32xuWY51asnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709196; c=relaxed/simple;
	bh=ygTqAmSf0IfPNGq1Shs18IB+YIEVcTNMo1JV/OBncAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z9AJqlxZUc/JZ2BpJCZvroIzdsgHnb15EDBZbjvQyAb7nr74gEvqrJF8kYFw5VsaX3WESpz1FgDygBGeuIa+oiAxZlPq0l6PPdJ5neh37xvuSeUYn/3UQNlb4NXbA+zTtoniPcgJzBI1Zz64MCiX/n8AlB3spmMsNFTeidYdqz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iff/+Dct; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ec0f3b9cfeso47089361fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jun 2024 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709193; x=1719313993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZUe7gF67J9gDxOaoNUrJWpHp/2/v3KlOF4371wquz0=;
        b=Iff/+DctX2C8u060DPaW5Ae9G0SgfAFh/WdUObvWJAw1LTIMIQSTXD72gSDy07veK6
         mFTU50XZwD6bkKvQlanhExsmAS+3Ir/MBN3t0azcnLOl1SYfCKIGlqcOp5czLjFUOGsK
         khpOUITl6zJxzNXBH9wmINluZwfTHOx29/U6AGuMjM9M3TOBgTFFuMbgg4GXBf2ibMhW
         umzBOej+RK3ePC0Vas70Q6RfQkWnjqG0k8p5fLHZFGFwEBHO4g94UCKrqgew0OyfWU+H
         5xzmWDyP/cijUHsYUfzf+thQHgFsWFls2yFP0MqTa4mDs8lzbDr+Yuh1Sx8yYM/ZjIDV
         kUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709193; x=1719313993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZUe7gF67J9gDxOaoNUrJWpHp/2/v3KlOF4371wquz0=;
        b=ac+f2s2l8SBYXYlx0/heEsxo/gQKv0dKn4K88sPuEn9bEU2Am5GThClJkcmr6Lx5Tz
         AguIkkpAPDNBjpT0WfX4TOpOwTvIz4/71VPPJp2iX4ILw08ZMcIEqFFNifP2KhC/v1S7
         aMNedWxpmH4DRfuWdi8ghnhnHxN8Ioe/IK5LIvR1vJhbo7R9EO8ju2ECxKd71Y6s6GeA
         m6zdkiOYu+/Nee6+yoVvk4PkGrrdN8Bg+GRzx0iYN2vDflzPa9VbYPVey4EBTLPg1UYH
         VUu2bOynL0N2EdCIJS59Z0NnOypDBX9Yx8ruQ+icGpnPweuDHC7a+YssvLJ+R8RUkPxF
         Sppg==
X-Gm-Message-State: AOJu0YzQAxda/uTZsQ+WertiLT3wgVZazV4FJ/nvUT57g4F7qrh0fgAc
	UlJ4/MoaYZ5JUMLbkIu6fVjfKu9JzEUxULkTgJiush4AipXz9BrfDQFTGcf8KaM=
X-Google-Smtp-Source: AGHT+IFvHh/ds3YGzEZJqogwunAMiM1SJOHwoExwr3tTrv56ocyHxKE2bN01RmdOChtzhx+k1jIP3g==
X-Received: by 2002:a05:6512:15a:b0:52c:958a:4afa with SMTP id 2adb3069b0e04-52ca6e65889mr6824542e87.23.1718709192614;
        Tue, 18 Jun 2024 04:13:12 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cbb24b860sm652495e87.191.2024.06.18.04.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 04:13:12 -0700 (PDT)
Message-ID: <c3ab8619-2842-4e90-883a-04e45fb18394@linaro.org>
Date: Tue, 18 Jun 2024 13:13:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] drm/msm/adreno: Move hwcg table into a6xx specific
 info
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-5-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-5-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Introduce a6xx_info where we can stash gen specific stuff without
> polluting the toplevel adreno_info struct.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 65 +++++++++++++++++------
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +--
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
>   4 files changed, 67 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index bcc2f4d8cfc6..96d93251fdd6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -7,6 +7,7 @@
>    */
>   
>   #include "adreno_gpu.h"
> +#include "a6xx_gpu.h"
>   #include "a6xx.xml.h"
>   #include "a6xx_gmu.xml.h"
>   
> @@ -465,7 +466,9 @@ static const struct adreno_info a6xx_gpus[] = {
>   		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>   		.init = a6xx_gpu_init,
>   		.zapfw = "a610_zap.mdt",
> -		.hwcg = a612_hwcg,
> +		.a6xx = &(struct a6xx_info) {

const

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

