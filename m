Return-Path: <linux-arm-msm+bounces-916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE887EF052
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:28:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C65C01F28664
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B639219463;
	Fri, 17 Nov 2023 10:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k4SzAmwx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56019460
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 10:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C41CFC433C7;
	Fri, 17 Nov 2023 10:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700216918;
	bh=QCversjCzEUGiXNxUKjPeJo0oZmncZLcMGfj60HFPUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k4SzAmwx3eBIGuT+BHJFjLtE1f6T52HZLA5AJsUqVvtMEwIvFzcTw32U/to3g9NBD
	 /lTV9NBlQW7hqkM4qAEnC4ZPGF7/qouW4Y6CtN1T8WaWO8KmZhpG6ge25aI4LRDlTs
	 GSLFNnxtMBO3HedT+Tgk0Ms0R1ImLv9XBM2IdHG947Y3kNRYNsvfaJDRLMkfjvHyQO
	 OBatj4+Arc1qR/Uzue09On/rhS7f2W8yGKhKf3r7WA3wBaxFNMGv0v6MzhCDnHxilY
	 5k/uFcVrK0LaEPjpIEMp63Q+IHkOt8Bk1YqXgWw0BdvbMS9WfIgjA6MgN3wIaVWkiH
	 7moQrx0glT4XQ==
Date: Fri, 17 Nov 2023 15:58:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Michael Bottini <michael.a.bottini@linux.intel.com>,
	"David E . Box" <david.e.box@linux.intel.com>
Subject: Re: [PATCH 2/6] PCI: vmd: Fix deadlock when enabling ASPM
Message-ID: <20231117102829.GK250770@thinkpad>
References: <20231114135553.32301-1-johan+linaro@kernel.org>
 <20231114135553.32301-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114135553.32301-3-johan+linaro@kernel.org>

On Tue, Nov 14, 2023 at 02:55:49PM +0100, Johan Hovold wrote:
> The vmd_pm_enable_quirk() helper is called from pci_walk_bus() during
> probe to enable ASPM for controllers with VMD_FEAT_BIOS_PM_QUIRK set.
> 
> Since pci_walk_bus() already holds a pci_bus_sem read lock, use the new
> locked helper to enable link states in order to avoid a potential
> deadlock (e.g. in case someone takes a write lock before reacquiring
> the read lock).
> 
> Fixes: f492edb40b54 ("PCI: vmd: Add quirk to configure PCIe ASPM and LTR")
> Cc: stable@vger.kernel.org      # 6.3
> Cc: Michael Bottini <michael.a.bottini@linux.intel.com>
> Cc: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/vmd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
> index 94ba61fe1c44..0452cbc362ee 100644
> --- a/drivers/pci/controller/vmd.c
> +++ b/drivers/pci/controller/vmd.c
> @@ -751,7 +751,7 @@ static int vmd_pm_enable_quirk(struct pci_dev *pdev, void *userdata)
>  	if (!(features & VMD_FEAT_BIOS_PM_QUIRK))
>  		return 0;
>  
> -	pci_enable_link_state(pdev, PCIE_LINK_STATE_ALL);
> +	pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
>  
>  	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_LTR);
>  	if (!pos)
> -- 
> 2.41.0
> 

-- 
மணிவண்ணன் சதாசிவம்

