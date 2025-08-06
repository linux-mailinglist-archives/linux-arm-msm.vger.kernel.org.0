Return-Path: <linux-arm-msm+bounces-67942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E30EAB1CAC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 19:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAB96162541
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903EE1E7C03;
	Wed,  6 Aug 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iH0Lum0L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612B9EEA6;
	Wed,  6 Aug 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754501325; cv=none; b=sgTI8sS8EFesAIKPPD/AErB4OhpRwuh7FNBWciSJm4I3wPb+/uJX9KLNyfopzCWoCUd/n99YalOuo0myc8QGxK+W3GP1NFMuzWYxT3UH6n1pWOJuqRejYB+EMDpgDzjfKQKEwq9WNpVZub1Qf6XsQTg5Y8aUZsEYbdtBlK6Rd+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754501325; c=relaxed/simple;
	bh=XOh7ZW934UbNE6R+YKem0b85T3g/dZjtzAE7tD6zXO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BY8zOTueEcecvr633lOmsY+jT0McLR4FjzfmiZ67TikIq15brz5f5yUu1WzI4Wkkc784vNGilTbpPLBE+KKLPTGAibrUBrUtLHXgoV6VxKBSulhNGTVriRw7xSKffUIbpZ5233rqY/71bjVPXv1SMqAKC7014EVLD795mpQ2Eik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iH0Lum0L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06D6DC4CEE7;
	Wed,  6 Aug 2025 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754501324;
	bh=XOh7ZW934UbNE6R+YKem0b85T3g/dZjtzAE7tD6zXO0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iH0Lum0LENw7kN3xt7mfold6zbNxOFFqzvLy9h72OrLAxBXht5FEje6vG0IP2CJc8
	 YmPF7ZpmfWcJlAJN5WFZt2FWCmGwLAumq/6Hwy6B5V8tQN4DjzSZhDRwHhLFpi5pNW
	 GdBr6Bvvw9WMj6h5Cq9/rJghS7sULAKMlP/cotpBwWAIAAtwwq4RiNAZ7FFkLYUDqR
	 TKv+PD21+cYPZYIVWRCiEcCoSCw3HtsAttCTyWdvl/IB2OrWCw7Nk4sFe6YcskEQxp
	 MDIRbVfols+dM8wvpBZYoKuKEDusU+A7fao7i2pjj5FUKj+gXRzdrYd8laqp55oiip
	 hjZejeKa0FuXg==
Date: Wed, 6 Aug 2025 22:58:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH v2 3/5] bus: mhi: host: pci_generic: Remove MHI driver
 and ensure graceful device recovery
Message-ID: <y3bvlfxjo5thagngezv57d5jwe6uwwot2hwqwdne2p6yvogor2@obs4nls47hx3>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-3-4bd862b822e8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-3-4bd862b822e8@quicinc.com>

On Thu, Jul 10, 2025 at 02:28:34PM GMT, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> When the MHI driver is removed from the host side, it is crucial to ensure
> graceful recovery of the device. To achieve this, the host driver will
> perform the following steps:

Please rewrite the description in an imperative tone.

> 
> 1. Disable SRIOV for any SRIOV-enabled devices on the Physical Function.

You haven't enabled SR-IOV at this point, but only in the next patch. So you
need to swap patches 3 and 4.

> 2. Perform a SOC_RESET on Physical Function (PF).
> 
> Disabling SRIOV ensures that all virtual functions are properly shut down,
> preventing any potential issues during the reset process. Performing
> SOC_RESET on each physical function guarantees that the device is fully

Each physical function? How many PF does this device support? It should be
described somewhere on the total PF and VF it supports.

> reset and ready for subsequent operations.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 4bafe93b56c54e2b091786e7fcd68a36c8247b8e..2d1381006293412fbc593316e5c7f0f59ac74da8 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -45,6 +45,8 @@
>   * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>   *		   of inband wake support (such as sdx24)
>   * @no_m3: M3 not supported
> + * @reset_on_driver_unbind: Set true for devices support SOC reset and
> + *				 perform it when unbinding driver

	reset_on_remove: Reset the device while removing the driver

>   */
>  struct mhi_pci_dev_info {
>  	const struct mhi_controller_config *config;
> @@ -58,6 +60,7 @@ struct mhi_pci_dev_info {
>  	unsigned int mru_default;
>  	bool sideband_wake;
>  	bool no_m3;
> +	bool reset_on_driver_unbind;
>  };
>  
>  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -300,6 +303,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>  	.dma_data_width = 32,
>  	.sideband_wake = false,
>  	.no_m3 = true,
> +	.reset_on_driver_unbind = true,
>  };
>  
>  static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
> @@ -970,6 +974,7 @@ struct mhi_pci_device {
>  	struct work_struct recovery_work;
>  	struct timer_list health_check_timer;
>  	unsigned long status;
> +	bool reset_on_driver_unbind;
>  };
>  
>  static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
> @@ -1270,6 +1275,11 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	mhi_cntrl->mru = info->mru_default;
>  	mhi_cntrl->name = info->name;
>  
> +	/* Assign reset functionalities only for PF */

Remove the comment.

> +	if (pdev->is_physfn)
> +		mhi_pdev->reset_on_driver_unbind = info->reset_on_driver_unbind;
> +
> +

Extra newline.

>  	if (info->edl_trigger)
>  		mhi_cntrl->edl_trigger = mhi_pci_generic_edl_trigger;
>  
> @@ -1336,7 +1346,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	return err;
>  }
>  
> -static void mhi_pci_remove(struct pci_dev *pdev)
> +static void mhi_pci_resource_deinit(struct pci_dev *pdev)

Please do not create unsymmetric functions. There is no mhi_pci_resource_init().

>  {
>  	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
>  	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> @@ -1352,6 +1362,20 @@ static void mhi_pci_remove(struct pci_dev *pdev)
>  	/* balancing probe put_noidle */
>  	if (pci_pme_capable(pdev, PCI_D3hot))
>  		pm_runtime_get_noresume(&pdev->dev);
> +}
> +
> +static void mhi_pci_remove(struct pci_dev *pdev)
> +{
> +	struct mhi_pci_device *mhi_pdev = pci_get_drvdata(pdev);
> +	struct mhi_controller *mhi_cntrl = &mhi_pdev->mhi_cntrl;
> +
> +	/* Disable SRIOV */

This one too.

> +	pci_disable_sriov(pdev);
> +	mhi_pci_resource_deinit(pdev);
> +	if (mhi_pdev->reset_on_driver_unbind) {
> +		dev_info(&pdev->dev, "perform SOC reset\n");

This is just a spam, please drop.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

