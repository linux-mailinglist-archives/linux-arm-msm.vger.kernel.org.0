Return-Path: <linux-arm-msm+bounces-29324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E6395C450
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 06:41:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8E361C21C64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 04:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50EEF44393;
	Fri, 23 Aug 2024 04:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JAV2hZnH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A174D41A80
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Aug 2024 04:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724388111; cv=none; b=tOC1tGX1v5MziH+sdMs44rYiewBlh0/Dm/F+pgPPrLLmxO6kj5vyEx+Hshl6GLxiFPVXB89MBZNdGrGyppu1jhMRDJ3w0kdtD/W+vpDzbzo8EuLhLFrnJMs0OLNCaLowmUFI0gj0VPRflZcfKWsdsXEb7+/JF/HrTe+lg+xCGX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724388111; c=relaxed/simple;
	bh=NMnglV9f2iZ+5YA6NVawUfsyurLZXHwBFYQWSxrw070=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6Vmulc3zaTTc0jHpJOf08YGdDCPFE7BEjyqrOLKlqy06gLdsFglDvndb0QzyxPKQ2DUKr0y5EjEytbhU5x/Cw2Hdjg7UihmVbQmwmM9AofewMGa8eMxZw4ofmYzrfNwy0ehiehjuxdbnrMmknl1vNU/3H+oR/NMLhStnEscImg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JAV2hZnH; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6b6b9867faaso14479337b3.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 21:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724388108; x=1724992908; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i8Hdt+Ziyk3ApS+28+90F4gk8pQ/plK/cHji4/f7O10=;
        b=JAV2hZnHQyvS5VaBOSEirB/gkdEP2i3ehkMmBv4I/4Uw4CqJh0RDSKiKv8Hmd+dcw8
         dmFlrPH7b75tpEsCwFqmB1TR3gZ/RyB4j7K+bh8yyzvXpsaOB9OglHZPMmCxYfd1SD5c
         DY2ADG/1Defx3ip9OH9NJli2aAJTFUt9Wj0epb9jfl9YOfuoFDWnrCYzxpWj4JHN7uBy
         qb5JRgmca2K2VKmWksA4PmEeETuAzWd9ZmjzDb5mm48UKHtZ3GHsJ1TDq3Lg4de7nkta
         wLPWjWgIJwxOqB9jCsK7sqB38B9C4Mpkj4tnQvdK05ZO8UqThxoTpuOaiAUgNjjDRZu2
         475Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724388108; x=1724992908;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8Hdt+Ziyk3ApS+28+90F4gk8pQ/plK/cHji4/f7O10=;
        b=IX9VfqPxh7ug/PwxOnB5XXljnpZN532woYYOmxn610RLaKu28HSXGESSjE0VhRfaIZ
         c+36xLh1EplEPP1BwjiyWgHwFSCo+qXImiPcDAMnv2RRGflYY0cj0L03eLLWjHnObI7Q
         sF45tJOqvIrU564CcxTmfUIuBthAYmOwSfgf9QokdJ79uvDGK6gD04E5wFwFTQRCspZp
         DuEn2e9h4do7jJf/Jfmr47l3qX3QeihLHCCi8PhxcTzbJueklP/Zc2x2lyoEm8f39EaK
         CNM86amybgKomRJFQ8qZ0VJpg2C2hRpYn8rAFiCXDDODgF4t0zi2romVDzv+iE/KQmw4
         fNHA==
X-Forwarded-Encrypted: i=1; AJvYcCUTsc0GWUDi/vvC9go+1T4eQUY75leWHQ7NVY87kgXnMcOGXLyswF6KlPMuIgwgpknpPGxt9ObhPjmXrJk8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyos55ZlJT+i/MTn+oM2WitD77bFEGA9id+ywMF0q4fKNBEwAYH
	ETcUmHMi2IBXHRmMVWOj5cqoHtqa8oHCXBjR80H96qQpG2eC1trk1xtFyXoLEg==
X-Google-Smtp-Source: AGHT+IGgqCAl2DtPSD3FqenaWclI7zOLDIcSKST0EsaMmrhwmKom2mPkjSQ+LV1oWCSgkZ8hDk8QhA==
X-Received: by 2002:a05:690c:760a:b0:6b1:2825:a3e2 with SMTP id 00721157ae682-6c629159d06mr11528287b3.44.1724388108526;
        Thu, 22 Aug 2024 21:41:48 -0700 (PDT)
Received: from thinkpad ([120.60.60.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714342e09d5sm2157246b3a.123.2024.08.22.21.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 21:41:48 -0700 (PDT)
Date: Fri, 23 Aug 2024 10:11:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom-ep: Do not enable resources during probe()
Message-ID: <20240823044133.b27cgioefsg4sjlr@thinkpad>
References: <20240822154025.vfl6mippkz3duimg@thinkpad>
 <20240822173133.GA312907@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822173133.GA312907@bhelgaas>

On Thu, Aug 22, 2024 at 12:31:33PM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 22, 2024 at 09:10:25PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Aug 22, 2024 at 10:16:58AM -0500, Bjorn Helgaas wrote:
> > > On Thu, Aug 22, 2024 at 12:18:23PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Aug 21, 2024 at 05:56:18PM -0500, Bjorn Helgaas wrote:
> > > > ...
> > > 
> > > > > Although I do have the question of what happens if the RC deasserts
> > > > > PERST# before qcom-ep is loaded.  We probably don't execute
> > > > > qcom_pcie_perst_deassert() in that case, so how does the init happen?
> > > > 
> > > > PERST# is a level trigger signal. So even if the host has asserted
> > > > it before EP booted, the level will stay low and ep will detect it
> > > > while booting.
> > > 
> > > The PERST# signal itself is definitely level oriented.
> > > 
> > > I'm still skeptical about the *interrupt* from the PCIe controller
> > > being level-triggered, as I mentioned here:
> > > https://lore.kernel.org/r/20240815224735.GA57931@bhelgaas
> > 
> > Sorry, that comment got buried into my inbox. So didn't get a chance
> > to respond.
> > 
> > > tegra194 is also dwc-based and has a similar PERST# interrupt but
> > > it's edge-triggered (tegra_pcie_ep_pex_rst_irq()), which I think
> > > is a cleaner implementation.  Then you don't have to remember the
> > > current state, switch between high and low trigger, worry about
> > > races and missing a pulse, etc.
> > 
> > I did try to mimic what tegra194 did when I wrote the qcom-ep
> > driver, but it didn't work. If we use the level triggered interrupt
> > as edge, the interrupt will be missed if we do not listen at the
> > right time (when PERST# goes from high to low and vice versa).
> > 
> > I don't know how tegra194 interrupt controller is wired up, but IIUC
> > they will need to boot the endpoint first and then host to catch the
> > PERST# interrupt.  Otherwise, the endpoint will never see the
> > interrupt until host toggles it again.
> 
> Having to control the boot ordering of endpoint and host is definitely
> problematic.
> 
> What is the nature of the crash when we try to enable the PHY when
> Refclk is not available?  The endpoint has no control over when the
> host asserts/deasserts PERST#.  If PERST# happens to be asserted while
> the endpoint is enabling the PHY, and this causes some kind of crash
> that the endpoint driver can't easily recover from, that's a serious
> robustness problem.
> 

The whole endpoint SoC crashes if the refclk is not available during
phy_power_on() as the PHY driver tries to access some register on Dmitry's
platform (I did not see this crash on SM8450 SoC though).

If we keep the enable_resources() during probe() then the race condition you
observed above could apply. So removing that from probe() will also make the
race condition go away,

- Mani

-- 
மணிவண்ணன் சதாசிவம்

