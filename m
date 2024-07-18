Return-Path: <linux-arm-msm+bounces-26593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F0393513A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 19:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12B191C21F6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 17:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DB71459E5;
	Thu, 18 Jul 2024 17:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJNiSVvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04445143892
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 17:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721323390; cv=none; b=MEMfGf17/5i1Hun1DYqhwXestiWmocFYvuY6Jw6g5HosSiNgdBfxbl4NbYxWPr4PHYy743YM5vHTJbXkznnu2GphXc6f1cjnzqEgFX8RmTy6n3RZU5v0yC/qjX9VSL0q07Etk9+bptJZ94UkxuZQivbI09kOmjmCU4ptI5x8rM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721323390; c=relaxed/simple;
	bh=0i7KtJ9FSifVfJLTP8L6MmmzH1IONF8nR5XE9Ek8NnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dIKyNnrhICbyKDPR9ys1EKTNmnLpeB246qtdchE76zpBoYt93xPLZiLy68sQ2GTS36PxymfzVAJnYfiGegaLk+R1ri6lUvQoRvoT9LsNikafseoFvvYJFuK+sT+QeGVImc0VdNBAi4pF6N9bMzDquXnDU2pE3R+/uJAz7jNw2dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJNiSVvY; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fb1c918860so17201435ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 10:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721323387; x=1721928187; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ICFDDieCGpEoaZYDXXhvPh/cZNuguHANawunFSMXlc=;
        b=yJNiSVvYXGaKMDXOs618SvxsjDyKUPC2MVc3X36Wpl2m0Zj6WXd3gzC6iM4TLO+VBv
         PP/1Gc/tQqHb3THu4VmUsdlbdzIWmO+OBx47ZZpw9ycJwX+6kJ4vaZ6NCOuCk7JlWwVu
         +tmc6lkunSs5N8AZSLTiOe5+LMPI14Fw1KNDCU1Qa7qcHDTUYZjmkKDlvm71w26A9HAu
         prSUbsgJB94dI83Qmi1OirumiXr7OKBZiAmqaUB57tz6PkPEbEbj69Egab2Cmz3IouIM
         fD00D7px8Yb4Qlfz5PxBN3nXN6yuB4g7ybwRmZqWXvxXcWz6YVu3QCziZSxnX/I2Bkqm
         LqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721323387; x=1721928187;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6ICFDDieCGpEoaZYDXXhvPh/cZNuguHANawunFSMXlc=;
        b=h6FZ+QweHzv11Wy5SXUI0dBBuvXyp0QIbBSDQTaTd0u6F5PWwSfdFdY+9V+1d8Hkl8
         2yZLYwW8FpWbqxmUFV7oTpmGBycpPX9kezC7G9qyYHJjRH2XUZQsDYIQKis+FVQYHjW3
         aLXc34ef/ed1HdwrSngN3AxncrdNjgDNU6YYye/w8EX5vzdoKay/kPpctx6k0LSt52tP
         byV89Sx7fZ1jDemOVRdaMFunAoHpCdpjbSNqTcK9fajuH/cJx4JIeupN4IEO0PfRqb4T
         s8FyuCTIGg9Ia0N6uYCqTh+oVMjHzNS+aJCMWkTBIhbjmFyplfB3c8XpXdOK41NCl2iS
         pmDw==
X-Forwarded-Encrypted: i=1; AJvYcCXQg2Q0uOMSbj94+RLsAqIQ/Z9LTvWaURs+VIZbQdOVhtH8Pre0iC5t6Gqcfwi4ZHd0O5cOhVL8KqSXuM1CmC/+4G4zAJG4z0G6pmXN/Q==
X-Gm-Message-State: AOJu0YwVtV/KYTDjfVqLpUQI4kx6Iz1m3p9Km84dq9iaRg2UnNbGnbOF
	mb3Qi6h8OfrYSnLT2/eD8gOYwQ07KBZyToQe3mlTN505zNJdWiJ1C3cyylrXEg==
X-Google-Smtp-Source: AGHT+IEKTF3lGFKsLnOuovg2GIq+pf1Ok3ICUV+brkwjfKlutwdQ6WVPpLajBng6U/Qw4CmZ5dJUQA==
X-Received: by 2002:a17:903:32c3:b0:1fc:54c4:61a7 with SMTP id d9443c01a7336-1fc5b60aa7bmr50154655ad.23.1721323387186;
        Thu, 18 Jul 2024 10:23:07 -0700 (PDT)
Received: from thinkpad ([120.56.207.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc2751bsm96197055ad.143.2024.07.18.10.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 10:23:06 -0700 (PDT)
Date: Thu, 18 Jul 2024 22:53:01 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Mayank Rana <quic_mrana@quicinc.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 12/13] PCI: qcom: Simulate PCIe hotplug using 'global'
 interrupt
Message-ID: <20240718172301.GC2499@thinkpad>
References: <20240717-pci-qcom-hotplug-v2-0-71d304b817f8@linaro.org>
 <20240717-pci-qcom-hotplug-v2-12-71d304b817f8@linaro.org>
 <02b94a07-fcd6-4a48-bead-530b81c8a27e@quicinc.com>
 <20240718102938.GA8877@thinkpad>
 <8c3e77b6-0d23-42ef-a7db-52635bd5070a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8c3e77b6-0d23-42ef-a7db-52635bd5070a@quicinc.com>

On Thu, Jul 18, 2024 at 10:15:58AM -0700, Mayank Rana wrote:
> Hi Mani
> 
> On 7/18/2024 3:29 AM, Manivannan Sadhasivam wrote:
> > On Wed, Jul 17, 2024 at 03:57:11PM -0700, Mayank Rana wrote:
> > > Hi Mani
> > > 
> > > I don't think we can suggest that usage of link up event with Global IRQ as
> > > simulate PCIe hotplug. hotplug is referring to allow handling of both
> > > add or remove of endpoint device whereas here you are using global IRQ as
> > > last step to rescan bus if endpoint is power up later after link training is
> > > initiated.
> > > 
> > 
> > Why not? Well it is not entirely the standard 'hotplug' and that's why I
> > referred it as 'simulating hotplug'.
> Because it is misleading here by saying simulate hotplug. You can mention as
> use link up event
> to rescan bus instead of using simulate PCIe hotplug here.
> 

Fair point. Will reword in v3.

> > The point of having this feature is to avoid the hassle of rescanning the bus
> > manually when the devices are connected to this bus post boot.
> > 
> > > Will this work if you remove endpoint device and add it back again ?
> > > 
> > 
> > No, not currently. But we could add that logic using LINK_DOWN event. Though,
> > when the device comes back again, it will not get enumerated successfully due to
> > a bug in the link training part (which I plan to address later). But this
> > issue is irrespective of this hotplug simulation.
> ok. Although LINK DOWN event not necessary suggests that endpoint has been
> removed but it also suggests that link has gone into bad state, and it is
> being detected and notified as link down event.

Right, but what would be the recovery process if Link down event happens? You'd
remove the device and insert it back, right?

Doing link training again won't bring the link back I guess.

> > > Regards,
> > > Mayank
> > > On 7/17/2024 10:03 AM, Manivannan Sadhasivam via B4 Relay wrote:
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > 
> > > > Historically, Qcom PCIe RC controllers lack standard hotplug support. So
> > > > when an endpoint is attached to the SoC, users have to rescan the bus
> > > > manually to enumerate the device. But this can be avoided by simulating the
> > > > PCIe hotplug using Qcom specific way.
> > > > 
> > > > Qcom PCIe RC controllers are capable of generating the 'global' SPI
> > > > interrupt to the host CPUs. The device driver can use this event to
> > > > identify events such as PCIe link specific events, safety events etc...
> > > > 
> > > > One such event is the PCIe Link up event generated when an endpoint is
> > > > detected on the bus and the Link is 'up'. This event can be used to
> > > > simulate the PCIe hotplug in the Qcom SoCs.
> > > > 
> > > > So add support for capturing the PCIe Link up event using the 'global'
> > > > interrupt in the driver. Once the Link up event is received, the bus
> > > > underneath the host bridge is scanned to enumerate PCIe endpoint devices,
> > > > thus simulating hotplug.
> > > > 
> > > > All of the Qcom SoCs have only one rootport per controller instance. So
> > > > only a single 'Link up' event is generated for the PCIe controller.
> > > > 
> > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >    drivers/pci/controller/dwc/pcie-qcom.c | 55 +++++++++++++++++++++++++++++++++-
> > > >    1 file changed, 54 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > index 0180edf3310e..a1d678fe7fa5 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c

[...]

> > > > +static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
> > > > +{
> > > > +	struct qcom_pcie *pcie = data;
> > > > +	struct dw_pcie_rp *pp = &pcie->pci->pp;
> > > > +	struct device *dev = pcie->pci->dev;
> > > > +	u32 status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
> > > > +
> > > > +	writel_relaxed(status, pcie->parf + PARF_INT_ALL_CLEAR);
> > > > +
> > > > +	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
> > > > +		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> > > > +		/* Rescan the bus to enumerate endpoint devices */
> > > > +		pci_lock_rescan_remove();
> > > > +		pci_rescan_bus(pp->bridge->bus);
> > > > +		pci_unlock_rescan_remove();
> > > How do you handle case where endpoint is already enumerated, and seeing link
> > > up event in parallel or later ? will it go ahead to rescan bus again here ?
> > > 
> > 
> > If the endpoint is already enumerated, there will be no Link up event. Unless
> > the controller reinitializes the bus (which is the current behavior).
> > 
> > If the endpoint is already powered on during controller probe, then it will be
> > enumerated during dw_pcie_host_init() and since we register the IRQ handler
> > afterwards, there will be no Link up in that case.
> > 
> > This feature is only applicable for endpoints that comes up post boot.
> ok. thanks for above information. I feel capturing this information in
> commit text
> would be helpful.

Sure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

