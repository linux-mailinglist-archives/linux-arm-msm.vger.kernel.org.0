Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65297640CE6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 19:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbiLBSQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 13:16:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234313AbiLBSQJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 13:16:09 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E15EFEF0EA;
        Fri,  2 Dec 2022 10:16:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 96298B82228;
        Fri,  2 Dec 2022 18:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD1EC433D6;
        Fri,  2 Dec 2022 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670004965;
        bh=soJj4Ja/1hLNJVg1joV3xhFw9ylDyPn1XfDLP4/kIRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jYDIiXa9lXbGjs687sFNH1CDkOd3vfzs0q69QlgN880mquCk6A/smAb4tKUD/wLZz
         ZYtmZHt+FLot5zMP91bBiu/KvgHcjwafLkYYdX5bmhGIUd44ajOHaAAmV5LEDjjDQD
         nDHTYLKYbT5B5ug+Su5xZikdxLsf35MT6tzgn8l6dbfERoqfcIbFHZVFOJSH5stPCB
         STCfHET1RPcjjkRrxnrqXXAnwAcuXVPOTEr+BHqhBDb3fYsR2tJba9tV+VeGNzJRfz
         lIGbvhm4QMETrAjiTJBDUhYLEiHfab/jie4WTPjmpX9VunNKuZG2qVDWHPPKcPJHax
         1u+wX56aq15BQ==
Date:   Fri, 2 Dec 2022 12:16:02 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Maria Yu <quic_aiquny@quicinc.com>
Cc:     mathieu.poirier@linaro.org, arnaud.pouliquen@foss.st.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        quic_clew@quicinc.com
Subject: Re: [PATCH v5 2/2] remoteproc: core: change to ordered workqueue for
 crash handler
Message-ID: <20221202181602.sg2pbgl5br2hw2rh@builder.lan>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-3-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202094532.2925-3-quic_aiquny@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 02, 2022 at 05:45:32PM +0800, Maria Yu wrote:
> Only the first detected crash needed to be handled, so change
> to ordered workqueue to avoid unnecessary multi active work at
> the same time.

In cab8300b5621 ("remoteproc: Use unbounded workqueue for recovery
work") Mukesh specifically said that it was required that multiple
remoteproc instances should be allowed to recover concurrently.

Is this no longer the case? Or am I perhaps misunderstanding the
nuances of the different work queue models?

> This will reduce the pm_relax unnecessary concurrency.

I'm not sure I understand this sentence, unless I remove the word
"pm_relax", was it added by mistake?


If so, is the support for concurrent recovery really unnecessary?

I know we have cases where we spend time in the recovery process just
waiting for things to happen, so allowing recovery to run concurrent
between instances sounds like a good idea.

Regards,
Bjorn

> 
> Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
> ---
>  drivers/remoteproc/remoteproc_core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index c2d0af048c69..4b973eea10bb 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -2728,8 +2728,8 @@ static void __exit rproc_exit_panic(void)
>  
>  static int __init remoteproc_init(void)
>  {
> -	rproc_recovery_wq = alloc_workqueue("rproc_recovery_wq",
> -						WQ_UNBOUND | WQ_FREEZABLE, 0);
> +	rproc_recovery_wq = alloc_ordered_workqueue("rproc_recovery_wq",
> +						WQ_FREEZABLE, 0);
>  	if (!rproc_recovery_wq) {
>  		pr_err("remoteproc: creation of rproc_recovery_wq failed\n");
>  		return -ENOMEM;
> -- 
> 2.17.1
> 
