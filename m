Return-Path: <linux-arm-msm+bounces-28734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C0795413D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:38:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C19551F23318
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C8717E76F;
	Fri, 16 Aug 2024 05:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="APT3IreW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB777107
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 05:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723786684; cv=none; b=s34P/DLim7AsoVl5ZyeI5BAwJPiCW8np+T+7KU0LqlA90aIklND3ex5WyVlB4QWYa3TV9UE28JulBWCfvWGcumH2xjCmJFGhiRsu3ArT+1Md20SDl9NYCZAg6dbs8VHa/RgxA0kr4TP7oHgZZabeCGqccVmo3IsmXidSUpc+GCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723786684; c=relaxed/simple;
	bh=UgTBPgKfAzIf8f96qHCArmk1pvypK4P/mS4CEvRVAMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPH7p1SO/51PsEkJyg8i9UJ6TrqR+1BqaNbOsAEAksHEg5Ehobr3jjwMBySZ2lWPUHxsoxajQFym8zYnJguZq/ZTvFZCRVTVbN1oMxcxcLPAg6JX2IyUFPJJest6p0vyQ2xVSTSy9t6ai+kYCn0N7Mcv531QbXdFAGPVUUOmalw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=APT3IreW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-710ce81bf7dso1318715b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 22:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723786681; x=1724391481; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q7prgwpKi60S0wtUNCPg0YfxubP3Ut6CQZnpYvPh+ks=;
        b=APT3IreWCwtODVF0LbtZYj4eCNTQEcTkbnGhiLSTYfmuA7SkTyeYvVNpzqM9/vaVYJ
         1/jkDa0jRAMubecLYh0QcLe02zTs9jbm66VOzw7BY9kxN8ufgvVWwStZ7jqb//y69qcu
         iCKbNz2LsBVbDTMScdV+zwsZRZuCi8H+4mDg0sPOYcMxF0tpXoLgBFH/wAYtiPyDD9Yd
         Qb9e7ErKuKs2GE0QzGRb2cI3v804BeZ+RIS9pgYNO04akgomCEsFRvsze2wAd4bEI/MB
         QIDpDf2AXq6/psPGTED20jdRL8hnO9cGZBrAaZI03QqUaYsmX9rh1ItfzxSCMikEWA1e
         U8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723786681; x=1724391481;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7prgwpKi60S0wtUNCPg0YfxubP3Ut6CQZnpYvPh+ks=;
        b=YzFclBQcQ1Acfd5UfA7ywJcmofpDycUmdgJWfDAlWk9k8jhmrv37lJzfpksI+3Bp7w
         +ofCSF+XjihoWwuYp7XAoa72nyUu/UYfvY2WYS/DBOI0viLEcVqJ7+SnJYI1eOcBX+Wn
         bKC6yHnYdLCG6SuDVya79IBRGT/J6M7K1zqMQRrho+EdoYbEidSfC6Bog+C12oZR5ODJ
         iz5wVR2saR5g9bDv4LBsmYn7kIcTUKeZw3AjGcVvd63cjCgMXgvnSX+jpneuL/00Pq4A
         6vmN8bifJi+yab3f1RIVnZOKWU2IFpgik3914XV3gelWWzagTxnP822dKoCO7ZAsQGMD
         z/gQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbvWFAaQ3a/D2FIZckcQo4Xk+dHom07/erdvdavDbxj1xNv8nj0qHN/LsIl2AadseMjY9j7Tp89Yuf06dZo0w78nUVbe4vIoHtBceJxQ==
X-Gm-Message-State: AOJu0Yy06TJOi9tJwwg9+K/MP33AMcYx8x+yBPXpoKsGc8wiUWJ5HWYc
	mg2G9mg4jqqBcEQBzzYM2lAAk6wFfJTqdr1htiRNnnPdQSGB6pHEi/IFlx+fnw==
X-Google-Smtp-Source: AGHT+IFULWviVp2cPDtwKAzOpa5+1vMIGu4a/EkkBQIRTeHiqzksixG0eY81MV7KEKUeTVXyMLwl7w==
X-Received: by 2002:a05:6a00:194e:b0:70b:2a:15cd with SMTP id d2e1a72fcca58-713c4bac60cmr1915613b3a.0.1723786681112;
        Thu, 15 Aug 2024 22:38:01 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af3d13fsm1885217b3a.218.2024.08.15.22.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 22:38:00 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:07:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom-ep: Do not enable resources during probe()
Message-ID: <20240816053757.GF2331@thinkpad>
References: <20240727090604.24646-1-manivannan.sadhasivam@linaro.org>
 <20240815181557.GA53448@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240815181557.GA53448@bhelgaas>

On Thu, Aug 15, 2024 at 01:15:57PM -0500, Bjorn Helgaas wrote:
> On Sat, Jul 27, 2024 at 02:36:04PM +0530, Manivannan Sadhasivam wrote:
> > Starting from commit 869bc5253406 ("PCI: dwc: ep: Fix DBI access failure
> > for drivers requiring refclk from host"), all the hardware register access
> > (like DBI) were moved to dw_pcie_ep_init_registers() which gets called only
> > in qcom_pcie_perst_deassert() i.e., only after the endpoint received refclk
> > from host.
> > 
> > So there is no need to enable the endpoint resources (like clk, regulators,
> > PHY) during probe(). Hence, remove the call to qcom_pcie_enable_resources()
> > helper from probe(). This was added earlier because dw_pcie_ep_init() was
> > doing DBI access, which is not done now.
> > 
> > While at it, let's also call dw_pcie_ep_deinit() in err path to deinit the
> > EP controller in the case of failure.
> 
> Is this v6.11 material?  If so, we need a little more justification
> than "no need to enable".
> 

That's why I asked to merge the comment from Dmitry:

"...moreover his makes PCIe EP fail on some of the platforms as powering on PHY
requires refclk from the RC side, which is not enabled at the probe time."

And Krzysztof did that:
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/qcom&id=cd0b3e13ec309dcbe1efb66b1969fc72088b791d

- Mani

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 14 ++++----------
> >  1 file changed, 4 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index 236229f66c80..2319ff2ae9f6 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -846,21 +846,15 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
> >  	if (ret)
> >  		return ret;
> >  
> > -	ret = qcom_pcie_enable_resources(pcie_ep);
> > -	if (ret) {
> > -		dev_err(dev, "Failed to enable resources: %d\n", ret);
> > -		return ret;
> > -	}
> > -
> >  	ret = dw_pcie_ep_init(&pcie_ep->pci.ep);
> >  	if (ret) {
> >  		dev_err(dev, "Failed to initialize endpoint: %d\n", ret);
> > -		goto err_disable_resources;
> > +		return ret;
> >  	}
> >  
> >  	ret = qcom_pcie_ep_enable_irq_resources(pdev, pcie_ep);
> >  	if (ret)
> > -		goto err_disable_resources;
> > +		goto err_ep_deinit;
> >  
> >  	name = devm_kasprintf(dev, GFP_KERNEL, "%pOFP", dev->of_node);
> >  	if (!name) {
> > @@ -877,8 +871,8 @@ static int qcom_pcie_ep_probe(struct platform_device *pdev)
> >  	disable_irq(pcie_ep->global_irq);
> >  	disable_irq(pcie_ep->perst_irq);
> >  
> > -err_disable_resources:
> > -	qcom_pcie_disable_resources(pcie_ep);
> > +err_ep_deinit:
> > +	dw_pcie_ep_deinit(&pcie_ep->pci.ep);
> >  
> >  	return ret;
> >  }
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்

