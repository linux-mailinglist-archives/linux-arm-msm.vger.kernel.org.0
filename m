Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E829C1CA3A3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 08:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725897AbgEHGNr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 02:13:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:46778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725896AbgEHGNr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 02:13:47 -0400
Received: from Mani-XPS-13-9360 (unknown [157.50.45.37])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D859D20725;
        Fri,  8 May 2020 06:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588918427;
        bh=uCwWcJtdd6frbTmuQHsfeyWV4UFkvt8omeOoYW4xCgo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LG3tfk9mmM/1S/YbIMZGdW6aCFUXl9zNJJG276APD1xb9AO8nNU+P/HZzdGs1yiTI
         7lNK31RSFKqgSbBBAtzao9Tgv6yaS7BIFJho+Q3xaTgK1SkzXfcWnVZU8Js6et5jn1
         8nsBxjciu3v7wBG3lcCndg1Xdr3FPGJ/e3nhsdpI=
Date:   Fri, 8 May 2020 11:43:37 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        hemantk@codeaurora.org, jhugo@codeaurora.org
Subject: Re: [PATCH v6 6/8] bus: mhi: core: Return appropriate error codes
 for AMSS load failure
Message-ID: <20200508061337.GB2696@Mani-XPS-13-9360>
References: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
 <1588718832-4891-7-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1588718832-4891-7-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 05, 2020 at 03:47:10PM -0700, Bhaumik Bhatt wrote:
> When loading AMSS firmware using BHIe protocol, return -ETIMEDOUT if no
> response is received within the timeout or return -EIO in case of a
> protocol returned failure or an MHI error state.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/bus/mhi/core/boot.c | 23 ++++++++++++-----------
>  1 file changed, 12 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/boot.c b/drivers/bus/mhi/core/boot.c
> index 17c636b..05627fe 100644
> --- a/drivers/bus/mhi/core/boot.c
> +++ b/drivers/bus/mhi/core/boot.c
> @@ -176,6 +176,7 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
>  	void __iomem *base = mhi_cntrl->bhie;
>  	rwlock_t *pm_lock = &mhi_cntrl->pm_lock;
>  	u32 tx_status, sequence_id;
> +	int ret;
>  
>  	read_lock_bh(pm_lock);
>  	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> @@ -198,19 +199,19 @@ static int mhi_fw_load_amss(struct mhi_controller *mhi_cntrl,
>  	read_unlock_bh(pm_lock);
>  
>  	/* Wait for the image download to complete */
> -	wait_event_timeout(mhi_cntrl->state_event,
> -			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
> -			   mhi_read_reg_field(mhi_cntrl, base,
> -					      BHIE_TXVECSTATUS_OFFS,
> -					      BHIE_TXVECSTATUS_STATUS_BMSK,
> -					      BHIE_TXVECSTATUS_STATUS_SHFT,
> -					      &tx_status) || tx_status,
> -			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
> -
> -	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state))
> +	ret = wait_event_timeout(mhi_cntrl->state_event,
> +				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
> +				 mhi_read_reg_field(mhi_cntrl, base,
> +						    BHIE_TXVECSTATUS_OFFS,
> +						   BHIE_TXVECSTATUS_STATUS_BMSK,
> +						   BHIE_TXVECSTATUS_STATUS_SHFT,

If you want to prevent some parameters to be within 80 characters that is fine
but do it for all to look uniform:

                              mhi_read_reg_field(mhi_cntrl, base,
                                                BHIE_TXVECSTATUS_OFFS,
                                                BHIE_TXVECSTATUS_STATUS_BMSK,
                                                BHIE_TXVECSTATUS_STATUS_SHFT,
						&tx_status) || tx_status,

Thanks,
Mani

> +						    &tx_status) || tx_status,
> +				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
> +	if (MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state) ||
> +	    tx_status != BHIE_TXVECSTATUS_STATUS_XFER_COMPL)
>  		return -EIO;
>  
> -	return (tx_status == BHIE_TXVECSTATUS_STATUS_XFER_COMPL) ? 0 : -EIO;
> +	return (!ret) ? -ETIMEDOUT : 0;
>  }
>  
>  static int mhi_fw_load_sbl(struct mhi_controller *mhi_cntrl,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
