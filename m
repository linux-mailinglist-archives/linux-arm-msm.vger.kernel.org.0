Return-Path: <linux-arm-msm+bounces-45790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9096A18F10
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 11:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A08C1188C0E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F18A21348;
	Wed, 22 Jan 2025 10:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mi4fsSHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8783C1B4F3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 10:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737540012; cv=none; b=USxJZP4+XOSEkXC3xgyVABAWQiiLWtjBlzZrzBI7JqaLDqs14C5OaMflW+IIwVdrR+hrmHqWesZkIjzNNtJTz+6mOS6xe3odfI3EPCiRlwRvskmpUMqvC2CyNHx8YVTqpT+wh0urfjGiRk4XRDmM/STTdg0p8Y7725/lD5R/tCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737540012; c=relaxed/simple;
	bh=+wsrOd0qHRtyMX2kOTNMRykr4F2eirOjoPKRdQiARJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwH9FnzALkKtnMRQsxvN4N6rqTYbYNGrOWB01dqec6U8y6onD13qjnADzzYBWLn2CHKk/H+aAM1hAUD5HYskawwIemGO3OWo5NJQvgs0chp2d4IZNw3lzr/PTlw4BMiPCrL0g27elW/s4cEaD2Olj0SVkJ7vOkhVvOZHeD4xCIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mi4fsSHc; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54026562221so6750451e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 02:00:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737540008; x=1738144808; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zEFQawktjxbGhtjeAIH260ijjFGtUtPD1lmxQwfvD70=;
        b=Mi4fsSHc9t17v7yTy4JA2cGAgJm19YSEczZLyhjNz82mSMD8DaMIchB+tVifCzxu2t
         dIg646+wxrz5UHQkIAPlA/WjkT1vlaO/zPgB/TCEpAGAGp7bL/Z+7l9P/aELRO8qDoxS
         cIGSWel4xG+oTJ93VrcECT9286DtjjGTZPeVYGxCp529EsCVMs6oYlgmDwwSCJ7Dgrbu
         MnfVN8EoH1YYatg2NtgliamWQ2qGlLXIspFx5eeXT0wnqQnNnK/iAw1WqE/hCrtrEkRC
         1MK9OZJloCAlK19Hoq3qVz9g7GwFitImOeitEC4D7ozqdFM0ZvOB5ta7haTMjwJVgWW8
         SwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737540008; x=1738144808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEFQawktjxbGhtjeAIH260ijjFGtUtPD1lmxQwfvD70=;
        b=Jf/vStHMVcO4wFQlOojtvsNnVv1napzdGUZzs8d7hhRrPS7ZOhUEZGRZPYXd3BjVIL
         36UuwYr06+UcSFiqKxTxRsxGH2MJRPzaODJTdjXNyMQIuAMLOig1N4FJUo8SJU2vRevw
         OP5Gy5e32kVC36bBSJsWYkd8hPfqI83kYoD/E5VaS9AhtAMA6IvXOs0r8R499uVydk6A
         9B1nDSfODzFfg5yVD2MvxkNvmNUaZfLTrnmyFc6Nvn4vKA5unAhT5sY9Eo4Vbos5AtE1
         X6x8opqgLBgdDD821Z9ZlVX1pjNvjgS79TunpZYxLjek+UjE+pJgE5FPhI/ZiH/0Q/c9
         fkaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZXc8z7ie9Y4oaY61KTOwM0/bXB0gGZ02yrhgVOs4fzOoDvA5pGEQQIF5mZ92mecq7940K7cW9zRzQ4Wng@vger.kernel.org
X-Gm-Message-State: AOJu0YwEU2UogNJegZ9c+VRFz2nhCdB5pKPeKKqbXcgAcR7MoGjuq1KZ
	mpDLjqKmcSJY9EunJL6t3Mtw91fCDT+d7hjfjvg7pmX3zlP5l76WjhvvrJ9PHs4=
X-Gm-Gg: ASbGncubPqfOXtk8/9sxyt1/nYxqewHny7NibyXPpuNjavxL7Elx3+d6EABdEJvVk4/
	hS5Id1p8/rZHAl8QErQMPEtZXBvkclVHIG+ar1qAvy97O1xof3doTZXAiesT0ZDi+xNLSbyFAUC
	r9X/pCAbqhcWzFYCm+36+g99s7X58Vp0o+HtISZVKoMBfm3395pidsuQIWzVZSQ0v5ZKRdv74R1
	ewnng0IIGGx6CdHDevIx2P1F4CgCNOvhYUTXE9rD8sycwcP/l2utz4bEJb9xGJds9/fBrI1majr
	xnOP5mbrl9Hbl8esvCwl6Dg3E8qBZ727uc0Fm6Y1N1hoVnzpOQ==
X-Google-Smtp-Source: AGHT+IEzUj8d1CjaJ2+hjasjv+g9ctm8BlZOjITBAX5i3FJQn+c/3JTOFqKIBY7RUuTDcdqTjs92zg==
X-Received: by 2002:ac2:5497:0:b0:542:2a20:e699 with SMTP id 2adb3069b0e04-5439c21f31fmr5489633e87.9.1737540007532;
        Wed, 22 Jan 2025 02:00:07 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af0e8ffsm2174384e87.59.2025.01.22.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:00:06 -0800 (PST)
Date: Wed, 22 Jan 2025 12:00:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com, quic_narepall@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH V3 4/4] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Message-ID: <nmsm6bb5biptmzruggs4f3mweq7d7hcmwqjdidf6bi7gyoliw2@x4yitguzz6zx>
References: <20250122094707.24859-1-quic_sachgupt@quicinc.com>
 <20250122094707.24859-5-quic_sachgupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122094707.24859-5-quic_sachgupt@quicinc.com>

On Wed, Jan 22, 2025 at 03:17:07PM +0530, Sachin Gupta wrote:
> With the current DLL sequence stability issues for data
> transfer seen in HS400 and HS200 modes.
> 
> "mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
> data error 0"
> 
> Rectify the DLL programming sequence as per latest hardware
> programming guide
> 
> Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 270 ++++++++++++++++++++++++++++++++---
>  1 file changed, 252 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index cc7756a59c55..17f17a635d83 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -28,6 +28,7 @@
>  #define CORE_VERSION_MAJOR_SHIFT	28
>  #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
>  #define CORE_VERSION_MINOR_MASK		0xff
> +#define SDHCI_MSM_MIN_V_7FF		0x6e
>  
>  #define CORE_MCI_GENERICS		0x70
>  #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
> @@ -118,7 +119,8 @@
>  #define CORE_PWRSAVE_DLL	BIT(3)
>  
>  #define DDR_CONFIG_POR_VAL	0x80040873
> -
> +#define DLL_CONFIG_3_POR_VAL	0x10
> +#define TCXO_FREQ               19200000
>  
>  #define INVALID_TUNING_PHASE	-1
>  #define SDHCI_MSM_MIN_CLOCK	400000
> @@ -309,6 +311,16 @@ struct sdhci_msm_host {
>  	bool artanis_dll;
>  };
>  
> +enum dll_init_context {
> +	DLL_INIT_NORMAL,
> +	DLL_INIT_FROM_CX_COLLAPSE_EXIT,
> +};
> +
> +enum mode {
> +	HS400, // equivalent to SDR104 mode for DLL.
> +	HS200, // equivalent to SDR50 mode for DLL.
> +};
> +
>  static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
>  {
>  	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> @@ -793,6 +805,211 @@ static int msm_init_cm_dll(struct sdhci_host *host)
>  	return 0;
>  }
>  
> +static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> +{
> +	return SDHCI_MSM_MIN_CLOCK;
> +}
> +
> +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> +{
> +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
> +	unsigned int sup_clk;
> +
> +	if (req_clk < sdhci_msm_get_min_clock(host))
> +		return sdhci_msm_get_min_clock(host);
> +
> +	sup_clk = clk_get_rate(core_clk);
> +
> +	if (host->clock != msm_host->clk_rate)
> +		sup_clk = sup_clk / 2;

Please resolve previous discussions before sending new versions. Just
sending a response and then sending next iteration of the patchset is
not a proper way to communicate.

NAK until the discussion is resolved in the previous thread.

> +
> +	return sup_clk;
> +}
> +

-- 
With best wishes
Dmitry

