Return-Path: <linux-arm-msm+bounces-12567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED5867A84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 16:42:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9173AB3A16D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Feb 2024 15:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFD3219E3;
	Mon, 26 Feb 2024 15:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ldJt/rwH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC7112BEA2
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 15:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708961285; cv=none; b=eYuaOnNS03Mj6kbm8WsQfTEcqf/FKKHS6gzCK3PTi88sq8Y9VKGPlBYsItGiVSbw0qwUPAyugwPpqAkTlcmOrD7itzE3xeAw1Omo391oUnMiXmjycyZNodqM/ty+b6VAFDGzd2vKPcCoy2dZgMIyGQ8MqwXAu7AVr8e0+IUOJ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708961285; c=relaxed/simple;
	bh=/zIqNEIiZgqgESqdwwv84VSZjlqukKlOFeK313xRY+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PP7H49sG8EhtUlBfWiMh5GsNakyaVxdXjKQqahaj+pxi1gtM0IsMgNqGd468+XO1fDHXRQiFxSTn5hOHwSMDvCSF82QzgNtBd03jPzkcog5aP4cO1UEXfZ0mLptBJIHtgpBUXs0EmT8r4xvfDupCX43xOeLWDON+iavaNkBp2DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ldJt/rwH; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-29a6dcfdd30so2064220a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 07:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708961283; x=1709566083; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zUk/ORfZNSqc9ZCObPtK2ZClf11ZenkgiuTQii/H4vM=;
        b=ldJt/rwHc2iFKZEc+XMfvB/rDW0WTfyv5fjj5BjJGp64hKkXg1A3cYu63AV6e3g0rE
         HmsGE3a9jgslNlTgHNd3W7ekWkHflzi2rnCzrqNpvyUPw0D65AtLF1m+v+IgCc5WVeJX
         T8ZAyf4dw6fb4b1l57RRpWe3x00SfUonSA2hoeqOT6ZWIsmaC8mBuiOZWm8Umy4CvFrL
         hymUKCimhyZLqdIWUjbcLfLRSXXTUjep5P/HZnOJTkfGmAlHBrlTzq4CduVmpy89wP9V
         /qGoZpke7L4FvRipxUU5vc5QWLLAK5fJfl42RRycRDLYp817sninRTYYnCor1ni51r/U
         HAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708961283; x=1709566083;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zUk/ORfZNSqc9ZCObPtK2ZClf11ZenkgiuTQii/H4vM=;
        b=tpwSHTB9IEq2moquS7CXwfK7cHhMN1UrKFPkKIavB89+452kzftAMUfaAYq9EUPKY8
         bRnnhjLp0LFKSkp4CxAtlu1Fd6S3VIAc6gXL88UxYC/k+tJU8eAleBFTOGbX78VO1xuB
         5n6PcCphJqkxoFsVXrMlhbgwzTcLC6IIC/VIHqM30E75Ka+K1QsthGsT44cA/39LNlZx
         VUHCc121nfsr+1In2HO1EsF1B22p1PUSKkcV3si5/thQ0exhO35bU3QDh+4gX9GVLPZm
         KPyrPogawyBK6wKUXH0HnosSoBd+JdL8bkDXfAoybj8t1Pz7qoRakiflDIicIIEK2e/Y
         dO4g==
X-Forwarded-Encrypted: i=1; AJvYcCXirPObtaURX0iqR8e6IvFZ1jNsKGG3UOrD4K+mrZKGI4ny7qimG5/Km+j2crEicjxo3A73P8kbRFRKtmjhthWp55Gz0IlkUAN1d6yt0A==
X-Gm-Message-State: AOJu0YxFcz99CJLpyEMsksS2nvBUIZXbWR896V9TNwqXw2mCJc5tHusq
	1OFHXNcCIo2Ci9uemtsHriCTWjFbpTuGjSS1Ytn52poN5YG2M9Nv/aDs8MuArQ==
X-Google-Smtp-Source: AGHT+IFASf7wo/ZepyNEJ40sBxrik6uh3CI0+HCHyKlm+3jmHjdxgtw9uL5jNgpl+vxlzT6sDHAIBw==
X-Received: by 2002:a17:90a:fe0d:b0:29a:7f4f:c55a with SMTP id ck13-20020a17090afe0d00b0029a7f4fc55amr5377972pjb.7.1708961283129;
        Mon, 26 Feb 2024 07:28:03 -0800 (PST)
Received: from thinkpad ([117.202.184.81])
        by smtp.gmail.com with ESMTPSA id c13-20020a63da0d000000b005dcaa45d87esm4110876pgh.42.2024.02.26.07.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 07:28:02 -0800 (PST)
Date: Mon, 26 Feb 2024 20:57:57 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v3 1/5] PCI: dwc: Refactor dw_pcie_edma_find_chip() API
Message-ID: <20240226152757.GF8422@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-1-cfcb8171fc24@linaro.org>
 <fielxplkgrvz5qmqrrq5ahmah5yqx7anjylrlcqyev2z2cl2wo@3ltyl242vkba>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fielxplkgrvz5qmqrrq5ahmah5yqx7anjylrlcqyev2z2cl2wo@3ltyl242vkba>

On Mon, Feb 26, 2024 at 03:45:16PM +0300, Serge Semin wrote:
> Hi Manivannan
> 
> On Mon, Feb 26, 2024 at 05:07:26PM +0530, Manivannan Sadhasivam wrote:
> > In order to add support for Hyper DMA (HDMA), let's refactor the existing
> > dw_pcie_edma_find_chip() API by moving the common code to separate
> > functions.
> > 
> > No functional change.
> > 
> > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.c | 52 +++++++++++++++++++++-------
> >  1 file changed, 39 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index 250cf7f40b85..193fcd86cf93 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -880,7 +880,17 @@ static struct dw_edma_plat_ops dw_pcie_edma_ops = {
> >  	.irq_vector = dw_pcie_edma_irq_vector,
> >  };
> >  
> > -static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> > +static void dw_pcie_edma_init_data(struct dw_pcie *pci)
> > +{
> > +	pci->edma.dev = pci->dev;
> > +
> > +	if (!pci->edma.ops)
> > +		pci->edma.ops = &dw_pcie_edma_ops;
> > +
> > +	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> > +}
> > +
> > +static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
> >  {
> >  	u32 val;
> >  
> > @@ -900,24 +910,27 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> >  	else
> >  		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > 
> 
> > -	if (val == 0xFFFFFFFF && pci->edma.reg_base) {
> > -		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> > -
> > -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > -	} else if (val != 0xFFFFFFFF) {
> > -		pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> > +	/* Set default mapping format here and update it below if needed */
> > +	pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> >  
> > +	if (val == 0xFFFFFFFF && pci->edma.reg_base)
> > +		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> > +	else if (val != 0xFFFFFFFF)
> >  		pci->edma.reg_base = pci->dbi_base + PCIE_DMA_VIEWPORT_BASE;
> > -	} else {
> > +	else
> >  		return -ENODEV;
> > -	}
> 
> Sorry for not posting my opinion about this earlier, but IMO v2 code
> was more correct than this one. This version makes the code being not
> linear as it was in v2, thus harder to comprehend:
> 
> 1. Setting up a default value and then overriding it or not makes the
> reader to keep in mind the initialized value which is harder than to
> just read what is done in the respective branch.
> 

No, I disagree. Whether we set the default value or not, EDMA_MF_EDMA_LEGACY is
indeed the default mapping format (this is one of the reasons why the enums
should start from 1 instead of 0). So initializing it to legacy is not changing
anything, rather making it explicit.

> 2. Splitting up the case clause with respective inits and the mapping
> format setting up also makes it harder to comprehend what's going on.
> In the legacy case the reg-base address and the mapping format init are
> split up while they should have been done simultaneously only if (val
> != 0xFFFFFFFF).
> 

Well again, this doesn't matter since the default mapping format is legacy. But
somewhat agree that the two clauses are setting different fields, but even if
the legacy mapping format is set inside the second clause, it still differs from
the first one since we are not setting reg_base.

> 3. The most of the current devices has the unrolled mapping (available
> since v4.9 IP-core), thus having the mf field pre-initialized produces
> a redundant store operation for the most of the modern devices.
> 

Ok, this one I agree. We could avoid the extra assignment.

> 4. Getting rid from the curly braces isn't something what should be
> avoided at any cost and doesn't give any optimization really. It
> doesn't cause having less C-lines of the source code and doesn't
> improve the code readability.
> 

Yeah, there is no benefit other than a simple view of the code. But for point
(3), I agree to roll back to v2 version.

> So to speak, I'd suggest to get back the v2 implementation here.
> 
> >  
> > -	pci->edma.dev = pci->dev;
> > +	return 0;
> > +}
> >  
> > -	if (!pci->edma.ops)
> > -		pci->edma.ops = &dw_pcie_edma_ops;
> > +static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> > +{
> > +	u32 val;
> >  
> > -	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> 
> > +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > +	else
> > +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> 
> Just dw_pcie_readl_dma(pci, PCIE_DMA_CTRL)
> 

'val' is uninitialized. Why should the assignment be skipped?

- Mani

> -Serge(y)
> 
> >  
> >  	pci->edma.ll_wr_cnt = FIELD_GET(PCIE_DMA_NUM_WR_CHAN, val);
> >  	pci->edma.ll_rd_cnt = FIELD_GET(PCIE_DMA_NUM_RD_CHAN, val);
> > @@ -930,6 +943,19 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> >  	return 0;
> >  }
> >  
> > +static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> > +{
> > +	int ret;
> > +
> > +	dw_pcie_edma_init_data(pci);
> > +
> > +	ret = dw_pcie_edma_find_mf(pci);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return dw_pcie_edma_find_channels(pci);
> > +}
> > +
> >  static int dw_pcie_edma_irq_verify(struct dw_pcie *pci)
> >  {
> >  	struct platform_device *pdev = to_platform_device(pci->dev);
> > 
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்

