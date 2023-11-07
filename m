Return-Path: <linux-arm-msm+bounces-96-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CC37E4204
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 15:45:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E963281061
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 14:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E7530D15;
	Tue,  7 Nov 2023 14:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="igKU9F11"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E122FE02;
	Tue,  7 Nov 2023 14:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D68C4C433C7;
	Tue,  7 Nov 2023 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699368309;
	bh=DCyfmXibenthavLR5OiO0v+ClmxD1f/SWmuBNmS/nbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=igKU9F11MB0Xcq4Nu0c1zh1QEB+4EOVvhCFXhykinYrteyoEIZAmk+OCdpz2BIrQD
	 REEqlz5XNUcIntoHKJiiT4Lx9GXJ2dr/INGX7xQ9WkESsMdsAmgVmn4UrXxVNNKIzx
	 04wxNoRpL6NneIX5ip6sDXZ3CPuQcySARG4dKSdmVUsZGiAQaBSjTT7WpntRKTChTx
	 r8upz/bfdHhVFgxb+EDNsDPEUEDd7StSdXkwW2NXLK3qCEIUN28TnS6dS8DHQL9lBh
	 XMoiLPgXPHqE3UphKCKtmZUbr4l4xKKDuE/9QVhTRkLrk3hB9IdS2U7zMtGif3kj2l
	 vwpEpHoVapRYg==
Date: Tue, 7 Nov 2023 20:14:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	konrad.dybcio@linaro.org, mani@kernel.org, robh+dt@kernel.org,
	quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
	dmitry.baryshkov@linaro.org, robh@kernel.org,
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
	quic_parass@quicinc.com, quic_schintav@quicinc.com,
	quic_shijjose@quicinc.com, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v7 3/4] PCI: epf-mhi: Add support for SA8775P
Message-ID: <20231107144445.GA147804@thinkpad>
References: <1699361428-12802-1-git-send-email-quic_msarkar@quicinc.com>
 <1699361428-12802-4-git-send-email-quic_msarkar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1699361428-12802-4-git-send-email-quic_msarkar@quicinc.com>

On Tue, Nov 07, 2023 at 06:20:27PM +0530, Mrinmay Sarkar wrote:
> Add support for Qualcomm Snapdragon SA8775P SoC to the EPF driver.
> Reusing PID (0x0306) as dedicated PID for SA8775P EP is yet to decide
> and it supports HDMA.

"SA8775P is currently reusing the PID 0x0306 (the default one hardcoded in the
config space header) as the unique PID is not yet allocated. But the host side
stack works fine with the default PID. It will get updated once the PID is
finalized."

> Currently, it has no fixed PCI class, so it is
> being advertised as "PCI_CLASS_OTHERS".
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/pci/endpoint/functions/pci-epf-mhi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/pci/endpoint/functions/pci-epf-mhi.c b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> index b7b9d3e..23ea94e 100644
> --- a/drivers/pci/endpoint/functions/pci-epf-mhi.c
> +++ b/drivers/pci/endpoint/functions/pci-epf-mhi.c
> @@ -114,6 +114,22 @@ static const struct pci_epf_mhi_ep_info sm8450_info = {
>  	.flags = MHI_EPF_USE_DMA,
>  };
>  
> +static struct pci_epf_header sa8775p_header = {
> +	.vendorid = PCI_VENDOR_ID_QCOM,
> +	.deviceid = 0x0306,               /* FIXME: Update deviceid for sa8775p EP */
> +	.baseclass_code = PCI_CLASS_OTHERS,
> +	.interrupt_pin = PCI_INTERRUPT_INTA,
> +};
> +
> +static const struct pci_epf_mhi_ep_info sa8775p_info = {
> +	.config = &mhi_v1_config,
> +	.epf_header = &sa8775p_header,
> +	.bar_num = BAR_0,
> +	.epf_flags = PCI_BASE_ADDRESS_MEM_TYPE_32,
> +	.msi_count = 32,
> +	.mru = 0x8000,
> +};
> +
>  struct pci_epf_mhi {
>  	const struct pci_epc_features *epc_features;
>  	const struct pci_epf_mhi_ep_info *info;
> @@ -677,6 +693,7 @@ static int pci_epf_mhi_probe(struct pci_epf *epf,
>  }
>  
>  static const struct pci_epf_device_id pci_epf_mhi_ids[] = {
> +	{ .name = "sa8775p", .driver_data = (kernel_ulong_t)&sa8775p_info },

The ID should be changed to "pci_epf_mhi_sa8775p". I know that you followed the
existing pattern, but it was my fault to ignore the prefix "pci_epf_mhi" and now
the function name would appear as "functions/sa8775p/" and it would create issue
if we happen to support multiple functions for this EP.

I will share the patch with you for changing the names for other functions as
well. Please apply it on top this series and send it together. Even though it is
an ABI breakage if we change the function name, luckily there isn't anyone (to
my knowledge) using this driver outside Qcom and myself yet.

- Mani

>  	{ .name = "sdx55", .driver_data = (kernel_ulong_t)&sdx55_info },
>  	{ .name = "sm8450", .driver_data = (kernel_ulong_t)&sm8450_info },
>  	{},
> -- 
> 2.7.4
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

