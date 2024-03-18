Return-Path: <linux-arm-msm+bounces-14318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4665E87E324
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 06:34:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABF49B21C22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 05:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297C2224F6;
	Mon, 18 Mar 2024 05:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MLipzEQV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB00224D4
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 05:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710740085; cv=none; b=GC5OiqmxRQfMPF2RCPP5GIbuE/HnJS5TFjWrmW7SRb0tk5JfbITLiiyPwa/c1seJvy+jN2WNJzmKzeQC0Cn1Vt+eI7ivkOYkCYLBaNzB+N/mY6xbaKZiFoHQsU3JT8aU6syverMXZye1rx0rc2SuMKeHhs+TWWT9DFv1tR4MWEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710740085; c=relaxed/simple;
	bh=AiQOLLLmKWz3oZYJRfuHOSVlqQaIsEFensTv4wlYHnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPULZ3VydFoTIUd9Z9p5w2yz6JgdNl8QcwXgCWGH8jgBFw9ntJx4ZTA5voc2ngT68fzQXoSStA/sTfYfSZb9JYI5dW2SWvHzNwznHVlPTYvReu4EiPtdlbFb+QzobmEZvBOm3pckClOehFQDyeZHYuRZqDFUBD5Tjw2G4I17cUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MLipzEQV; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1def2a1aafaso13639545ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Mar 2024 22:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710740083; x=1711344883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EF1nwg1aauriBtLQKhQ+qgjoLON5IninqkCOyqnKfIU=;
        b=MLipzEQV0gxN2OKJbLKyFpTB+rlPYzsGEluz8JatYcXNo6e4ePIz22Z8mQoADhQ9ln
         DnKsggq7+JSy2To/nLKUhKLBGNIstUg4m6QHaxtDO9OLKWo6TQcL08+mqONznmMH/b9h
         WQls9isQkAuxREugh0b1V557pR/aGFmpNoifGwTNGG0dQnIGSljWPPvR0Wz3nvKuPFzk
         dF6lJ6VerMLrMRlwc6ODu1ZuM+22Zcp1jzlPljtRxmLs02ZDUq6bEEclG39qFElPUKYR
         NFzFfdULbGLB0WRC5KtmirETSVcVt3Ja6YbKsxFddpo1mB5B379UlUK7Tsmml+xAEeXO
         Pt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710740083; x=1711344883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EF1nwg1aauriBtLQKhQ+qgjoLON5IninqkCOyqnKfIU=;
        b=cNCIUrXVm81yHGXKCMVjc2rSVrDW/GtfeWn9TSFf3Q+7/SVGJihn/dW15K6r4Fxrzg
         Bh5oz8YuPCTIfND4KOf5xSRBMgUzWzMfKP5aYkGUXdY/m32YfJNfytRo1bPcp3RwGWjT
         rhSKYMmVApq11ELkS4TqaqJjKWmmbeoOPgyQ+idNss3ZwkMm5sKFhAFMjr8sqFhETNUN
         IpvvKh6WFLRW7gAd8DwjV9YLlt/++QXHFOGWhr3kNrpjCDRLYrLGHy2UssNHm/Qn2oEP
         zVpecM7xHzls15DFdCtjEo+kCJuE+QErx2NuIrxmldJL74998Upf/BaIceNYbTw3SD4q
         nJBA==
X-Forwarded-Encrypted: i=1; AJvYcCXEy+muxuSGCC1uhSq4p/Lw3xRWJl+fv+uw6Hp2I9fVUPtoVL3NvmMhokZxhT7s3OdxQTHyJBcpFuj6+zk/svq2hrRXa2QO6YXJNe/8vg==
X-Gm-Message-State: AOJu0YwOPCcmimFf/qT9VFaKdDYIps/WBlbAgT3n3eMzXbZoRbV1TVmg
	qxiNoxVspLbquy5+YPtMuCopzSL65HSV/yrvEYsHNIPzpgJ2bm+lchyh76qV0A==
X-Google-Smtp-Source: AGHT+IEKMHb+7xvRCgR/g4XEp4tB9vwgi0BH58gTwM7mvpy1llF9PEEfvC2uPC2VQbcd7dshAsa6Mg==
X-Received: by 2002:a17:903:22d1:b0:1e0:1a96:33d1 with SMTP id y17-20020a17090322d100b001e01a9633d1mr2858887plg.16.1710740082128;
        Sun, 17 Mar 2024 22:34:42 -0700 (PDT)
Received: from thinkpad ([103.246.195.160])
        by smtp.gmail.com with ESMTPSA id mp6-20020a170902fd0600b001dee3c1559dsm7127313plb.303.2024.03.17.22.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 22:34:41 -0700 (PDT)
Date: Mon, 18 Mar 2024 11:04:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	mhi@lists.linux.dev, Siddharth Vadapalli <s-vadapalli@ti.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v4 2/5] PCI: dwc: Skip finding eDMA channels count for
 HDMA platforms
Message-ID: <20240318053436.GE2748@thinkpad>
References: <20240306-dw-hdma-v4-0-9fed506e95be@linaro.org>
 <20240306-dw-hdma-v4-2-9fed506e95be@linaro.org>
 <kqztfm6ri54pkxcmsmngldmlf22mt2vn5cgxxfhjqxujx3qkq2@us6rc2sof7gk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <kqztfm6ri54pkxcmsmngldmlf22mt2vn5cgxxfhjqxujx3qkq2@us6rc2sof7gk>

On Tue, Mar 12, 2024 at 12:17:48PM +0300, Serge Semin wrote:
> On Wed, Mar 06, 2024 at 03:51:58PM +0530, Manivannan Sadhasivam wrote:
> > In the case of Hyper DMA (HDMA) present in DWC controllers, there is no way
> > the drivers can auto detect the number of read/write channels as like its
> > predecessor embedded DMA (eDMA). So the glue drivers making use of HDMA
> > have to pass the channels count during probe.
> > 
> > To accommodate that, let's skip the existing auto detection of channels
> > count procedure for HDMA based platforms. If the channels count passed by
> > the glue drivers were wrong in any form, then the existing sanity check
> > will catch it.
> > 
> > Suggested-by: Serge Semin <fancer.lancer@gmail.com>
> > Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>
> 
> Please find a tiny nitpick further below.
> 
> > ---
> >  drivers/pci/controller/dwc/pcie-designware.c | 15 ++++++++++-----
> >  1 file changed, 10 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> > index 3a26dfc5368f..599991b7ffb2 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware.c
> > @@ -927,13 +927,18 @@ static int dw_pcie_edma_find_channels(struct dw_pcie *pci)
> >  {
> >  	u32 val;
> >  
> > -	if (pci->edma.mf == EDMA_MF_EDMA_LEGACY)
> > -		val = dw_pcie_readl_dbi(pci, PCIE_DMA_VIEWPORT_BASE + PCIE_DMA_CTRL);
> > -	else
> 
> > +	/*
> > +	 * Autodetect the read/write channels count only for non-HDMA platforms.
> > +	 * HDMA platforms doesn't support autodetect, so the glue drivers should've
> > +	 * passed the valid count already. If not, the below sanity check will
> > +	 * catch it.
> > +	 */
> 
> This is correct for the _native_ HDMA CSRs mapping. I suggest to emphasize
> that in the note above.
> 

Ack.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

