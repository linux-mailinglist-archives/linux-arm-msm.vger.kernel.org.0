Return-Path: <linux-arm-msm+bounces-47932-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9738DA34B17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 18:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BAE97A18DC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 16:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B499E1FF7D8;
	Thu, 13 Feb 2025 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B6c9+SMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D477A200120
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 17:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739466014; cv=none; b=AIF30JCTsFiZqBMl4v2Y/I/M31UCXNXvIy94pO9GOrLxCD4/KCLpfpqwyi7i0K1l8bkepLgQ/E5CccbwBf9dtYzCeQj6/9L3Fb0uJyWBOQ+273Bwzf/3v7lrrIWqnU0WacH85YGeWDwPfyuoSuY42mFuF/ic3oc5alA0mVbwevw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739466014; c=relaxed/simple;
	bh=BtRN7n4xGXk239SdRnSmUkBejNJDYu6BWsjQYOPuYjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oswvdnkd6dXKnDggrKJUFCb5e5lS8QFIV3yLiSm+gX1dAa7PQnNIX5lqvrl3yQO2SVT5Owal0K6QsomBQKV1BdWwK9x/NG2NlKwmXe4gFLs12oYiQp1xESk9+fvjn5xxk7qStuuAWT4KJ81AgNG2MGuF1oqZjEjOs2qtiXP9Ryc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B6c9+SMx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-545064389d3so1167170e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 09:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739466011; x=1740070811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eLTdc0mnszW35pcuuPl/ETu0QFfOhGZjVUBzq1yxI/g=;
        b=B6c9+SMxWWo0B2lSykEu6ugROGyeyZqmYZwGGFJt9vLn/SIJwPto5rHrVW/tfCO9Bp
         s1D3mzUGJKpZjbnCU84VcVAQwcJPj5nMObD87XfsjKGA/yH/yxFpyCx1nC0hP063lRGS
         G0CsUucqLayhdADQi3sWrF6FhqmQHKX65SItV3GuvsUzli1vYZYUopRH+VsgEieHoqje
         gVO/bSV7gFBKJu7s7Wyen9wkKtwr/Qe9UgNG8lyoOjr8qqFGSI35lS50CNgWACaesaBj
         clQ3l94wd6ahuOY+DU9tMLXFS3U7GaFIr6BM+PMD8/pQdiYtUztkZkSa6Qq0XE6N22HP
         wlAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739466011; x=1740070811;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLTdc0mnszW35pcuuPl/ETu0QFfOhGZjVUBzq1yxI/g=;
        b=A8Uq3dCxUPGeF5HfdsncopDB/te8y0rEp6Gfdwbse90jixzxjxlWEKQ9pdE7Y1KsIO
         +zEVl+fLUprew6H01yvE6mtFiwyNQgF7Dt2lvBhFUbiH0QNGWd22cpf0O+5tkVP4n0xq
         kRoa+xeDBwu0/7dwqB9R0aMx7ZpQXEQa+LT9XGc6GRw2mkPm0z+IdNdCmYPQcgglEpAV
         R0KgsQo//YWmWA7gBJVlbFKAtCZl/9/7KSd0+wLXD+cg0vorBQefMVcZRASTPHutZ8tV
         spU2iDwMQ9asFQ61ZV9RT92mn3LvfShSeNG+onACWGYTPXdQ/yrxj/XfpuSNPM4Asq1R
         BdzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwGgLEKpZM5VRSZLc1zyJt1YwrcZs2ViXth33Uhe2gFRQES6hSGOnUmyoHsY1iwS6dKNdIupw4na13xZ+u@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+pFVmWYYb2EkF7Dd4h3zhUsp1JesQbptACa5WDEn9XeuyNnH
	tPQn0mE5TmxzW67/NWcRKMCf11lZY5F4zGdQCJo+pxWBx7j3naJGveRWhpZSx3o=
X-Gm-Gg: ASbGncs4orIGBdHNqux7FkgIeg8tD9ZFo/BconsHqCU0HECZ8CxvVSyeM1aOWfMnyau
	Hbm7k9NX0DP6UcUBZp5uIafURj+yCnK1NAa41vVRPQ8OIVwVZbPTDpR4X0PqxY7D8n9//PGiiWd
	UBdnw4+4StvRK4vpozpbZp7NPSmYx5J1MT7kMC74tKYSrn/EXkLTfORcGOMpq4Wlfqh6vIkPlmN
	KJKRA+CECVIu/fRDMB0Dwm6mvSf7bp9yrl5GSIXYInP0GmGoQrgVtDjqff1AdJW1/ZaGbaNH2Ge
	vhoD5sR94/qFAxx6RRLyQ8WW9HnmH3joNfVhv0L2lNe80uWl6bGV5IzA+EowsGPhG5RcG9o=
X-Google-Smtp-Source: AGHT+IECjSH9vRJLStWd+xD1ybGS+qcgRaQJyWQXD6FBqkvSQHj2aTj5q7HpRowg32NwdODaOMXJGw==
X-Received: by 2002:a05:6512:224a:b0:545:fad:a757 with SMTP id 2adb3069b0e04-5451dd99d0bmr1143047e87.29.1739466010776;
        Thu, 13 Feb 2025 09:00:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105e4csm219176e87.111.2025.02.13.09.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:00:09 -0800 (PST)
Date: Thu, 13 Feb 2025 19:00:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
Message-ID: <pgwuzwohvnvrw7ism5zuaigjjsljvqylej2tyjxeo7cpcsycfk@lusbxdvvbetz>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
 <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-3-3fa0bc42dd38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-3-3fa0bc42dd38@linaro.org>

On Thu, Feb 13, 2025 at 05:27:58PM +0100, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.

I'd say that this is not just to 'fix dtbs check', but also to ensure
that MDSS has enough bandwidth to let HLOS write config registers.

> 
> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

