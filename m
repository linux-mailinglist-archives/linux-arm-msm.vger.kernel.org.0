Return-Path: <linux-arm-msm+bounces-72308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94370B45AEC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5802E5C6937
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99FE224893;
	Fri,  5 Sep 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gd1A+B3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A4BA72633;
	Fri,  5 Sep 2025 14:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757083829; cv=none; b=lhda+9dS10tGO/xEnlZxli9kMG5Gt5HvewAq0k17YTCUh0OlzXQs3DWLq4Cwas1hd0W+Ox+H83NecUZHEpwIHk5374Cvn+n+794hSSfBRrRBtLjdVDwQHHO87DynW+n17YS8ucitOKDs4xeUimalzprzE9lmH/WPSC7BLo3reVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757083829; c=relaxed/simple;
	bh=kAE7QMSgWPymSsX1fjbsvGtqxOjnWRpw6DKbmB/TdOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/Xr6Iunjtwf0O9iXgaM3htX5eCLtgCaueNK9SSmRUOaY8L6FUjoazw9SQDY55pfJaxinKE/WO7gql9HKTQ8DVVHZuCMT1MaktD7fbbNdM98gmm0tAh0AqTr2qtxT3IVVHG8Om9dqVnGN9AdfhPifqNlb2DxdgDr36d1oiNS1ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gd1A+B3I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E288EC4CEF1;
	Fri,  5 Sep 2025 14:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757083829;
	bh=kAE7QMSgWPymSsX1fjbsvGtqxOjnWRpw6DKbmB/TdOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gd1A+B3II800+S6KrdudhsHu/8nCWr/I9lD40r1/Pv6ebIXtdQJJ48Hznlx3caoPV
	 L14dPWA0B5edbkwj7TQ94IZhmf7c8SUqRlk3CG4St9FL/SkG/LiUPjv0tNi4rXeWMK
	 /PsRbgBrySslF7guI39oipty+5zyyqX5hgyvdEXaQhDdCpAlnSuB2BKocmczh2PGoj
	 KbgEef3Z1Vg2vFQm93fsKsbvZaB7GPNh/ZXdAvXfPurCTvEQP1t+1hRZl8kmGL7az2
	 POpbglO3f4GMd8dIdC9g58gtL8D5oHvM2q3MH3OhJU42rp3RLEwFVROznHavXJt7zg
	 7RxOoFmDJ2mtw==
Date: Fri, 5 Sep 2025 20:20:22 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/6] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
Message-ID: <elqkwbuht6jimwdqtc26casnvkpoofrni5jsdg3vy2fjsz7h5f@zcnl42wj3g5q>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
 <20250821-vdev_next-20250821_sriov-v3-2-e1b017c48d4a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-2-e1b017c48d4a@quicinc.com>

On Thu, Aug 21, 2025 at 06:25:34PM GMT, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> - In SR-IOV enabled devices, the VF DEVICE/VENDOR ID register returns
>   FFFFh when read (as per PCIe SR-IOV spec section 3.4.1.1).
> - To determine device activity, read the PCIe VENDOR_ID of the Physical
>   Function (PF) instead.
> - Disabled health check monitoring for Virtual Functions (VFs), as they
>   are not physical functions and lack direct hardware control.
> - This avoids unnecessary CPU cycles consumed by VF health checks, which
>   are unintended and non-functional.
> 

Reword the description in imperative mood and try to come up with a paragraph
with continuity instead of points.

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 35 ++++++++++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 2967ed4cec29d1c1eeb581ed44cf9afcea90f533..df18627a9feb4f2d53ba1ca6a4e8087dc23c7873 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1094,8 +1094,7 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>  	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>  	u16 vendor = 0;
>  
> -	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
> -		return false;
> +	pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor);

You removed the return value check. Was that intentional?

>  
>  	if (vendor == (u16) ~0 || vendor == 0)
>  		return false;
> @@ -1205,7 +1204,9 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>  
>  	dev_warn(&pdev->dev, "device recovery started\n");
>  
> -	timer_delete(&mhi_pdev->health_check_timer);
> +	if (pdev->is_physfn)
> +		timer_delete(&mhi_pdev->health_check_timer);

I really hate these if () checks everywhere. So I came up with the below macro:

	#define mhi_timer(pdev, timer_func, ...) \
		do { if (pdev->is_physfn) timer_func(__VA_ARGS__); } while(0)

	mhi_timer(pdev, timer_delete, &mhi_pdev->health_check_timer);

But mhi_timer() provides no information on what the macro is supposed to do and
I cannot think of a better name.

So maybe we have to live with the if () checks.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

