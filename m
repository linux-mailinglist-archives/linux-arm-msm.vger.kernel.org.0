Return-Path: <linux-arm-msm+bounces-45786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B0BA18EC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 10:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1D3218828A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 09:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153BE20FA8F;
	Wed, 22 Jan 2025 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fEhtFgBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA681F8679
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 09:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737539458; cv=none; b=nltzkBzyt9YURRsxzRqYv85ZB81E0JYBoXbUSimA0KQwi9mPFBMmqI69Q3uJF7tMokpkYASzv0o+hSeV4AJlfw9KNSxEPYZH4oXEOIkfDFSIwp73HujcLeKJZQZyc6gG4YTn3ZH60kxnpqMBV06hmQNWkj3/KXNkQQItR33DpqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737539458; c=relaxed/simple;
	bh=fNqbO3rfKLiDL9gSz6Rvd6JmUVwHrmKELjpnIWXw3EE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1Mw5IChClB9IchDSK9VioIfgUKRJoNKvD2a6KvzoGamFY+wDm9YkpwjaQznyO8n0ueSOlXBhM8qWnkG96OM896FIFSJcaDwROeA9bJ46+JTTL5N5eD22LEHVg27vR88Csnm5sbG8uddE+1y84HiM8m8/p+jTwyflPxa2W6wJbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fEhtFgBR; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54287a3ba3cso672526e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 01:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737539454; x=1738144254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lBCHEf/C9ggUMnYZG2kd8fp8JybeLJM7ogvfrNNENjE=;
        b=fEhtFgBRH9KQhQoMgzhi0xCUHZSrVrr0Uf0ThcV/YPWueBV4CpOOspA2GYQb00CNro
         pxRMwCJ9oW19Z7+drPiJyxUYLkhc12uTucdHFg2XRLeDcVamZQ5sOnhHAmOmJBAuu5We
         hWbpFtMmH8DZBT+YfXNVtSPQyc82LeHosb+d2Qong6iXq/5Vdb/9FAs6eJNsq+PWz9LI
         KZ0l9jwDheCYZm45Say1aMFH5Dioolz8P2zFBIRG0bCJn+lWYWMzFctTGJnOzNxbJQ/E
         S0+wC0E7MJlsf9AlPj/8qF7CWK6lPpG5QzwXgTU5KBohGKpGeBAh99l2QGZ2dWnQTmo5
         Wo4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539454; x=1738144254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBCHEf/C9ggUMnYZG2kd8fp8JybeLJM7ogvfrNNENjE=;
        b=dzD1gW+Viw8X4Rl3O40f6bktMjdpAxn7MTIN7Zc/CXKSNmIHTD5ORGkA+YNyihZdVR
         jdRQY+JcireTmUyTor61BUjrrD2LczLmt/n5HhNHmk82b497sXEQ0CuSxtq/5WihN2or
         dEJcNasup3Cksicnds2ceED1yBxSuKTy7bJFd2sNpJyqToPSwZoayt4e4gwlzE2k6O/S
         SYh7q3cqGKlIraLxlw5fMsNqdjU2V3tJUKwoq48ZU89nUGtW3EigseGKX1ul24Lw2DA4
         oKZA5BTxe2nXD9CKEEKi4D5/yKFIBpjm9Ngr/GeuJDo6HabVUSkUJPa4cj6DP+ZkWghe
         nx0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU951QKDMdgPakq8/0F+tXMfxXwGYdPTlYe/4eyApl54cO1dnvPn36C/xoIKH4/Pmw4S/vjc7/QZ6QWrZQt@vger.kernel.org
X-Gm-Message-State: AOJu0YyZlTn4rO/Uz9nDqBNXsoKncvUFl2KWlAgnfKU7OqwAHI7PKdHZ
	P+0f+hO//cv3SDUyLXFcvaDPKphcrdfn8rq0Reqz9W+01DCqpcTxX1nkcR0Cqw0gLzQWhSPUI9N
	Fzb0=
X-Gm-Gg: ASbGnctmREmAlUoNyUWmV9ip+x2GxSDVvSNPMjauX5R2H74in+zA8yljlBF/eBPpuYi
	jYvnD5z5ydCeQ6Uet+ewg63eukKKBQFpb8cy3apTRrmJAxY8R/Fhq5pzQvDOikWdR1mVErGlQtp
	MEsBt6LSLz51MXR3GCMzu0o5SMwa9QzwR4A/qr5lat2S2cbDZ2ruyJFUS1U7ZJ9kRNIn6jPa5ax
	MFcEk3nzZuXNuh8cM0Wo5fNkyB1E/Zo4I5+uSY+wW3B3guTicz4XdmcKBgUawGJbc7BOGg64i4f
	uHY8JdeXcwHlDGrIghEJ7ELAZnYO1mHpg1K5W7zhCbBPyxFNeGAY/0WTM53J
X-Google-Smtp-Source: AGHT+IFRfMhjsVpefV6maB7xCVKP12Ct+Hkn4E3vIkBFc99WFVI8/tbDsA5csZ+BezazKNFBtqnU6A==
X-Received: by 2002:a05:651c:1508:b0:2fa:c185:ac4e with SMTP id 38308e7fff4ca-3063066d162mr113898521fa.13.1737539453989;
        Wed, 22 Jan 2025 01:50:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330cdcsm25502911fa.11.2025.01.22.01.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 01:50:53 -0800 (PST)
Date: Wed, 22 Jan 2025 11:50:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com, quic_narepall@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH V2 2/2] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Message-ID: <d5ykzwuk3wrwycol3wpeontfp5t7h7vfrfcxnmxei3qs74xsp7@ihtzne5wbytf>
References: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
 <20241218091057.15625-3-quic_sachgupt@quicinc.com>
 <a2mnkliubpdryxdwsd33kccvnlb4fnyzik5ywxw4xhnimwdwsm@oxe34zogzfot>
 <bb60a145-1e8f-4004-b266-9f26a11440b9@quicinc.com>
 <otfof56qvqxyjaq6onor2f3egrt57h2xazncias72qnn4xjgz5@2aj2pyj5xmyl>
 <a885b32c-c59f-4fb6-b2cb-7955d2d3ae69@quicinc.com>
 <mpuyg4ndd7xvfpwd6oubn7zmzkuienyrig5pmkrd4badlpebvf@h6weyimpcfv2>
 <769268c2-9a7f-4b6e-aabd-a6cf5a744d5b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <769268c2-9a7f-4b6e-aabd-a6cf5a744d5b@quicinc.com>

On Wed, Jan 22, 2025 at 02:57:59PM +0530, Sachin Gupta wrote:
> 
> 
> On 1/7/2025 8:38 PM, Dmitry Baryshkov wrote:
> > On Tue, Jan 07, 2025 at 11:13:32AM +0530, Sachin Gupta wrote:
> > > 
> > > 
> > > On 12/27/2024 12:23 AM, Dmitry Baryshkov wrote:
> > > > On Thu, Dec 26, 2024 at 11:22:40AM +0530, Sachin Gupta wrote:
> > > > > 
> > > > > 
> > > > > On 12/19/2024 11:24 AM, Dmitry Baryshkov wrote:
> > > > > > On Wed, Dec 18, 2024 at 02:40:57PM +0530, Sachin Gupta wrote:

> > > > > > > +
> > > > > > > +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> > > > > > > +{
> > > > > > > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > > > > > +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > > > > > +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
> > > > > > > +	unsigned int sup_clk;
> > > > > > > +
> > > > > > > +	if (req_clk < sdhci_msm_get_min_clock(host))
> > > > > > > +		return sdhci_msm_get_min_clock(host);
> > > > > > > +
> > > > > > > +	sup_clk = clk_round_rate(core_clk, clk_get_rate(core_clk));
> > > > > > > +
> > > > > > > +	if (host->clock != msm_host->clk_rate)
> > > > > > > +		sup_clk = sup_clk / 2;
> > > > > > > +
> > > > > > > +	return sup_clk;
> > > > > > 
> > > > > > Why?
> > > > > 
> > > > > Sorry, I did not understand your question. Can you please explain in detail.
> > > > 
> > > > Please explain the maths. You get the rate from the clock, then you
> > > > round it, but it is the rate that has just been returned, so there
> > > > should be no need to round it. And after that there a division by two
> > > > for some reason. So I've asked for an explanation for that code.
> > > > 
> > > 
> > > clk_round_rate is used in case of over clocking issue we can round it to the
> > > usable frequency.
> > 
> > If it is a frequency _returned_ by the clock driver, why do you need to
> > round it? It sounds like that freq should be usable anyway.
> > 
> 
> I agree, rounding will be taken care by clock driver. Will remove in my next
> patch.
> 
> > > Divide by 2 is used as for HS400 the tuning happens in
> > > HS200 mode only so to update the frequency to 192 Mhz.
> > 
> > Again, is it really 192 MHz? Or 19.2 MHz?
> > Also if it is for HS400, then shouldn't /2 be limited to that mode?
> > 
> 
> Yes, It is 192 MHz.

Good, thanks for the confirmation.

> As part of eMMC Init, driver will try to init with the best mode supported
> by controller and device. In this case it is HS400 mode, But as part of
> HS400 mode, we perform Tuning in HS200 mode only where we need to configure
> half of the clock.

This isn't an answer to the question. Let me rephrase it for you: if the
/2 is only used for HS400, why should it be attempted in all other
modes? Please limit the /2 just to HS400.

-- 
With best wishes
Dmitry

