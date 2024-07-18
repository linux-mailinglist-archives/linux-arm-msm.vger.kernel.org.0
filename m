Return-Path: <linux-arm-msm+bounces-26545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED75934BAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 12:29:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FA931F2234A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 10:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 605DB824AC;
	Thu, 18 Jul 2024 10:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFtsf01i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF8812C46D
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721298587; cv=none; b=dhNZ96209lXj7tEBpVU7esieEnNbJgltyb2brTnysHIN5fX/AfEKdfKuoykQv0w1rvpP+pW43ddGLn5Ss47MbVuhOLVkgwrs5TB179+gG60B3bm2iVQv15f/RN40ICKctmZEQNANQvs0OOyyyKxKZ5lT0yjuY2n9hhMxlCBSGKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721298587; c=relaxed/simple;
	bh=3Qyk3nLyLDIHrxPcP2TVz5Xq7b5aJdgiNMZExcslJDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hc39zvodkYJNligx8dPi/3nt/4wx6+0w8SsdPnUmhUT5zSQZBGoXOQ+tnSnSP9ryqT1GYefc/0oboPrpus43JsXVlH3tyuQciNUmsDK6znJmx91Lv1vxZP9TszqBEskuOOnFlc+gokRp6mkO5PXKY00A35Je8AjKwMpp+6hfAwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFtsf01i; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-260fff38792so20213fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 03:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721298585; x=1721903385; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qn595tj+8ziMn0/QIYoTkBU+IARmrWlkcsfgecQj10Y=;
        b=OFtsf01icfZ0OGFJL4tHDxXooNhlpx2q6FBXzNRliE/tcdziWs9NqzF6mrMD7k5sSK
         93ak/qihLNJ1qvSU8uB3H4N0oO+0LzkPf0tOZXWG9W1BWkOEc04gOvr72gji8t8T1P/L
         91FFi3fVmji0vcbUUfIDhWoQAlh9Jx6pR86PQPas+J4EchFP36cL9U8CRz/ZqBvHfXsl
         SFG7nJb5L/U5GC7jQuH7dW2TSxrjfn4YAGnsZAxi9JeYpAxnswbc+Fl28THlAA2i6iO6
         XM+TLtr/TYxFAmpl39E1QvXzxSeUhkihqgHlvJ8PE2b3cHOfAhJgBf1oMLLF4jno/k6e
         02tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721298585; x=1721903385;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn595tj+8ziMn0/QIYoTkBU+IARmrWlkcsfgecQj10Y=;
        b=O+q589zVpyOtU7iQOE1uidECPK65Su9ElH9+K1QFuHA3Ym+3cS2QQ/h77p8YVdiwvi
         S2hIoGIumbifNpc1Jie9xkH772VXUj1K4EHlZ8rs9P9H6eSuco4yd6y8BdUpDa9TFucq
         TemCpcdpsddfHduZTeh/Riy1OTgAcTQssxi7ewx5BdvVHA1frDM9R6VITr5i05EC11+d
         vc10VCi6/fvHZeet9Ja3fSrRruxIa6+o9vjaEMvAZE+8gHSxJS8Xvit5ppUG4lQq0X8v
         TBCFFP66N+HezXBfii2rVYttaeZcQ4uP8GVWrhPMaQTUGeewfJTOq7ZF/+KcF2noZEY3
         ujAg==
X-Forwarded-Encrypted: i=1; AJvYcCUfLXK7RDLuJSEq1RaLHWJRvG96FtMpMnONpPC4HTCFmCP8RuvjmqV3NBhTcJWdg9iykcJk+9/bk/2pxYYv6Y+WTakO59lTVnaCrSyhcw==
X-Gm-Message-State: AOJu0Yykq41IsAzjNJRSnuxH+cxn2rf276fVhAR4slZU/hvUGDcTg5G0
	DXDabmJPAePIuSQLnQdKCCHduOoU5M4oj+hznmST1RxqASqkK/jD42i547CwtA==
X-Google-Smtp-Source: AGHT+IEqtMgjvMxkbWmWOdXGGWp0Zjuz/CWNaJsNsiv+FSoHC2NTjU/GPw8xwFN3knQ+HKmaZvHkxw==
X-Received: by 2002:a05:6871:149:b0:25e:12b9:be40 with SMTP id 586e51a60fabf-260d9221b48mr3740633fac.25.1721298584639;
        Thu, 18 Jul 2024 03:29:44 -0700 (PDT)
Received: from thinkpad ([220.158.156.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ec7ed56sm9640357b3a.125.2024.07.18.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 03:29:44 -0700 (PDT)
Date: Thu, 18 Jul 2024 15:59:38 +0530
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
Message-ID: <20240718102938.GA8877@thinkpad>
References: <20240717-pci-qcom-hotplug-v2-0-71d304b817f8@linaro.org>
 <20240717-pci-qcom-hotplug-v2-12-71d304b817f8@linaro.org>
 <02b94a07-fcd6-4a48-bead-530b81c8a27e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <02b94a07-fcd6-4a48-bead-530b81c8a27e@quicinc.com>

On Wed, Jul 17, 2024 at 03:57:11PM -0700, Mayank Rana wrote:
> Hi Mani
> 
> I don't think we can suggest that usage of link up event with Global IRQ as
> simulate PCIe hotplug. hotplug is referring to allow handling of both
> add or remove of endpoint device whereas here you are using global IRQ as
> last step to rescan bus if endpoint is power up later after link training is
> initiated.
> 

Why not? Well it is not entirely the standard 'hotplug' and that's why I
referred it as 'simulating hotplug'.

The point of having this feature is to avoid the hassle of rescanning the bus
manually when the devices are connected to this bus post boot.

> Will this work if you remove endpoint device and add it back again ?
> 

No, not currently. But we could add that logic using LINK_DOWN event. Though,
when the device comes back again, it will not get enumerated successfully due to
a bug in the link training part (which I plan to address later). But this
issue is irrespective of this hotplug simulation.

> Regards,
> Mayank
> On 7/17/2024 10:03 AM, Manivannan Sadhasivam via B4 Relay wrote:
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
> >   drivers/pci/controller/dwc/pcie-qcom.c | 55 +++++++++++++++++++++++++++++++++-
> >   1 file changed, 54 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 0180edf3310e..a1d678fe7fa5 100644
> > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > @@ -50,6 +50,9 @@
> >   #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
> >   #define PARF_Q2A_FLUSH				0x1ac
> >   #define PARF_LTSSM				0x1b0
> > +#define PARF_INT_ALL_STATUS			0x224
> > +#define PARF_INT_ALL_CLEAR			0x228
> > +#define PARF_INT_ALL_MASK			0x22c
> >   #define PARF_SID_OFFSET				0x234
> >   #define PARF_BDF_TRANSLATE_CFG			0x24c
> >   #define PARF_SLV_ADDR_SPACE_SIZE		0x358
> > @@ -121,6 +124,9 @@
> >   /* PARF_LTSSM register fields */
> >   #define LTSSM_EN				BIT(8)
> > +/* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> > +#define PARF_INT_ALL_LINK_UP			BIT(13)
> > +
> >   /* PARF_NO_SNOOP_OVERIDE register fields */
> >   #define WR_NO_SNOOP_OVERIDE_EN			BIT(1)
> >   #define RD_NO_SNOOP_OVERIDE_EN			BIT(3)
> > @@ -1488,6 +1494,29 @@ static void qcom_pcie_init_debugfs(struct qcom_pcie *pcie)
> >   				    qcom_pcie_link_transition_count);
> >   }
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
> How do you handle case where endpoint is already enumerated, and seeing link
> up event in parallel or later ? will it go ahead to rescan bus again here ?
> 

If the endpoint is already enumerated, there will be no Link up event. Unless
the controller reinitializes the bus (which is the current behavior).

If the endpoint is already powered on during controller probe, then it will be
enumerated during dw_pcie_host_init() and since we register the IRQ handler
afterwards, there will be no Link up in that case.

This feature is only applicable for endpoints that comes up post boot.

> Also can you consider doing this outside hardirq context ?
> 

This is already running in threaded irq context (bottom half), wouldn't that
be enough?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

