Return-Path: <linux-arm-msm+bounces-67937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 65603B1CA32
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 19:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900DB56575F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAFEA29B237;
	Wed,  6 Aug 2025 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5FinJSL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEECE29B200;
	Wed,  6 Aug 2025 17:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754499604; cv=none; b=fbwTZoCQRFEB0bYdEO2LjeO/uGTHx34tZjDbUQAssieW1dcNCsaXxDcJ6rT7gKCjRl5Pbvn3KbcoN/m/ElZ4e3J/Yp5y3gwGCUEfgiZVpSXlADUvqCfsEDx9lvOKCeOnG6ePqFrkr9+sWsBAAUTMABWKPyHDEMNcIKPQA3jX8ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754499604; c=relaxed/simple;
	bh=ZZXZYieQ3h8L7ACbGMQlKhLS4SHt2CvV4GaanagYHTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D/lhpe38yZZpAJfdeWJBEjOtUU6igNJd4PEkZvNH45Aqj+aejkMdUKJTvqO3rFphmtc+1InS1rwhl0Oq0HjUXzgjeEaSShQxq0om7V/pczrnthE35bATyfS3fI7ChIIA4NwThfmU2uAoeSb5DW15+v0tHVktmVTrVmTx0WPWyrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5FinJSL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0483DC4CEE7;
	Wed,  6 Aug 2025 17:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754499604;
	bh=ZZXZYieQ3h8L7ACbGMQlKhLS4SHt2CvV4GaanagYHTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H5FinJSLjKsHuvXXb7Hr4xhxjeoj1/dVxDxvRBNbnt+ashNuP1F7H/7PKGMmCLI9B
	 mtObvEu6gmRRiAhJZVOy8tieEv28y4BJJaqNgwTYo6CT/RgoxRw7NPqZjr3ohdKA4I
	 FrjN0/j+oTw/DCPtO+QIUTQuBm7sTkdk8mxMQds/IRQpNTu1dCu+BKNXSUu2nK3A4S
	 da9WNWy3qbw0v9DwYGgJkCiACnQVXEp+hITXnv7bTD+zhcmoyuKmectnPohkQ5+1XM
	 H2+m6Gd6lLsr5CD84cDKyKMaNEURpmT5kKgQOPnF1aPvIxpOxAwgc84MfeTE19qtBM
	 6QFWOo9UxuS+g==
Date: Wed, 6 Aug 2025 22:29:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/5] bus: mhi: host: pci_generic: Read
 SUBSYSTEM_VENDOR_ID for VF's to check status
Message-ID: <luaoyvwqp3fpvqgybhstnnrutn46ry3tyfxw2launvnxzfvyqo@pdfdpfocfq6k>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-2-4bd862b822e8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-2-4bd862b822e8@quicinc.com>

On Thu, Jul 10, 2025 at 02:28:33PM GMT, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> In SRIOV enabled devices, the VF DEVICE/VENDOR ID register returns FFFFh
> when read (PCIe SRIOV spec-3.4.1.1). Therefore, read the PCIe
> SUBSYSTEM_VENDOR_ID to check if the device is active.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 7d0ac1c34ddf95ace2a85e5f08884f51604d9b0f..4bafe93b56c54e2b091786e7fcd68a36c8247b8e 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1025,8 +1025,10 @@ static bool mhi_pci_is_alive(struct mhi_controller *mhi_cntrl)
>  	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>  	u16 vendor = 0;
>  
> -	if (pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor))
> -		return false;
> +	if (pdev->is_virtfn)
> +		pci_read_config_word(pdev, PCI_SUBSYSTEM_VENDOR_ID, &vendor);
> +	else
> +		pci_read_config_word(pdev, PCI_VENDOR_ID, &vendor);

You should not read the sub Vendor ID for VF. PCIe spec suggests reading the PF
Vendor ID for VF. So you should just use pci_physfn() API as below:

	pci_read_config_word(pci_physfn(pdev), PCI_VENDOR_ID, &vendor);

This will work for both PF and VF.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

