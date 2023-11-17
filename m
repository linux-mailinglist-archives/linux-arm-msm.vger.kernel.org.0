Return-Path: <linux-arm-msm+bounces-937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F27EF0A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 11:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A30F281042
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266D91A719;
	Fri, 17 Nov 2023 10:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qR6SB/dR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1771A70D
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Nov 2023 10:36:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58447C433C7;
	Fri, 17 Nov 2023 10:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700217398;
	bh=US34hMxupTHZ9TsBDq1dqsqsLDXa5zqsP2aagnEpwKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qR6SB/dR/hVs2o/TszmjzGLOeimKanmbfi2ETFu4k5U890FEwX+E3cbJYpPUvVchv
	 eYyPt/9i2ejlP//6KUHJ+qtNIyDxXc4H60sE91eg+CgdoPCmb8Y8MrIaCReO9U4Qfg
	 a+MI3ZVsdgEHCF8Mjd8MkfS8GUC1USIdY33mJKC9GjYuQ2z9mfWllQVwp+0wTnZmd6
	 Uu9u53mLL6URdgK+w4RePlVR0pdHm9ZAMBsGts25rlzBAvZy/awnzkqpSu1wr0HMq6
	 WiO+pAMpaQcLPZaygSdcctl1vMCk3YwKAIYYnp8aa9yAaCYpQu7mh4tbeQFITTn+IM
	 V5Uy2XjfLHWyg==
Date: Fri, 17 Nov 2023 16:06:30 +0530
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
Subject: Re: [PATCH 6/6] PCI/ASPM: Add lockdep assert to link state helper
Message-ID: <20231117103630.GO250770@thinkpad>
References: <20231114135553.32301-1-johan+linaro@kernel.org>
 <20231114135553.32301-7-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114135553.32301-7-johan+linaro@kernel.org>

On Tue, Nov 14, 2023 at 02:55:53PM +0100, Johan Hovold wrote:
> Add a lockdep assert to the locked disable link state helper which
> should only be called with a pci_bus_sem read lock held.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/pcie/aspm.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 19b7256d2dc9..ef2e7a186f57 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1090,6 +1090,8 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool locked
>  
>  int pci_disable_link_state_locked(struct pci_dev *pdev, int state)
>  {
> +	lockdep_assert_held_read(&pci_bus_sem);
> +
>  	return __pci_disable_link_state(pdev, state, true);
>  }
>  EXPORT_SYMBOL(pci_disable_link_state_locked);
> -- 
> 2.41.0
> 

-- 
மணிவண்ணன் சதாசிவம்

