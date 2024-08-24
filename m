Return-Path: <linux-arm-msm+bounces-29443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC695DF03
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 18:35:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B24C1C20E6C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Aug 2024 16:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4ABF17BEB6;
	Sat, 24 Aug 2024 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EQ2bRgcU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2439A17BEA7
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2024 16:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724517261; cv=none; b=OiDBjp+W+VGbm0557Mqbbp+6nxH2IRMzMn52RQi0b6VjvGH6G9iUUHzrn/vmHEK2xDQ0N+rS2B/6LGFFMUrYzVrTY3QKQa1bzaykpPQsQqnoGqV/2QVIbBgAg/p3iN3xRSQ+2xfdOU9J3HlSuA93ax6ioG7JlwY+XlMvzIbPSMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724517261; c=relaxed/simple;
	bh=VcVQOc1gJJE9inqoroUckPQ6d4aDsf9mjtCNHnj3dxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FLkXDya/I/8Q5EFD8mSZ1/CLZU4cB2/K/YNH7C988UFqhkUEuUANnIJD35KGniVS9lnZPxCLfaHV5opt0TWeB11sOv8pAFUB1hxzV8ekMGGZNvwrVj8Nsp9gY4kl5dGKcR/WLkfcPw9yqepbsn66bCM9s19C4nAmvhzD1DWUSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EQ2bRgcU; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2d60f48a2ccso2422109a91.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Aug 2024 09:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724517259; x=1725122059; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XUKd8TW71RsWpnd0GbWn6h2v6e8v27iVaD09f+k/+78=;
        b=EQ2bRgcUQzN+s0iNO0NXCtL2LaSoQITFW1wnKXnTRSJU3zqv5HOFCo5SahXRAbrPjp
         Im4rla9DUqWFnKl4qi70PKnnPc8prwn3tshR1GrUmb2nU+Y0WtUkoDgqrlinSfh2O3JY
         KjtspVQxkDYTpZqCrFWfNwESbwmpCrmOl2GgobmyqaAAINXexR+f9q0R979gIBTrO7M0
         zNvvYfwREnbFDpjhbNuGtIEz6j0FJm/3tRR4RtHY3op5F2P+x+jf4aWBF3SbheVeC4+h
         P7uzdqiUgjgmszDdyZI21VjxW+Sr6R8j4I859HoQzhFvBvb9+R5F23Aud0BMZyzDeCN+
         xvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724517259; x=1725122059;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XUKd8TW71RsWpnd0GbWn6h2v6e8v27iVaD09f+k/+78=;
        b=Z5cj+p13qkoqrQEMN5KWdG4ts2n5P3xBWb5EoapApr7WCIEUjhx/o78WNXvdbFM9yo
         1NLjAwaRW7+K0/I/b+tfvuz6OQmVH7cTwJT7OnCntMXyZQPbj5taVbhW2h1lxt2uYgF5
         gfWQjtXYmJPf7IWgEwKiwC3GomNDwkhqsR4nNauzDCSXkqe02YPQgsrOdaXkFHrYQ06T
         pSbvPMoR3Z1uKZLbfrP8qipYYd6lYbZHpfyJd73MwhXcbcXcgH0Ylf6s2KhMXGi+a3dL
         MWGVBaYsDwLPpTaOjzl6oORsI2uONSZuO/uYK/txoOJUposgsEZio6n55EnOyBvdHWBQ
         kslQ==
X-Forwarded-Encrypted: i=1; AJvYcCXASeytn7N9C0YIGG00o9UkvNnA1LQSXJqtNRv/7/8g1ZxRrGbrpwcA5YyFtFORrpVc2/faYKmUAkuHOrq+@vger.kernel.org
X-Gm-Message-State: AOJu0YxXgcJwne5Ijxjz7BCP8DeVs93FsoI0hYk9ZdG9YaPCIBvxQr34
	3rNvAZ4tCaidCwDgZFIqihwbk0tdzSy8NkpvGoFxrSzipXUr9sRRSg5QO5KA0g==
X-Google-Smtp-Source: AGHT+IHJSoWVuCArmfalBXWeHEhioLVFHCv4Tn6JcUEk+XfUQRJGTJvfmdGFUDGcBr8uZO6FwgOSdQ==
X-Received: by 2002:a17:90a:c694:b0:2d3:b60c:45e7 with SMTP id 98e67ed59e1d1-2d646d1db91mr6172384a91.32.1724517259333;
        Sat, 24 Aug 2024 09:34:19 -0700 (PDT)
Received: from thinkpad ([220.158.156.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm8660325a91.17.2024.08.24.09.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 09:34:18 -0700 (PDT)
Date: Sat, 24 Aug 2024 22:04:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom-ep: Do not enable resources during probe()
Message-ID: <20240824163414.osqnxii2imbo62he@thinkpad>
References: <20240824021946.s5jbzvysjxl5dcvt@thinkpad>
 <20240824161234.GA411277@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240824161234.GA411277@bhelgaas>

On Sat, Aug 24, 2024 at 11:12:34AM -0500, Bjorn Helgaas wrote:
> On Sat, Aug 24, 2024 at 07:49:46AM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Aug 23, 2024 at 05:04:36PM -0500, Bjorn Helgaas wrote:
> > > On Fri, Aug 23, 2024 at 10:11:33AM +0530, Manivannan Sadhasivam wrote:
> > > > On Thu, Aug 22, 2024 at 12:31:33PM -0500, Bjorn Helgaas wrote:
> > > > > On Thu, Aug 22, 2024 at 09:10:25PM +0530, Manivannan Sadhasivam wrote:
> > > > > > On Thu, Aug 22, 2024 at 10:16:58AM -0500, Bjorn Helgaas wrote:
> > > > > > > On Thu, Aug 22, 2024 at 12:18:23PM +0530, Manivannan Sadhasivam wrote:
> > > > > > > > On Wed, Aug 21, 2024 at 05:56:18PM -0500, Bjorn Helgaas wrote:
> > > > > > > > ...
> > > > > > > 
> > > > > > > > > Although I do have the question of what happens if the RC deasserts
> > > > > > > > > PERST# before qcom-ep is loaded.  We probably don't execute
> > > > > > > > > qcom_pcie_perst_deassert() in that case, so how does the init happen?
> > > > > > > > 
> > > > > > > > PERST# is a level trigger signal. So even if the host has asserted
> > > > > > > > it before EP booted, the level will stay low and ep will detect it
> > > > > > > > while booting.
> > > > > > > 
> > > > > > > The PERST# signal itself is definitely level oriented.
> > > > > > > 
> > > > > > > I'm still skeptical about the *interrupt* from the PCIe controller
> > > > > > > being level-triggered, as I mentioned here:
> > > > > > > https://lore.kernel.org/r/20240815224735.GA57931@bhelgaas
> > > > > > 
> > > > > > Sorry, that comment got buried into my inbox. So didn't get a chance
> > > > > > to respond.
> > > > > > 
> > > > > > > tegra194 is also dwc-based and has a similar PERST# interrupt but
> > > > > > > it's edge-triggered (tegra_pcie_ep_pex_rst_irq()), which I think
> > > > > > > is a cleaner implementation.  Then you don't have to remember the
> > > > > > > current state, switch between high and low trigger, worry about
> > > > > > > races and missing a pulse, etc.
> > > > > > 
> > > > > > I did try to mimic what tegra194 did when I wrote the qcom-ep
> > > > > > driver, but it didn't work. If we use the level triggered interrupt
> > > > > > as edge, the interrupt will be missed if we do not listen at the
> > > > > > right time (when PERST# goes from high to low and vice versa).
> > > > > > 
> > > > > > I don't know how tegra194 interrupt controller is wired up, but IIUC
> > > > > > they will need to boot the endpoint first and then host to catch the
> > > > > > PERST# interrupt.  Otherwise, the endpoint will never see the
> > > > > > interrupt until host toggles it again.
> > > > > 
> > > > > Having to control the boot ordering of endpoint and host is definitely
> > > > > problematic.
> > > > > 
> > > > > What is the nature of the crash when we try to enable the PHY when
> > > > > Refclk is not available?  The endpoint has no control over when the
> > > > > host asserts/deasserts PERST#.  If PERST# happens to be asserted while
> > > > > the endpoint is enabling the PHY, and this causes some kind of crash
> > > > > that the endpoint driver can't easily recover from, that's a serious
> > > > > robustness problem.
> > > > 
> > > > The whole endpoint SoC crashes if the refclk is not available during
> > > > phy_power_on() as the PHY driver tries to access some register on Dmitry's
> > > > platform (I did not see this crash on SM8450 SoC though).
> 
> I don't think the nature of this crash has been explained, so I don't
> know whether it's a recoverable situation or not.
> 

I will add this info in the commit message.

> > > > If we keep the enable_resources() during probe() then the race
> > > > condition you observed above could apply. So removing that from
> > > > probe() will also make the race condition go away,
> > > 
> > > Example:
> > > 
> > >   1) host deasserts PERST#
> > >   2) qcom-ep handles PERST# IRQ
> > >   3) qcom_pcie_ep_perst_irq_thread() calls qcom_pcie_perst_deassert()
> > >   4) host asserts PERST#, Refclk no longer valid
> > >   5) qcom_pcie_perst_deassert() calls qcom_pcie_enable_resources()
> > >   6) qcom_pcie_enable_resources() enables PHY
> > > 
> > > I don't see what prevents the PERST# assertion at 4.  It sounds like
> > > the endpoint SoC crashes at 6.
> > 
> > IDK why host would quickly assert the PERST# after deasserting
> > during probe() unless someone intentionally does that from host
> > side.
> 
> I think the host is allowed to assert PERST# at any arbitrary time, so
> an endpoint should be able to handle it no matter when it happens.
> 
> > If that happens then there is a possibility of the endpoint SoC
> > crash, but I'm not sure how we can avoid that.
> > 
> > But what this patch fixes is a crash occuring in a sane scenario:
> > 
> > 1) Endpoint boots first (no refclk from host)
> > 2) Probe() calls qcom_pcie_enable_resources() --> Crash
> 
> I agree with this, although I think it's more of a band-aid than a
> complete solution.  I don't have access to any SoC or PCIe controller
> docs, so maybe this is a hardware design problem and this is the best
> we can do.
> 

I agree. But AFAIK there is no way endpoint can avoid this crash unless it
generates its own clock. I did some investigation on the SRIS support and able
to get it work in my local branch.

I will try to upstream that feature for the currerntly supported Qcom SoCs in
endpoint mode. But Qcom told me that non-SRIS mode is also required by some
customers, so unfortunately we cannot make it as the default operating mode.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

