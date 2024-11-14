Return-Path: <linux-arm-msm+bounces-37863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C603F9C81BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 05:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 08DF6B248BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Nov 2024 04:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0BD71E7C2A;
	Thu, 14 Nov 2024 04:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oMxHaTOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6391DF72E
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 04:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731557450; cv=none; b=W6OlQKfRXOZBrPHDk42vYnCX0n/kOMYU/QADWE0dFNknQZm4+2yiRW+RUbQ2Xa72RYOmF9cqEliHiUO4SNK45zDtLuurVwvpU8ixOU656SMiURhCYQ3Uzk9GPTU91eN0NPsc2s+0Z1zyoAxxB3g99dHOh01KuKFYQJ89xFJpo0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731557450; c=relaxed/simple;
	bh=uZK/kjouv46+pdbCVKgjZCD7+R7rCdyQnqk9U8cLUb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3+YiX7fmYBRodZXBpv8hzLClchMOq++9Gj8qFuv9dQ8mgDbK4rhK/nAkJRcKcCBsHraBtQd3pmTTMg0zrLN6BOwZTQc5G66GyT0Ys+/OsaiSA+N5PKzuz48tLEhW/ioXaJCnrEKQWy4gIMUvMBt8kFLpUcIhTgKdUY27Pvn91E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oMxHaTOQ; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5ee35ef95daso58848eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Nov 2024 20:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731557448; x=1732162248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=714o0ZvV3ReDS0/ENHf9k2aMav2Bj5ZxwGFca11krmI=;
        b=oMxHaTOQuJ+ZeRi96lBia1ko9dctULn6RDPKA+josLthmamfWU/FWnyT3kWgv1KJ65
         tCgfP7jQ8CqwLwg7wELLVTfG3205acLLL8qHAo2G8+V2myVfVqNHt47yYQILHGXu3Hr8
         wIvnr44xkuheK2r89wwUpmNbukvraKcV7qQaOy3ToCowh9dSJUyf7IU+EpBDkmFoQ/8M
         Al9gUymX37j78SZw8Der9o6iJEtotqq1Yc5Pc5Buyl8rv9Vfe0fN54CQqqS1am1I5Ehu
         DxgxlQe7rOBGshZmq3uhu3VDcKiG9QXj+Leo8G2RRFKJQRDE//hU+liODNKYrjpnExma
         Brtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731557448; x=1732162248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=714o0ZvV3ReDS0/ENHf9k2aMav2Bj5ZxwGFca11krmI=;
        b=u/453lcyGnLPWlrRuWN2KuXpiWlFfw0LkR27VheCZjw/PLycADUAXE+r+XIVle5lbS
         uEsafEizkwHBGio57dZAUmNENTiCB8TKKQgs9JhDSTUgYDTPC1c+nXUIo94rLJhkCg6s
         YjmEB+smuo7tlysUE+fKGmHJQjNRelNnALl5siuhTJZ3+n0wg24r5fJjv8HF4q5Rr/Dq
         vtxzo0ZVCSoRkWHmOhj9rBiZzS/q5OWTpRe1Twm1kU4se9gOBKOo7ycMCqikYRUIuAVP
         uWQ7eLsehgRioQvjoaP/zIydRtBUEEQMD2ADDrtFx7xgFZFLmIfW9gbByE6o/g9yLDzZ
         e+BQ==
X-Forwarded-Encrypted: i=1; AJvYcCX21jQDXjdMONUJ34PJG6YhsXq1zIgeL0gi5igMzrSWU9KlgtUV/IKDiUS7ZTpFAW0UC04JmizXK47SLr2z@vger.kernel.org
X-Gm-Message-State: AOJu0YyphuhrFGqUaduvdpqZvuKGwunhVPc04MNz1gt+8kEfw7wmzeo4
	kpvbebJ2IDyWZwDnd6L+sKJmLKAiiSztsRw/CKdxXAnluGf+ZNd5PhN41absVJc=
X-Google-Smtp-Source: AGHT+IHhmzaCqJTL1FZBlYi3QTXBwW4hYnnT5adF5L4Dt+rljYzEGjLvaeQoWgOAVbjH16kKWY3SWA==
X-Received: by 2002:a05:6830:628d:b0:716:a62d:a8ac with SMTP id 46e09a7af769-71a601079a4mr6592178a34.9.1731557447938;
        Wed, 13 Nov 2024 20:10:47 -0800 (PST)
Received: from localhost ([122.172.86.146])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8b39b3ad9sm129628a12.81.2024.11.13.20.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 20:10:47 -0800 (PST)
Date: Thu, 14 Nov 2024 09:40:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 1/8] opp: core: implement dev_pm_opp_get_bandwidth
Message-ID: <20241114041044.esfazw5mv6zfyrix@vireshk-i7>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-1-3b8d39737a9b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-1-3b8d39737a9b@linaro.org>

On 13-11-24, 16:48, Neil Armstrong wrote:
> Add and implement the dev_pm_opp_get_bandwidth() to retrieve
> the OPP's bandwidth in the same was as the dev_pm_opp_get_voltage()

                                  way

> helper.
> 
> Retrieving bandwidth is required in the case of the Adreno GPU
> where the GPU Management Unit can handle the Bandwidth scaling.
> 
> The helper can get the peak or everage bandwidth for any of

                                 average

> the interconnect path.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/opp/core.c     | 25 +++++++++++++++++++++++++
>  include/linux/pm_opp.h |  7 +++++++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/drivers/opp/core.c b/drivers/opp/core.c
> index 494f8860220d97fc690ebab5ed3b7f5f04f22d73..19fb82033de26b74e9604c33b9781689df2fe80a 100644
> --- a/drivers/opp/core.c
> +++ b/drivers/opp/core.c
> @@ -106,6 +106,31 @@ static bool assert_single_clk(struct opp_table *opp_table)
>  	return !WARN_ON(opp_table->clk_count > 1);
>  }
>  
> +/**
> + * dev_pm_opp_get_bandwidth() - Gets the peak bandwidth corresponding to an opp

s/peak bandwidth/bandwidth/

> + * @opp:	opp for which voltage has to be returned for
> + * @peak:	select peak or average bandwidth
> + * @index:	bandwidth index
> + *
> + * Return: peak bandwidth in kBps, else return 0

s/peak bandwidth/bandwidth/

> + */
> +unsigned long dev_pm_opp_get_bandwidth(struct dev_pm_opp *opp, bool peak, int index)
> +{
> +	if (IS_ERR_OR_NULL(opp)) {
> +		pr_err("%s: Invalid parameters\n", __func__);
> +		return 0;
> +	}
> +
> +	if (index > opp->opp_table->path_count)
> +		return 0;
> +
> +	if (!opp->bandwidth)
> +		return 0;
> +
> +	return peak ? opp->bandwidth[index].peak : opp->bandwidth[index].avg;
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_opp_get_bandwidth);

All other bandwidth APIs are named as _bw, maybe do same here too ?

-- 
viresh

