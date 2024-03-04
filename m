Return-Path: <linux-arm-msm+bounces-13227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C9186FB80
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 09:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67B1A1F21061
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Mar 2024 08:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE79617589;
	Mon,  4 Mar 2024 08:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qLBmXvOF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F1A171BF
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Mar 2024 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709540252; cv=none; b=jhUsRWYLpYQA7lughR2nFLw+gk01QoF+bntag1H+yPPDWWPEiDGpet611fS8P8HQ8Moe+KrV2Bw8yHzyV9N4nwXbYgb3suD0P5QcfI/1DIKSZd/wTIfVNCt/+pP2knUhMTsdfapv2rW+K8SURQntGVs4j6KNHUbuS33toRLdiQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709540252; c=relaxed/simple;
	bh=AD9VdZnv6tpH2MGwDtAtMpimMoKxyHcy4Zu3b2xEwqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G7rkgZB4IDlFJEZCtObYlcHPdWTXjJOSOFMfS9B5Dw8plkIdqZYdumDcnb+UwWmmbCD/JJBIZMMW6RR4vIPYbzD3fqsQNQO3juwGB5+D6P4Nn3OxPSyzy0DRJsca7nRqLFBxc5hNKcMUxHtEaw0U+hP0nTob30yTTcFc85zIuXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qLBmXvOF; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7810827e54eso323647985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Mar 2024 00:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709540248; x=1710145048; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hmWR/dQ/IEMHbjZi2RajMkmXPdKPqp6IFe8boeN75aE=;
        b=qLBmXvOFtcsx+rnJDCob3E2rOLnBI9AHapK8Dtm+Rr0QUw0xTMdXs5+xl8zCLLe6Wk
         4C0UQRqwzo/e+bpVnUe5IEBdARgbSoe1YKekPfBbgodS9Oxr/KXR9Ok8Fox2ccxVZeeo
         IekStR2qwSUACWCj/Vhafm2bPKC4KCUC3hAO2cPa9zVsiuo0wpp6SANzq1kgdw5JecWN
         n24mVnoGUqHpn4oMM7trC3Bm6l9GwFW3Wr3tR3NB8etQ57+oQdEpLLa1zseKHaoBPcsw
         FDOFm3k8CA9v0YmDrk9fDKQA46FOViUkCzPNLLSjX42QG9r5JT6adkpbocbPOG28rV7K
         LswA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709540248; x=1710145048;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmWR/dQ/IEMHbjZi2RajMkmXPdKPqp6IFe8boeN75aE=;
        b=nsbdIAWMHw85m0FWOS5BLvdFR1St5u21GcSqIqs7Qi7zTDQ0X8qHEFake85PqV+OxM
         d0ddADKfP/UwEbVAOtnmNaNFjhlM/UL9zTgoregr9dyceIqfAHENP/hOhr+VJreHRF0R
         fZAmTxu/qYDTZTOFKTzX39bKlJfh86qswrCYKNypoC7McTgEt9Bv3tt1BcxBCDe8jtNL
         ECvGiONNNqaW2nUDSSS6My6Fv/TcXfcK4IAaev3Dcd/BUIRIzIYHLdwc4a8uxh+szNfq
         vfE5YfgKD2vgAE6WPzq0Xll/49h68byuhcrmQQL/WWl/05tek+2zg86l1to7wLw1cRCU
         weog==
X-Forwarded-Encrypted: i=1; AJvYcCUtQ5MTGPQyrzQm9ipJAdyH+UPJZnLWMbir8t1Z/3bmkvuvmsKNse565IF95vKuonXNQ3voBY2j9WbhNtwxL9b8YjdRK8Gv1YV2BNi1PA==
X-Gm-Message-State: AOJu0Yy20s1bdFDPZPjj/B1gNz+7PNUs3Wa4kqkma4L9D3U+z38Tdjpp
	1VJihBGVO6vi4bi6Tsz350N5N59amrb+8pqi5+u46rsjt8jpCVWltQlYm4s7lw==
X-Google-Smtp-Source: AGHT+IHj2odoO405rOYr1Gbd+eMsiiWMwBO5dmlWnp+hZP/p4is76K0Utr7rAm1gwPP1v5DFYu5Uzw==
X-Received: by 2002:a05:620a:110d:b0:788:22c4:c95f with SMTP id o13-20020a05620a110d00b0078822c4c95fmr3901107qkk.21.1709540248532;
        Mon, 04 Mar 2024 00:17:28 -0800 (PST)
Received: from thinkpad ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id t20-20020a05620a0b1400b007881ed0f87dsm1737718qkg.65.2024.03.04.00.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:17:28 -0800 (PST)
Date: Mon, 4 Mar 2024 13:47:13 +0530
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
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v8 03/10] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup()
 API for drivers supporting PERST#
Message-ID: <20240304081713.GH2647@thinkpad>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-3-64c7fd0cfe64@linaro.org>
 <ZeB7PQtkDSoCzE1Z@fedora>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZeB7PQtkDSoCzE1Z@fedora>

On Thu, Feb 29, 2024 at 01:40:29PM +0100, Niklas Cassel wrote:
> On Sat, Feb 24, 2024 at 12:24:09PM +0530, Manivannan Sadhasivam wrote:
> > For DWC glue drivers supporting PERST# (currently Qcom and Tegra194), some
> > of the DWC resources like eDMA should be cleaned up during the PERST#
> > assert time.
> > 
> > So let's introduce a dw_pcie_ep_cleanup() API that could be called by these
> > drivers to cleanup the DWC specific resources. Currently, it just removes
> > eDMA.
> > 
> > Reported-by: Niklas Cassel <cassel@kernel.org>
> > Closes: https://lore.kernel.org/linux-pci/ZWYmX8Y%2F7Q9WMxES@x1-carbon
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-ep.c | 11 +++++++++--
> >  drivers/pci/controller/dwc/pcie-designware.h    |  5 +++++
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
> >  drivers/pci/controller/dwc/pcie-tegra194.c      |  2 ++
> >  4 files changed, 17 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > index 2b11290aab4c..1205bfba8310 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> > @@ -564,12 +564,19 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
> >  	return 0;
> >  }
> >  
> > -void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
> > +void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
> >  {
> >  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
> > -	struct pci_epc *epc = ep->epc;
> >  
> >  	dw_pcie_edma_remove(pci);
> 
> Hello Mani,
> 
> In this message:
> https://lore.kernel.org/linux-pci/20240130062938.GB32821@thinkpad/
> 
> You mentioned that you were going to clean up the BARs.

Yes, I did and it is still in my queue.

> (Like I wrote in that thread, I really think that we should merge a fix for
> the broken "do we have a saved value from find_first_zero_bit() in the array",
> by using a "if (!saved_value[bar])", when find_first_zero_bit() returns zero.)
> 

Hmm, yeah that logic is flawed. Let me take another look.

> However, regardless of that, I do not see that this series (neither
> dw_pcie_ep_cleanup(), nor dw_pcie_ep_linkdown()), calls any function which
> will clean up the BARs.
> 
> Since e.g. qcom-ep.c does a reset_control_assert() during perst
> assert/deassert, which should clear sticky registers, I think that
> you should let dw_pcie_ep_cleanup() clean up the BARs using
> dw_pcie_ep_clear_bar().
> 

As I mentioned earlier, it is the job of the EPF drivers to clear the BARs since
they allocate them. I'm trying to reduce the implicit resetting wherever we
could.

The proper fix is to add the LINK_DOWN callback to EPF drivers and do cleanup.
I'm planning to submit a series for that after this one.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

