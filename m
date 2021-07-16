Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411E43CB200
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jul 2021 07:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbhGPFpM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jul 2021 01:45:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:35384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230024AbhGPFpL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jul 2021 01:45:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6654F613DF;
        Fri, 16 Jul 2021 05:42:15 +0000 (UTC)
Date:   Fri, 16 Jul 2021 11:12:11 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        quic_jhugo@quicinc.com, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v1 1/2] bus: mhi: core: Read serial number during
 pre-powerup phase
Message-ID: <20210716054211.GC3323@workstation>
References: <1626395276-24171-1-git-send-email-bbhatt@codeaurora.org>
 <1626395276-24171-2-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1626395276-24171-2-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 15, 2021 at 05:27:55PM -0700, Bhaumik Bhatt wrote:
> In some cases, device may boot straight to the mission mode
> execution environment and skip the PBL transition or firmware
> load procedure. Serial number and OEM PK hash values would remain
> unpopulated in those scenarios. Move the reads for those to the
> power up preparation phase such that controllers always have them
> populated.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/boot.c | 17 +----------------
>  drivers/bus/mhi/core/init.c | 17 ++++++++++++++++-
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 8100cf5..213307ab 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -394,28 +394,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>  	void *buf;
>  	dma_addr_t dma_addr;
>  	size_t size;
> -	int i, ret;
> +	int ret;
>  
>  	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)) {
>  		dev_err(dev, "Device MHI is not in valid state\n");
>  		return;
>  	}
>  
> -	/* save hardware info from BHI */
> -	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_SERIALNU,
> -			   &mhi_cntrl->serial_number);
> -	if (ret)
> -		dev_err(dev, "Could not capture serial number via BHI\n");
> -
> -	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++) {
> -		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i),
> -				   &mhi_cntrl->oem_pk_hash[i]);
> -		if (ret) {
> -			dev_err(dev, "Could not capture OEM PK HASH via BHI\n");
> -			break;
> -		}
> -	}
> -
>  	/* wait for ready on pass through or any other execution environment */
>  	if (mhi_cntrl->ee != MHI_EE_EDL && mhi_cntrl->ee != MHI_EE_PBL)
>  		goto fw_load_ready_state;
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index aeb1e3c..8b4336e 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -1065,7 +1065,7 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  {
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>  	u32 bhi_off, bhie_off;
> -	int ret;
> +	int i, ret;
>  
>  	mutex_lock(&mhi_cntrl->pm_mutex);
>  
> @@ -1124,6 +1124,21 @@ int mhi_prepare_for_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	mutex_unlock(&mhi_cntrl->pm_mutex);
>  
> +	/* save hardware info from BHI */
> +	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_SERIALNU,
> +			   &mhi_cntrl->serial_number);
> +	if (ret)
> +		dev_err(dev, "Could not capture serial number via BHI\n");
> +
> +	for (i = 0; i < ARRAY_SIZE(mhi_cntrl->oem_pk_hash); i++) {
> +		ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->bhi, BHI_OEMPKHASH(i),
> +				   &mhi_cntrl->oem_pk_hash[i]);
> +		if (ret) {
> +			dev_err(dev, "Could not capture OEM PK HASH via BHI\n");
> +			break;
> +		}
> +	}
> +
>  	return 0;
>  
>  error_reg_offset:
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
