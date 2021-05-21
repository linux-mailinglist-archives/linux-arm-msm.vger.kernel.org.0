Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D78538C796
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 May 2021 15:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231447AbhEUNQa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 May 2021 09:16:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230408AbhEUNQ3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 May 2021 09:16:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE0D861244;
        Fri, 21 May 2021 13:15:03 +0000 (UTC)
Date:   Fri, 21 May 2021 18:44:57 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v2] bus: mhi: core: Improve debug messages for power up
Message-ID: <20210521131457.GG70095@thinkpad>
References: <1620072038-36160-1-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620072038-36160-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 03, 2021 at 01:00:38PM -0700, Bhaumik Bhatt wrote:
> Improve error message to be more descriptive if a failure occurs
> with an invalid power up execution environment. Additionally, add
> a debug log to print the execution environment and MHI state
> before a power up is attempted to confirm if the device is in an
> expected state. This helps clarify reasons for power up failures
> such as the device being found in a PBL or Emergency Download
> Mode execution environment and the host expected a full power up
> with Pass-Through and no image loading involved.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> v2: Use power up instead of power on and update commit text with an example.
> 
>  drivers/bus/mhi/core/pm.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
> index adf426c..f4a8b9a 100644
> --- a/drivers/bus/mhi/core/pm.c
> +++ b/drivers/bus/mhi/core/pm.c
> @@ -1076,12 +1076,16 @@ int mhi_async_power_up(struct mhi_controller *mhi_cntrl)
>  
>  	/* Confirm that the device is in valid exec env */
>  	if (!MHI_IN_PBL(current_ee) && current_ee != MHI_EE_AMSS) {
> -		dev_err(dev, "Not a valid EE for power on\n");
> +		dev_err(dev, "%s is not a valid EE for power on\n",
> +			TO_MHI_EXEC_STR(current_ee));
>  		ret = -EIO;
>  		goto error_async_power_up;
>  	}
>  
>  	state = mhi_get_mhi_state(mhi_cntrl);
> +	dev_dbg(dev, "Attempting power on with EE: %s, state: %s\n",
> +		TO_MHI_EXEC_STR(current_ee), TO_MHI_STATE_STR(state));
> +
>  	if (state == MHI_STATE_SYS_ERR) {
>  		mhi_set_mhi_state(mhi_cntrl, MHI_STATE_RESET);
>  		ret = wait_event_timeout(mhi_cntrl->state_event,
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
