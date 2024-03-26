Return-Path: <linux-arm-msm+bounces-15124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B7988BB8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 08:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4E61F37FCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 07:44:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4893813280F;
	Tue, 26 Mar 2024 07:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K44Vpity"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AC01804F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 07:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711439080; cv=none; b=u7o9oCrUhgpZYY6w5xtvGyX5w5rs2u78tODgeP34cxlHwkViwVS5TPv+QUoegOES+O+oCxa0E+KIAJJMlJYxJ8dVupK0GfNNRkIh9BEf7qOFpGGt+lwlmh4bgdaf1CFpLPbk7ZwWhI3yiP+ywm7YeMe9w7woyrE19Pkb47zzRos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711439080; c=relaxed/simple;
	bh=MsrkW69p8rySCRtLMEt7t+ExHfkgy2bgx4K2VLJtRIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjtloLMi/UAyT+tawBIHypwmSVtgOuv1yNPVzR3bakS6pkhxZ+GtK655q7tjiVh6FvJ68tsfYD0cjn4t1wvszlKNZWbYPVzr6Yx2oXMQUQpVQaC9m0a7CGBr5jSD9MJHDW0WmrvF9dcwqbMdO4Oe7Q2kNr5+k3owKI9VYoySg5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K44Vpity; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2a0782f0da5so967249a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711439077; x=1712043877; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ltBMUKgzn3zhp60fMyljAq7QO/sGMekj2XSf0AJieWY=;
        b=K44Vpityl70wxDk+ib6CnDpqrxYFhnGK9av1CsMF9Ys4/iwNWdrVIi+FEhyxvce0CB
         gU9hm41RFiiUA963wzug+ypG3N2Ze6bOC1Raaxul8rWiyjM1J2EeaG/beRff2Lh8fMFH
         pmn6GVf8JKeX8kdB8Q8AEL7lKz3Ouv63hzVoKHz+7dTaH24WI13qMZCwb+3NEfN221+1
         JblUd0Gt4ZWQUIK0y1Trvniu5goKH17Up88VAPGiIaodMO3IJLVWc6zWyf2Zwj58PdXN
         DRHDOioCrIR0i6tMhz2P/tUnusQ+BUuVf4Y7zf2iV8wppt84ptibSximcUl1xjBzj8FD
         Q5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711439077; x=1712043877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ltBMUKgzn3zhp60fMyljAq7QO/sGMekj2XSf0AJieWY=;
        b=T0HaYV9FvmMlrN/FPcTXaUR+R2ORfvpuWoaus6AS1KLSlplJai0LvXSgFormYctL0r
         +rsLvULbFd3NLiQOUwYZ5z4XDIqY9D1XjTtPSi2duSOrYecJkQNe4IF8jMJTDc5QVaE/
         1L/rChU1PcHm3HFtdVlm5giFbmSdcmgxHhaoGzdWZpHnBPwp0Oy8UMVtvIWm2xeSX9P6
         RJpgrk+BwWws+8v19IFKMRwNe9OkSQMENU/sdZm/0rZi6ZBYdRbYaX/0CZAdF/d4lh5Y
         pGI1TcFbumrX7RfWdAIQiLGfxmcksdgYF0BPOU4EJoGLC56cn23Qi2uZUrUY3fAclA35
         Av5g==
X-Forwarded-Encrypted: i=1; AJvYcCVMeciW/SpB6Gu4Bj2+nGO9s0r6PKYK/MUDU4+tFLIY8HusbdXL9SCYRmYADs/8UGRLkc1zcApRaQmDyn7L/z/339B8FGReMuKG+BjBQQ==
X-Gm-Message-State: AOJu0YwGxxJm40+08OiS06W4scDq2LW7dPprYXQ/BYoDfdynESGZS4+n
	Zw8dgI74sZS9F4xxQK/9O+/VAZfakOX1JMZ3+dEDjGeDAKqEUlnvA0PQHsRt1w==
X-Google-Smtp-Source: AGHT+IFpNW25eFjP8EzgblCKW0udVOJeCu+1W8FIYLgYCGlpAIzgTkcJLGCCZzYcvI56FkcxZcDtgA==
X-Received: by 2002:a17:90a:ec0d:b0:2a0:61ca:8d8a with SMTP id l13-20020a17090aec0d00b002a061ca8d8amr1054642pjy.6.1711439077214;
        Tue, 26 Mar 2024 00:44:37 -0700 (PDT)
Received: from thinkpad ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id q67-20020a17090a17c900b0029c5ee381dfsm8460725pja.26.2024.03.26.00.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 00:44:36 -0700 (PDT)
Date: Tue, 26 Mar 2024 13:14:29 +0530
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
Message-ID: <20240326074429.GC9565@thinkpad>
References: <20240314-pci-epf-rework-v1-0-6134e6c1d491@linaro.org>
 <20240314-pci-epf-rework-v1-1-6134e6c1d491@linaro.org>
 <Zf2s9kTMlZncldWx@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zf2s9kTMlZncldWx@ryzen>

On Fri, Mar 22, 2024 at 05:08:22PM +0100, Niklas Cassel wrote:
> On Thu, Mar 14, 2024 at 08:53:40PM +0530, Manivannan Sadhasivam wrote:
> > All EP specific resources are enabled during PERST# deassert. As a counter
> > operation, all resources should be disabled during PERST# assert. There is
> > no point in skipping that if the link was not enabled.
> > 
> > This will also result in enablement of the resources twice if PERST# got
> > deasserted again. So remove the check from qcom_pcie_perst_assert() and
> > disable all the resources unconditionally.
> > 
> > Fixes: f55fee56a631 ("PCI: qcom-ep: Add Qualcomm PCIe Endpoint controller driver")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 6 ------
> >  1 file changed, 6 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index 2fb8c15e7a91..50b1635e3cbb 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -500,12 +500,6 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
> >  static void qcom_pcie_perst_assert(struct dw_pcie *pci)
> >  {
> >  	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
> > -	struct device *dev = pci->dev;
> > -
> > -	if (pcie_ep->link_status == QCOM_PCIE_EP_LINK_DISABLED) {
> > -		dev_dbg(dev, "Link is already disabled\n");
> > -		return;
> > -	}
> >  
> >  	dw_pcie_ep_cleanup(&pci->ep);
> >  	qcom_pcie_disable_resources(pcie_ep);
> 
> Are you really sure that this is safe?
> 
> I think I remember seeing some splat in dmesg if some clks, or maybe it
> was regulators, got disabled while already being disabled.
> 
> Perhaps you could test it by simply calling:
> qcom_pcie_disable_resources();
> twice here, and see if you see and splat in dmesg.
> 

Calling the disable_resources() function twice will definitely result in the
splat. But here PERST# is level triggered, so I don't see how the EP can see
assert twice.

Am I missing something?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

