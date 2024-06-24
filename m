Return-Path: <linux-arm-msm+bounces-23962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E9914F36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 15:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7762B281B8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 13:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C95D1411F8;
	Mon, 24 Jun 2024 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gl3KhjHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACDA1411EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 13:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719237238; cv=none; b=dUhK7yvccV39dA8c0GNC922IkaqYGvjzZ28FoGRBW1AdGVXa5qKhFtKo4N3gNmdnIoNWIYdR5SZv16um+6b/CjcUCAWbQ/Z1ND9Gc0Yo6N062QyiE7brKjh3i2dsngc5/Cw/+3i+RyPoQeIMsF3voatxS5N2g1n5RW4mggcfYGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719237238; c=relaxed/simple;
	bh=k2kNvre2Me0LAngo+HM9BUoQeYsmECvhu4GbqQWpJTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMVUJhzIuFSxP0fNN9itjrEeFybbKKAQt6d1o/Wl+BiOuChx1ZPbG9gPc7/vaAd2rfS8yr1J2pGtcDahIGMknKs3ys/kdb8N12oLzg7PBs5N89aAx3Pi1UcsvR21+ARlzmaHtQS6PrqfSYY6qj9knz2y7yiEnHYQNfR0g1OvP4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gl3KhjHb; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ebe6495aedso45709531fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 06:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719237234; x=1719842034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5S10zLLSMGCffMYd/h+/RimKZkqJmO/jBCyUz/wexOY=;
        b=Gl3KhjHbwZqtHAzZ4el7rCBtXTYlg47WVzN8kIIaHmESFqdySdfK1EWaGg+GQqIX0l
         bcXET+QIC2dBTWH2rF6nvMfvq+qcnWBs58IzzXJ/00rUXkCKdPV4h01JR15L/1YYJX7w
         geV5M27VpSwvDIPHNdzf0TE3ZLb69KR5IW08/xCJ/n/CAfhT5/pEsejkUmpO6kHWbK3w
         Vuf9kZRQIZ/ggMAl2qieqGYWKf4Tm6SkBr4OpBQl/wVOPjDDWVwKaHIXMUj9f41pdnyd
         gnypJWFRzTDPYOghfOg9oRrIIYsp/5JpCOa5Bppnc0PvbqlLHp29WTmH5uDBUM/vbttn
         KKew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719237234; x=1719842034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5S10zLLSMGCffMYd/h+/RimKZkqJmO/jBCyUz/wexOY=;
        b=HzctUCtJgpalOa7DYH3KAsIJS5rkJ1z9yLJTBsvWgJwX1FGo6+N2UPXTrDWEaTCCyh
         I1m/OXvyL7oAzKuEfog6RJh5PT4UOb5Ne3F0l1e4zACe0xU579U06Rb7ZiMD9fueaFTo
         bH/lxiAhk1sg/+baoaJYjTH6ZF/odhzD1ZFN2xAZU6lTh88tPQtRY/mYmeVo2b+88cHB
         CCyCowwRhNQLFq9yuBqCVPBucAGnL9O2NKbW5yRwrfu/hG2t/LVIKWRniM4VfTmabaza
         wI/ajIHyv8X+LxLLIzZhACe9KGC/ldBgKMoQXu+XKXxapKepW77czJUWZkfFQhY2uVPB
         72Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXRQgnv09iGJjBFU2lGP/qWuIl94XWSymAg9SGQcp7QZWfDMSYGkOPY806jeHB55AFfmZcoOVCXHylLX5ISwjjigjNO0Lar0b6y7Ibm+g==
X-Gm-Message-State: AOJu0YwTz0vvyPQMTSPPfA9MAg3PbQ0tAwlFvykxFD2CVZcX/PYy5/vD
	ctaD8F53BSNXRE+61BrKKfPv0cwSn0wnEW96J0oEZuXbVi5yXL7vOmPL1zfq9WQ=
X-Google-Smtp-Source: AGHT+IF7G8yRO1cSo8vqHH5UaeNqcbHw+S8TNtA0Ju96Wb3SODipWZSK3i2ngTmztbBS/byXZ+YJCA==
X-Received: by 2002:a2e:9b55:0:b0:2ec:50dc:af8d with SMTP id 38308e7fff4ca-2ec5b29fc03mr26068691fa.12.1719237233248;
        Mon, 24 Jun 2024 06:53:53 -0700 (PDT)
Received: from ?IPV6:2a00:f41:c03:9198:7df:6a16:3e8e:ed7b? ([2a00:f41:c03:9198:7df:6a16:3e8e:ed7b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30534e35sm4701537a12.62.2024.06.24.06.53.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 06:53:52 -0700 (PDT)
Message-ID: <5947559d-30dd-4da1-93cc-a15dc65cb77d@linaro.org>
Date: Mon, 24 Jun 2024 15:53:48 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/msm/adreno: Add support for X185 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Daniel Vetter
 <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
References: <20240623110753.141400-1-quic_akhilpo@quicinc.com>
 <20240623110753.141400-3-quic_akhilpo@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240623110753.141400-3-quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/23/24 13:06, Akhil P Oommen wrote:
> Add support in drm/msm driver for the Adreno X185 gpu found in
> Snapdragon X1 Elite chipset.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
> 
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 19 +++++++++++++++----
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  6 ++----
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 14 ++++++++++++++
>   drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>   4 files changed, 36 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 0e3dfd4c2bc8..168a4bddfaf2 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -830,8 +830,10 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
>   	 */
>   	gmu_write(gmu, REG_A6XX_GMU_CM3_CFG, 0x4052);
>   
> +	if (adreno_is_x185(adreno_gpu)) {
> +		chipid = 0x7050001;

What's wrong with using the logic below?

>   	/* NOTE: A730 may also fall in this if-condition with a future GMU fw update. */
> -	if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
> +	} else if (adreno_is_a7xx(adreno_gpu) && !adreno_is_a730(adreno_gpu)) {
>   		/* A7xx GPUs have obfuscated chip IDs. Use constant maj = 7 */
>   		chipid = FIELD_PREP(GENMASK(31, 24), 0x7);
>   
> @@ -1329,9 +1331,18 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>   	if (!pri_count)
>   		return -EINVAL;
>   
> -	sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> -	if (IS_ERR(sec))
> -		return PTR_ERR(sec);
> +	/*
> +	 * Some targets have a separate gfx mxc rail. So try to read that first and then fall back
> +	 * to regular mx rail if it is missing
> +	 */
> +	sec = cmd_db_read_aux_data("gmxc.lvl", &sec_count);
> +	if (PTR_ERR_OR_ZERO(sec) == -EPROBE_DEFER) {
> +		return -EPROBE_DEFER;
> +	} else if (IS_ERR(sec)) {
> +		sec = cmd_db_read_aux_data("mx.lvl", &sec_count);
> +		if (IS_ERR(sec))
> +			return PTR_ERR(sec);
> +	}

I assume GMXC would always be used if present, although please use the
approach Dmitry suggested


The rest looks good!

Konrad

