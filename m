Return-Path: <linux-arm-msm+bounces-13825-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 418618781ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 15:46:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC3C8B215C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Mar 2024 14:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 252D24087E;
	Mon, 11 Mar 2024 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHyJ3FtD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C0741232
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 14:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710168376; cv=none; b=uAogPmKG/BLzSPp4CC4kidP22jZLdwNdykQUfvjbsqnU4p7Fk9nBU40NcIl0+aQutaQc4WLGprUTass91yFvFTgiv6XsoniNNhiK+Gqi4HmpIksCj98RuTa7+rekX1KZuNcFaSBYla+bQDH9HrF7qXcDG8zFb8P0i2pqKCkGgM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710168376; c=relaxed/simple;
	bh=aTwrh90GUA0KuD1dJsmiDHSRUsUSaTCyVUrQIX6iNAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vb8YCQVU9G8br2d8K9cVoWR884zpukWH87WLV+NiiD2JEbtd59n8VkfuLfIgybLet3AsiVGRbsxE3EmsVVeSlEW1ocwSYw724K1ZGkAUCY7yAvaTqoxQDffX0aiP3MDCe42bywoHJyW7xETiEw5pXqufkR2LmBDScB1tu9O3xWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rHyJ3FtD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e66e8fcc2dso2905209b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Mar 2024 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710168372; x=1710773172; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7WZeoUY9lDhr7yJPXp/YwXiCG8hTtAt9+Pvs1llVqw0=;
        b=rHyJ3FtDcw8P3wUOnNulEZuwPV4VP0ulj4JM28BomYQAawePdstskecFXjin3dHATR
         x4aqmmZMPM+ZUs8tKM2d4QnxSPCoOXKQnLrrV7t2e6d4tHcXzmK253JWCT592tlQR6mk
         uXo0+GIF3C45JyvikWWPq6dVH8ihWBmpYg/KvifT9ETHjIvWCdFgHXRMMME4GkY9Y5Eo
         eDjrkmsf8BUw0A+oY4NjDDbAv709DQ3L8IeZokl5MY8ZsWQe4doWKQ2aKUEunK7rbGMh
         65pphfZ8I9Qz8hXH3hXRJ437HKXNAw0AyzJ7eXbGGKR0plvTtsUHzro/JLE79v+GlYyN
         ZclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710168372; x=1710773172;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WZeoUY9lDhr7yJPXp/YwXiCG8hTtAt9+Pvs1llVqw0=;
        b=Jd0zz+EMcSGRM8vzqA7R2qFojcn/tiXgxAwjIxk9Eahc21dghQKRd/+Xw7cbv4h3Ig
         kRGLO4/KgT/UyVWIBN4S+C2XBLakXENB0QCUCgc0ctCgUC2xMa1KaCPljdsgsVu5PdQ6
         wY6GEKew8iCUpgQYBxkEBgYnzuAhhyVaL5wPdKn0XTGtWtvkI50M4sJ+cblg1RgfTlO9
         GM4yygNnrUCWTBI4lYlUSiZtC2K2tpWapWcfgNbvzj6zgDSHfdQkJYaSyBdPTitTJHJn
         7EEeg6ZHZ8LyItHWm8WbMIdVar7UkYm9q6rYArQ/6fip1ixm60xC0L9UlcfITB7S8fsK
         Zc8Q==
X-Forwarded-Encrypted: i=1; AJvYcCU4GLQY9hWh6fbPR82J97tBbh/QyKF5y/d2jK0gL2lnbVzLhmM7hpQkU/U1Vch6fxMzSbutdOLQcAw9mV4Ri8uKyadgqdj6yCRDVOTvZg==
X-Gm-Message-State: AOJu0Yz3d2Bnqaz5+6hgyHRW0R8lu4Fs4jt2+LML3W3iB12zf7rCOGHw
	NLrUJYh3MhDcj0oM4/rPG+lbYnVdf8eVsaLqzV5fChVw124axhOuScLcBc5h0g==
X-Google-Smtp-Source: AGHT+IEkyoSv3cUPd2YD+Ord9GisLbDuQ3mTJgXZUAwKm1FrFZN401VY7NABhiAj7Fw9fR+qh9jZVw==
X-Received: by 2002:a05:6a00:2d20:b0:6e5:5a24:818c with SMTP id fa32-20020a056a002d2000b006e55a24818cmr7159193pfb.7.1710168372299;
        Mon, 11 Mar 2024 07:46:12 -0700 (PDT)
Received: from thinkpad ([117.217.184.48])
        by smtp.gmail.com with ESMTPSA id o12-20020a62f90c000000b006e053e98e1csm4427472pfh.136.2024.03.11.07.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 07:46:11 -0700 (PDT)
Date: Mon, 11 Mar 2024 20:15:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v9 07/10] PCI: dwc: ep: Remove "core_init_notifier" flag
Message-ID: <20240311144559.GA2504@thinkpad>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
 <20240304-pci-dbi-rework-v9-7-29d433d99cda@linaro.org>
 <ZesRk5Dg4KEASD3U@ryzen>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZesRk5Dg4KEASD3U@ryzen>

On Fri, Mar 08, 2024 at 02:24:35PM +0100, Niklas Cassel wrote:
> On Mon, Mar 04, 2024 at 02:52:19PM +0530, Manivannan Sadhasivam wrote:
> > "core_init_notifier" flag is set by the glue drivers requiring refclk from
> > the host to complete the DWC core initialization. Also, those drivers will
> > send a notification to the EPF drivers once the initialization is fully
> > completed using the pci_epc_init_notify() API. Only then, the EPF drivers
> > will start functioning.
> > 
> > For the rest of the drivers generating refclk locally, EPF drivers will
> > start functioning post binding with them. EPF drivers rely on the
> > 'core_init_notifier' flag to differentiate between the drivers.
> > Unfortunately, this creates two different flows for the EPF drivers.
> > 
> > So to avoid that, let's get rid of the "core_init_notifier" flag and follow
> > a single initialization flow for the EPF drivers. This is done by calling
> > the dw_pcie_ep_init_notify() from all glue drivers after the completion of
> > dw_pcie_ep_init_registers() API. This will allow all the glue drivers to
> > send the notification to the EPF drivers once the initialization is fully
> > completed.
> > 
> > Only difference here is that, the drivers requiring refclk from host will
> > send the notification once refclk is received, while others will send it
> > during probe time itself.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > diff --git a/drivers/pci/endpoint/functions/pci-epf-test.c b/drivers/pci/endpoint/functions/pci-epf-test.c
> > index 18c80002d3bd..fc0282b0d626 100644
> > --- a/drivers/pci/endpoint/functions/pci-epf-test.c
> > +++ b/drivers/pci/endpoint/functions/pci-epf-test.c
> > @@ -927,21 +928,12 @@ static int pci_epf_test_bind(struct pci_epf *epf)
> >  	if (ret)
> >  		return ret;
> >
> 
> Hello Mani,
> 
> Since you asked for testing, I gave your series a spin
> (with a driver without .core_init_notifier).
> 
> 
> There seems to be a problem that pci_epc_write_header() is never called.
> 
> Debugging this, it seems that .core_init in pci-epf-test is never called.
> 
> If I add debug prints in pci_epc_init_notify(), I see that it does not
> notify a single EPF driver.
> 
> It appears that the patch in $subject will call pci_epc_init_notify()
> at EPC driver .probe() time, and at that point in time, there are no
> EPF drivers registered.
> 
> They get registered later, when doing the configfs write.
> 
> 
> I would say that it is the following change that breaks things:
> 
> > -	if (!core_init_notifier) {
> > -		ret = pci_epf_test_core_init(epf);
> > -		if (ret)
> > -			return ret;
> > -	}
> > -
> 
> Since without this code, pci_epf_test_core_init() will no longer be called,
> as there is currently no one that calls epf->core_init() for a EPF driver
> after it has been bound. (For drivers that call dw_pcie_ep_init_notify() in
> .probe())
> 

Thanks a lot for testing, Niklas!

> I guess one way to solve this would be for the EPC core to keep track of
> the current EPC "core state" (up/down). If the core is "up" at EPF .bind()
> time, notify the EPF driver directly after .bind()?
> 

Yeah, that's a good solution. But I think it would be better if the EPC caches
all events if the EPF drivers are not available and dispatch them once the bind
happens for each EPF driver. Even though INIT_COMPLETE is the only event that is
getting generated before bind() now, IMO it is better to add provision to catch
other events also.

Wdyt?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

