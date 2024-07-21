Return-Path: <linux-arm-msm+bounces-26670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 763F69383C6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jul 2024 09:35:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFC4A281516
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Jul 2024 07:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CE1F8F49;
	Sun, 21 Jul 2024 07:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JuhJ1AjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BA82114
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jul 2024 07:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721547299; cv=none; b=bBKs/yDPTtKg6GABqnhN3FYHNPUSV+chQRsfY5hf+9lHt3e0jZxw4hA30Iw8n2+2v9+Z+8sSWTBQhV64QB+5DciPWtKEkHMPY6DRxz7W/jD0DSvxDq+w7eeXbDOTo88216Yp36UvFW2pB2wusULGDL75E0ExfMYkzf06xv3rH/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721547299; c=relaxed/simple;
	bh=615Y60sS0HnKgrEOSDngqRTLkDcK0Kh+/38Lwy8kv6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ef5hPdSLJ+krDmxtfsy5TAFRLgya9h7Fu9oFbYX2a09Q5IWoTPENGFRRTeMPQ5I8P6zKGOpvH0z9/27gBsjMAkV7uFabccGySjiLIeFIUKd/xJDO8fB2K9gScAd5zJi4+XGgSniiO805gTn0GDO6e/eNxxmLhs8u+Q5ZPphci/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JuhJ1AjR; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-70446231242so1660439a34.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jul 2024 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721547295; x=1722152095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fv8zq0RF9fuXhAhro26VA4Ztvgod/aLFsPxle9EfgL8=;
        b=JuhJ1AjR7W30zanxlylefWfKmCyHMn1KBrztwOmJZD5DpMrHnlJf1I6elJy0TxAR18
         6bkychIUuG/KsUWkp4JLBEQFhNxM3V45WL0VzW+h0jAZYFt/MSQNAYfWuKqc8H73ekwN
         TxC8pPpgzcCnH9ixD2RR+DjeP8QyBvT1faBiRkCGwRjzlfJrS3w0YDHfaJUZGGBrytUF
         mOtcTY81Sg/sjauLhpF3Iz4lIaAfMcONhAj0V5+laqvfaLsuIrpfmupnOP73YtLushqG
         43obI+2jDD3Tn+PVU52it15gPCotzduECSVzunBR0gSIMnk7PnXOmKw63eGOH3MwIIfK
         lyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721547295; x=1722152095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fv8zq0RF9fuXhAhro26VA4Ztvgod/aLFsPxle9EfgL8=;
        b=CqJZJiKvZZfTK8nFPMT4NcUhJbOIw/tzzlBslcDwhMO6cOzWKVum5hVaOpEw6IpS2s
         I8cQSH3LflPyYtOJrDaV3LnLdtmEZxMzCR0DLYOtCs9ZiZWmzCGXqme7HBZjeyuIK7U1
         Bb5+/Y09sD+z5NsYe4Pk5erApapl4HvbOCS8Et8MZY0l/dyp6NqryeAD8EQpmQlRaZyk
         w8Gd1d2NQFhC9+fWEWsqx+wrN0DfEADwob9fyLzslzVSyNNyU2GziSLor+Z6qjAXxcV1
         GG62PWzmv60+lo/bDhAmDto7K0MRWrDIq/f7tEtEe9ElDkyHTGBPaHIxc75whm9Xpkw3
         1Crw==
X-Forwarded-Encrypted: i=1; AJvYcCWcUssyfgj6/7/PbS/5+deV7Vwk76uD0MdzpoSJp3zoPDEKny/CtyNIJ6/y2uky0gIpj7YGD7lcp1kkQbkwl9ZTF2f0udFjF8XjtkHrHA==
X-Gm-Message-State: AOJu0YyYd0aZoUk0jj//ORvwC5H5FexcnH/8WQw8mD3p9j9+xiCdpY18
	HCcvH7uCiZWUU/KE5y97ovpT8kLYpZG53v6N6UQkweyAkkgjjdTi9GpfEElLsg==
X-Google-Smtp-Source: AGHT+IH8MRPAPm4xaF0SpRioIhikBOqnKb0441E7QxNtDLhOvN4IZ5Y/lfCoNBhXQ2AR20v1d84k0Q==
X-Received: by 2002:a05:6830:418c:b0:703:6b15:45b4 with SMTP id 46e09a7af769-70900942a3amr5054713a34.28.1721547295246;
        Sun, 21 Jul 2024 00:34:55 -0700 (PDT)
Received: from thinkpad ([120.56.206.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff59dfd3sm3478960b3a.153.2024.07.21.00.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 00:34:54 -0700 (PDT)
Date: Sun, 21 Jul 2024 13:04:47 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <20240721073447.GA1908@thinkpad>
References: <20240717-pci-qcom-hotplug-v2-0-71d304b817f8@linaro.org>
 <20240717-pci-qcom-hotplug-v2-12-71d304b817f8@linaro.org>
 <Zpr3h7c3JRKqjtyb@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zpr3h7c3JRKqjtyb@lizhi-Precision-Tower-5810>

On Fri, Jul 19, 2024 at 07:32:23PM -0400, Frank Li wrote:
> On Wed, Jul 17, 2024 at 10:33:17PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Historically, Qcom PCIe RC controllers lack standard hotplug support. So
> > when an endpoint is attached to the SoC, users have to rescan the bus
> > manually to enumerate the device. But this can be avoided by simulating the
> > PCIe hotplug using Qcom specific way.
> > 
> > Qcom PCIe RC controllers are capable of generating the 'global' SPI
> > interrupt to the host CPUs. The device driver can use this event to
> > identify events such as PCIe link specific events, safety events etc...
> > 
> > One such event is the PCIe Link up event generated when an endpoint is
> > detected on the bus and the Link is 'up'. This event can be used to
> > simulate the PCIe hotplug in the Qcom SoCs.
> 
> Does hardware auto send out training pattern when EP boot after RC scan pci
> bus? Who trigger start link trainning?
> 

This is taken care by the DWC driver. It starts link training during
dw_pcie_host_init().

- Mani

> Frank
> 
> > 
> > So add support for capturing the PCIe Link up event using the 'global'
> > interrupt in the driver. Once the Link up event is received, the bus
> > underneath the host bridge is scanned to enumerate PCIe endpoint devices,
> > thus simulating hotplug.
> > 
> > All of the Qcom SoCs have only one rootport per controller instance. So
> > only a single 'Link up' event is generated for the PCIe controller.
> > 
> > Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-qcom.c | 55 +++++++++++++++++++++++++++++++++-
> >  1 file changed, 54 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 0180edf3310e..a1d678fe7fa5 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -50,6 +50,9 @@
> >  #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
> >  #define PARF_Q2A_FLUSH				0x1ac
> >  #define PARF_LTSSM				0x1b0
> > +#define PARF_INT_ALL_STATUS			0x224
> > +#define PARF_INT_ALL_CLEAR			0x228
> > +#define PARF_INT_ALL_MASK			0x22c
> >  #define PARF_SID_OFFSET				0x234
> >  #define PARF_BDF_TRANSLATE_CFG			0x24c
> >  #define PARF_SLV_ADDR_SPACE_SIZE		0x358
> > @@ -121,6 +124,9 @@
> >  /* PARF_LTSSM register fields */
> >  #define LTSSM_EN				BIT(8)
> >  
> > +/* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > +#define PARF_INT_ALL_LINK_UP			BIT(13)
> > +
> >  /* PARF_NO_SNOOP_OVERIDE register fields */
> >  #define WR_NO_SNOOP_OVERIDE_EN			BIT(1)
> >  #define RD_NO_SNOOP_OVERIDE_EN			BIT(3)
> > @@ -1488,6 +1494,29 @@ static void qcom_pcie_init_debugfs(struct qcom_pcie *pcie)
> >  				    qcom_pcie_link_transition_count);
> >  }
> >  
> > +static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
> > +{
> > +	struct qcom_pcie *pcie = data;
> > +	struct dw_pcie_rp *pp = &pcie->pci->pp;
> > +	struct device *dev = pcie->pci->dev;
> > +	u32 status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
> > +
> > +	writel_relaxed(status, pcie->parf + PARF_INT_ALL_CLEAR);
> > +
> > +	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
> > +		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> > +		/* Rescan the bus to enumerate endpoint devices */
> > +		pci_lock_rescan_remove();
> > +		pci_rescan_bus(pp->bridge->bus);
> > +		pci_unlock_rescan_remove();
> > +	} else {
> > +		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
> > +			      status);
> > +	}
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> >  static int qcom_pcie_probe(struct platform_device *pdev)
> >  {
> >  	const struct qcom_pcie_cfg *pcie_cfg;
> > @@ -1498,7 +1527,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> >  	struct dw_pcie_rp *pp;
> >  	struct resource *res;
> >  	struct dw_pcie *pci;
> > -	int ret;
> > +	int ret, irq;
> > +	char *name;
> >  
> >  	pcie_cfg = of_device_get_match_data(dev);
> >  	if (!pcie_cfg || !pcie_cfg->ops) {
> > @@ -1617,6 +1647,27 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> >  		goto err_phy_exit;
> >  	}
> >  
> > +	name = devm_kasprintf(dev, GFP_KERNEL, "qcom_pcie_global_irq%d",
> > +			      pci_domain_nr(pp->bridge->bus));
> > +	if (!name) {
> > +		ret = -ENOMEM;
> > +		goto err_host_deinit;
> > +	}
> > +
> > +	irq = platform_get_irq_byname_optional(pdev, "global");
> > +	if (irq > 0) {
> > +		ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
> > +						qcom_pcie_global_irq_thread,
> > +						IRQF_ONESHOT, name, pcie);
> > +		if (ret) {
> > +			dev_err_probe(&pdev->dev, ret,
> > +				      "Failed to request Global IRQ\n");
> > +			goto err_host_deinit;
> > +		}
> > +
> > +		writel_relaxed(PARF_INT_ALL_LINK_UP, pcie->parf + PARF_INT_ALL_MASK);
> > +	}
> > +
> >  	qcom_pcie_icc_opp_update(pcie);
> >  
> >  	if (pcie->mhi)
> > @@ -1624,6 +1675,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
> >  
> >  	return 0;
> >  
> > +err_host_deinit:
> > +	dw_pcie_host_deinit(pp);
> >  err_phy_exit:
> >  	phy_exit(pcie->phy);
> >  err_pm_runtime_put:
> > 
> > -- 
> > 2.25.1
> > 
> > 

-- 
மணிவண்ணன் சதாசிவம்

