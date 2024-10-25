Return-Path: <linux-arm-msm+bounces-35803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0F19AF9E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 08:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A051F20FC5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 06:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267CE199948;
	Fri, 25 Oct 2024 06:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RErVLxD6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE22E1B21A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 06:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729837247; cv=none; b=HWH892+r9ra2g26p2sCy5g8VEPJBl3f1QWPPAIb5aHOpwOET8ukywW/pZAE2FFvhWLJsHxwLPovALC3gQtgsN1vfAJFzJ59PMAGdM4j62nGx9f9Pk5Bz/plgp1mkzZpmb5XhDgioTSgFtxpq9MJLytvyqQeMM9aO3sS3Aq3lNFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729837247; c=relaxed/simple;
	bh=HZlBWj0FWjc4K+GXSSqYDUZAfTlababGxYa7GsHTQEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S7Ld4UiC80GyBTF1J8vVqrnMBPNItouO311W+z9rDeuUycfSdCaghCgijN7pzITa1dCM240tenz0F6blArym47nYn11r4tfz7HTMPNBZji6GFdS7vZdsEHEiFeZC7UROWqaPap4CYdK+7QNf3DTQ5HSQVO5kRzCqcTjMGBGw6Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RErVLxD6; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fc96f9c41fso18676831fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Oct 2024 23:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729837243; x=1730442043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fa4hzQ+Rm2Sfi2hblWN0d77o7Rww3knGJAgco2JSSQc=;
        b=RErVLxD61Dagmrr/LPdS4rlhxPRBELMeJs/C0kSR67BL9DIi7aNdgq1tp4yNFRLj9r
         ameUVTSSZF8sGngV8wMbR1QDySiWvu1GB8FhQQMiwlZjvdg0XW7D/aeN8Oi8EU1bI5pe
         zkv4F1Thw6/vciGsx0zOz6P12MQ9KvqsOtWFnsG0wWDgzASbc/fwLXQpRt75Oi6XMjA8
         yKpoLn7a1xqX/OgSa5ZmQeNh9rRs3/AyKXGm78W1gRBAEpM9fWI9mxKoSD66viiq8pTs
         SL/m/Dzit6tSYrguCEeZihCMwii4CzCYf+G9o3tq4T5jPDk1rFFsQCkVNPe1xHQX7vpA
         qapw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729837243; x=1730442043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fa4hzQ+Rm2Sfi2hblWN0d77o7Rww3knGJAgco2JSSQc=;
        b=hhUMGuzF9kVivkZczRS2ZE/8x2VNcj5eK1KZWVtbC0xAZzx4/Tdxse/vX7tWFGhZTY
         vqEODcJfAEXTU5/yEnhvwyu5PaEtnhFoQuVvlM7SBczQU0TjQWJn/f20T5gLlaStw61e
         Zq/BQCR8uNSLLTrwqWmGs1fH1rM7YKzt9oh6lKCjAkV3pkcpPXgBT1t5fagD8/21p+WQ
         Wjp2SSKKMsqq1uRsbreym1Tw9Pqxt6QFLW5V+7pvxY/LznX5vhgs+tAxf6I+Q+8fMxWV
         dIkTN6k/6yUEjP/wL6DZUXJ0E1v89sMZ6ihXvakYXQT8U3lyfMHv/i7jpxaHpdgK7iBt
         5/fA==
X-Forwarded-Encrypted: i=1; AJvYcCXGShT06EE7l8c/ksOINnjkpqHedoNlgRZkLvnR2n/nl5lTN3e8qpsIhoL02m1YZ2iSzvv7tTEFw0JrUzcP@vger.kernel.org
X-Gm-Message-State: AOJu0Yyr7mF0NnamueIK+3nml2ofNt/8bfEgtjYWvmy/XxyQbSmdnhnb
	2DfGuWI0uCi4nJkAY31dGxzO/4uFzdk9gRIPFiVSl+k8aoKWNl96ZZQK0yVjMQQ=
X-Google-Smtp-Source: AGHT+IFNRNNvwVBh0hKoiNOnVytmC+6XoCQ1BxvBzNlf2gAayZD+u4XyCH7hmjht01xOxLd+tVcIvw==
X-Received: by 2002:a2e:6101:0:b0:2fb:382e:4105 with SMTP id 38308e7fff4ca-2fca833e4a3mr12799821fa.11.1729837242835;
        Thu, 24 Oct 2024 23:20:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451a2adsm686561fa.49.2024.10.24.23.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 23:20:40 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:20:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] clk: qcom: dispcc-sm6115: remove alpha values from
 disp_cc_pll0_config
Message-ID: <ifbybdn7nhsw2skgshjtskijrnyfn3r3fsg4znmf2olc2esbmn@gkurcqjlddj7>
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
 <20241021-alpha-mode-cleanup-v1-5-55df8ed73645@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021-alpha-mode-cleanup-v1-5-55df8ed73645@gmail.com>

On Mon, Oct 21, 2024 at 10:22:01PM +0200, Gabor Juhos wrote:
> Since both the 'alpha' and 'alpha_hi' members of the configuration is
> initialized (the latter is implicitly) with zero values, the output
> rate of the PLL will be the same whether alpha mode is enabled or not.
> 
> Remove the initialization of the alpha* members to make it clear that
> the alpha mode is not required to get the desired output rate.
> 
> No functional changes intended, compile tested only.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/dispcc-sm6115.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/dispcc-sm6115.c b/drivers/clk/qcom/dispcc-sm6115.c
> index 939887f82ecc3da21a5f26168c3161aa8cfeb3cb..2b236d52b29fe72b8979da85c8bd4bfd1db54c0b 100644
> --- a/drivers/clk/qcom/dispcc-sm6115.c
> +++ b/drivers/clk/qcom/dispcc-sm6115.c
> @@ -48,8 +48,6 @@ static const struct pll_vco spark_vco[] = {
>  /* 768MHz configuration */
>  static const struct alpha_pll_config disp_cc_pll0_config = {
>  	.l = 0x28,
> -	.alpha = 0x0,
> -	.alpha_en_mask = BIT(24),

NAK, this isn't a fixed rate PLL.

>  	.vco_val = 0x2 << 20,
>  	.vco_mask = GENMASK(21, 20),
>  	.main_output_mask = BIT(0),
> 
> -- 
> 2.47.0
> 

-- 
With best wishes
Dmitry

