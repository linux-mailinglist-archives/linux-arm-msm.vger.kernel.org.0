Return-Path: <linux-arm-msm+bounces-15165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 091B088C03D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 12:10:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9662301529
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 11:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ACC482D7;
	Tue, 26 Mar 2024 11:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zZPDLU58"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF083A8F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 11:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711451431; cv=none; b=DgMq8Js/4Bp4KpbYjeP07tehpMD0gqlG2zYn5Mxi3qOvLFZU8mdLKKdyzL9eU5JxXSTZ3It348zu0TQShkM1WQ+ta6l6loW5qjfu3GT8GUc45z1IyJ0B4EyL+HMeQhwpCWG9laDBhpDolYf2APFim09Fw9uUowBN/o1VH9Je7tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711451431; c=relaxed/simple;
	bh=lNqffwHbF4+DgPye64vC4bdBKO4etn+DRoKyxkJB4dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpnOwxBfPwHIAkpj3LXZSifKmx72ictaFpErWQBtpc9k0sbiNpWHpRa6P9Y7XlqmneiEtTJBEMU/+/WRZUe6zzdx3ivfh8cm0GAgJmCgUNXJNGzE1ujW5jm1zCj8lVp3Ee6N3Rw6FB8ahaKZY1ZK1MyFlLIVjhkVG9ESnnaL8Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zZPDLU58; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so2925850a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 04:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711451429; x=1712056229; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eGBD00Nb+rvDCVS5Fn3z09PsE5MBX3NmOYcBRrgB0Ak=;
        b=zZPDLU580HPKiXYVVXk2P7n4QQ0HTnufmR9KkrA8VrQWaSSsWQYeHXj+31bQyiOVbq
         nkEC7knCDBUc3aQEZRCQX6uipN9Ffmk45NXw7wXts8xAshONBqxJhZE8T30fXsxqKsyw
         GByGYcf9dDbDh8BwYOO0P1MCAwcdldg7kdINXoY7mBOzBbRDp2JLrunGIvpJtyQdznVs
         HWXCptyBcoCyEduhch5qY7OocUee6+ZQeaxMiPPZPlCsbpKxyqqzYSljO0GNqD0B+KV9
         G5gMlyT7gyNBvBdB9l3NiAsxgEYHsyw4OJGBfmqr0D3p1wCIUNAZH8n4B2gozkbH7Yan
         acYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711451429; x=1712056229;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGBD00Nb+rvDCVS5Fn3z09PsE5MBX3NmOYcBRrgB0Ak=;
        b=UyIWu4/Jotp4JDjj02YVrCsA4mFmb0LFWP0fqyaN34USnf5MP3Fysej90u7Qo/fTVm
         6sSNewdso1ujygFrnGz501cPXC6WTnNE9N575cDwnNcS0/vd/486DeuLxYM/RvRh+38t
         1DkT+iXI4/jNb797JY+3RQywzTWlxMygHj8hh8aM3Bzgh2d1rFEV6/+cQEPzC0XGVhtf
         byExfOHMD8yeC23SNhBPIsXK3JsA5t7y4xb7I54P/B3EDl4Pbk2jo22KTN6LwYmLsTLC
         W1fJVv40936h5WuFHd+aNRm8CI4JqzYAgu/qTLwz4Ad8ahR2ys7SxVXdiWE2Q+Wu/3P3
         Rsnw==
X-Forwarded-Encrypted: i=1; AJvYcCUTLgTViUz980KgWSRwbOnvv2fL6p8i949BBQwAm/GRCryEt3KAMsz7b5dAYhJ50fGkdrk0JyCMGTikO1wa/Pc06L8VrLJMSFy5zeGTRQ==
X-Gm-Message-State: AOJu0YyIP5wIhjrn7Hmk+MRtW6+m4IaEcIje8bHFAQhEU0exE3sF2+XD
	uF3QEEqwhTsnbGkScWlV/f6tvqYDyEPe2kCbAq8JV10aSY5WUEALHhQTTtjOFg==
X-Google-Smtp-Source: AGHT+IGbSEcld3RliKzvUERGTeqYSFE/Rs+8oSpqppqSDIVaVGzMOSy8p0g1ooCyZlGfvgyHtpzkLQ==
X-Received: by 2002:a05:6a20:d81b:b0:1a3:bb75:17ab with SMTP id iv27-20020a056a20d81b00b001a3bb7517abmr8219769pzb.59.1711451429355;
        Tue, 26 Mar 2024 04:10:29 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id r18-20020aa78b92000000b006e647716b6esm5943393pfd.149.2024.03.26.04.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 04:10:29 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:40:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 01/11] PCI: qcom-ep: Disable resources unconditionally
 during PERST# assert
Message-ID: <20240326111021.GA13849@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
 <Zf2s9kTMlZncldWx@ryzen>
 <20240326074429.GC9565@thinkpad>
 <ZgKiUogkgrMwV1uD@x1-carbon>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZgKiUogkgrMwV1uD@x1-carbon>

On Tue, Mar 26, 2024 at 11:24:18AM +0100, Niklas Cassel wrote:
> On Tue, Mar 26, 2024 at 01:14:29PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Mar 22, 2024 at 05:08:22PM +0100, Niklas Cassel wrote:
> > > On Thu, Mar 14, 2024 at 08:53:40PM +0530, Manivannan Sadhasivam wrote:
> > > > All EP specific resources are enabled during PERST# deassert. As a counter
> > > > operation, all resources should be disabled during PERST# assert. There is
> > > > no point in skipping that if the link was not enabled.
> > > > 
> > > > This will also result in enablement of the resources twice if PERST# got
> > > > deasserted again. So remove the check from qcom_pcie_perst_assert() and
> > > > disable all the resources unconditionally.
> > > > 
> > > > Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 6 ------
> > > >  1 file changed, 6 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > index 2fb8c15e7a91..50b1635e3cbb 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > > > @@ -500,12 +500,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
> > > >  static void qcom_pcie_perst_assert(struct dw_pcie *pci)
> > > >  {
> > > >  	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
> > > > -	struct device *dev = pci->dev;
> > > > -
> > > > -	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED) {
> > > > -		dev_dbg(dev, "Link is already disabled\n");
> > > > -		return;
> > > > -	}
> > > >  
> > > >  	dw_pcie_ep_cleanup(&pci->ep);
> > > >  	qcom_pcie_disable_resources(pcie_ep);
> > > 
> > > Are you really sure that this is safe?
> > > 
> > > I think I remember seeing some splat in dmesg if some clks, or maybe it
> > > was regulators, got disabled while already being disabled.
> > > 
> > > Perhaps you could test it by simply calling:
> > > qcom_pcie_disable_resources();
> > > twice here, and see if you see and splat in dmesg.
> > > 
> > 
> > Calling the disable_resources() function twice will definitely result in the
> > splat. But here PERST# is level triggered, so I don't see how the EP can see
> > assert twice.
> > 
> > Am I missing something?
> 
> I think I remember now, I was developing a driver using a .core_init_notifier,
> but I followed the pcie-tegra model, which does not enable any resources in
> probe() (it only gets them), so I got the splat because when PERST got
> asserted, resources would get disabled even though they were already disabled.
> 
> pcie-qcom:
> -gets resources in .probe()
> -enables resources in .probe()
> -sets no default state in .probe()
> 
> pcie-tegra:
> -gets resources in .probe()
> -enables resources in perst_deassert()
> -sets default state to EP_STATE_DISABLED in probe()
> 
> So pcie-qcom does not seem to be following the same pattern like pcie-tegra,
> because pcie-qcom actually does enable resources for the first time in
> probe(), while tegra will enable resources for the first time in
> perst_deassert().
> 
> Sorry for the noise.
> 

I was planning to drop enable_resources() from Qcom driver once the DBI rework
series gets merged. Because, the resource enablement during probe is currently
done to avoid the crash that is bound to happen if registers are accessed during
probe.

But what your observation reveals is that it is possible to get PERST# assert
during the EP boot up itself which I was not accounting for. I always assumed
that the EP will receive PERST# deassert first. If that is not the case, then
this patch needs to be dropped.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

