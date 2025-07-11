Return-Path: <linux-arm-msm+bounces-64656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1282FB027DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 01:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 389871C87BE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Jul 2025 23:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93EE9225A3E;
	Fri, 11 Jul 2025 23:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lTOSy/LX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26FF41FDE19
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 23:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752277773; cv=none; b=kW0gqEuud5kmkLEnxl570ZWzkxB0R9mGvyRgwdCfUUk7S06quwnlKdoNInxGzFCQdWFKnYJWvlO9pQfa05dabXCf2y8lEZgkVW8QgbtrYGmL7IxNe9/hwCeWB5dAcaleEz4mM/wbAZEFz7Lm0VhP3pkqpHushkQ/vfcxizSli28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752277773; c=relaxed/simple;
	bh=MrjFFSLrixtNQISgNSoqC6by9asCMdinuhdIGBG/7UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Auoar9BzGCZ3k5g0PvLW+YHG272nP3dI4HQri73W9hukVuyZy6Y2DkL2XjKDCHTwpNXyeWX15VR7qLBRAPIcxNh2xDGZCxQgprY9+hl2h4wCBPvOqyJX9Wolx70N1T2+IanNPLdoQ3HybdJQiDbP85C4Y9yXUT0yOTie32LsmmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lTOSy/LX; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23602481460so26198685ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Jul 2025 16:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752277769; x=1752882569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KC1CYY+XS/EVReWHxILsWiPjh9LJPfU94snv8/jX79c=;
        b=lTOSy/LXZfKubczJI7oKZlrg+rRwJWas7qtj0Zis/Gn1QcHcjtdj8V2e0ltGLqWQn/
         LlsJINN01ieselFSj4LLKiZCL5AcJtX1pULZT35Ng5NsGTD3tecUWaW3B7sqc9bIhspF
         tfmHpaMGtlkjbc8boHF8eqD5lRHS+11XmaMTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752277769; x=1752882569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KC1CYY+XS/EVReWHxILsWiPjh9LJPfU94snv8/jX79c=;
        b=v2HHNtGLkiwnwXnKWel3z75UYHxlxMNWWMWPlblkbaqGJMqSwgapxQG8AercaJOZad
         JJD+FhOKk+JTJYDeT9Jl72XCzqoWElXdcAM/E8PcEOUs5QzkZ4EtOQ/MR9O0f9PRaz3m
         OZFyhZnvcoMrboEQyK3k2tJ+1o9oAM6p96xXOixqJ6jwT/mSWclY2LwI0Ahfh91dZXrM
         LN2ByHuhgd6sKn0r2pWlM0HWzkdldyeYQPGd96CyXlxxh7xi/T2rqgks4K+F3nvrswWf
         S8ZTjx5zcdmFXExiRGm3MRn6OMjqCB54nNvVbIrSIVTjKdx/jJHNCORGSEu/moylMNce
         mP1A==
X-Forwarded-Encrypted: i=1; AJvYcCXpNtqM7pwM2Zbol6sVpccGgBV/qTV6lFW5KGE8pTiiWY+PLx8/KPaIW5w4mwgzocqE0eyDuzW+fHs1clGg@vger.kernel.org
X-Gm-Message-State: AOJu0YzOkwuEJ+xF6Q2YICtq8O12D3S3xmRb7pfyV4Bm+8npFXZATUWW
	3iQMNSZ4DmfbKvksnuQeXgd1o0KXBwyokir6sKGMm6mABaV7R2APYaBLDJBSi8SGQg==
X-Gm-Gg: ASbGncuUc5ghBkjfWL29yDFAYVVi0ZLm8e9r8eEoHEY61rNycX+dTWF5BJG5H2aL3PT
	QA2HDEPFH9juXKBOOvZvRhkssa1OaGKOLUjOl33/Yo1kvGBIygUQLH+EobI62LciH56KtPPJlVV
	leCzAWRSBG/urhto8gIb+rJimsZILG8KxE3AEVyYmgH/crdsLO5hUFauoOfr2N8rTrkRQ04DFr+
	p6SQ/uPIDqkXj8oF8Ld0YYiss6UxeRGNnDvLjhmMB7Uy14toIy2VOpF19gGzQCEs7Vp/fVbmI46
	y+XF9PvsJ9v1ettEPfMDMQo2A4yr1y7GO/vG5rwE77tmDa/68qAOcniL0I1owo3ORRv9BDI3tul
	FMYMjaK25gD0GA7NSWZXIaobEcYUfJCjNZriw+QwYuHLRx+1rGYWsZL4O4Zdi
X-Google-Smtp-Source: AGHT+IEZEOkHg2JDnPVscnsdRLHkXkD8TwYVqpEi0tinyurqooXEUZWQu4K9HvxpNjbOnoSzMA4FEg==
X-Received: by 2002:a17:903:46cb:b0:23d:dd04:28e5 with SMTP id d9443c01a7336-23df08e1bd4mr68820345ad.34.1752277769541;
        Fri, 11 Jul 2025 16:49:29 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:2386:8bd3:333b:b774])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de4322f15sm53994305ad.130.2025.07.11.16.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 16:49:29 -0700 (PDT)
Date: Fri, 11 Jul 2025 16:49:27 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH RFC 2/3] PCI/pwrctrl: Allow pwrctrl core to control
 PERST# GPIO if available
Message-ID: <aHGjBxKYJCkhXcbo@google.com>
References: <20250707-pci-pwrctrl-perst-v1-0-c3c7e513e312@kernel.org>
 <20250707-pci-pwrctrl-perst-v1-2-c3c7e513e312@kernel.org>
 <aG3e26yjO4I1WSnG@google.com>
 <kl5rsst6p2lgnepopxij5o6vyca4abrjlktsirfac3v7cnm33l@svrcm7v4gasr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kl5rsst6p2lgnepopxij5o6vyca4abrjlktsirfac3v7cnm33l@svrcm7v4gasr>

On Wed, Jul 09, 2025 at 01:35:08PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Jul 08, 2025 at 08:15:39PM GMT, Brian Norris wrote:
> > On Mon, Jul 07, 2025 at 11:48:39PM +0530, Manivannan Sadhasivam wrote:
> > > --- a/drivers/pci/pwrctrl/core.c
> > > +++ b/drivers/pci/pwrctrl/core.c
> > > +static void pci_pwrctrl_perst_deassert(struct pci_pwrctrl *pwrctrl)
> > > +{
> > > +	/* Bail out early to avoid the delay if PERST# is not available */
> > > +	if (!pwrctrl->perst)
> > > +		return;
> > > +
> > > +	msleep(PCIE_T_PVPERL_MS);
> > > +	gpiod_set_value_cansleep(pwrctrl->perst, 0);
> > 
> > What if PERST# was already deasserted? On one hand, we're wasting time
> > here if so. On the other, you're not accomplishing your spec-compliance
> > goal if it was.
> > 
> 
> If controller drivers populate 'pci_host_bridge::perst', then they should not
> deassert PERST# as they don't control the supplies. I've mentioned it in the
> cover letter, but I will mention it in commit message also.

Sorry, I think I partially read that, but didn't really grasp how it fit
in here.

I commented on patch 3 where you try to implement this. IIUC, you're
making excessive assumptions about the use of pwrctrl.

Brian

