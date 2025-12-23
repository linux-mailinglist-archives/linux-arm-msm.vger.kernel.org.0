Return-Path: <linux-arm-msm+bounces-86330-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D48CD912B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 12:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9E6683053FF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 11:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAF6330B21;
	Tue, 23 Dec 2025 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQye61fF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA7621CC60;
	Tue, 23 Dec 2025 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488557; cv=none; b=ULeRpfunvXNxR3Sp99qvP6W4afRHes1LY789PcERjiEalP77wgQTyKAhHKH2p0ulQhfBo1CmZluCBkYnoTtFBa6jqY7CNxnyKfMw7a2SXTpH6AJUFhPImVLcnEQ8vUI1FV5ye8GtJWlhKiDwAuSvesaZ9zD/V8RhKpdluVHDGZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488557; c=relaxed/simple;
	bh=yg2XBuxio3NdjvzsR7xyhB3pXuYvprrc2g9whxOt3lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eljplHDW9cW6JTKdy/tFtr65ZeAN2g3WkzfuOYYdDIzNke30b+sNjn4AinBSfqBqyRe7Iv9fGmJac/ZxgWlnDHU89WYXEvLqZP8qvsVKTbYl+vIhweQ5efFDhc8U7R7dCeRaNAxIrVlbCaZzyALgru5569vMCkalucij12PVkoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQye61fF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EFAEC116C6;
	Tue, 23 Dec 2025 11:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766488557;
	bh=yg2XBuxio3NdjvzsR7xyhB3pXuYvprrc2g9whxOt3lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQye61fFgmmofxLd0MnSL8+od9VGZfFqMaT2QD3bMWxcrbF9X4g5QjoKDvaWXrFOz
	 xo7jHyesX7tDIc7xV3GKzBQlVE5o5ajQmfs+f/roZgQkxvOuuzIhK9iCm0U7afdcve
	 y6+fe+PEfCBQKQxPWi56x3VzYeH7KKrIDQnDMEh3mtPKRB7Z6XHq0SbfZN8zwPrax2
	 bSOVblKhrK7NRpXYnx35EES5JrspRxsNoE10sRNYJjkvqBEtJlyYiwfHPzsjKqUw/F
	 AWj+j1FBVccOfgJFrnZ87BN47MhjFrz7DJy8244w2gVDegbI0yy9cvw2veY3Z1sAz7
	 IDRotXwNSZ/mQ==
Date: Tue, 23 Dec 2025 16:45:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mayank Rana <mayank.rana@oss.qualcomm.com>, 
	Baochen Qiang <quic_bqiang@quicinc.com>
Subject: Re: [PATCH v4] mhi: host: Add support for dual ELF image format
Message-ID: <a5obqgu6swi7eq2j2n2655twn4aw2muzkrr5txmbg2qdfzs36y@7v6maj5pdw6c>
References: <20251223-wlan_image_load_skip_512k-v4-1-a00234a6c578@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251223-wlan_image_load_skip_512k-v4-1-a00234a6c578@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 01:16:46AM -0800, Qiang Yu wrote:
> From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> 
> Currently, the FBC image contains a single ELF header followed by segments
> for both SBL and WLAN FW. However, TME-L (Trust Management Engine Lite)
> supported devices (e.g., QCC2072) require separate ELF headers for SBL and
> WLAN FW segments due to TME-L image authentication requirements.
> 
> Current image format contains two sections in a single binary:
> - First 512KB: ELF header + SBL segments
> - Remaining: WLAN FW segments (raw data)
> 
> The TME-L supported image format contains two complete ELF files in a
> single binary:
> - First 512KB: Complete SBL ELF file (ELF header + SBL segments)
> - Remaining: Complete WLAN FW ELF file (ELF header + WLAN FW segments)
> 
> Download behavior:
> - Legacy: 1. First 512KB via BHI (ELF header + SBL)
>           2. Full image via BHIe
> 
> - TME-L: 1. First 512KB via BHI (SBL ELF file)
>          2. Remaining via BHIe (WLAN FW ELF file only)
> 
> Add runtime detection to automatically identify the image format by
> checking for the presence of a second ELF header at the 512KB boundary.
> When detected, MHI skips the first 512KB during WLAN FW download over BHIe
> as it is loaded in BHI phase.
> 
> Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

This version is not anyway close to the previous one. So all the tags from
Mayank and Baochen are irrelevant.

- Mani

> ---
> Changes in v4:
> - Detect image format runtime by checking second ELF header instead of using a flag.
> - Link to v3: https://lore.kernel.org/r/20251201-wlan_image_load_skip_512k-v3-1-bedb5498a58a@oss.qualcomm.com
> 
> Changes in v3:
> - Reword commit message.
> - Reword comments of standard_elf_image flag
> - Add reviewed-by tag.
> - Link to v2: https://lore.kernel.org/mhi/20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com/
> 
> Changes in v2:
> - V1 patch is paused because of no user. WLAN team plan to add support for
>   new WLAN chip that requires this patch, so send v2.
> - Change author and SOB with new mail address.
> - Reword commit message.
> - Place standard_elf_image flag after wake_set in struct mhi_controller
> - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> ---
>  drivers/bus/mhi/host/boot.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index 205d83ac069f15a19ab2d66a63692e5d60334d4c..6ba0f16854d3a839e987f19d782600467b5f9836 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -584,6 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	 * device transitioning into MHI READY state
>  	 */
>  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> +
> +		/*
> +		 * Some FW combine two separate ELF images (SBL + WLAN FW) in a single
> +		 * file. Hence, check for the existence of the second ELF header after
> +		 * SBL. If present, load the second image separately.
> +		 */
> +		if (!memcmp(fw_data + mhi_cntrl->sbl_size, ELFMAG, SELFMAG)) {
> +			fw_data += mhi_cntrl->sbl_size;
> +			fw_sz -= mhi_cntrl->sbl_size;
> +		}
> +
>  		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
>  		if (ret) {
>  			release_firmware(firmware);
> 
> ---
> base-commit: ac35e04f8000aaaf98635792464647e7a6f3422e
> change-id: 20251129-wlan_image_load_skip_512k-ddcfe49db8e3
> 
> Best regards,
> -- 
> Qiang Yu <qiang.yu@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

