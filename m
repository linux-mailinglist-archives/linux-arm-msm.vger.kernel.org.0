Return-Path: <linux-arm-msm+bounces-72311-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09874B45B4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 16:59:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B5F3BB565
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F0B936CDE2;
	Fri,  5 Sep 2025 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q+Ll0mWo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4EB2F7AB0;
	Fri,  5 Sep 2025 14:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084191; cv=none; b=N9gNFx0cOAbnlKp+2JJVtYSuGfPlBO6ngpcBW593BGTMesVpHnHzW8QGh9HvnQCovG6d8XXwobNIGr5PLmn0puJ48mMkpL3q+L/ouEJPYNhr9s3Q+EaMd3ZeZkfjBxc5NPCv0+0UNE264XFgkbYNK9weVDdxLFV/1VGz3VeckPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084191; c=relaxed/simple;
	bh=jmmqgMUirtfYeSXPXqYQ0yzKkKVEp3WxOphifTvxL60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOLdWi46GDrWNH3u07HpPlucj1ZY0IXfLzvuMKW/nfRnFZBihpe4J8onlsu6vYgEV1rWph63kMvPvr3Bgpvb42CKZCZ3njqOxDNgNdB/59whggy0+hPfWHb4eEtolDmm+CmxsZx9QCdY+EU47phc43US2SrNxdeDJvoSjb+mzmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q+Ll0mWo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1AC0C4CEF1;
	Fri,  5 Sep 2025 14:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757084190;
	bh=jmmqgMUirtfYeSXPXqYQ0yzKkKVEp3WxOphifTvxL60=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q+Ll0mWoVCfGIsJnW26P6Xd9tnA5QcSS7qpAw2XV503fsq1NhlE6rYDgRSNlFE0XA
	 y9Z+l6ZzX5QSbixMaGvsYkvLUL2zSoBA+0/RrY1O0j60pA/BLs8iOxI8WNuz5IHrEQ
	 97MUu+CT0zt8QZcC+/bSOOkq0NKZKKIbFOFgYvPD2mLi/n7OQF8gwpaR8kc95LgHdR
	 /phaM2LneM141rLNoBNFbCJPZAPh/pida569RKSDKppGVYsB6tyVVqILZrFNGl/uTv
	 GyYtIA4dx/qcCwC9X81ggk+C9uVsVJTzU12Gb5cv9XX6qCTUwxYoYdWu/uTC8Onr/u
	 VnR5toe309Jjw==
Date: Fri, 5 Sep 2025 20:26:24 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vivek.Pernamitta@quicinc.com
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vivek Pernamitta <quic_vpernami@quicinc.com>
Subject: Re: [PATCH v3 4/6] bus: mhi: host: pci_generic: Remove MHI driver
 and ensure graceful device recovery
Message-ID: <e5nhd5hgu7peewiaxn6wdjlopaixntgu7zc6d7twhjgglt46rh@hymyien7z5wy>
References: <20250821-vdev_next-20250821_sriov-v3-0-e1b017c48d4a@quicinc.com>
 <20250821-vdev_next-20250821_sriov-v3-4-e1b017c48d4a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250821-vdev_next-20250821_sriov-v3-4-e1b017c48d4a@quicinc.com>

On Thu, Aug 21, 2025 at 06:25:36PM GMT, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> So, When the MHI driver is removed from the host side, it is essential to
> ensure a clean and stable recovery of the device.

You need to mention why it is essential. What will happen otherwise.

> This commit introduces
> the following steps to achieve that:
> 
> 1. Disable SR-IOV for any SR-IOV-enabled devices on the Physical Function.
> 2. Perform a SOC_RESET on the PF to fully reset the device.
> 
> Disabling SR-IOV ensures all Virtual Functions (VFs) are properly shutdown,
> preventing issues during the reset process. The SOC_RESET guarantees that
> the PF is restored to a known good state.
> 

Again, no reasoning was provided why this is necessary.

> Note:
> - The QDU100 platform supports 1 PF and 16 VFs.
> - QDU100 does not support Function Level Reset (FLR) due to a hardware
>   limitation. As a result, SOC_RESET is used to reset the device.
> - On QDU100, any VF failure can cause the entire endpoint (EP)
>   to go down, making this recovery mechanism critical.
> 

This comment about QDU100 doesn't belong to this patch as this patch is not at
all related to QDU100.

> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 351b177cdf84057fb5a4e2f5b52279d7f1da41c2..f922cca0ab633aeae942587f0c40038342ce9c33 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -45,6 +45,8 @@
>   * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>   *		   of inband wake support (such as sdx24)
>   * @no_m3: M3 not supported
> + * @reset_on_remove: Set true for devices support SOC reset and perform it
> + *		     while drivee remove

driver

Maybe reword it to:

	'Set true for devices that require SoC during driver removal'

>   */
>  struct mhi_pci_dev_info {
>  	const struct mhi_controller_config *config;
> @@ -58,6 +60,7 @@ struct mhi_pci_dev_info {
>  	unsigned int mru_default;
>  	bool sideband_wake;
>  	bool no_m3;
> +	bool reset_on_remove;
>  };
>  
>  #define MHI_CHANNEL_CONFIG_UL(ch_num, ch_name, el_count, ev_ring) \
> @@ -300,6 +303,7 @@ static const struct mhi_pci_dev_info mhi_qcom_qdu100_info = {
>  	.dma_data_width = 32,
>  	.sideband_wake = false,
>  	.no_m3 = true,
> +	.reset_on_remove = true,
>  };
>  
>  static const struct mhi_channel_config mhi_qcom_sa8775p_channels[] = {
> @@ -1039,6 +1043,7 @@ struct mhi_pci_device {
>  	struct work_struct recovery_work;
>  	struct timer_list health_check_timer;
>  	unsigned long status;
> +	bool reset_on_remove;
>  };
>  
>  static int mhi_pci_read_reg(struct mhi_controller *mhi_cntrl,
> @@ -1323,7 +1328,6 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	else
>  		mhi_cntrl_config = info->config;
>  
> -	/* Initialize health check monitor only for Physical functions */

Spurious change?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

