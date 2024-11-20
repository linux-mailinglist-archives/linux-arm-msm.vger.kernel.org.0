Return-Path: <linux-arm-msm+bounces-38468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 591A29D39BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 12:44:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 131341F22038
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30A3519CC31;
	Wed, 20 Nov 2024 11:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qD1ptUYi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696EE19F13F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 11:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103063; cv=none; b=CfS5f0uf3x94QFGy6JAG9hWkBhh30oSjToa/FC25lVom0gHVhORQu/P0xtE2r3obvgOuxKxhXcu/rFKN2MbPDW6kToXmIfJHD19QkQNQQYIRLY9tUayCpkXen+K27d7DoYayFcQkXcSHS+QUnHyLAD/fVKbc+5alrAhzVTgSfmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103063; c=relaxed/simple;
	bh=MBY1tocOleXSubrnmqvjhWAnctlm34fJboe09gcAvUY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzqslKWzI290iBkiZ6y9suEt5pN0178NFWhnRHJ/TQm1JHorezopQU450Hq4oe0JutECLB8nyc/xbBGqc7YsK0GJcQpqUNIa5AFf3XT5XPVLuS7qY0Czlds8b5ev2cRZLmDeA+T9ypXKinloGTXZQhjKBU5vzQ8JLPyh/4Wt/Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qD1ptUYi; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-539e63c8678so4780379e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Nov 2024 03:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732103059; x=1732707859; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9DRvXARQ1UdTvlDiFS+YRmTlgOqmMlEKwZDmn4BjfP0=;
        b=qD1ptUYiHUivPQZ6A7SShnaZZFwfLl1WJuEzAN76hTAEn6Op8yKKTQ8I/XGvCN2Apr
         bcbpWNOi1/sPWALTio/b6m0V6fKxj4btHa3VkoZU1lBGvvy+p8A3YWGOe/u6XDEbiEaa
         +efLHGEt7YjTfbol66haK5LTHh3Uck0OYKwLJ9uuM5Gb4ApfKR4a1AxFWDQKE2Pg66w7
         A/NzmAyYmpgiDXbHt+WFwMGV/6zDwvWqGMZQfDmhhUSSQiQEek6YQbgBnSWPL5QSQFcn
         gxt87gfvCrojtVtHgiJX99ihyCdS/BUsA+ozALim55VQaL4t7+NzBw/D9mUbruvdG1Ew
         9SBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732103059; x=1732707859;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9DRvXARQ1UdTvlDiFS+YRmTlgOqmMlEKwZDmn4BjfP0=;
        b=MyRdpGcpCjdx51EnRwz1QGWE8L6SXiXScywQr0VulHb/DcIv4BIdn0L6CLUHW3kbAs
         EcMrU1brKxNw6hVnbYxYBdndZVMKZCjIOay82QDmIhOhTBwMFjzyU5yNNtaHNggLym2v
         Y3U7e5lXHA1l9+A/9RrgoZoJVBt3cbgNFT2xGcs6mU3Z8f06dScNR72PC2aNNP8uaqxS
         +1Yhl+aDem2ZMATSkolFUZaw3Nl25NK6WGtanH4CcLH0dz+SHCB1eGpjAVWKftilZzvN
         GZACuYf9Xq9hOL9j7Y/dUrSHHTRtWfy8irstjIyAIJ5nNEF1AkhWrQ4kkZ8C8LyLtsG8
         KyQw==
X-Forwarded-Encrypted: i=1; AJvYcCVT+RAN1tzMc6/U2k3r9syGSVVTuVnFVB5S+2iox4sAOOXdSWKrOqLrXXDUDKHbPYSnsVxhdhKNgHz3k2PI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40Taqc34OKMNaTY9MbE3e0Wnk2Iy90E0ZhSKj+LaWmIyomQIL
	6NlgDa6zr5ie8SiyxXnWtBPFHqX09a8VXRvbL7ENYK7ELW13XGqlpHeokuJGh6E=
X-Google-Smtp-Source: AGHT+IENehDPBicxK9JfxLgvExZQ3j1PXy75ftMbSZQj8HtpOt2sSHv8gorwetAxqzmU4d1aWMiGlA==
X-Received: by 2002:ac2:4551:0:b0:539:8bc6:694a with SMTP id 2adb3069b0e04-53dc136aa08mr913736e87.43.1732103058604;
        Wed, 20 Nov 2024 03:44:18 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dbd47285fsm604802e87.225.2024.11.20.03.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:44:17 -0800 (PST)
Date: Wed, 20 Nov 2024 13:44:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 07/11] drm/msm: adreno: find bandwidth index of OPP
 and set it along freq index
Message-ID: <xm2pic3yixhlsktaqnux7uvoxbxpvcmkcurylydifbqpx24x4i@lj65uktyscdq>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-7-4deb87be2498@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-7-4deb87be2498@linaro.org>

On Tue, Nov 19, 2024 at 06:56:42PM +0100, Neil Armstrong wrote:
> The Adreno GMU Management Unit (GMU) can also scale the DDR Bandwidth
> along the Frequency and Power Domain level, until now we left the OPP
> core scale the OPP bandwidth via the interconnect path.
> 
> In order to enable bandwidth voting via the GPU Management
> Unit (GMU), when an opp is set by devfreq we also look for
> the corresponding bandwidth index in the previously generated
> bw_table and pass this value along the frequency index to the GMU.
> 
> Since we now vote for all resources via the GMU, setting the OPP
> is no more needed, so we can completely skip calling
> dev_pm_opp_set_opp() in this situation.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 17 +++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

