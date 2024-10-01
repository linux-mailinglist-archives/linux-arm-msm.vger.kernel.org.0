Return-Path: <linux-arm-msm+bounces-32831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3698B2EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 06:21:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDBFC1C22BDD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 04:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0384A1B3F20;
	Tue,  1 Oct 2024 04:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="edQTh1YM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27F81B0119
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Oct 2024 04:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727756463; cv=none; b=P87huaXk7t0HeFeUDqKLnnCwuDHEWC7iurMkUul8EjqVjJKA4i+riEeOXI7RrsACxOWMVpm0hiI0psqNH4aMWNdsyV8fjyx9MzZDFqfNUt+Tj0vN1B/noTGEm2yPROKYIZ0MLKtXwaMnFbVUUwzaeUOsYB2EWYt6HAbPFG54L+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727756463; c=relaxed/simple;
	bh=2vHVnH/4a+TI9m7+h+0WNgqxTEdog8ZD2UBhQAmgP4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+FK+Kis4M+faKV47OhlKuWmhG3cPDBcpz6o7m500q3dHOsT1mAkaBH9Zx2wX7Hw+iVe3A5rQCsFivjLBV00D06pDY2w5R4uv8fHZbhWT4zxtxJXo6jygj28+VbbQIY5NYcfk04Qei9fCzbhN65WGVYTWnEjQV1erKH/CgZ39w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=edQTh1YM; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e09ff2d890so4249179a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Sep 2024 21:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727756461; x=1728361261; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=icoY3qoHkJebuDnNC7tmCQDTScbY4VF90NsdASl0kCo=;
        b=edQTh1YMq1tDMhrYR7c3L25kn9/5bFcT0dXamDYHm/u06Qe7LPes3bI2kvOvpZt1Pt
         hS6c6k/DaQtoVmzEbybbbGCxiJOoJ5K7P9cnufBtoXIEZUR3lAfQnymMJTWumRqzve2P
         UlzeWkN9Db13WdfVMIcw4vELHmxkI9tmdarjh+xqKoFSKBzf3esEW2BrL8GX5ToqbQ7R
         onTgOZlulYNeWwtkYXeaf8N/lrCDh72RVKYFO5U1bcDUAHnFUVr2ugvpmaXvygmDzkpg
         ui98LC8eFWf/pvMaIKnqYlse8dXquStPTg5xa36R/7Xf8pxga18HtePbyNiRHf3+8faJ
         8bYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727756461; x=1728361261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=icoY3qoHkJebuDnNC7tmCQDTScbY4VF90NsdASl0kCo=;
        b=shu+W7Y+47zq8PveFLCCMLlwCAqWe0be8GF8I9yV99b/gJBvziaHnGBhteH9YaCBKG
         8QRo/i9OwbdAZ5JSr48KflzV9aG3hk5wVd+tfQGDGWphRpaZ6wvgVAOYAf0wCbWLyJvI
         7u8IkvVvdzwQUo4Dd0dAhwHwavUt9E8rY43dAkfTo+xZNlDnCF3633gL4sjrptVdui8G
         fhXkKOZ5aFAfiuLlOF54/C5T1TgY93WA4Hy/QIB/A6fPjuhR3y08Z/WLD2txAkfONhwO
         aitULT7A+5R9AZPyOSJElQvEqxbXVQh3rV6SEMftpfAYeOEhDNy1EJeOecjXlVp95suG
         mkpw==
X-Forwarded-Encrypted: i=1; AJvYcCWZzXhUnOSeTf+6rLFfqzwGneyrm1DvNNj9Tpux22NAuhEf+I+5Fb5Lo01JGZtgG8dq0xnkxtS3fquUuSJz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+U9S+zi5YKNDURkYPbE44XWTlgJbE3LFkcOKz2SwYGSpymGQC
	0iWu2WxHQnHhjVWJkxyDZ4Iiapo61L4ziX6uugFaK4Mvkh3g7Amj9YStDBQcbjg3ibEBokbAlvQ
	=
X-Google-Smtp-Source: AGHT+IGkODG87Nrx6whSCqQEnsxe02WoLf8cq/2tdiwWSa7nfwMsiRNiYuTbQPvVnCH9JZuf5OUInQ==
X-Received: by 2002:a17:90a:db56:b0:2d8:a344:900d with SMTP id 98e67ed59e1d1-2e0b89dffbemr16116715a91.12.1727756461219;
        Mon, 30 Sep 2024 21:21:01 -0700 (PDT)
Received: from thinkpad ([36.255.17.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0fdafsm61579625ad.148.2024.09.30.21.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 21:21:00 -0700 (PDT)
Date: Tue, 1 Oct 2024 09:50:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_qianyu@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH] PCI: qcom: Enable MSI interrupts together with Link up
 if global IRQ is supported
Message-ID: <20241001042055.ivf4zspq4fqmaxth@thinkpad>
References: <20240930134409.168494-1-manivannan.sadhasivam@linaro.org>
 <20240930171101.GA180132@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930171101.GA180132@bhelgaas>

On Mon, Sep 30, 2024 at 12:11:01PM -0500, Bjorn Helgaas wrote:
> On Mon, Sep 30, 2024 at 07:14:09PM +0530, Manivannan Sadhasivam wrote:
> > Currently, if global IRQ is supported by the platform, only the Link up
> > interrupt is enabled in the PARF_INT_ALL_MASK register. But on some Qcom
> > platforms like SM8250, and X1E80100, MSIs are getting masked due to this.
> > They require enabling the MSI interrupt bits in the register to unmask
> > (enable) the MSIs.
> 
> "global IRQ" is a very generic name.  If that's the official name, it
> should at least be capitalized, e.g., "Global IRQ", to show that it is
> a proper noun that refers to a specific IRQ.
> 

Sure.

> > Even though the MSI interrupt enable bits in PARF_INT_ALL_MASK are
> > described as 'diagnostic' interrupts in the internal documentation,
> > disabling them masks MSI on these platforms. Due to this,
> 
> > MSIs were not
> > reported to be received these platforms while supporting global IRQ.
> 
> I'm trying to parse "while supporting global IRQ."  We basically
> support global IRQ by installing qcom_pcie_global_irq_thread(), but of
> course the device doesn't see that, so I assume it would be more
> informative to say that MSIs are masked by some register setting.
> 

Hmm, this is what I mentioned in the above paragraph referencing
PARF_INT_ALL_MASK register. Is that not clear enough?

> The patch suggests that MSIs are masked internally unless
> PARF_INT_MSI_DEV_0_7 is set in PARF_INT_ALL_MASK.
> 
> Are you saying that prior to 4581403f6792, MSIs did work?  Does that
> mean PARF_INT_MSI_DEV_0_7 was set by a bootloader or something, so
> MSIs worked?  And then 4581403f6792 came along and implicitly cleared
> PARF_INT_MSI_DEV_0_7, so MSIs were then masked?
> 

Yeah. Those bits were enabled by default in hardware, but since they were
mentioned as 'diagnostic interrupts' in documentation, commit 4581403f6792
intentionally disabled them. But that results in MSIs getting masked in
*some* platforms.

- Mani

> > So enable the MSI interrupts along with the Link up interrupt in the
> > PARF_INT_ALL_MASK register if global IRQ is supported. This ensures that
> > the MSIs continue to work and also the driver is able to catch the Link
> > up interrupt for enumerating endpoint devices.
> > 
> > Fixes: 4581403f6792 ("PCI: qcom: Enumerate endpoints based on Link up event in 'global_irq' interrupt")
> > Reported-by: Konrad Dybcio <konradybcio@kernel.org>
> > Closes: https://lore.kernel.org/linux-pci/9a692c98-eb0a-4d86-b642-ea655981ff53@kernel.org/
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index ef44a82be058..2b33d03ed054 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -133,6 +133,7 @@
> >  
> >  /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> >  #define PARF_INT_ALL_LINK_UP			BIT(13)
> > +#define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
> >  
> >  /* PARF_NO_SNOOP_OVERIDE register fields */
> >  #define WR_NO_SNOOP_OVERIDE_EN			BIT(1)
> > @@ -1716,7 +1717,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> >  			goto err_host_deinit;
> >  		}
> >  
> > -		writel_relaxed(PARF_INT_ALL_LINK_UP, pcie->parf + PARF_INT_ALL_MASK);
> > +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_MSI_DEV_0_7,
> > +			       pcie->parf + PARF_INT_ALL_MASK);
> >  	}
> >  
> >  	qcom_pcie_icc_opp_update(pcie);
> > -- 
> > 2.25.1
> > 

-- 
மணிவண்ணன் சதாசிவம்

