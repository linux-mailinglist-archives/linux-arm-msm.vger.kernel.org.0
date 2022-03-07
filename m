Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4790D4D027C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Mar 2022 16:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242498AbiCGPKU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Mar 2022 10:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236493AbiCGPKS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Mar 2022 10:10:18 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 834FE4DF58;
        Mon,  7 Mar 2022 07:09:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1F1D961224;
        Mon,  7 Mar 2022 15:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6614EC340E9;
        Mon,  7 Mar 2022 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646665762;
        bh=Py6F6pj5cnvncL/T9T4/xc5qexf5xVDcQfXArLLcVm4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DK5yv1ZrizLihhuKE0R/q79w74Jywoiov4DIhk3ueYtmk+52qdsPmpIic2XD6lZpt
         LlBv+cUWfcBmF1cLL9lB1l0ZM8fFIRYYoD3EQBZEGXb8sKfkdC+AaJup99RU6SEk+2
         OPlPwsmxWjg4WmehDEVSsW5lgiJbDWBHb6hbb+qz6BR27TfeHdcMVqP1v6xqIUEcGl
         uHBofUhqF9md4QSBeIg5yEHYSrVgw/Y67THY/k2BwZ07ggFoFM8klw/NPloBwZBnNI
         wS1Cc0UR9+WS9Lhv8+/HIPua7WrwHTzFrKjgezW7GY698Q4flZR98i2ZCy75JHa6pn
         vbUTJaKVjKJxQ==
Date:   Mon, 7 Mar 2022 20:39:16 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Hemant Kumar <hemantk@codeaurora.org>,
        Alex Elder <elder@linaro.org>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Fix signedness bug in
 mhi_ep_register_controller()
Message-ID: <20220307150916.GO12451@workstation>
References: <20220307142822.GC19660@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307142822.GC19660@kili>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 07, 2022 at 05:28:22PM +0300, Dan Carpenter wrote:
> The "mhi_cntrl->index" variable is unsigned so the error handling will
> not work.
> 
> Fixes: 10f0ab9c6787 ("bus: mhi: ep: Add support for registering MHI endpoint controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix! The fix was already added to mhi-next (squashed) as a
response to the previous report.

https://lore.kernel.org/mhi/20220307071739.GM12451@workstation/T/#t

Thanks,
Mani

> ---
>  drivers/bus/mhi/ep/main.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 3e98107f08c4..879071b021d5 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1418,11 +1418,10 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>  	mhi_ep_mmio_set_env(mhi_cntrl, MHI_EE_AMSS);
>  
>  	/* Set controller index */
> -	mhi_cntrl->index = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
> -	if (mhi_cntrl->index < 0) {
> -		ret = mhi_cntrl->index;
> +	ret = ida_alloc(&mhi_ep_cntrl_ida, GFP_KERNEL);
> +	if (ret < 0)
>  		goto err_destroy_wq;
> -	}
> +	mhi_cntrl->index = ret;
>  
>  	irq_set_status_flags(mhi_cntrl->irq, IRQ_NOAUTOEN);
>  	ret = request_irq(mhi_cntrl->irq, mhi_ep_irq, IRQF_TRIGGER_HIGH,
> -- 
> 2.20.1
> 
