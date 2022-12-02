Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D173640CD4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 19:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233709AbiLBSJZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 13:09:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233664AbiLBSJZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 13:09:25 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45EDEDA7F1;
        Fri,  2 Dec 2022 10:09:24 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0A1D6B82216;
        Fri,  2 Dec 2022 18:09:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DDB1C433D6;
        Fri,  2 Dec 2022 18:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670004561;
        bh=SlxPpidoaq4/k2kywngMB0JL5nx7vMV5drbBSm3uGlU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gE1asRLBmagtzLY1z7zjXh+lHpqT50pKBKbdHv9GkJ77xLcmm1s+2ENwt4WLqpkec
         BsFhUDtYU++KrdjrBQWJ/AqqENEfRHjidw6gaT9erCQrXYGaB5YviK6cQun90rXbhj
         6iGyatoB9GjsdJ6f/euuZW88DapkP8LRFX4I2LTvcLuOnHVxSL9rOseFDu55rqaPcT
         i1dlTEAq0GwadUAoPE2I6+VHpFBh4g3z8vkkyOsiGU22xbBcZqE8UyQQoOkkmRKp/M
         jf3dh/DQHO/fjPawERO+WbokfdiwIREYY/GtBdFxIhf0agxni09y51H08u8qpDlyGB
         wz5iDsP86zLqA==
Date:   Fri, 2 Dec 2022 12:09:19 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Maria Yu <quic_aiquny@quicinc.com>
Cc:     mathieu.poirier@linaro.org, arnaud.pouliquen@foss.st.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        quic_clew@quicinc.com
Subject: Re: [PATCH v5 1/2] remoteproc: core: do pm relax when in
 RPROC_OFFLINE
Message-ID: <20221202180919.ffxzaflxlc4af6hu@builder.lan>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-2-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202094532.2925-2-quic_aiquny@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 02, 2022 at 05:45:31PM +0800, Maria Yu wrote:
> RPROC_OFFLINE state indicate there is no recovery process
> is in progress and no chance to do the pm_relax.
> Because when recovering from crash, rproc->lock is held and
> state is RPROC_CRASHED -> RPROC_OFFLINE -> RPROC_RUNNING,
> and then unlock rproc->lock.
> When the state is in RPROC_OFFLINE it means separate request
> of rproc_stop was done and no need to hold the wakeup source
> in crash handler to recover any more.
> 

It's not obvious to me that you're trying to say here is "make sure that
pm_relax() happens even when the remoteproc is stopped before the crash
handler work is scheduled".

> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 8768cb64f560..c2d0af048c69 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1862,11 +1862,16 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	mutex_lock(&rproc->lock);
>  
> -	if (rproc->state == RPROC_CRASHED || rproc->state == RPROC_OFFLINE) {
> +	if (rproc->state == RPROC_CRASHED) {
>  		/* handle only the first crash detected */
>  		mutex_unlock(&rproc->lock);
>  		return;
>  	}
> +	if (rproc->state == RPROC_OFFLINE) {
> +		/* no need to recover if remote processor is offline */

I don't think it's correct to say "no need", I think if the user stopped
the remoteproc before the recovery was scheduled recovery would undo
that stop...

So perhaps something like:

"Don't recover if the remote processor was stopped"

Regards,
Bjorn

> +		mutex_unlock(&rproc->lock);
> +		goto out;
> +	}
>  
>  	rproc->state = RPROC_CRASHED;
>  	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
> @@ -1877,6 +1882,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  	if (!rproc->recovery_disabled)
>  		rproc_trigger_recovery(rproc);
>  
> +out:
>  	pm_relax(rproc->dev.parent);
>  }
>  
> -- 
> 2.17.1
> 
