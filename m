Return-Path: <linux-arm-msm+bounces-36042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5889B1A72
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 20:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E4C281E9C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 18:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B995C1D5ABE;
	Sat, 26 Oct 2024 18:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yrMr/o/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5672231C
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729968966; cv=none; b=orp9YvhRXUJQ1OI6kakRSIa9A9Vu+Xr1wgGdrfYANW6yjh2Hka0H9Lg31eWxxosa1/Go4VtGXI0gTQKyHlR0y1uSvIk0kwIR1cK/cDUkQ7L6x9SXyYP+OLnsZq9W3GOJXLQr/wXZUNHHNbarqeFs8/gqc+J5l+8pCl0K1Kjz3cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729968966; c=relaxed/simple;
	bh=QpC8YVpB40Z6U1Lv/iZ2wuaqETufaSWOZ9EgEu4KImk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atbHJMKMXlt015qPN19Og1QCW9yVBJZRiBGCApC0SxRbpdAZ6jC7Vd8QnPAf869bLtjcTD6gNSsspYFw1sxJo1Pf+hfM0AUMNn0ltWanxHlS7ajM+0z86IvwR69NT7m2V1bKig/9R5KMKRg9shBa8UrRzwKdasjo9EiAnv/tK6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yrMr/o/B; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso29451331fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 11:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729968962; x=1730573762; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l7NYgtXYY+/uZDllEcjAHtzUzuPVhJCmDywI+NC6CaQ=;
        b=yrMr/o/Bo+Vdn9kgEXF1m0A7JBHWA6+DQqw0tbZ1uCF2qzfkumdMM5hNkUQysA2vvB
         BcmMTjrpVexzM4iJimMsV6TTsLZDCkG7hbDpwj49D0x8AXYsBHQsRuiDhv2VRO+ADBv7
         dnNFbQxrrbPhsK1CZG5qdO7V9kbFH2pnpfaF5zYMkvoVn5uUHSdVkdBsB43mdwx7pn9q
         Zhp5ktEul1UtIr+NAum11XE3KUOsPx2ApvC5g1UEfZfGvcYhI7rx3EWDZfYwK+c2asZt
         IyVhNr4eyk1q+pa4LSFZg6WT/HWfiFT6QvDQrAw7p7gGzm2CyISRw9iWGKAJN/QFFt0S
         4u2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729968962; x=1730573762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l7NYgtXYY+/uZDllEcjAHtzUzuPVhJCmDywI+NC6CaQ=;
        b=eErZxRf6dLIoJAqwVsmrgmhUWUbrQtWcfhY0q/Xx8yNdNkd2Oso5DWsqaoGT9AOiX+
         cxMmA3emD/5hPIu8Xnwsqm3GTCbnH6zmvWeP2muZyBy2i/IlJp3+XL1aNny7bLJYUKfE
         dvzd61WGkKKLm4eAl+LD5jM1PonPJ1AneTIXrhenIMevMyL0YJFB3Qq6ofNC4Lfues9d
         VrpNUMZU1T9cWFK6M3+1TECfWnlHaWMxkjgXXoAmvmeLPxHZvkqAvB9rtAWyJiDXuC4f
         50gZCvSMRnI35Z+jXLMQmyx+rsi+zzShkinTZ4poeNv878flqNEPwZbK5Vgz0H4hp5Nb
         HzGQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3tc31Q6QGMX9nYhtqKydIAme+1c2X4Js83GbX8ueY5w5z7CblNK75D1EIPoJ7YP7o0Ee27eXkzBav7CAD@vger.kernel.org
X-Gm-Message-State: AOJu0YxJbDN3wcRUOFa3wCOxMpV3/AC6jKTR6lmC5+pjb4iahMnO6WBb
	DQnUAfGczWYqZk1oYvg25WL0TIYgeIx343g150TCsKSvYaeyTVe8K1M5bIv1kFE=
X-Google-Smtp-Source: AGHT+IG9dImdPHGpADDEloy0+Zfu4O/+8WjoU10sz+7Yl6LFvGYaZ/pBLY7FwvHZ34Io4qq6Tv5k8w==
X-Received: by 2002:a2e:515a:0:b0:2fa:be1a:a4b0 with SMTP id 38308e7fff4ca-2fcbdfd8152mr10741631fa.21.1729968962346;
        Sat, 26 Oct 2024 11:56:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4507b9csm6110761fa.28.2024.10.26.11.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 11:56:00 -0700 (PDT)
Date: Sat, 26 Oct 2024 21:55:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: qcom: apss-ipq-pll: drop 'alpha_en_mask' from
 IPQ5018 PLL config
Message-ID: <64vqb56a5gvpy5mut47n34nlqmbtfctvyljgylwuapgp53un5y@mj7k4awd3fay>
References: <20241021-alpha-mode-cleanup-v1-0-55df8ed73645@gmail.com>
 <20241021-alpha-mode-cleanup-v1-1-55df8ed73645@gmail.com>
 <yplfg55afv4vucpcxbkqsxmn44mzwr3tepbuvgtswhupx7fzfi@mwofp7v3uarm>
 <45461b57-cb5a-43a5-8b9c-09ae059805a9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45461b57-cb5a-43a5-8b9c-09ae059805a9@gmail.com>

On Fri, Oct 25, 2024 at 10:05:04PM +0200, Gabor Juhos wrote:
> 2024. 10. 25. 8:24 keltezéssel, Dmitry Baryshkov írta:
> > On Mon, Oct 21, 2024 at 10:21:57PM +0200, Gabor Juhos wrote:
> >> Since neither 'alpha' nor 'alpha_hi' is defined in the configuration,
> >> those will be initialized with zero values  implicitly. By using zero
> >> alpha values, the output rate of the PLL will be the same whether
> >> alpha mode is enabled or not.
> >>
> >> Remove the superfluous initialization of the 'alpha_en_mask' member
> >> to make it clear that enabling alpha mode is not required to get the
> >> desired output rate.
> >>
> >> No functional changes, the initial rate of the PLL is the same both
> >> before and after the patch.
> > 
> > After going through DISPCC changes, I think the whole series is
> > incorrect: these PLL can change the rate (e.g. to facilitate CPU
> > frequency changes). Normally PLL ops do not check the alpha_en bit when
> > changing the rate, so the driver might try to set the PLL to the rate
> > which requires alpha value, while the alpha_en bit isn't set.
> 
> Both clk_alpha_pll_stromer_set_rate() which is used for IPQ5018 (patch 1), and
> clk_alpha_pll_stromer_plus_set_rate() used for IPQ5332 (patch 2) sets the
> ALPHA_EN bit unconditionally.
> 
> For the PLLs affected by the remaining patches, clk_alpha_pll_set_rate() is used
> which also unconditionally sets the ALPHA_EN bit via __clk_alpha_pll_set_rate().
> 
> I have created the patches after analysing the side effects of [1]. Due to the
> bug described in that change, the clk_alpha_pll_configure() function in the
> current kernel never sets the ALPHA_EN bit in the USER_CTL register. This means
> that setting 'alpha_en_mask' in the configurations has no effect actually.
> 
> So, if we assume that the affected PLLs are working correctly now, it is not
> because the 'alpha_en_mask' is specifed in the configuration but due to the fact
> that the set_rate op sets the ALPHA_EN bit.
> 
> At least, I came to this after the analysis.

Ack. Please mention in the commit message that it's safe to drop the
alpha_en bit, because it will get reset by the set_rate function.

> 
> [1]
> https://lore.kernel.org/r/20241021-fix-alpha-mode-config-v1-1-f32c254e02bc@gmail.com
> 
> Regards,
> Gabor
> 
> 

-- 
With best wishes
Dmitry

