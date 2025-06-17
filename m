Return-Path: <linux-arm-msm+bounces-61565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1FCADC650
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8175D189963D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:28:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCA72949F3;
	Tue, 17 Jun 2025 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ME6cL/4G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D717293C68;
	Tue, 17 Jun 2025 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152440; cv=none; b=D/uRH0mtKionms8SBYt6EsnJS4ZjPvamVTpV5oiW/eZ0qu0SOu/c3Xwo1u1yi/Z1JnkiEMD2uv1RuJKPzthkSRRGbX143Umk/1B9I/cUhqm48zV3VW23ijRt8LQzmSgY2LBIvtT1MXQEGByueQzQXVx7pQDgp5E8N++GfvdWUWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152440; c=relaxed/simple;
	bh=/j9qw9CPeikjZGsZN2keC06a14oGdbXh/cFa9quarCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HM9T5pPU17Tne/oeIIoK2mVuj0FJfLcyZu9bgBnbcH07qECDIqGyPKewueGN6yLvwUu24Wp0jYgpYb8xGufg/lya+v0C2TZAdznFESUnIr3dwXcmv9dTEJaYuekmDOKFvBgrMYx5+Qqext3qrDteS7Gv8ZqF7nZpvgVbaQZdN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ME6cL/4G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81322C4CEED;
	Tue, 17 Jun 2025 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750152440;
	bh=/j9qw9CPeikjZGsZN2keC06a14oGdbXh/cFa9quarCc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ME6cL/4GMsQtRnijbudm4iGh8KzyGl0NTc/VXArUH+mvjy1T33nog+OwCG93otWrk
	 DYBqmNHjytCJwzC1Xulz/YxqBh3EEFJzrvjJK3x/yE8eW1EPJ950sePx54GQ2mSIAV
	 2QHhLS4V/c03f1RRao2qOVdiYcN9bd5x9s8zwqEvHwNBgN5TCSnIJu92m5kaCpb9pa
	 EbquN/L70dtcGp22NxwgtLWVHcAMDBWiCr5ZYbp7apLQPT6Jt1VGgSfD8WSqbf/uTZ
	 VTLmdopIHDu0ib2z/YRTyxBRqvQIJhmVLvA9KLh3ZCv5j6kVsw/KaT2+r1GDl4Men8
	 988a/p9L4qQ3g==
Date: Tue, 17 Jun 2025 14:57:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Adam Xue <zxue@semtech.com>, Thomas Perrot <thomas.perrot@bootlin.com>, 
	Aleksander Morgado <aleksander@aleksander.es>
Cc: manivannan.sadhasivam@linaro.org, slark_xiao@163.com, 
	johan+linaro@kernel.org, quic_vpernami@quicinc.com, tglx@linutronix.de, 
	fabio.porcedda@gmail.com, quic_msarkar@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, imocanu@semtech.com
Subject: Re: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x
 and set MRU to 32768 for better performance.
Message-ID: <gt6uyoohzyjlqsbb4wro7vjsyhgwpvca46ixmivo6ybvmejsc3@nc3syx4lk4t3>
References: <20250528175943.12739-1-zxue@semtech.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528175943.12739-1-zxue@semtech.com>

On Wed, May 28, 2025 at 10:59:43AM -0700, Adam Xue wrote:

+ Thomas and Aleksander (for EM919X related question)

> Add MHI controller config for EM929x. It uses the same configuration
> as EM919x. Also set the MRU to 32768 to improve downlink throughput.
> 

This also affects the EM919X modem. So I want either Thomas or Aleksander to
confirm that it doesn't cause any regression.

Rest looks good to me.

- Mani

> 02:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device 0308
> 	Subsystem: Device 18d7:0301
> 
> Signed-off-by: Adam Xue <zxue@semtech.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 03aa88795209..9bf8e7991745 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -695,6 +695,7 @@ static const struct mhi_pci_dev_info mhi_sierra_em919x_info = {
>  	.config = &modem_sierra_em919x_config,
>  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
>  	.dma_data_width = 32,
> +	.mru_default = 32768,
>  	.sideband_wake = false,
>  };
>  
> @@ -813,6 +814,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  	/* EM919x (sdx55), use the same vid:pid as qcom-sdx55m */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x18d7, 0x0200),
>  		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
> +	/* EM929x (sdx65), use the same configuration as EM919x */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x18d7, 0x0301),
> +		.driver_data = (kernel_ulong_t) &mhi_sierra_em919x_info },
>  	/* Telit FN980 hardware revision v1 */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0306, 0x1C5D, 0x2000),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
> -- 
> 2.45.2
> 
> 
> To view our privacy policy, including the types of personal information we collect, process and share, and the rights and options you have in this respect, see www.semtech.com/legal.

-- 
மணிவண்ணன் சதாசிவம்

