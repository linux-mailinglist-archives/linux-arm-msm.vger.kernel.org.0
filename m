Return-Path: <linux-arm-msm+bounces-26265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD44931FA2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 06:18:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CA41B20C46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 04:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3FA23B0;
	Tue, 16 Jul 2024 04:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vIjF0ytw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EB510A1A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 04:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721103515; cv=none; b=rPoCOkw9NwR+Z9+FtYNwwyp2Oni7ZyaZ1n2fvt54+Xg/0mwfWFeMEoReHr0wcD28pADkC5l5o9Num3sQ4AY8zdv+meREmZ+MujAQxMpD90+8DIKeN1L+B5NFlwv56DLigrw5+U7ZqWzyR2dz2c0drTvpGXPZj+DbuaUyLAX+he4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721103515; c=relaxed/simple;
	bh=RGsPBBQkzUBM0SMR+ehNOxqmnR0WbZc/DsQlI6sXDmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bpqCwtA9sM+G2uBXF4cRTdr8sheF+Fbyn+S0D/VlzKCAWZseW+Ol1AIOZidq0Tvobi19Utne+UirYWGS/3CTgmNyNV2hPtkxnrfLUxYgr0r2l30fICymEAgH5fzA5Wm8DJKEJTzhZkYJlA/J7orcBq7GqJNStyAZFL/U7iRjDqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vIjF0ytw; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-70af5fbf0d5so3118874b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jul 2024 21:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721103513; x=1721708313; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BKYgDKFHVYuhAVcjkJOhPnekOkq1qxzB/IHzo1av0Yc=;
        b=vIjF0ytwNwE84Mhg+0lXJwc3AGQ6M/xBTeQyiRGHCJfCw/bMYct6jnQN5vaX3gaBwJ
         GE8itWoKVfHKH74fWvjrIr+vFGdptaGdVhQGQFkmTtLOBwnbzCAy7eh1nFmQlP3+WcFb
         gABIxN465xqcKQzEblbcXbrpO3hSp/dKWUHfYOq6fFZ36us3PAYOMhHF3kKc7s7FHJ7a
         DPM5JJIIIwqiu/YyvWINzRMnbeqnofvc7Scm3ItR35mpw/GJXNPrAeyJIqV34W+76XBS
         k3BTKqIkYtBXoiSwK4yLA7P70eX8fkZiNJu2+oBdXfW8vcgW6VJYvD0+WB1wp5PqYP2r
         WfpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721103513; x=1721708313;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKYgDKFHVYuhAVcjkJOhPnekOkq1qxzB/IHzo1av0Yc=;
        b=recspGOpTatrUqLPnThi2cztC9uoDHe6ptrziNfIZyRWbQDLhdEuR5R4CLlbJBgXoW
         evNcDCdvjh0vLOgYWmnxuH3wIMUabIuV9hu8Bx5iJencYXgl90xF98MVEEXA6EsHgHNI
         JORWZwkNkFeGeXGpa7jgbjxASLXmgnspcwgJZDAk0nhAhUuf7SnzPnHASsMOysSVdKYv
         QSNfgCqyiQZND4rVUXpRwK04h2axMIBHre0JbJ9sLX3oGaAzFfVfXlGGnhEPRdjhKtZN
         GAdqO4gofO0jDwoxZ9T8M3IGal9lbLknz44Mh8n80vam57JZI021rvpgqi3WKxjS5BGo
         UdFw==
X-Forwarded-Encrypted: i=1; AJvYcCXYEs5F2uQHYb6/uH7xf4t9w3fN6sn48FkLEAtuQWkoOeSgb5EHpf8egi3z5dfkfDTlFJq3sM9CwvuvquFEXFcnuoIi6se8ivp2FYrqDA==
X-Gm-Message-State: AOJu0YzLdDuFpghGTndEJTwnAFAu4Mr/QQIezFG1pWB1kULYDECYJJYe
	M5jVi2AnZTYVa3Bcm8Syf0sKEjAXY1pjMQk8QCh3VcCV63Crgckd9rM391NeBw==
X-Google-Smtp-Source: AGHT+IGiEeicT8EuRcZ39OL++BPMADEK4s+ncegx9kmgjnLWGE4lsZt/4u4yLE9ZcSWRMSRVO51wCw==
X-Received: by 2002:aa7:8541:0:b0:705:9669:af1f with SMTP id d2e1a72fcca58-70cd8403e27mr881928b3a.10.1721103512634;
        Mon, 15 Jul 2024 21:18:32 -0700 (PDT)
Received: from thinkpad ([220.158.156.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7ecd362dsm5202464b3a.215.2024.07.15.21.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 21:18:32 -0700 (PDT)
Date: Tue, 16 Jul 2024 09:48:27 +0530
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
Message-ID: <20240716041827.GD3446@thinkpad>
References: <20240715-pci-qcom-hotplug-v1-0-5f3765cc873a@linaro.org>
 <20240715-pci-qcom-hotplug-v1-13-5f3765cc873a@linaro.org>
 <dca49572-dc77-58df-1bd1-b0e897191c87@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dca49572-dc77-58df-1bd1-b0e897191c87@quicinc.com>

On Tue, Jul 16, 2024 at 09:34:13AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/15/2024 11:03 PM, Manivannan Sadhasivam via B4 Relay wrote:
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
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/pci/controller/dwc/pcie-qcom.c | 55 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 55 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > index 0180edf3310e..38ed411d2052 100644
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
> > @@ -260,6 +266,7 @@ struct qcom_pcie {
> >   	struct icc_path *icc_cpu;
> >   	const struct qcom_pcie_cfg *cfg;
> >   	struct dentry *debugfs;
> > +	int global_irq;
> >   	bool suspended;
> >   };
> > @@ -1488,6 +1495,29 @@ static void qcom_pcie_init_debugfs(struct qcom_pcie *pcie)
> >   				    qcom_pcie_link_transition_count);
> >   }
> > +static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
> > +{
> > +	struct qcom_pcie *pcie = data;
> > +	struct dw_pcie_rp *pp = &pcie->pci->pp; > +	struct device *dev = pcie->pci->dev;
> > +	u32 status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
> > +
> > +	writel_relaxed(status, pcie->parf + PARF_INT_ALL_CLEAR);
> > +
> > +	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
> > +		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
> > +		/* Rescan the bus to enumerate endpoint devices */
> > +		pci_lock_rescan_remove();
> > +		pci_rescan_bus(pp->bridge->bus);
> There can be chances of getting link up interrupt before PCIe framework
> starts enumeration and at that time bridge-> bus is not created and
> cause NULL point access.
> Please have a check for this.
> 

Host bridge is enumerated during dw_pcie_host_init() and the IRQ handler is
registered afterwards. So there is no way the 'pp->bridge' can be NULL.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

