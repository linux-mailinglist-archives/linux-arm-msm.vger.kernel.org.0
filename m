Return-Path: <linux-arm-msm+bounces-20473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B458CF135
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 22:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60A6A1C20A20
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 20:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AD4128396;
	Sat, 25 May 2024 20:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+v8kcaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C6A127B7D
	for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 20:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716667871; cv=none; b=hYlpS00GqFcArlbUMWGcxjWibjU8fdWMuXdPd4gKXtpBRQu/4l3Ke5qMv5buBQipCgHeEcYSl5g/exH9fOwO7pZqeizykQ2XdYRw8TordflG8RPyqbWJwfvfUrQFXXcm/82KzPwxVtmGIu+uD9fiQOt3FMR8AwYBaQqXO45ktew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716667871; c=relaxed/simple;
	bh=dQI/5SlCCSGM8/NujvD3m7waqzbqicwkfZxpKUg2ZCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eV7+7grXzqrQdTRQDISUbLcv+xNVhNWTvAcurSSedBY3h3xNwLLos2fWjhzc4VuODn28mvXT0/KQRukB2uj4ud8rtILQfQmY9J6dAWLIfMdeZEKjeg+QcNoH7wSzzAsQuMiSLPFMlUuLNVEOWJjbbsymbG5g94qWXv+mu/wAgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k+v8kcaL; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2e576057c06so99429701fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 May 2024 13:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716667868; x=1717272668; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yaoDKdjFI3h12KWVoOCk4ZnWaN/cN1Wp9VMoWd3wrgM=;
        b=k+v8kcaLAo13lnMqfrRnf7vaHJUaoc69rOUO64StiFMbn7FgJD09d7LN/QXUIAElWA
         AZ+P+ZUPo/4qEhX2lcFRt/sbGkg6miL2yO1NHb29ZWMGGOpDKNrym/WERMHaYjyWH4Hs
         EOYrwsCFodMs5PO9/6EYadF10hFMrywf5YyZ6+tMUuyIwUWeiEGGo2Qu7NS3jVYR76TX
         bs7T53YhU4esn4z9AWbaLzLBb9co+/Qvl5+gkuOFRUODFQ6w1SI5ryDhpvlBpkH3YDNW
         bxOa22qerJpF3RU4J0fYElWYWZYrJPIax7d8EwsOiVn/usq9reRS5dFit+7MSeVWcp81
         NYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716667868; x=1717272668;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yaoDKdjFI3h12KWVoOCk4ZnWaN/cN1Wp9VMoWd3wrgM=;
        b=hxVTFtZK5WnjsjVEhdSroDkKhLGQMc1CCdqDilLHJgK6Yj/fcjJ32Yv8BXIhaB5VrF
         RttqcovdgXNh0HnX29KHcc8peuEWK231jKJ3DUl5l2j4RMOfM8yOpXloam+c52+71TcK
         bTg49B0pU9csyNUS8Gzktd5hYYNipbOIuJrKT9pgC5nkn3LZZVtjSy7DbH8kodHOF305
         +fC8U8GQ/qDLbnkHsfX8d41hHdeZ040zNNGEyMN3H9BLK9TS3/2hsw3RHrAEqEf8rd4o
         EBvCjJGEPVpeL1vNzU9zMHLKUa6HtPP6Hq4wzXzu+kyB02+ihu7rhcTGJL/Dkii2I2Ki
         C8Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXjHPAqfnMlDOlO7xD8laWpCRK0aKLDgwPeOvwYXtrwZX5exJeMAI6h8R4uTHG/YLhs0fGNPLv+03JPzW6tld+beEOdyF2Bm6rHHlHa2Q==
X-Gm-Message-State: AOJu0YyBAnhUZVp0E/S+vLq2mUhQ23ZhgOKHAbFTUTzksckxFGOI4FXp
	3tjfeMHhCqowmB/5Npb7Z0VYJxXR5K7yoeU1ZnaleCCrHYYwLZeM5Czv76X9N78=
X-Google-Smtp-Source: AGHT+IHeXsRN5GYKWEn/GYdf0fZpg3A6I3Q1YApzT1j4NmJTvIFz1B63NRRCeikpUyZExi/Ir/p/5Q==
X-Received: by 2002:a2e:b60f:0:b0:2e6:fec1:dd75 with SMTP id 38308e7fff4ca-2e95b07038fmr40415881fa.8.1716667867949;
        Sat, 25 May 2024 13:11:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf47a4sm8779641fa.57.2024.05.25.13.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 13:11:07 -0700 (PDT)
Date: Sat, 25 May 2024 23:11:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sc8180x: Correct cpufreq compatible
Message-ID: <sjmrxhb6e73yydvb2w2tnb5crgulyajjxht2zfxozfflrexfam@h5yelxej2hvu>
References: <20240525-sc8180x-cpufreq-compatible-v1-0-febf0f17909c@quicinc.com>
 <20240525-sc8180x-cpufreq-compatible-v1-2-febf0f17909c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525-sc8180x-cpufreq-compatible-v1-2-febf0f17909c@quicinc.com>

On Sat, May 25, 2024 at 10:48:51AM -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
> 
> The Qualcomm EPSS CPUfreq binding requires a platform-specific
> compatible, add this.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

