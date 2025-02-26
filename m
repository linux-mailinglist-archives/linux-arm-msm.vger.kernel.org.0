Return-Path: <linux-arm-msm+bounces-49412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31A36A4549B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 05:42:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFA0A18929E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 04:42:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BC8926773B;
	Wed, 26 Feb 2025 04:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZGt1iS1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A314139B;
	Wed, 26 Feb 2025 04:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740544957; cv=none; b=IRqsnI46DpDLu2jwoA6VJDDnDciHsQColUah9heuU5jT3Y5ChelfGn1DZoXCs+SUbXbUQieUrhxPWcFWqDnTI0M2rOKhOvY2EaR6KljwweMNtKD+a0qeaTv676g+/5hmdjAlDo85+oqf/VTczEfdcMObhEvDZU+1xrDreqTBDXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740544957; c=relaxed/simple;
	bh=gU+B+Bca/0yY91nfkZnbHtjy9lyrivsnimV5FlcX+6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mnbxKaxpBorThH5tY6QLPFXr82RSsBWobT4AV7kqH/kSSjROyQj0zPh/lQEExTSwE8Xq+KX5HcphQ7APSU4j9eWVFbwjim9uPTe+1WoHLoNPioX1pecmmGCUSRoq8OYNGfxjITtRCinLCdk3qrLVMNXshjdS2q2zSC1ALYztBwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZGt1iS1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F1EC4CED6;
	Wed, 26 Feb 2025 04:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740544956;
	bh=gU+B+Bca/0yY91nfkZnbHtjy9lyrivsnimV5FlcX+6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EZGt1iS1+e8UeSAa/4QoD0h+Ji1K2004WNcCQ1yoxfdRfOxeuR+7Q6kK55BrsiP9i
	 M57GDeEmCFNFnoV5/fEhbxmlgqH1WEqXXU/gJVK5823w3sAcbVRMjey5vBZ2Kj8DFO
	 mlHBt04QuZ8JYf0eqzyWNQ0ozTkzRRlgZu/QXj5Vmcsm7wA1fbCdpXW5Vk5DT4rN8d
	 KAuZvtDFSov06yL1m77y2u8RVe4glVgNrM5BYGcosOK9sMxnJn424LIn5mte6QXG/4
	 4GtrEBSVtX1IGQjlsLfbJqvD4AGTukkE2YLxH2EsWZ9mBXq1yZnzBLnAu/hbZow52h
	 TtqmNWolZo01A==
Date: Tue, 25 Feb 2025 22:42:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-idp: Update protected clocks
 list
Message-ID: <j43f4wu6wgoho2tl4crckemnngyvek5mma6ghkdyqcivk65dcf@gfsimovfuqy5>
References: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-protected_clock_qcm6490-v1-1-5923e8c47ab5@quicinc.com>

On Thu, Feb 06, 2025 at 03:43:21PM +0530, Taniya Das wrote:
> Certain clocks are not accessible on QCM6490-IDP board,
> thus mark them as protected.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
> Mark few clocks as protected on IDP of QCM6490.
> 
> This patchset is separated out from the series[1] to remove dependency from
> the LPASS reset.
> [1]: https://lore.kernel.org/all/20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com/
> ---
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts | 21 +++++++++++++++++++++

I merged the patch adding this board in November 2023, are you saying
that for the last 15 months no one has actually booted it!?

>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> index 9209efcc49b57a853c4dd55ac52cd4dc98d7fe86..346b9a377e611cd3e32cf00d44e87b363bada07a 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
> @@ -759,3 +759,24 @@ &wifi {
>  
>  	status = "okay";
>  };
> +
> +&gcc {

As you know, we sort nodes by address (if they have one), then
alphabetically. So this does not belong here.

Regards,
Bjorn

> +	protected-clocks = <GCC_AGGRE_NOC_PCIE_1_AXI_CLK> ,<GCC_PCIE_1_AUX_CLK>,
> +			   <GCC_PCIE_1_AUX_CLK_SRC>, <GCC_PCIE_1_CFG_AHB_CLK>,
> +			   <GCC_PCIE_1_MSTR_AXI_CLK>, <GCC_PCIE_1_PHY_RCHNG_CLK_SRC>,
> +			   <GCC_PCIE_1_PIPE_CLK>, <GCC_PCIE_1_PIPE_CLK_SRC>,
> +			   <GCC_PCIE_1_SLV_AXI_CLK>, <GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
> +			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>, <GCC_QSPI_CORE_CLK>,
> +			   <GCC_QSPI_CORE_CLK_SRC>,<GCC_USB30_SEC_MASTER_CLK>,
> +			   <GCC_USB30_SEC_MASTER_CLK_SRC>, <GCC_USB30_SEC_MOCK_UTMI_CLK>,
> +			   <GCC_USB30_SEC_MOCK_UTMI_CLK_SRC>,
> +			   <GCC_USB30_SEC_MOCK_UTMI_POSTDIV_CLK_SRC>, <GCC_USB30_SEC_SLEEP_CLK>,
> +			   <GCC_USB3_SEC_PHY_AUX_CLK>, <GCC_USB3_SEC_PHY_AUX_CLK_SRC>,
> +			   <GCC_USB3_SEC_PHY_COM_AUX_CLK>, <GCC_USB3_SEC_PHY_PIPE_CLK>,
> +			   <GCC_USB3_SEC_PHY_PIPE_CLK_SRC>, <GCC_CFG_NOC_LPASS_CLK>,
> +			   <GCC_MSS_GPLL0_MAIN_DIV_CLK_SRC>, <GCC_MSS_CFG_AHB_CLK>,
> +			   <GCC_MSS_OFFLINE_AXI_CLK>, <GCC_MSS_SNOC_AXI_CLK>,
> +			   <GCC_MSS_Q6_MEMNOC_AXI_CLK>, <GCC_MSS_Q6SS_BOOT_CLK_SRC>,
> +			   <GCC_SEC_CTRL_CLK_SRC>, <GCC_WPSS_AHB_CLK>,
> +			   <GCC_WPSS_AHB_BDG_MST_CLK>, <GCC_WPSS_RSCP_CLK>;
> +};
> 
> ---
> base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
> change-id: 20250206-protected_clock_qcm6490-4019e6a61d0b
> 
> Best regards,
> -- 
> Taniya Das <quic_tdas@quicinc.com>
> 

