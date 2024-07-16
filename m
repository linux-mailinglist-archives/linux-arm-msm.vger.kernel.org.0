Return-Path: <linux-arm-msm+bounces-26269-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B464932037
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 07:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5988B1C212A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 05:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFEF18046;
	Tue, 16 Jul 2024 05:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bin38Phh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B732A18028
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 05:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721109269; cv=none; b=oM+ppUPPkhHAoBSGRwqMoVQR3lYyvH9lf639+TqMWNiXCaYZdB/wvwxIKKD1YYTduMYdEJFfgjoEkEutDnmXsoFgEk7H+ERwX86wFHqv5iJifS5wdPQtsyvCjja6zHIyBNG3vKlnoKsGfyqigQRTCPo2KvHp0aDTqYn/NXRGMH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721109269; c=relaxed/simple;
	bh=8SWh3YsFQcByki1FvXThWtAwdidMLruKFc3hekCFPe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9CJ0wTnv5DHtsbgZKW+SENQFsOIF2Sde4Ws2TX/d9E25KLrulGx9qRECm7JXcGtOraNWpcrp2AyWcF5g/ycE/+3sE3J+YaN7yrYS641gYpt3kLovv8yoKM5fsnQhrs7n7MTzOn1cbWvHrrm706mQV87x/wqrfC1RmyYsNla4MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bin38Phh; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70af2b1a35aso3418640b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 22:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721109267; x=1721714067; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j5Rz5pUnmzAdXYXomrqcCRUBtbJFIpPghAcemVOy+KE=;
        b=Bin38Phh/YO4wP/ycVDtJnLhtZUmQc5HRpqIjFTQCetmN9R9Gz561cslSDnHxn+avn
         8WASst5DssPGJRPrFIgqJY98vofVSg1G5jOyvxTHClqC1JvbatJeysYmq2ib/jstT5uU
         p1FkAfKs6BQejf5/iT2pR/3E4rq4NH8vQJzrAwU1zxCksA95oJG0wnn+kswPFoi5RnTo
         t4SNQ5v8X8DI4RSX1P9SHGz84siD7ugr9PYZrvr765THrCoBgB3iCiLFqzIKD6YMZjER
         6w9mk23TC4y/eY6PgPG3SKmw6jcrgtabUcbnoiaRQSCSVZpl8D2ZA3RHCajU/TtUWnjO
         EAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721109267; x=1721714067;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j5Rz5pUnmzAdXYXomrqcCRUBtbJFIpPghAcemVOy+KE=;
        b=puvf12m4qtN5XS7yQeMetsC4+z3GJHpmsdvjbqHrCQaVCEcfIoeOfDzVNNMkuGFWo3
         8Tc51nk9+7x/Iq6BhAxg7vmellWing8oH+o7y2pM2DLwaU/EgHV8BdBWKj/o1wmTXxib
         naxkb9s14SWxzfsZcaw9/HdoNNy6tRPYrVoHlet4n8RzQGiW+q58wZ/BavjRkTj/0OQ4
         5plLI7Fm4DxiYKohEia2p2cJhUVKknqFiBfndLncQOxwKljV0ixf0jKzXfLTiQBjMDud
         c1aSPnb5LS9LbHOTXnJWLXPIjSJiUb/pqheKZJaugsDDk5hC3QOvNy485jNBhznB37eZ
         8p1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbOk5kdtZpy0Kr3G0Hex3FkPbpfGky+GJqAdBJwehEsaKBG4KhEa2pC3ScTyNAAYh47UKu77w/3kruLpcnIzMUmQsROjjNN7Tf+AbbiQ==
X-Gm-Message-State: AOJu0YzN+9q/hNITCeG64quGV+msqhLv/rM1tc6c/hjdKPEJCmk7V9GF
	KRh0DS/jQN+CyCjJ6QyoShrYDLuQoDBwfVyN1KHBaV2HF/GnkUIr12zeEc3xuQ==
X-Google-Smtp-Source: AGHT+IHuG+uTfs6HPzYAk3BUQ13tmoIgfCaKYHZ7kdFOSweAVIAvws9TwolgArzopQbySBvmZoFtVg==
X-Received: by 2002:a05:6a20:7348:b0:1c2:a3c7:47dd with SMTP id adf61e73a8af0-1c3f1271246mr1372239637.42.1721109266955;
        Mon, 15 Jul 2024 22:54:26 -0700 (PDT)
Received: from thinkpad ([220.158.156.207])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2caedcacf88sm5380644a91.55.2024.07.15.22.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 22:54:26 -0700 (PDT)
Date: Tue, 16 Jul 2024 11:24:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
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
Subject: Re: [PATCH 13/14] PCI: qcom: Simulate PCIe hotplug using 'global'
 interrupt
Message-ID: <20240716055421.GF3446@thinkpad>
References: <20240715-pci-qcom-hotplug-v1-0-5f3765cc873a@linaro.org>
 <20240715-pci-qcom-hotplug-v1-13-5f3765cc873a@linaro.org>
 <dca49572-dc77-58df-1bd1-b0e897191c87@quicinc.com>
 <20240716041827.GD3446@thinkpad>
 <5f8218cb-a8d6-789a-8723-0af07353e432@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5f8218cb-a8d6-789a-8723-0af07353e432@quicinc.com>

On Tue, Jul 16, 2024 at 09:54:54AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/16/2024 9:48 AM, Manivannan Sadhasivam wrote:
> > On Tue, Jul 16, 2024 at 09:34:13AM +0530, Krishna Chaitanya Chundru wrote:
> > > 
> > > 
> > > On 7/15/2024 11:03 PM, Manivannan Sadhasivam via B4 Relay wrote:
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
> > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > ---
> > > >    drivers/pci/controller/dwc/pcie-qcom.c | 55 ++++++++++++++++++++++++++++++++++
> > > >    1 file changed, 55 insertions(+)
> > > > 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > index 0180edf3310e..38ed411d2052 100644
> > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > @@ -50,6 +50,9 @@
> > > >    #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
> > > >    #define PARF_Q2A_FLUSH				0x1ac
> > > >    #define PARF_LTSSM				0x1b0
> > > > +#define PARF_INT_ALL_STATUS			0x224
> > > > +#define PARF_INT_ALL_CLEAR			0x228
> > > > +#define PARF_INT_ALL_MASK			0x22c
> > > >    #define PARF_SID_OFFSET				0x234
> > > >    #define PARF_BDF_TRANSLATE_CFG			0x24c
> > > >    #define PARF_SLV_ADDR_SPACE_SIZE		0x358
> > > > @@ -121,6 +124,9 @@
> > > >    /* PARF_LTSSM register fields */
> > > >    #define LTSSM_EN				BIT(8)
> > > > +/* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > > > +#define PARF_INT_ALL_LINK_UP			BIT(13)
> > > > +
> > > >    /* PARF_NO_SNOOP_OVERIDE register fields */
> > > >    #define WR_NO_SNOOP_OVERIDE_EN			BIT(1)
> > > >    #define RD_NO_SNOOP_OVERIDE_EN			BIT(3)
> > > > @@ -260,6 +266,7 @@ struct qcom_pcie {
> > > >    	struct icc_path *icc_cpu;
> > > >    	const struct qcom_pcie_cfg *cfg;
> > > >    	struct dentry *debugfs;
> > > > +	int global_irq;
> > > >    	bool suspended;
> > > >    };
> > > > @@ -1488,6 +1495,29 @@ static void qcom_pcie_init_debugfs(struct qcom_pcie *pcie)
> > > >    				    qcom_pcie_link_transition_count);
> > > >    }
> > > > +static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
> > > > +{
> > > > +	struct qcom_pcie *pcie = data;
> > > > +	struct dw_pcie_rp *pp = &pcie->pci->pp; > +	struct device *dev = pcie->pci->dev;
> > > > +	u32 status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
> > > > +
> > > > +	writel_relaxed(status, pcie->parf + PARF_INT_ALL_CLEAR);
> > > > +
> > > > +	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
> > > > +		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> > > > +		/* Rescan the bus to enumerate endpoint devices */
> > > > +		pci_lock_rescan_remove();
> > > > +		pci_rescan_bus(pp->bridge->bus);
> > > There can be chances of getting link up interrupt before PCIe framework
> > > starts enumeration and at that time bridge-> bus is not created and
> > > cause NULL point access.
> > > Please have a check for this.
> > > 
> > 
> > Host bridge is enumerated during dw_pcie_host_init() and the IRQ handler is
> > registered afterwards. So there is no way the 'pp->bridge' can be NULL.
> > 
> > - Mani
> I leaved a gap between bridge-> & bus by mistake, I want to highlight
> bridge->bus in above comment. The bus can be NULL and it can create NULL
> point access.

How can the bridge->bus be NULL? Only if the bridge itself is not enumerated, it
will be NULL. And that cannot happen unless something wrong with the controller
itself. In that case, how can Link up event be generated?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

