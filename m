Return-Path: <linux-arm-msm+bounces-929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 961267EF084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 196DDB20B52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AEB11A29B;
	Fri, 17 Nov 2023 10:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyPo0qh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6FA1A271
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 10:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91603C433C7;
	Fri, 17 Nov 2023 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700217155;
	bh=P6HQZRDDmwp9Crnk93EhFdo2cPR9sDDh+Congk5Ouuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyPo0qh4XK7WbIugX2QTAFDdhDPTrz0IqKR7j1oKpwZj/bdj4KOBsEHyllUQPKWnx
	 TXlsqzMUkQEaVR0sh8D7k02T6uirj1bcY2Z1+8Cc+EAuNfWZKVoi5kvw+/dxiJuaAh
	 5h9QLiJP+CpSicZezXlGfzYYgsLeqf+/Eha60VVgLPPOpN5l7axbdocGG/yg+DvgsI
	 km8UD/hHi5+4IfF0/gLNEV5UaXxXnc96/8xwXgyf7Hayfa4D14hh1zEzbYpY2dfG+M
	 pMmnP4p0aaYX7FERpqsfhHZ2N2R/uOpReT3b+6kXxXGMXjJoJ/LK7dcpinuTFbAb26
	 2lk8+rqxm/lTQ==
Date: Fri, 17 Nov 2023 16:02:27 +0530
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] PCI: qcom: Clean up ASPM comment
Message-ID: <20231117103227.GM250770@thinkpad>
References: <20231114135553.32301-1-johan+linaro@kernel.org>
 <20231114135553.32301-5-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114135553.32301-5-johan+linaro@kernel.org>

On Tue, Nov 14, 2023 at 02:55:51PM +0100, Johan Hovold wrote:
> Break up the newly added ASPM comment so that it fits within the soft 80
> character limit and becomes more readable.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

I think we discussed (80column soft limit for comments) in the past, but I don't
think breaking here makes the comment more readable.

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-qcom.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index 21523115f6a4..a6f08acff3d4 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -969,7 +969,10 @@ static int qcom_pcie_post_init_2_7_0(struct qcom_pcie *pcie)
>  
>  static int qcom_pcie_enable_aspm(struct pci_dev *pdev, void *userdata)
>  {
> -	/* Downstream devices need to be in D0 state before enabling PCI PM substates */
> +	/*
> +	 * Downstream devices need to be in D0 state before enabling PCI PM
> +	 * substates.
> +	 */
>  	pci_set_power_state(pdev, PCI_D0);
>  	pci_enable_link_state_locked(pdev, PCIE_LINK_STATE_ALL);
>  
> -- 
> 2.41.0
> 

-- 
மணிவண்ணன் சதாசிவம்

