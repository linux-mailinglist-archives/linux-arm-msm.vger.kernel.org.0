Return-Path: <linux-arm-msm+bounces-22062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7F0900301
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 14:07:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC54B1C22D3E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 12:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED83190677;
	Fri,  7 Jun 2024 12:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/0Xpx48"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3961847
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 12:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717762010; cv=none; b=e2PtuXm79LfbCopQZOG+hccIdy68OD1Suhy5y7EISEZbuKPuQWPdkVPXrshCw/cGAEbj4J6984Muc3/Mq0kdtfslrU/XPKTop+XVaCqTdA0GiBHePrzMF4ok7a+zOqQhz4fFtnWRXGW6I4WeFHAio+YuuSHH9aIE+iZo16zPWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717762010; c=relaxed/simple;
	bh=Vjv8WjEHAUBLg+R73TC4iHSeKZUV9RKb7PxJ5B8Y/WI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJfkhfJNfCCeKsrBs9sJHAr2ZEmkN2EyiGh5PaAOrMzAqCAUXEjS4WYYaHehqZU6ULpSfMbSZIAJjzAp+xmziH7gpN/pp4DpQSHZzE4Avg4rt36kUnrJolxerU6jcpctNaj1xpK8T4stvELTQ7PTn1x2BmcaOhun3GXBHSf7VE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/0Xpx48; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1f67fa9cd73so23044275ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 05:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717762007; x=1718366807; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k7NnO3DgcXmjQU2TFy5q5V0KcneMOGXb1GGo0qLmGSA=;
        b=W/0Xpx48QPdOA6lzHNq6eJAcLVw/XqaO4t7XYOO80CfHRoZIXaELHlcA0X62XiRMj4
         JfiTYGsPJcvlKzVp/GzS4j7WzGsBq2rG9qGf55HnDnMov2cr91mVmowaoKkSs+0/n5aP
         nTbD6Bd0G2BbFCgGSnli2pwGZj/AMwH55b2y0S243jMnKMIZCX1pXUlWAXz0iya+C73L
         IWjb9Cw0EoHqMlKqHBDmee5tHtQGXNzXb4HdCcuu4IdKGGV5ar9klygD6yFGrwkQU0pC
         I38dE/v/ita5bq3ffMCF/mLmdR5IZRWHlSCK6iW42aQX2ZbWnIJrk367U1GSmpsT/OVZ
         bvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717762007; x=1718366807;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7NnO3DgcXmjQU2TFy5q5V0KcneMOGXb1GGo0qLmGSA=;
        b=raZv2B9mDFy6EF6FmNY/xMv8u75Z2hgzKdeA92az0dCyPwOJIYezIOn/4Tp0OBJDrb
         F3TrswA8srFaomolrkfFDYYaXwJo8aNjD/urfYtWAj6pARAR1C6uaHi5WnYBV5FgIoA9
         Ilgmts8FyOQfbnQKxxkhAdnynAEpxVXwKtpTAs2tIEFopq8aiJX87e9v60frT4ddb4Rk
         4k4JXJDRuM1N/baQ2VHao5X+Oha5xIuoLuu3MGizJSB2KULHHEIAKNwxxVGLFGcTlspW
         VNfQwpBN41yS+ujbtXX8g2IUoIcj5Zr7d569z5ADDujcMjR49MZt5GdFk7rW8UOhSqIf
         g9yw==
X-Forwarded-Encrypted: i=1; AJvYcCXcqHc1UTVIwxx7FnI67QvNRHAP7zcaH3fX2wK/Ve73NFbrhgajTP7bXUb16kLvH0+NycBlY+5Wl4MpqN1Ro1MsM6hoBx3hDO+chq1SVA==
X-Gm-Message-State: AOJu0YylVU5pULpDXEX7L24tQ4f4X0oIWkbmaI3Qz1+yscP2ghs1lg7A
	701s3pAqNH9FiHRtDdmynlE2Qa9Pd38jc15+RSn59htxa7ruykgZCaTy07WvlQ==
X-Google-Smtp-Source: AGHT+IHZn1FxYEr2n48jlTtRBDfIAQDg5hiBd+j5q8YaNLn1ULoVlYRkUzjPoDR891koRVR82SXEYA==
X-Received: by 2002:a17:902:e84e:b0:1f6:7f8f:65ac with SMTP id d9443c01a7336-1f6b8f075b0mr80949715ad.26.1717762006991;
        Fri, 07 Jun 2024 05:06:46 -0700 (PDT)
Received: from thinkpad ([120.56.207.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd761ac8sm32756425ad.54.2024.06.07.05.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 05:06:46 -0700 (PDT)
Date: Fri, 7 Jun 2024 17:36:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	mhi@lists.linux.dev, Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 0/5] PCI: endpoint: Add EPC 'deinit' event and
 dw_pcie_ep_linkdown() API
Message-ID: <20240607120636.GA4122@thinkpad>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
 <ZmLTcNz0FxAWRYcd@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZmLTcNz0FxAWRYcd@ryzen.lan>

On Fri, Jun 07, 2024 at 11:31:28AM +0200, Niklas Cassel wrote:
> On Thu, Jun 06, 2024 at 12:56:33PM +0530, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series includes patches that were left over from previous series [1] for
> > making the host reboot handling robust in endpoint framework.
> > 
> > When the above mentioned series got merged to pci/endpoint, we got a bug report
> > from LKP bot [2] and due to that the offending patches were dropped.
> > 
> > This series addressed the issue reported by the bot by adding the stub APIs in
> > include/pci/pci-epc.h and also removed the unused dwc wrapper as concluded in
> > [3].
> > 
> > Testing
> > =======
> > 
> > This series is tested on Qcom SM8450 based development board with 2 SM8450 SoCs
> > connected over PCIe.
> > 
> > - Mani
> > 
> > [1] https://lore.kernel.org/linux-pci/20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org/
> > [2] https://lore.kernel.org/linux-pci/202405130815.BwBrIepL-lkp@intel.com/
> > [3] https://lore.kernel.org/linux-pci/20240529141614.GA3293@thinkpad/
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> > Manivannan Sadhasivam (5):
> >       PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
> >       PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers
> >       PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
> >       PCI: layerscape-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
> > 
> >  drivers/pci/controller/dwc/pci-dra7xx.c           |   2 +-
> >  drivers/pci/controller/dwc/pci-imx6.c             |   2 +-
> >  drivers/pci/controller/dwc/pci-keystone.c         |   2 +-
> >  drivers/pci/controller/dwc/pci-layerscape-ep.c    |   4 +-
> >  drivers/pci/controller/dwc/pcie-artpec6.c         |   2 +-
> >  drivers/pci/controller/dwc/pcie-designware-ep.c   | 116 +++++++++++++---------
> >  drivers/pci/controller/dwc/pcie-designware-plat.c |   2 +-
> >  drivers/pci/controller/dwc/pcie-designware.h      |  10 +-
> >  drivers/pci/controller/dwc/pcie-keembay.c         |   2 +-
> >  drivers/pci/controller/dwc/pcie-qcom-ep.c         |   5 +-
> >  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |   2 +-
> >  drivers/pci/controller/dwc/pcie-tegra194.c        |   3 +-
> >  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |   2 +-
> >  drivers/pci/endpoint/functions/pci-epf-mhi.c      |  19 ++++
> >  drivers/pci/endpoint/functions/pci-epf-test.c     |  17 +++-
> >  drivers/pci/endpoint/pci-epc-core.c               |  25 +++++
> >  include/linux/pci-epc.h                           |  13 +++
> >  include/linux/pci-epf.h                           |   2 +
> >  18 files changed, 162 insertions(+), 68 deletions(-)
> > ---
> > base-commit: 7d96527bc16e46545739c6fe0ab6e4c915e9910e
> > change-id: 20240606-pci-deinit-2e6cdf1bd69f
> > 
> > Best regards,
> > -- 
> > Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> 
> Considering certain dependency patches have been merged to
> pci/endpoint and other dependency patches have been merged to
> pci/controller/dwc, perhaps it is best if you split this series:
> 
> Series 1 based on pci/endpoint: with patch 1/5 and 2/5.
> Series 2 based on pci/controller/dwc: with patch 5/5.
> 

Thanks Niklas! I didn't check the 'dwc' branch, so ended up posting patches 3/5
and 4/5 again.

Bjorn, if you are OK with this series, I can go ahead and apply patches 1/5 and
2/5 to 'pci/endpoint' and bank on Krzysztof to handle 5/5.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

