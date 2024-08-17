Return-Path: <linux-arm-msm+bounces-28844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A869554C1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 04:02:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 965531F2246C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Aug 2024 02:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DB783D66;
	Sat, 17 Aug 2024 02:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IZGB1l0j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D819879F6
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Aug 2024 02:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723860116; cv=none; b=oPeRGV9BqoWEmQzfkmPy+I1XJD3iiwN5rMwfNGwc+S5SxSAE9xUEL8oHXjMj2AItzBum3x0aRTeAVCUYbqLOAnTIcw+68QWl7xJsTentlheGgezbhQUEjuFNqg6EViEl9h6kjMBg+r5vX1IWtEdoZUfdy5TtXWyd/WnQSgSk6GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723860116; c=relaxed/simple;
	bh=v+Pi/DblEZO86qBIJLP05oOr943epaXJ3fCxDeK2Vxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsrc8rKb6G8d2fOtnNN2OqZd03xpIZPvGMYWWAjBj8k8T5AnNbbrjwGOxui8XUD4rpy6utPr+b7qDAsxfvqGMfN7GMZ5SBKmKOXvBUWoJrOcagzl0Vu2dRddwYqDi/++cGLppezxRwUiC1mEDxIqbJs+Or4hQnWVgwCXQ+agmwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IZGB1l0j; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1ff67158052so18846925ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Aug 2024 19:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723860114; x=1724464914; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XuZHGi+VXRXi9xw2FZMQ0Jmzs5dQDajQPPg4POCnbZc=;
        b=IZGB1l0j8lC112iWMQVlWXduYrPGdwLrgQRC3C7o+ePwDNzp8eZzNwyT/qIl750DR8
         lKPhCpa395RNQ1SKHmYyNU0axFfZKHcXxUwM0upVxgA/5UoSomokuxie0SykPDSSEANX
         dWQDgv3By7qJ1l7DKSLPMbBEk3nqfkfUjFixUpt/wXyAHqT4mFL70N/ElyEzMy2YEPWn
         2wERF1vY/DDM1jTMaceE7XI1TIG5xArYZJGU4MCyvuFutC/FX6EiwY432gAmrcQIoknk
         WJaDnZms3gANkHDQkDmodS1/hUfmf2td+DzH/CBvYUcHumsfhAnB4JJ6cgydmuycfAh6
         jA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723860114; x=1724464914;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XuZHGi+VXRXi9xw2FZMQ0Jmzs5dQDajQPPg4POCnbZc=;
        b=QQkDwzCCBM2OcoQsn7L9v5THvCm1oUGFsCcr36E8M2dR3K3wmveqiY+6LKeRSgXWUn
         z+v6d6gGmcXLQxbgiTuCK46/6yM5L+HkqBcItYtj0DGmompthL7swHzcoRHqGA30gF3m
         4FnHUc2lXpF6jccjRswu47UUte7vEQdeuoZ/zl365CH6b8ZoKDlt69tGRV2Ale/Mn3Vg
         m6TxOMrtW8MWvoTn4xSKaL5i5bKhWdW3/xOhpSpPRCveFaspmgy/mH4Y4ddvr3CntM7+
         yjSSOI4tn92/0CSeEMfP0tdoo+D87zT3YL+c8TdiwOgv2XBT4kqNowVVrVVw2ln/c+Lz
         661g==
X-Forwarded-Encrypted: i=1; AJvYcCVtZF2UAK+tBnAoN6mVDbAB2yZJxTar2vrmP9d+9bXLaxDHnT9qkozbbZYFn9ubExl/jY0CxrEYph0X2bVhKaKad9r6O8cSTRX8NnxrGQ==
X-Gm-Message-State: AOJu0Yzb3CKWcqK469E5mUsXcaAb9yTaDEph7buUZfe0VG4GoK1c0CsG
	7RzXC1PjNJHI9RvPKJv+tMEP+YP7IRju7kMv23YDU3/855URd1z1Z/dRbwrGEw==
X-Google-Smtp-Source: AGHT+IFwmOfQtJuDzzmgmOvtl7O/FhQchBC4mBKDDin3MuTQxZ1JMs78w5nvcLwydyOTJkhqaRxPgw==
X-Received: by 2002:a17:902:e747:b0:1fd:69d6:856d with SMTP id d9443c01a7336-20203e84504mr47263195ad.17.1723860114095;
        Fri, 16 Aug 2024 19:01:54 -0700 (PDT)
Received: from thinkpad ([220.158.156.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0320f85sm31116245ad.113.2024.08.16.19.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 19:01:53 -0700 (PDT)
Date: Sat, 17 Aug 2024 07:31:48 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Vidya Sagar <vidyas@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] PCI: qcom-ep: Move controller cleanups to
 qcom_pcie_perst_deassert()
Message-ID: <20240817020148.7oyvgc7e452dafg5@thinkpad>
References: <20240816050029.GA2331@thinkpad>
 <20240816191222.GA69867@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816191222.GA69867@bhelgaas>

On Fri, Aug 16, 2024 at 02:12:22PM -0500, Bjorn Helgaas wrote:
> On Fri, Aug 16, 2024 at 10:30:29AM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Aug 15, 2024 at 05:47:17PM -0500, Bjorn Helgaas wrote:
> > > [+cc Vidya, Jon since tegra194 does similar things]
> > > 
> > > On Mon, Jul 29, 2024 at 05:52:45PM +0530, Manivannan Sadhasivam wrote:
> > > > Currently, the endpoint cleanup function dw_pcie_ep_cleanup() and EPF
> > > > deinit notify function pci_epc_deinit_notify() are called during the
> > > > execution of qcom_pcie_perst_assert() i.e., when the host has asserted
> > > > PERST#. But quickly after this step, refclk will also be disabled by the
> > > > host.
> > > > 
> > > > All of the Qcom endpoint SoCs supported as of now depend on the refclk from
> > > > the host for keeping the controller operational. Due to this limitation,
> > > > any access to the hardware registers in the absence of refclk will result
> > > > in a whole endpoint crash. Unfortunately, most of the controller cleanups
> > > > require accessing the hardware registers (like eDMA cleanup performed in
> > > > dw_pcie_ep_cleanup(), powering down MHI EPF etc...). So these cleanup
> > > > functions are currently causing the crash in the endpoint SoC once host
> > > > asserts PERST#.
> > > > 
> > > > One way to address this issue is by generating the refclk in the endpoint
> > > > itself and not depending on the host. But that is not always possible as
> > > > some of the endpoint designs do require the endpoint to consume refclk from
> > > > the host (as I was told by the Qcom engineers).
> > > > 
> > > > So let's fix this crash by moving the controller cleanups to the start of
> > > > the qcom_pcie_perst_deassert() function. qcom_pcie_perst_deassert() is
> > > > called whenever the host has deasserted PERST# and it is guaranteed that
> > > > the refclk would be active at this point. So at the start of this function,
> > > > the controller cleanup can be performed. Once finished, rest of the code
> > > > execution for PERST# deassert can continue as usual.
> > > 
> > > What makes this v6.11 material?  Does it fix a problem we added in
> > > v6.11-rc1?
> > 
> > No, this is not a 6.11 material, but the rest of the patches I
> > shared offline.
> 
> For reference, the patches you shared offline are:
> 
>   PCI: qcom: Use OPP only if the platform supports it
>   PCI: qcom-ep: Do not enable resources during probe()
>   PCI: qcom-ep: Disable MHI RAM data parity error interrupt for SA8775P SoC
>   PCI: qcom-ep: Move controller cleanups to qcom_pcie_perst_deassert()
> 

And then the note...

"last one is not strictly a 6.11 material, but rest are"

Sorry if that confused you. I shouldn't have mentioned this patch anyway.

> > > Is there a Fixes: commit?
> > 
> > Hmm, the controller addition commit could be the valid fixes tag.
> > 
> > > This patch essentially does this:
> > > 
> > >   qcom_pcie_perst_assert
> > > -   pci_epc_deinit_notify
> > > -   dw_pcie_ep_cleanup
> > >     qcom_pcie_disable_resources
> > > 
> > >   qcom_pcie_perst_deassert
> > > +   if (pcie_ep->cleanup_pending)
> > > +     pci_epc_deinit_notify(pci->ep.epc);
> > > +     dw_pcie_ep_cleanup(&pci->ep);
> > >     dw_pcie_ep_init_registers
> > >     pci_epc_init_notify
> > > 
> > > Maybe it makes sense to call both pci_epc_deinit_notify() and
> > > pci_epc_init_notify() from the PERST# deassert function, but it makes
> > > me question whether we really need both.
> > 
> > There is really no need to call pci_epc_deinit_notify() during the first
> > deassert (i.e., during the ep boot) because there are no cleanups to be done.
> > It is only needed during a successive PERST# assert + deassert.
> > 
> > > pcie-tegra194.c has a similar structure:
> > > 
> > >   pex_ep_event_pex_rst_assert
> > >     pci_epc_deinit_notify
> > >     dw_pcie_ep_cleanup
> > > 
> > >   pex_ep_event_pex_rst_deassert
> > >     dw_pcie_ep_init_registers
> > >     pci_epc_init_notify
> > > 
> > > Is there a reason to make them different, or could/should a similar
> > > change be made to tegra?
> > 
> > Design wise both drivers are similar, so it could apply. I didn't
> > spin a patch because if testing of tegra driver gets delayed (I've
> > seen this before), then I do not want to stall merging the whole
> > series. 
> 
> It can and should be separate patches, one per driver.  But I don't
> want to end up with the drivers being needlessly different.
> 

Ok. Let me spin a patch for that driver also.

> > For Qcom it is important to get this merged asap to avoid
> > the crash.
> 
> If this is not v6.11 material, there's time to work this out.
> 
> > > > +	if (pcie_ep->cleanup_pending) {
> > > 
> > > Do we really need this flag?  I assume the cleanup functions could
> > > tell whether any previous setup was done?
> > 
> > Not so. Some cleanup functions may trigger a warning if attempted to do it
> > before 'setup'. I think dw_edma_remove() that is part of dw_pcie_ep_cleanup()
> > does that IIRC.
> 
> It looks safe to me:
> 
>   dw_pcie_ep_cleanup
>     dw_pcie_edma_remove
>       dw_edma_remove(chip = &pci->edma)       # struct dw_pcie *pci
>         dev = chip->dev
>         dw = chip->dw
>         if (!dw)
>           return -ENODEV
> 
> but if not, it could probably be made safe by adding a NULL pointer
> check and/or a "chip->dw = NULL" at the right spot.
> 
> We hardly have any cleanup functions affected by "cleanup_pending", so
> I think we can decide that they should be safe before 'setup' and just
> make it so.
> 

I just tested by removing the cleanup flag and it doesn't seem to scream. Maybe
the issue I saw previously was unrelated.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

