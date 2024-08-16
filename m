Return-Path: <linux-arm-msm+bounces-28724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A629540CB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 07:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F6D61C22102
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 05:00:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF4067829C;
	Fri, 16 Aug 2024 05:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bR0YBm2/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1505E57CB1
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 05:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723784437; cv=none; b=mLnFZsYw6OMZDEwdqSbUsdRYmRBuAJqyU6GONwhxDCrbpCQey31jlGnjI9GxObJdAoBIwIg2MB0R9JElCSusfl0w6bhW4KptU3OAlZ4qp7upN67Qsgxd2llDvPc+aCGvvUx3ocjgOApVMeO8Y63D7lHklH/chzt1rBnVUrNQlZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723784437; c=relaxed/simple;
	bh=V+5F1oveRmv0pSVGDANeVXah31hJMa43N75rfuBEQ0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6tY/SJoBZs0b+1xeraxPbMD6TyXQE/osKR9YQTEJ8Tvw/p46O66vPxcJetVjyQWrGrtEfPIYELeuTAi1jqQ4Bah5kisW2axTo0305aZbJ9Bdd3khfBmAQ4of9fOyO2DfpF4olf8g9XvdbPFgaz/12xYNwkIvEw1IcgOaox7KlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bR0YBm2/; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20203988f37so6035655ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 22:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723784434; x=1724389234; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tTlEisHK4yCx7hQg2VMWou4sqTPa4zx/4UhJkv4GXdY=;
        b=bR0YBm2/MCI+GT/L9wCUWZxyK+o2HhlR1ECVamALamCjFtlfRMLa6sjfT/yGStVYrw
         PhJ34XqLcBRDCLoV4jfXoIF/Q5rd0seD0gX5ETpc7vfMTE43oQd5Gs6SxAsoZLg2UVpm
         FFG0E8jBSD/KAf+6tXon1ixcL45IdZ125fo2PpW7sW1jfvXu2efOvA6zasJugwnA4EwB
         hBZ3HuoUqtbOnFiFsAOFbyIayKbnAx6KTHmicxmBg1JmH3anpifBNtWjpqTjk/B0ER1b
         jXbNmnWJTCIcd+gBLbL2zKoJsQQxnlOC6YqCWGOFfWb+Zgt5pC4sz1Y+MDuxKOX2wdAu
         BrRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723784434; x=1724389234;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tTlEisHK4yCx7hQg2VMWou4sqTPa4zx/4UhJkv4GXdY=;
        b=gfSF7FxbuHV3SwFfexSyvrkLhxPqlVgofrSpGYmHQrAJRr8sVzxqfU/B9Qqs2Y+Cif
         QcJ9le75tKjLthaelKxDho/60g1ZwnYW3vmXbUTXPvzcG+dEwP9NIMCht+QBpHH0K6XD
         gTAK9/UvmFUtaQhNSse3ojeuu24rY7670SNaVRYP10G1Vvy0MXGkWlnXxny7zl7clYSL
         9P19EKu7ibsv+rmJvlBAcy1e8c38HLNCU0WcnL/SaZ+KV7xjrS2r8bbGgCf/HaDHHY/z
         cPYbJMvpFikZu472KtgMl3CzFyRbs0yVbVtE4E00sMbPLlQkRvUzUCtiiyyp/ZZ2Bgqz
         qjYA==
X-Forwarded-Encrypted: i=1; AJvYcCXG1Y+cfrVb/EY1WJGEEOLBdcB1qvZME64mchGGdUA8sThsXMmqZuq/xO2mTAnvf0JmFcvozTUzaybaxHYWaOtVj8UIlWVyG8SC3B8IBQ==
X-Gm-Message-State: AOJu0YwN4egTVEvQHhE6eTygp02/eQCCxWPW4+eoaWiF2HMuKOnHKckz
	+Qgc3yjvymZrYm3ICLb/7uBQMACrSNUq1LRTncaiILh95OUO0atzVFIc7CnDFQ==
X-Google-Smtp-Source: AGHT+IENkLRreSP3HlZngVQUlgQ00Q+Vublx35vVuWPTimnHvJsxDGPdLY8rLwQcUUZiPo4KftizDQ==
X-Received: by 2002:a17:903:1c7:b0:1f7:37f:728d with SMTP id d9443c01a7336-20203e4f7edmr19517965ad.10.1723784434271;
        Thu, 15 Aug 2024 22:00:34 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f03956a8sm17934985ad.234.2024.08.15.22.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 22:00:33 -0700 (PDT)
Date: Fri, 16 Aug 2024 10:30:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vidya Sagar <vidyas@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] PCI: qcom-ep: Move controller cleanups to
 qcom_pcie_perst_deassert()
Message-ID: <20240816050029.GA2331@thinkpad>
References: <20240729122245.33410-1-manivannan.sadhasivam@linaro.org>
 <20240815224717.GA53536@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240815224717.GA53536@bhelgaas>

On Thu, Aug 15, 2024 at 05:47:17PM -0500, Bjorn Helgaas wrote:
> [+cc Vidya, Jon since tegra194 does similar things]
> 
> On Mon, Jul 29, 2024 at 05:52:45PM +0530, Manivannan Sadhasivam wrote:
> > Currently, the endpoint cleanup function dw_pcie_ep_cleanup() and EPF
> > deinit notify function pci_epc_deinit_notify() are called during the
> > execution of qcom_pcie_perst_assert() i.e., when the host has asserted
> > PERST#. But quickly after this step, refclk will also be disabled by the
> > host.
> > 
> > All of the Qcom endpoint SoCs supported as of now depend on the refclk from
> > the host for keeping the controller operational. Due to this limitation,
> > any access to the hardware registers in the absence of refclk will result
> > in a whole endpoint crash. Unfortunately, most of the controller cleanups
> > require accessing the hardware registers (like eDMA cleanup performed in
> > dw_pcie_ep_cleanup(), powering down MHI EPF etc...). So these cleanup
> > functions are currently causing the crash in the endpoint SoC once host
> > asserts PERST#.
> > 
> > One way to address this issue is by generating the refclk in the endpoint
> > itself and not depending on the host. But that is not always possible as
> > some of the endpoint designs do require the endpoint to consume refclk from
> > the host (as I was told by the Qcom engineers).
> > 
> > So let's fix this crash by moving the controller cleanups to the start of
> > the qcom_pcie_perst_deassert() function. qcom_pcie_perst_deassert() is
> > called whenever the host has deasserted PERST# and it is guaranteed that
> > the refclk would be active at this point. So at the start of this function,
> > the controller cleanup can be performed. Once finished, rest of the code
> > execution for PERST# deassert can continue as usual.
> 
> What makes this v6.11 material?  Does it fix a problem we added in
> v6.11-rc1?
> 

No, this is not a 6.11 material, but the rest of the patches I shared offline.

> Is there a Fixes: commit?
> 

Hmm, the controller addition commit could be the valid fixes tag.

> This patch essentially does this:
> 
>   qcom_pcie_perst_assert
> -   pci_epc_deinit_notify
> -   dw_pcie_ep_cleanup
>     qcom_pcie_disable_resources
> 
>   qcom_pcie_perst_deassert
> +   if (pcie_ep->cleanup_pending)
> +     pci_epc_deinit_notify(pci->ep.epc);
> +     dw_pcie_ep_cleanup(&pci->ep);
>     dw_pcie_ep_init_registers
>     pci_epc_init_notify
> 
> Maybe it makes sense to call both pci_epc_deinit_notify() and
> pci_epc_init_notify() from the PERST# deassert function, but it makes
> me question whether we really need both.
> 

There is really no need to call pci_epc_deinit_notify() during the first
deassert (i.e., during the ep boot) because there are no cleanups to be done.
It is only needed during a successive PERST# assert + deassert.

> pcie-tegra194.c has a similar structure:
> 
>   pex_ep_event_pex_rst_assert
>     pci_epc_deinit_notify
>     dw_pcie_ep_cleanup
> 
>   pex_ep_event_pex_rst_deassert
>     dw_pcie_ep_init_registers
>     pci_epc_init_notify
> 
> Is there a reason to make them different, or could/should a similar
> change be made to tegra?
> 

Design wise both drivers are similar, so it could apply. I didn't spin a patch
because if testing of tegra driver gets delayed (I've seen this before), then I
do not want to stall merging the whole series. For Qcom it is important to get
this merged asap to avoid the crash.

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index 2319ff2ae9f6..e024b4dcd76d 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -186,6 +186,8 @@ struct qcom_pcie_ep_cfg {
> >   * @link_status: PCIe Link status
> >   * @global_irq: Qualcomm PCIe specific Global IRQ
> >   * @perst_irq: PERST# IRQ
> > + * @cleanup_pending: Cleanup is pending for the controller (because refclk is
> > + *                   needed for cleanup)
> >   */
> >  struct qcom_pcie_ep {
> >  	struct dw_pcie pci;
> > @@ -214,6 +216,7 @@ struct qcom_pcie_ep {
> >  	enum qcom_pcie_ep_link_status link_status;
> >  	int global_irq;
> >  	int perst_irq;
> > +	bool cleanup_pending;
> >  };
> >  
> >  static int qcom_pcie_ep_core_reset(struct qcom_pcie_ep *pcie_ep)
> > @@ -389,6 +392,12 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
> >  		return ret;
> >  	}
> >  
> > +	if (pcie_ep->cleanup_pending) {
> 
> Do we really need this flag?  I assume the cleanup functions could
> tell whether any previous setup was done?
> 

Not so. Some cleanup functions may trigger a warning if attempted to do it
before 'setup'. I think dw_edma_remove() that is part of dw_pcie_ep_cleanup()
does that IIRC.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

