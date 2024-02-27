Return-Path: <linux-arm-msm+bounces-12650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F218689E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 08:35:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02821F21EAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 07:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7965754BE3;
	Tue, 27 Feb 2024 07:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ldv9eMli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915B54F96
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 07:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709019307; cv=none; b=j793c42x4j87eaaatVpc5FYePwvRVNc4Hc/n/VJMDC3/zSau+ramFOKkz8ks7d4vApEWe/Xrbx7L8YRGKp5AdzNyjm1/z2dd9B/F9Gsc/+dgBKloabky9/G6rcDd8GCQZIzYX4rpvX1+yJAEfVbgdpttrwVFkhfdzU/q/u9U7bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709019307; c=relaxed/simple;
	bh=pAafngDaYgAut7R/eqNrFUqz29Ygcobextfawbs04io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j3TV+YYWI4H4D/MpmEC0ICfXLPtK07JrxgXGQ91BpoXstOLgSGS9X8W8/gDe3n8z/r4DVToZalo+W969lFnZq4aZH+Lj+Sp5l7MLyhKJ3CyOBSUeU3/3G5KKdeJJ3lxt/qk66VLqS5ADyAiUGOBigUSLkBYfrlrXOrPtESUeR/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ldv9eMli; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dc1e7c0e29so18708395ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Feb 2024 23:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709019304; x=1709624104; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jxJu0PThWsJVSfDTe50TdK1bwGEaXtV2aPTG4iN2Vf8=;
        b=Ldv9eMliPNuJOQNTebLIHNFAhoTyc7jYzHlXL3CnljzC1st/5PvbXGk3X1carT9hWb
         8wqfoGwl2Nww8cGeZt79utcom9UWUGyS/xxWWHz8IIB59QlOGhDAibX7kdnybZReo/Cw
         5DRPWYgnwVxJPhf05lXVwPQG9eOU2ota1xzwIRacRkk/t0Pp6qYcHImblFsY+FNZOUgG
         Jp52r/01RgW5MITngHxk/tV0/Y2JvxWHsTxhIeaUzuu88i/EzFbWlae+e2AEfjqhAzfH
         7P1MWw/0B4y8pCVkXxM6VhrXyN8PNFzUprzqsnWk3r7HsG5BBpwR6rPLLovMDww99kBN
         76qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709019304; x=1709624104;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxJu0PThWsJVSfDTe50TdK1bwGEaXtV2aPTG4iN2Vf8=;
        b=JLJja4tLVR8JUYLWZcNZUs0R2azR1C6ln4y0zqmSBUJ9VMt3/POUs2EQ8Pq3rSPXFR
         00i53ZFUxNgvein90//Bw5K/dFlDYe2WtXdEAkJGrPN0gE19hzPRFbnxtx+6ldtku7+l
         QDe4C/IBDAkJh2pvN9JRBKRdiOSduluPkfZRz5cBVe4dEhmHdCkN7lhtp0IuV+Ze5QYI
         8N8IxbWpaYlhTVToaDK5bMxONxbm6vgpWXvnUUhOdZhb7JyXE+BN3Ea6wjV1D0f8wmP1
         56G/1OEXklsZZfKvdwykO1krXpMPC5L58e0GjS3AETmrOmvPCWuR9c1ZFswIe8RVLve1
         x4Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWAuHtfbPwQWwRtXz8fROk38tpYrmn3Oay7Lfd7afKsCLERypozRws8ULU2A4KzL8NHLubZY9KfkPxO0sSENfuqOB3Yw9of/QVFFJ1ibg==
X-Gm-Message-State: AOJu0YwvvpR4/HK19QOzWHHduyP7jksP+Jc0YT2YqodW6/wfJA2jlPrn
	emfCURcd3i+oahxUS/lqBKmE0Qs+29EFDGXSBs4/A624+NdN+9i2YZN4cLat7W3v9GQfrxrXCSw
	=
X-Google-Smtp-Source: AGHT+IF5qCH87pgk8mzfEN6e/vWkj+Lkv+zoEImw8I8EPmhF8wuiKbsba1BqsKFCjz+kC+4zNB6kVg==
X-Received: by 2002:a17:903:41cb:b0:1dc:38c7:ba1a with SMTP id u11-20020a17090341cb00b001dc38c7ba1amr11749172ple.25.1709019304388;
        Mon, 26 Feb 2024 23:35:04 -0800 (PST)
Received: from thinkpad ([117.213.97.177])
        by smtp.gmail.com with ESMTPSA id g13-20020a170902c38d00b001d9eef9892asm852511plg.174.2024.02.26.23.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 23:35:04 -0800 (PST)
Date: Tue, 27 Feb 2024 13:04:55 +0530
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
Message-ID: <20240227073455.GG2587@thinkpad>
References: <20240226-dw-hdma-v3-0-cfcb8171fc24@linaro.org>
 <20240226-dw-hdma-v3-1-cfcb8171fc24@linaro.org>
 <fielxplkgrvz5qmqrrq5ahmah5yqx7anjylrlcqyev2z2cl2wo@3ltyl242vkba>
 <20240226152757.GF8422@thinkpad>
 <6r7kquumuaga5j2hosyi6fla6frdzm5e4iobt7dtftjuwm7wku@7wij7dfhneob>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6r7kquumuaga5j2hosyi6fla6frdzm5e4iobt7dtftjuwm7wku@7wij7dfhneob>

On Tue, Feb 27, 2024 at 12:00:41AM +0300, Serge Semin wrote:
> On Mon, Feb 26, 2024 at 08:57:57PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Feb 26, 2024 at 03:45:16PM +0300, Serge Semin wrote:
> > > Hi Manivannan
> > > 
> > > On Mon, Feb 26, 2024 at 05:07:26PM +0530, Manivannan Sadhasivam wrote:
> > > > In order to add support for Hyper DMA (HDMA), let's refactor the existing
> > > > dw_pcie_edma_find_chip() API by moving the common code to separate
> > > > functions.
> > > > 
> > > > No functional change.
> > > > 
> > > > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >  drivers/pci/controller/dwc/pcie-designware.c | 52 +++++++++++++++++++++-------
> > > >  1 file changed, 39 insertions(+), 13 deletions(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > > > index 250cf7f40b85..193fcd86cf93 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > > > @@ -880,7 +880,17 @@ static struct dw_edma_plat_ops dw_pcie_edma_ops = {
> > > >  	.irq_vector = dw_pcie_edma_irq_vector,
> > > >  };
> > > >  
> > > > -static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> > > > +static void dw_pcie_edma_init_data(struct dw_pcie *pci)
> > > > +{
> > > > +	pci->edma.dev = pci->dev;
> > > > +
> > > > +	if (!pci->edma.ops)
> > > > +		pci->edma.ops = &dw_pcie_edma_ops;
> > > > +
> > > > +	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> > > > +}
> > > > +
> > > > +static int dw_pcie_edma_find_mf(struct dw_pcie *pci)
> > > >  {
> > > >  	u32 val;
> > > >  
> > > > @@ -900,24 +910,27 @@ static int dw_pcie_edma_find_chip(struct dw_pcie *pci)
> > > >  	else
> > > >  		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > > > 
> > > 
> > > > -	if (val == 0xFFFFFFFF && pci->edma.reg_base) {
> > > > -		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> > > > -
> > > > -		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > > -	} else if (val != 0xFFFFFFFF) {
> > > > -		pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> > > > +	/* Set default mapping format here and update it below if needed */
> > > > +	pci->edma.mf = EDMA_MF_EDMA_LEGACY;
> > > >  
> > > > +	if (val == 0xFFFFFFFF && pci->edma.reg_base)
> > > > +		pci->edma.mf = EDMA_MF_EDMA_UNROLL;
> > > > +	else if (val != 0xFFFFFFFF)
> > > >  		pci->edma.reg_base = pci->dbi_base + PCIE_DMA_VIEWPORT_BASE;
> > > > -	} else {
> > > > +	else
> > > >  		return -ENODEV;
> > > > -	}
> > > 
> > > Sorry for not posting my opinion about this earlier, but IMO v2 code
> > > was more correct than this one. This version makes the code being not
> > > linear as it was in v2, thus harder to comprehend:
> > > 
> > > 1. Setting up a default value and then overriding it or not makes the
> > > reader to keep in mind the initialized value which is harder than to
> > > just read what is done in the respective branch.
> > > 
> > 
> > No, I disagree. Whether we set the default value or not, EDMA_MF_EDMA_LEGACY is
> > indeed the default mapping format (this is one of the reasons why the enums
> > should start from 1 instead of 0). So initializing it to legacy is not changing
> > anything, rather making it explicit.
> > 
> > > 2. Splitting up the case clause with respective inits and the mapping
> > > format setting up also makes it harder to comprehend what's going on.
> > > In the legacy case the reg-base address and the mapping format init are
> > > split up while they should have been done simultaneously only if (val
> > > != 0xFFFFFFFF).
> > > 
> > 
> > Well again, this doesn't matter since the default mapping format is legacy. But
> > somewhat agree that the two clauses are setting different fields, but even if
> > the legacy mapping format is set inside the second clause, it still differs from
> > the first one since we are not setting reg_base.
> > 
> > > 3. The most of the current devices has the unrolled mapping (available
> > > since v4.9 IP-core), thus having the mf field pre-initialized produces
> > > a redundant store operation for the most of the modern devices.
> > > 
> > 
> > Ok, this one I agree. We could avoid the extra assignment.
> > 
> > > 4. Getting rid from the curly braces isn't something what should be
> > > avoided at any cost and doesn't give any optimization really. It
> > > doesn't cause having less C-lines of the source code and doesn't
> > > improve the code readability.
> > > 
> > 
> > Yeah, there is no benefit other than a simple view of the code. But for point
> > (3), I agree to roll back to v2 version.
> > 
> > > So to speak, I'd suggest to get back the v2 implementation here.
> > > 
> > > >  
> > > > -	pci->edma.dev = pci->dev;
> > > > +	return 0;
> > > > +}
> > > >  
> > > > -	if (!pci->edma.ops)
> > > > -		pci->edma.ops = &dw_pcie_edma_ops;
> > > > +static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> > > > +{
> > > > +	u32 val;
> > > >  
> > > > -	pci->edma.flags |= DW_EDMA_CHIP_LOCAL;
> > > 
> > > > +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > > > +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > > > +	else
> > > > +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> > > 
> > > Just dw_pcie_readl_dma(pci, PCIE_DMA_CTRL)
> > > 
> > 
> > 'val' is uninitialized. Why should the assignment be skipped?
> 
> The entire
> 
> +	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> +		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> +	else
> +		val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> 
> can be replaced with a single line
> 
> +	val = dw_pcie_readl_dma(pci, PCIE_DMA_CTRL);
> 
> since in the legacy case (reg_base = PCIE_DMA_VIEWPORT_BASE) and the
> reg_base has been initialized by now.
> 

Ah okay, got it!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

