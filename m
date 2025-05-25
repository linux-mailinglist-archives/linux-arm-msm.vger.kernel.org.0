Return-Path: <linux-arm-msm+bounces-59315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484BAC32E2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 10:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C20403B90AF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 08:00:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 132E019E819;
	Sun, 25 May 2025 08:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nDvWVW2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF953D984
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748160040; cv=none; b=jjneZWWK93X12qAFLa9fw6xqxxq7ECAD+eDLJpGrNOYEyUx474w+vaNqfldbKyQyNbbuMykG3kx9r+dO6mlgO8Nn+A7xw6vHtSVsAKgLULldlrgkG+EQQMbGVmF11KX0awpz9B5uoL8ZfzE/Uuo/m11wnxY+X8GMPSAvul94pD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748160040; c=relaxed/simple;
	bh=L3aMHR4CTO/nCqAwynDrCTi/8dVwtXeVc2t3Pr6BsgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qmOk+E+cLEGQUZFtGJ4wepHAHBLaQAfRgoEGRBYlee+FKcVxTd+unc2uKsDSSlmvgxjHawe6qAHM067vPfdeJfYsGejqtD8BDycRr3yTYhX//Wv4mvnBewJyh6H7/u3iALozqVsgr/OWxYkl6hDY56uXRtQ1QSseVJL9zi7USx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nDvWVW2a; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso953389b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 01:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748160037; x=1748764837; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iflJB+w+lsWSV4UDga7gqAG5xctQ/PU9lw7yRpGdqCM=;
        b=nDvWVW2aF0IlbWgrJQ6ila6b/rvXr83BRffYulH9SXiqDFXvcdo8p2eM1QZJ6hRhpc
         IQW18v3W57wmgrQIBBcoIuMFhU3Yfav6OMqm52zuLsb9pGJDPvX/1+R9TLFjJ03kxarE
         TK2NSHmOrf752BQl3LdpFraoGXIDhZP7q+tttJua5jswPC9568Y4lls//ZtjrmV/9+95
         lXO1So1lqvzb/Kc6oz/cSaW4bpm9j4vPzMKZA9DafFYzOcdmZeR3dTlOqZW93QfndCi+
         wntLqaZEJZ+iATsPPuUhpVERaW5sO/hJNih3YqWixoskNJjJxKtZI5ThJYrWqNJV4RoP
         drLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748160037; x=1748764837;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iflJB+w+lsWSV4UDga7gqAG5xctQ/PU9lw7yRpGdqCM=;
        b=OK+6mBHODJdYRX9jFeTXrAYMQaz2Al7k8zQNs4JUgY+MZQEPls6ANw9IFvu4TeF/TQ
         TmV0vIZNMVonSdtJ+trRx4L46CI7kK8MERKINkiz/cBAVFDu0E4j3x5+7ZGC3H4lABeU
         XrRcadQSc2jyXCg5clz8f5npom60QpNnAfyk3/SHu0BZtikrj/VqY/oakn2rAELjUtwT
         zYJHuMHuy47jzTftfN0fR+8R5tDLARBpzpAdWxlaRU157M3WoPGAlUMkhQ1ZgghFufff
         sKW6yaRrvdJYETjsLx3I2wOTe+nlInzIeWZTlLe/W/bAPF6z4AaLcTNU1/xz5ZjC+3x6
         A3bg==
X-Forwarded-Encrypted: i=1; AJvYcCVNm0u5NygN7RHrE3hOxGfuniAa1Ojn2vq1Qu9v4z4c7cUNEoJymaPjwImXedIUrxuWE+O5jrp0jBTFXV/h@vger.kernel.org
X-Gm-Message-State: AOJu0YwjNOOpBaOPyY1zaJ3RbZgtvjAuP+q3aS1DatP9rfeBfAn8s11B
	qSw4gxq8GijB7G5ugFP4qQoIJdl1rAbqM/vGk/cNm3IGZNNSvByCvYT3UqSFfxJE3Q==
X-Gm-Gg: ASbGncuJxkoB5UmYT8M0ybGuzlQmX4Jd0eaJGpX7ntjLFvFrBqSBtQt1a5VGeLZXwxb
	TzB82QwdV9lfYWxi+JUwUXyuRaZpSH0TgXsDUURuR1zgwc85IqHunlSHCMFYxAg3Ki09dmWNSlc
	mEAemxEY3tKnYHBTt2zweQa6NY43Ratvx8+kasqAGCkxNEalg/BFmoxiQPJBII9lUzxfQTz5+5l
	reBvEa0cGiPIoNy7d6ZZUK0xP3teAQAtbRi8W0mUGc9GseKZC2K63Xej5+WP2ObupEzxsZmWv7r
	mGgQYoXDTl86NSUSgL3qkO1rXwQCtE2wkig5lnBvvqJDjSGNkFm2TyM4+BeoLM8=
X-Google-Smtp-Source: AGHT+IG2fQnMLM1qHNOz/+4mtcm1AbBKu3X2bdFMeu7peaLGvWWoekE628Sw8UBiyxEDYRCPbc1BNw==
X-Received: by 2002:a05:6a00:10cd:b0:73f:f816:dd7f with SMTP id d2e1a72fcca58-745fe08352dmr7554205b3a.15.1748160036849;
        Sun, 25 May 2025 01:00:36 -0700 (PDT)
Received: from thinkpad ([120.56.207.198])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746029d0b57sm1853087b3a.19.2025.05.25.01.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:00:36 -0700 (PDT)
Date: Sun, 25 May 2025 13:30:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com, 
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	wilfred.mallawa@wdc.com, Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/2] PCI: Rename host_bridge::reset_slot() to
 host_bridge::reset_root_port()
Message-ID: <2ha23gwiz2iakdm56e5qhnxdnfib6cnk3jnl4qkrafx3ouipn6@43lu4d7aoqwe>
References: <20250524185304.26698-1-manivannan.sadhasivam@linaro.org>
 <20250524185304.26698-3-manivannan.sadhasivam@linaro.org>
 <aDIyyMvQkMC40jnQ@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDIyyMvQkMC40jnQ@ryzen>

On Sat, May 24, 2025 at 10:57:44PM +0200, Niklas Cassel wrote:
> On Sun, May 25, 2025 at 12:23:04AM +0530, Manivannan Sadhasivam wrote:
> > The callback is supposed to reset the root port, hence it should be named
> > as 'reset_root_port'. This also warrants renaming the rest of the instances
> > of 'reset slot' as 'reset root port' in the drivers.
> > 
> > Suggested-by: Lukas Wunner <lukas@wunner.de>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-dw-rockchip.c |  8 ++++----
> >  drivers/pci/controller/dwc/pcie-qcom.c        |  8 ++++----
> >  drivers/pci/controller/pci-host-common.c      | 20 +++++++++----------
> >  drivers/pci/pci.c                             |  6 +++---
> >  include/linux/pci.h                           |  2 +-
> >  5 files changed, 22 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > index 193e97adf228..0cc7186758ce 100644
> > --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> > @@ -85,7 +85,7 @@ struct rockchip_pcie_of_data {
> >  	const struct pci_epc_features *epc_features;
> >  };
> >  
> > -static int rockchip_pcie_rc_reset_slot(struct pci_host_bridge *bridge,
> > +static int rockchip_pcie_rc_reset_root_port(struct pci_host_bridge *bridge,
> >  				       struct pci_dev *pdev);
> >  
> >  static int rockchip_pcie_readl_apb(struct rockchip_pcie *rockchip, u32 reg)
> > @@ -261,7 +261,7 @@ static int rockchip_pcie_host_init(struct dw_pcie_rp *pp)
> >  					 rockchip);
> >  
> >  	rockchip_pcie_enable_l0s(pci);
> > -	pp->bridge->reset_slot = rockchip_pcie_rc_reset_slot;
> > +	pp->bridge->reset_root_port = rockchip_pcie_rc_reset_slot;
> 
> You just renamed the function to rockchip_pcie_rc_reset_root_port(),
> but you seem to use the old name here, so I would guess that this will
> not compile.
> 

Yeah, I guess I exposed my sed skills here :P Will fix it up while applying.

> With the function pointer renamed, this patch looks good to me:
> Reviewed-by: Niklas Cassel <cassel@kernel.org>
> 

Thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

