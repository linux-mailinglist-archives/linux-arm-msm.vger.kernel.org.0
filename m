Return-Path: <linux-arm-msm+bounces-863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A77EEE20
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 10:06:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 560AF280ED9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Nov 2023 09:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E08ADEAF9;
	Fri, 17 Nov 2023 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph8JTNUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A6CD296;
	Fri, 17 Nov 2023 09:06:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F80DC433C8;
	Fri, 17 Nov 2023 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700212012;
	bh=T2mILB6OLuIKTcfZr2BT0zwlCFYVwcwy0W1B4jyIbBE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ph8JTNUwYgHtIXJfkfXPfLie5d2K5Wq7VgxuXrBZHlXit6KamtJbUtOoX5xMiPa8A
	 WUCPHw0FLlH3j9CX/vgJ0uRohjNxLdFFxSGyDhtENnG9sBVOFPm43vcBFvbG7vg906
	 dzRvI4DM9urmNNRj8LcfFjxtK3QS1gOYduKIgsi9zbWQv2bVMGtRqIt/tmLQaSGu9p
	 a3JFTg6j8ArUTbhERl+jSspESFJ9ii/zQmyBECMLfRy5x+JUlYNZWVY3R++zwMP7qk
	 /0aXsEY+KOV1XzaN+8F8S2DXZVPP6IyhZK26tvXj29oTozCor0sD7ocf5KCzN8nOg3
	 jgUt9gI0Rabrw==
Date: Fri, 17 Nov 2023 14:36:40 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	konrad.dybcio@linaro.org, robh+dt@kernel.org,
	quic_shazhuss@quicinc.com, quic_nitegupt@quicinc.com,
	quic_ramkri@quicinc.com, quic_nayiluri@quicinc.com,
	dmitry.baryshkov@linaro.org, robh@kernel.org,
	quic_krichai@quicinc.com, quic_vbadigan@quicinc.com,
	quic_parass@quicinc.com, quic_schintav@quicinc.com,
	quic_shijjose@quicinc.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sa8775p: Mark PCIe controller
 as cache coherent
Message-ID: <20231117090640.GB250770@thinkpad>
References: <1700051821-1087-1-git-send-email-quic_msarkar@quicinc.com>
 <1700051821-1087-4-git-send-email-quic_msarkar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1700051821-1087-4-git-send-email-quic_msarkar@quicinc.com>

On Wed, Nov 15, 2023 at 06:07:01PM +0530, Mrinmay Sarkar wrote:
> The PCIe controller on SA8775P supports cache coherency, hence add the

"PCIe RC controller" both in subject and description.

> "dma-coherent" property to mark it as such.
> 
> Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>

With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 7eab458..ab01efe 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -3620,6 +3620,7 @@
>  				<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_PCIE_0 0>;
>  		interconnect-names = "pcie-mem", "cpu-pcie";
>  
> +		dma-coherent;
>  		iommus = <&pcie_smmu 0x0000 0x7f>;
>  		resets = <&gcc GCC_PCIE_0_BCR>;
>  		reset-names = "core";
> -- 
> 2.7.4
> 

-- 
மணிவண்ணன் சதாசிவம்

