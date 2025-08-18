Return-Path: <linux-arm-msm+bounces-69502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A750B29BE5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 10:22:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE94F188C069
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 08:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E1302FF15D;
	Mon, 18 Aug 2025 08:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMNyz7XX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65012C17B2;
	Mon, 18 Aug 2025 08:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505183; cv=none; b=ib3dv6M41wu2e2mneQqKlbzwQ21Y944I5lCzhs5gh8w9WdeWxrCW5uSPqE6ohqVBoh+zm12pzB3rmlU3ls5bDCFmhO5eRRuRmLFZkTYeGHdj9b+PJo1otkwQcO4/t4NFXjTVumVC23P5TQW+z/wNLHeU3yH/6CTl59qoqnI/z1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505183; c=relaxed/simple;
	bh=qs1FyK4l3M8bvkPrN9EVnJA8GJp/pj19Ib9fWjdBj8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B/O3RXnG2VjAbrcxvtrQbu3dWl7B7QlPjoK52JCrU/ZBIAcE+V3eG+g0OUDwqjKKdqD0HrFrmiKZqRx+lGmQ4qLQ1PhwtivhONzxGVkqBBhqHJyxXodwBzrkmsTRLC9N2G5M+9aUTrZtMbczQMaP1Kwi42GnPJ0YtM//zwwzu30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMNyz7XX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D84C4CEEB;
	Mon, 18 Aug 2025 08:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755505182;
	bh=qs1FyK4l3M8bvkPrN9EVnJA8GJp/pj19Ib9fWjdBj8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IMNyz7XXaT1daLXIB1nZiQ96Fc4riXu3aj6QRLeUVh82i6nXiLZoWEHE+Dq+28b0P
	 VZjIuK0LIOXl5nR3wc0gaWWSVrJyOAw5Odex1qHz9lNk501F2MOusWz/PGYX/if6Oj
	 Zm+H8f2BnCdFuo1QYiFGAdOmX6moMI4VsUStUh6noWFLyrgMNwxI8NH2sfMY/jM7uj
	 CuKlaMyWKKEEQEW9YziN1xBg8JmcAfSY0IrwekwS1zjD0L2S6+jOkm82tDxJuPsBao
	 l1JVnPopp5OGNg/h0z0zhQlG5zFFVm5Qrj+mn3toQtSZNkQ2Dgp71DZ25Y9DqgwtKw
	 csJQM7IrxGwLw==
Date: Mon, 18 Aug 2025 13:49:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Michael Fritscher <michael@fritscher.net>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, duke_xinanwen@163.com
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add Quectel RM520N-GLAP to
 pci id table
Message-ID: <7fsulhs6l5j7gg4oy3hww6xpg5rlq7msxfixpa3zbsd4ejmymw@dk67avi3vn6i>
References: <20250729-add-rm520n-glap-support-v1-1-736ee6bbb385@fritscher.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250729-add-rm520n-glap-support-v1-1-736ee6bbb385@fritscher.net>

+ Duke Xin

On Tue, Jul 29, 2025 at 01:37:51PM GMT, Michael Fritscher wrote:
> Quectel RM520N-GLAP is a variant of Quectel RM520N-GLAA with fused out USB.
> Add its PCI vendor and product id to the list to use the right dev info.
> 
> Signed-off-by: Michael Fritscher <michael@fritscher.net>
> ---
> This series add support for the Quectel RM520N-GLAP, which uses a
> Qualcomm PCI Vendor ID. Origin is linked at the end. After this it is
> found as
> 
> MHI PCI device found: quectel-rm5xx
> 
> and works.
> 

This looks similar to another issue that is being discussed here:
https://lore.kernel.org/mhi/ywase3lkm5iimrzyin5grb3hr36zedsvzs3p2z6z2q6532g3cq@25ibqnpmanvo/

These Quectel modems are reusing the QCOM Vendor IDs and ends up causing
trouble. We need to hear from Quectel on why this happens and how they want
these modems to be supported in mainline.

- Mani

> Link: https://forum.gl-inet.com/t/how-to-installing-vanilla-openwrt-on-gl-x3000/45404/15
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 589cb6722316..3f3212dda5bb 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -857,6 +857,9 @@ static const struct pci_device_id mhi_pci_id_table[] = {
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn980_hw_v1_info },
>  	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x0306),
>  		.driver_data = (kernel_ulong_t) &mhi_qcom_sdx55_info },
> +	/* RM520N-GL variant with Qualcomm vendor and subvendor ID */
> +	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, PCI_VENDOR_ID_QCOM, 0x5201),
> +		.driver_data = (kernel_ulong_t) &mhi_quectel_rm5xx_info },
>  	/* Telit FN990 */
>  	{ PCI_DEVICE_SUB(PCI_VENDOR_ID_QCOM, 0x0308, 0x1c5d, 0x2010),
>  		.driver_data = (kernel_ulong_t) &mhi_telit_fn990_info },
> 
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250729-add-rm520n-glap-support-8add91648721
> 
> Best regards,
> -- 
> Michael Fritscher <michael@fritscher.net>
> 

-- 
மணிவண்ணன் சதாசிவம்

