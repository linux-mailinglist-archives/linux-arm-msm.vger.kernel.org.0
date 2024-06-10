Return-Path: <linux-arm-msm+bounces-22157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F785901B67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 08:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8151B1F21F00
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Jun 2024 06:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD251803A;
	Mon, 10 Jun 2024 06:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qPj5C8aw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D41C18643
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Jun 2024 06:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718002418; cv=none; b=EgdLKsaajymA9vP6nCPbW612KfG7ryOjaYr8pBNI4kTj/qJW0MUecA3QGJGN1WkdGnwWFu1O1k5qy5KAsS5yaRbL1l81y0Lgg8IMwMtvCkyxlEK4NCA+uLQWMFw7KfQ+BZ+bRSrxJzhjQK5Ft/qbEB41zViBWADcC7dbRdmpEzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718002418; c=relaxed/simple;
	bh=mRZh5+OagwrYksdm05IvR/+1yNl8KYHz8Qj7URz+FVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFkAv/EZhDaT5JxfoiN5SguqXO4gleiSkynwz7L2KqVakuajgjof2Sh245v6ivx0RM/YQTfRWgoFMtTifQeC8S3CI2zU3eVctE0GFl2N0tO2k5LfX9s28q1MVRp5G1FtsJYtfGfR2lVK1oq2ixHjziNjRnHgaYjIbSOV0ARapK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPj5C8aw; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6e9f52e99c2so851660a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Jun 2024 23:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718002415; x=1718607215; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q79+Rla3cX6Hmnq2eCF4cwSxfS8g2qeMA5niTT4AJrk=;
        b=qPj5C8awILJqh3c/ngE7eXKXeYZ0SQOicLTFq5jZzuiL9aHGzEYvh25QB2h713dsMt
         3c+MYas5fDMuGrH8mO4sx57ojueo6ftuPopnJa8wRmTz/AM8UYoXfiKFHSX5FXJbANil
         FXb2sSUzmTcDjagabFJSpcd5Sf6WY1j3W5R9gjYUHCNy7BL30CnnEcV8NFyanyR2uSUr
         s6qJy1tSl33o4XhZyubNBuquojl/ZVvDXJCp+1zIsYAwS8gjZi9sQv0ENu8wSMRglpwD
         pPYl6Kd2rlSRWDZPNjBVzziIsusmJ9rwKqw4ylTnOAzRRRRUP7wdfPSva9Qt1AESroYZ
         Mh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718002415; x=1718607215;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q79+Rla3cX6Hmnq2eCF4cwSxfS8g2qeMA5niTT4AJrk=;
        b=b4J+ArJCjcg8xrQ70vkDlK3pAMTiIwgv8L4OzJHNm6+Rz3eOgPfcP28pVCls4DEzHU
         i3F38Vw0tUCnlg5UKUBBzqALD8fN6T6u9uxNRjK1gx4nP/w/CIfusHW8Bh9quKaIS4Xf
         BjEdaT+VB308+KZBUjAk0+dEkwMcEOT4RZHOM8nlbkE/if6kVpbHp19d3ERqiJWKJusz
         ig0D8uF5XZzXU7IFF3QZyMxl/q0ndlu+Iz7b4wfT79payT7AeoDdVzZu9vI5vlCmN2vR
         E5OOeJeadzF7iV6B0ETySTPat/tKKhOn708Q+XeY/vBlokYx/m3RgcK9ANgemTnF1KHX
         Iosw==
X-Forwarded-Encrypted: i=1; AJvYcCX5GkgAV6TQYiHlkmCrciqTz6IUzaSJ82Up96kafsTRwhPS7Bm5JenkfHa4w5OaMb0nUVwaxhd0GPiPqnD0iEhfmK/QRzXeMVXNFycM/w==
X-Gm-Message-State: AOJu0Yy2Q14/V9nlHJyzqaBR6QKNzrG2125j8O/tmpfjPqUzZZQqHyQK
	I2bl4C9Q/xV8tBAL9Pvzxn11pquxdgmsVcXYOfCrhzn84SSd19KHL8sV9Bp4vg==
X-Google-Smtp-Source: AGHT+IGiQnfID/w2ovEqOtXmdaUmHolv4W8npj5rXP4hlu3K/zYS4n6pz5nKcO0YwT4Ao+fhHzZlGg==
X-Received: by 2002:a17:90b:b12:b0:2c2:c3fb:b13c with SMTP id 98e67ed59e1d1-2c2c3fbb277mr5727406a91.44.1718002414578;
        Sun, 09 Jun 2024 23:53:34 -0700 (PDT)
Received: from thinkpad ([220.158.156.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c3094cfe3dsm1355898a91.15.2024.06.09.23.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 23:53:34 -0700 (PDT)
Date: Mon, 10 Jun 2024 12:23:24 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>,
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
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@axis.com, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	mhi@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH 0/5] PCI: endpoint: Add EPC 'deinit' event and
 dw_pcie_ep_linkdown() API
Message-ID: <20240610065324.GA7660@thinkpad>
References: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240606-pci-deinit-v1-0-4395534520dc@linaro.org>

On Thu, Jun 06, 2024 at 12:56:33PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> This series includes patches that were left over from previous series [1] for
> making the host reboot handling robust in endpoint framework.
> 
> When the above mentioned series got merged to pci/endpoint, we got a bug report
> from LKP bot [2] and due to that the offending patches were dropped.
> 
> This series addressed the issue reported by the bot by adding the stub APIs in
> include/pci/pci-epc.h and also removed the unused dwc wrapper as concluded in
> [3].
> 
> Testing
> =======
> 
> This series is tested on Qcom SM8450 based development board with 2 SM8450 SoCs
> connected over PCIe.
> 
> - Mani
> 

Applied patch 2/5 to pci/endpoint! Krzysztof, please apply patches 1/5 and 5/5
to controller/dwc (patches 3/5 and 4/5 are already applied by you).

- Mani

> [1] https://lore.kernel.org/linux-pci/20240430-pci-epf-rework-v4-0-22832d0d456f@linaro.org/
> [2] https://lore.kernel.org/linux-pci/202405130815.BwBrIepL-lkp@intel.com/
> [3] https://lore.kernel.org/linux-pci/20240529141614.GA3293@thinkpad/
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
> Manivannan Sadhasivam (5):
>       PCI: dwc: ep: Remove dw_pcie_ep_init_notify() wrapper
>       PCI: endpoint: Introduce 'epc_deinit' event and notify the EPF drivers
>       PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle Link Down event
>       PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
>       PCI: layerscape-ep: Use the generic dw_pcie_ep_linkdown() API to handle Link Down event
> 
>  drivers/pci/controller/dwc/pci-dra7xx.c           |   2 +-
>  drivers/pci/controller/dwc/pci-imx6.c             |   2 +-
>  drivers/pci/controller/dwc/pci-keystone.c         |   2 +-
>  drivers/pci/controller/dwc/pci-layerscape-ep.c    |   4 +-
>  drivers/pci/controller/dwc/pcie-artpec6.c         |   2 +-
>  drivers/pci/controller/dwc/pcie-designware-ep.c   | 116 +++++++++++++---------
>  drivers/pci/controller/dwc/pcie-designware-plat.c |   2 +-
>  drivers/pci/controller/dwc/pcie-designware.h      |  10 +-
>  drivers/pci/controller/dwc/pcie-keembay.c         |   2 +-
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         |   5 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |   2 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c        |   3 +-
>  drivers/pci/controller/dwc/pcie-uniphier-ep.c     |   2 +-
>  drivers/pci/endpoint/functions/pci-epf-mhi.c      |  19 ++++
>  drivers/pci/endpoint/functions/pci-epf-test.c     |  17 +++-
>  drivers/pci/endpoint/pci-epc-core.c               |  25 +++++
>  include/linux/pci-epc.h                           |  13 +++
>  include/linux/pci-epf.h                           |   2 +
>  18 files changed, 162 insertions(+), 68 deletions(-)
> ---
> base-commit: 7d96527bc16e46545739c6fe0ab6e4c915e9910e
> change-id: 20240606-pci-deinit-2e6cdf1bd69f
> 
> Best regards,
> -- 
> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 

-- 
மணிவண்ணன் சதாசிவம்

