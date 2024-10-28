Return-Path: <linux-arm-msm+bounces-36235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 934249B3CBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 22:32:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C42011C20C66
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586E4188904;
	Mon, 28 Oct 2024 21:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkJ3j38u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC741E0B7C
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 21:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730151135; cv=none; b=lCNurvMYJPmoDP1j132Dc5MRRa0BjTIS33kMqJzsKXMaJeRUVUHsLunN44Mg1Z5b9ip3+70PAwrzaLszGFsV7OQRZaBEk8JHdqDsInmBDfBwRTMQgvyt3/FGQe6992/RWMipJmm7iZltin5nguTgAS/dFtvpyy8pDadfLO0nr6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730151135; c=relaxed/simple;
	bh=I+y5LBpxrffDHEAEq6J8VBrLt/nk3//KpfGz0Dbje8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szL8CvCkycUhzVTf9Xdpkmlv3e3kj0KgIc6zaBNFE8VSX1M529d9Nl8CW6paLSBJgpXQqH6YHUD9oulGrYf+fZnzIcRpoAmGXV+v+OUUBCHtuIcrbBHUo86/jHhf5cTB0/GRMy8llbiqWzCrbfQO0aQBCw6Obj6LvJEsrOYhXcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkJ3j38u; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso44326021fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 14:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730151131; x=1730755931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=viPeucgoHGdqU2xPgIzGF8IdpMPlf0xB9aPmUtP29kQ=;
        b=bkJ3j38u96byI7ye03Qx/mn+UWN4E/Uxno5Mhwvj7STiD9XLPiWZuUIrgBRfLftXZd
         ThxOWDJ2fFNc8MZjDdSUNPaf0JrUDRf9AXRxO+cQjOxPqWvgGvyiL87MEF/rgs7LMLT/
         9lEwD1bVmS+EFg0elgwF9H5FNm/s0tvrrtOMaMaBQXE29NnO7js8JuQvdswm9P/3XRPQ
         6qz4H0a7oU2J5xU5HNbf/8uX+XEek6zscaS4rf0KBvf2j6aTtU2JEfIBJatsm2CAAXT0
         BBRqAcuMrE2jiSb/k/23uc9RhOn7Yf63QlF4he2oA5sOQ3k1uExBo/GHRKzz/KZKtdIV
         QSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730151131; x=1730755931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viPeucgoHGdqU2xPgIzGF8IdpMPlf0xB9aPmUtP29kQ=;
        b=NoLOL3EQTNbmzlOELNFbklJ4MLQti4/HURKx2rMuGs3PmszR2NAlDUcSzGkaDVGKfP
         DYCVjsPiR+DeOS+aEQd7rKY1SBGfxBEJsIWVzETrPdU5OAMJSESrCxlhELwQq7GK9vro
         awWameMtVmhRNUBBLLeXK2ncSNKaERgMybzH0xgycOOn+uqHFwupQFiV9nERn+HSvS1B
         FijN41hGVolGGBg7sthfkYWg7Rq1FCo83xDsdeX3JxbXbopbZ8iTJwq8yL5vIMKg90E8
         ncWdwSJKyArPqPZgLE2hme0tWkDEItgGKpeaYq7BsEz7Ccbk/N1JnVgCkhNSc699/TiT
         FAsA==
X-Forwarded-Encrypted: i=1; AJvYcCVAFM/w0ZtmwNIJx7QmCHJav5HLQf4ZvNTAKYKx8YxULAv2A9slmGt29qJPOOj5P9Vhn0ljzNUhLXce5hNR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+mW6SSwB/TieqBCeLbDoGtT9IHsZMrJUVcvOT+socDICiujYe
	meHqT6n3E5s5KjClI0XIE3M2D3fjlQhpbuMA5RaubczJqskvamOF61aJ5UbafCE=
X-Google-Smtp-Source: AGHT+IFseX4y+MZS55htbXkdAVgkAAMt7Ah6+14DsNDpRvuDzxxDHaTtXbPKoP8HoWMOW7GlK9wDVA==
X-Received: by 2002:a2e:bc15:0:b0:2fb:8de8:7f9e with SMTP id 38308e7fff4ca-2fcbdf61197mr38090101fa.1.1730151131078;
        Mon, 28 Oct 2024 14:32:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb45d19d7sm12775221fa.96.2024.10.28.14.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:32:09 -0700 (PDT)
Date: Mon, 28 Oct 2024 23:32:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] clk: qcom: dispcc-qcm2290: remove alpha values
 from disp_cc_pll0_config
Message-ID: <7vvnfzy7e3sbjdlscwf4lutit7p43j4fmoy2xxkfs6ndkqgsqd@dli3uktvyhzu>
References: <20241028-alpha-mode-cleanup-v2-0-9bc6d712bd76@gmail.com>
 <20241028-alpha-mode-cleanup-v2-4-9bc6d712bd76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-alpha-mode-cleanup-v2-4-9bc6d712bd76@gmail.com>

On Mon, Oct 28, 2024 at 07:48:18PM +0100, Gabor Juhos wrote:
> Since both the 'alpha' and 'alpha_hi' members of the configuration is
> initialized (the latter is implicitly) with zero values, the output
> rate of the PLL will be the same whether alpha mode is enabled or not.
> 
> Remove the initialization of the alpha* members to make it clear that
> the alpha mode is not required to get the desired output rate.
> 
> Despite that enabling alpha mode is not needed for the initial
> configuration, the set_rate() op might require that it is enabled
> already. In this particular case however, the clk_alpha_pll_set_rate()
> function will get reset the ALPHA_EN bit when the PLL's rate changes,
> so dropping 'alpha_en_mask' is safe.
> 
> No functional changes intended, compile tested only.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
> Changes in v2:
>   - extend the commit message to indicate that dropping 'alpha_en_mask' is safe
>   - Link to v1: https://lore.kernel.org/r/20241021-alpha-mode-cleanup-v1-4-55df8ed73645@gmail.com
> ---
>  drivers/clk/qcom/dispcc-qcm2290.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

