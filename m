Return-Path: <linux-arm-msm+bounces-27268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C93FF93F71C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 15:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72F551F2232A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 13:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C3A15359A;
	Mon, 29 Jul 2024 13:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U4KY2sbU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029B714F121
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 13:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722261357; cv=none; b=Nl8Mgh5Jd871Q62qAuajq4iFUSSY8th1bfy0vtTouZq2JAlf8Awcwu6f3BKs/k3/Kx535xQdgjhn5uPQgJ7h9KRySdTxZlCZYh1eIllHzDCy/dtqHBq8LEORFGXdhFzzhhrK5hy4dtVG07dZEaYazsTZo8RtYbx4bXuxVL9zWtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722261357; c=relaxed/simple;
	bh=8FsX442TrJAitQSS3/8Wi6HaPs2O4RrdmTumQLmlQb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tATOQkrTtZ8kVocQjRAhEZyqMhFz9aAughoaRoRC/d1BfOSbdvMr6bHRbbIPF92I7treuB3Bw80UHoRqug3epwH07zHVKXNFDcPlkgmOuOkF5NWVy2XtZ+nOh1M4TFtQqxTJUsvsY71ExVWzsXvOhPwTUIGm978w5QYQyzirCJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U4KY2sbU; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc49c0aaffso18299165ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 06:55:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722261354; x=1722866154; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2+5OClieG7NMsxupjTRDIrQz18pxxk1qh4xfUGzZfN8=;
        b=U4KY2sbUlQ+SfvNX06BGHJspNBXGmaQzO9G2WDUwl30n2dASLf2b/X8nOCj6Gr2m4R
         hwOCKZYPQ8R7wLbjybJ2jtwFrnHzD/YAZW/gF/khlto84BzhJRi5S7WirsgA+GBCMQVc
         1ECMTzD9/anDU7NAkiA640Cu12i32DPSXdwgyixexENmfdAeqaqawvn+gHTAmZnI4JlF
         +StNvFxrr9vxajNKnbWkv6Mr0DlhMOjf09c14B1YkmIGF1DZ6C/HlLARQGeUYENFYnAY
         kSHTDfef5ZmSK5d51YsCqV6uSdRb1S3pFDMOu4taZlEQ5ZwJH6cj9DmBJ2GlTSCac9Rd
         3UjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722261354; x=1722866154;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2+5OClieG7NMsxupjTRDIrQz18pxxk1qh4xfUGzZfN8=;
        b=Zzk6mxef63c55jlYHif1QTgdtm/QgbrRrvLJnALjZZqwKj0lI50RHftye7kCZRwM1u
         S/kYVOOu9YqKG4hU4mY7wDR/WoCKmaFbR12ohsn33H7ZXWST0V5+4BGGqAa7qYUcsM9j
         Nk95O7Ss+gGKvH93meAcb8O29dT0ifD52QaBFIx5+mH566Layzwu81u0okWP6MOm2Xm5
         lGoKZjHnO9IqltSOAKOEJVKVq9YL0Ezu3LFtHKRK7rIlBdzAbKVWTENsUW1RvbjKYkvM
         3MKRjy4Z+tVFW8eHNnTH1U7FT4yyZu97oByjdqxQuJyNaKmWj94FEICLYIIGxkQtEhav
         +P5g==
X-Forwarded-Encrypted: i=1; AJvYcCXzuxI/DQo9sLxgpI09R6CJF81mtwrMEEGwhdnBOfxvymuHZctJDsLNeND/q/hLs3CcVXqksMJ6DagMEWjzQszS5MedGIU3v1DrXn4CeA==
X-Gm-Message-State: AOJu0YzQvq3HBP+MFn1BmWjnIz5HJkAZLEjyvPTgPTlvQGtVfqDHfNjP
	93J2WOtv2C6NmeN8bep9Rc9wAPv9/eLR92vdDQWlwPHYLRkHnRgwGpTY5+2uaw==
X-Google-Smtp-Source: AGHT+IEpWREOXzCfJ/w7X4EUv4bKcIueXlIPDaNU2qeXOLxxg9D0oeCWz2ilLfsq+HJr3p5t97hNzA==
X-Received: by 2002:a17:902:ea02:b0:1fd:d7a7:f581 with SMTP id d9443c01a7336-1ff047e4613mr70860035ad.7.1722261354184;
        Mon, 29 Jul 2024 06:55:54 -0700 (PDT)
Received: from thinkpad ([120.60.74.128])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7fe9cccsm82678495ad.289.2024.07.29.06.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:55:53 -0700 (PDT)
Date: Mon, 29 Jul 2024 19:25:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
Cc: lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: qcom-ep: Move controller cleanups to
 qcom_pcie_perst_deassert()
Message-ID: <20240729135547.GA35559@thinkpad>
References: <20240729122245.33410-1-manivannan.sadhasivam@linaro.org>
 <98264d15-fb30-32e0-7eba-72b3a50347e0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <98264d15-fb30-32e0-7eba-72b3a50347e0@quicinc.com>

On Mon, Jul 29, 2024 at 05:58:31PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/29/2024 5:52 PM, Manivannan Sadhasivam wrote:
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
> > 
> How about doing the cleanup as part of pme turnoff message.
> As host waits for L23 ready from the device side. we can use that time
> to cleanup the host before sending L23 ready.
> 

Yes, but that's only applicable if the host properly powers down the device. But
it won't work in the case of host crash or host abrupt poweroff.

- Mani

> - Krishna Chaitanya.
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/pci/controller/dwc/pcie-qcom-ep.c | 12 ++++++++++--
> >   1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > index 2319ff2ae9f6..e024b4dcd76d 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> > @@ -186,6 +186,8 @@ struct qcom_pcie_ep_cfg {
> >    * @link_status: PCIe Link status
> >    * @global_irq: Qualcomm PCIe specific Global IRQ
> >    * @perst_irq: PERST# IRQ
> > + * @cleanup_pending: Cleanup is pending for the controller (because refclk is
> > + *                   needed for cleanup)
> >    */
> >   struct qcom_pcie_ep {
> >   	struct dw_pcie pci;
> > @@ -214,6 +216,7 @@ struct qcom_pcie_ep {
> >   	enum qcom_pcie_ep_link_status link_status;
> >   	int global_irq;
> >   	int perst_irq;
> > +	bool cleanup_pending;
> >   };
> >   static int qcom_pcie_ep_core_reset(struct qcom_pcie_ep *pcie_ep)
> > @@ -389,6 +392,12 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
> >   		return ret;
> >   	}
> > +	if (pcie_ep->cleanup_pending) {
> > +		pci_epc_deinit_notify(pci->ep.epc);
> > +		dw_pcie_ep_cleanup(&pci->ep);
> > +		pcie_ep->cleanup_pending = false;
> > +	}
> > +
> >   	/* Assert WAKE# to RC to indicate device is ready */
> >   	gpiod_set_value_cansleep(pcie_ep->wake, 1);
> >   	usleep_range(WAKE_DELAY_US, WAKE_DELAY_US + 500);
> > @@ -522,10 +531,9 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
> >   {
> >   	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
> > -	pci_epc_deinit_notify(pci->ep.epc);
> > -	dw_pcie_ep_cleanup(&pci->ep);
> >   	qcom_pcie_disable_resources(pcie_ep);
> >   	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
> > +	pcie_ep->cleanup_pending = true;
> >   }
> >   /* Common DWC controller ops */

-- 
மணிவண்ணன் சதாசிவம்

