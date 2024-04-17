Return-Path: <linux-arm-msm+bounces-17783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6F28A8F9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 01:44:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3A11B21385
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 23:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5225D1272BF;
	Wed, 17 Apr 2024 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hIi5bZbV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2EA85945
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 23:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713397448; cv=none; b=STvSn49NPksfZxhL2yQAmCBnINnLdlUjTmErSAFwQu8o3DZXcLbpi6gW7mijeM/SoXDfMy4KtO4CozNcEpgGw4lZ+cWA844jui8RcsdJQcgpBwZw+/djSX0mUjJbz6wcA2SywqpYzXumzhdLfVi1A5aKpd0DxKrKPAGsZCcUAIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713397448; c=relaxed/simple;
	bh=UaZ1PhBhO3QCAsKNZAAEh3te/Tpq/ISFTdys8kgJiYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n9fDbK136n9lQDHD7UCZ5AqGBstxvaXPqECQsEBWWp7QNC3u/AudEygznSdV22kSd5Pye2jVW6Wp8uqwvbRjWa283h042SREQgChkc1N8kY5QVz9HjaLEtZ7KUUX89bhSjyJp1TvW8lpLi7wxonOpG63Z12+A58rBx8JLYvLxSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hIi5bZbV; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5194a2cf7c2so226122e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 16:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713397444; x=1714002244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4dYJ1ClH4O5pb9/mVyQ9/1Y0nfz72c0FqGgqO6+NBFs=;
        b=hIi5bZbVJAmj/aLD2UtlSP3OiAgSb5JWlL3hjWHNdYOrxCorpTja2QLYhKLdx+mOQW
         4Lnoyt3SN0Gth07UYqP/xWCkPP9e+Vtr6BlH3dTp30um5+FpXtoQQMW1qSKvEgoIhf78
         J8fw4IInAjSCX4c+5cX6JbSNLJMOFhzVbUb3R/T0B8CZBontrH8kEX9ofyXSl/iX10gQ
         NkI32jhy2diVNX0yGemH0/RHWU1dA4QGPICE218JvYJdhITO2GRjt2oqP/KO5mTLS062
         KJ9b7ZCCSqP1m/Ivl4OxJedyMTxnUFwEUkfZe6JGqMlhXas3iNEWyIfMVTcr1Ifh+BcM
         fYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713397444; x=1714002244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dYJ1ClH4O5pb9/mVyQ9/1Y0nfz72c0FqGgqO6+NBFs=;
        b=VhY57SzZbE5xn3Wv6R4nuLaC4mLlrjA+ubnNo3ZouPwAbplj7eCrycWeYOniWjsagd
         LpFDCjJGkArZ4KeuM1SwvRdA2NXc3WynBIzoOeu5tS6ryr3vdqMjcuSYC9t/4tSTwce7
         PsaK7rzg5IhncGz42lGGvHoGWFFgE6t4YFBOW60XN0qtt/y/4K35L35Nb8vGa6FRsNKQ
         zBVodAnt18hREPxf7/1wA3JDexUgei+9MaCz3vF+CPJh8/iwu+Tacji08zs8m6IkolTa
         TqpyS/IyurV3vSk5pvYwqIuMcEVWlyb28n+1iNUYkL5YLtRLNq4M1qya5Xvzp73elmDn
         US5w==
X-Forwarded-Encrypted: i=1; AJvYcCWFyeyEy3cC6RgwViVjfhwUu3DKkkEk+rCkBUI6aSsteCrw+F5Q097JhFFeJ0Ej/XTifnoHMyFDniB8+fZ6/i6coEr99v18JLqeIB94QQ==
X-Gm-Message-State: AOJu0Ywhc2y05Fqmq2I6tUUDvwOmQ3P3Xyw7NLeO3QKfee2b0SXIvLGS
	/Mhi0v62hXUFC3pLv71xkS7xErh0vjC/NZ3fLsvAPyasjRbwCBs4+je0uRGg3ws=
X-Google-Smtp-Source: AGHT+IE5TTewc1NQU6pjDvIINRLdTRyEr93ooSR0k+a7QtvsqWnNHglfNzFwEISYjtKIqilM46tyXw==
X-Received: by 2002:ac2:5605:0:b0:515:cc50:9376 with SMTP id v5-20020ac25605000000b00515cc509376mr350592lfd.22.1713397443931;
        Wed, 17 Apr 2024 16:44:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id b27-20020a056512025b00b00516dc765e00sm37612lfo.7.2024.04.17.16.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 16:44:03 -0700 (PDT)
Date: Thu, 18 Apr 2024 02:44:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/7] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
Message-ID: <wuxp2yusymxlbmiktheulgw42aexmp3pro2ookzjppn6pxwz3h@ohj6jlnq6g35>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
 <20240404-topic-smem_speedbin-v2-4-c84f820b7e5b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404-topic-smem_speedbin-v2-4-c84f820b7e5b@linaro.org>

On Wed, Apr 17, 2024 at 10:02:56PM +0200, Konrad Dybcio wrote:
> Add speebin data for A740, as found on SM8550 and derivative SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

