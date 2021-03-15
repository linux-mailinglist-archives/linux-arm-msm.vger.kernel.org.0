Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 410DD33AA3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 05:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229735AbhCOEFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 00:05:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229722AbhCOEFl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 00:05:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09D9264E3F;
        Mon, 15 Mar 2021 04:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615781141;
        bh=NP4gX/7kY+mDxqIuuLyrMr0pZfLGy0RRE6/sizVfms4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o3Y7UQUZ/eWfoTaZNvFTr4Xlxn2IuWHlKBoJ62A6m6BljT6aedAKDvA+Pq65IS5+D
         2L18FsDgWD0RsGXZlxb4QCbVeCs9QnZcbllKinIt0I1Elrt4UYy9BW6xUx+2aThgcU
         1DbJyVUZUNsql8I3vMt+c7lBD/zuuNTV03HXGe58wjPpwbPXdvIWFOqgZTFwHFsx8f
         7y9a73WHpFTpEKq4CrfQYH+mytW+J1y5T04PZH68GzXRMUj7cVF474tT1ZrpFbrOKd
         SXt4dTAbt1fDoRulWckkmRK4espBo2TlvO2momk7bBPv4XBH8bedBViasTVLcCIlCf
         /0ASQqVea+vOw==
Date:   Mon, 15 Mar 2021 09:35:34 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Colin King <colin.king@canonical.com>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] bus: mhi: core: remove redundant initialization of
 variables state and ee
Message-ID: <20210315040534.GA80095@thinkpad>
References: <20210311111727.8433-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311111727.8433-1-colin.king@canonical.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Mar 11, 2021 at 11:17:27AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variables state and ee are being initialized with values that
> are never read and are being updated later with a new values. The
> initializations are redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2c61dfd01353..3faf8bade520 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -428,9 +428,9 @@ irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>  {
>  	struct mhi_controller *mhi_cntrl = priv;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> -	enum mhi_state state = MHI_STATE_MAX;
> +	enum mhi_state state;
>  	enum mhi_pm_state pm_state = 0;
> -	enum mhi_ee_type ee = MHI_EE_MAX;
> +	enum mhi_ee_type ee;
>  
>  	write_lock_irq(&mhi_cntrl->pm_lock);
>  	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
> -- 
> 2.30.2
> 
