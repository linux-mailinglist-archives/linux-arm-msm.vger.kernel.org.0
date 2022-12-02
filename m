Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9510A640C2B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 18:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234131AbiLBRaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 12:30:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234088AbiLBRaT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 12:30:19 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11ECB8C686
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 09:30:18 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id fa4-20020a17090af0c400b002198d1328a0so1602591pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 09:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fp74wiDe5hOL2VWW3txNgTav4ONTpI8t4myrGBqPC1w=;
        b=N4aOdwhf+Brlquc7gVHfx77TFL3B5WAYcxTD0LA/IwWv2tPG5w7wchZ7BstoRiSjIJ
         s4wc0OnHYwUScmiWnxnTEMHJcCaQWrbhHzF4M/SXHVeYbDM19VfQCbvZMV/8uBGAkjjZ
         /hcxqCHDgIws8Nqv5VUEbXNsDiX9G9U9hqJBJBJR9IUh28ejhu9Ab5pjNdnkjJmc4aXe
         m6JkQZ9hQ4HP8aBPmGnxWTsKt5d1sCKi3/lEpSFmyx62+dPAeMjucWjLHKp7HGrX6nyT
         qC65zNjHqJRzejO1f+R0GoJkWsOe6bk2iQkWJoYNkKaM9RViVVtSr/G7vJ5f8DsW88zT
         QjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fp74wiDe5hOL2VWW3txNgTav4ONTpI8t4myrGBqPC1w=;
        b=kXZG2SeO8Z7PwA4Jyb+zQhFNv4Zhk7ofFKXSX4pETTNHfiMY1G+b2H0STpCjYFEWgv
         sCCNIGmUI1ZQ0d77o508MYqE3I0FhBYbiGZ3EGQw2AZC1jfpBRf2be0f4iNlEmPH58aG
         pYMA0wn4TYBCyMe0SE60OPB3FRC8M3O6KhBtzLy/MuXza8Vki9p+ysUohQGCz3tnwxY7
         yVWy+5rN/iIGmR13XRa+BiDsqEmgurnk3HM9/hMf+R3Oy63OPjEj4j0RSHYci2uW+huj
         fPMG0ljZPjpgGkhtD/AsDpXIOmQazrCbIZD4bmpC4EUiuSgZUC9rvOF1uMUxzKka6u4E
         iu2A==
X-Gm-Message-State: ANoB5pkDhTi/v6ERpU6Fp+zuDV6miOuuTH/yptSrCqLp8nOKzQ1JENIX
        HFjfsPn2zb3dwKUm8ywVy4Pri2PB4iLTqvgs
X-Google-Smtp-Source: AA0mqf7EpMgLRKJzlI30cWySgrLGdTrg/dsFnnkIF2QrGagNYPhZYT/o+VLbba66/2AjV8MoTH7Yeg==
X-Received: by 2002:a17:903:240b:b0:186:9fc5:6c2c with SMTP id e11-20020a170903240b00b001869fc56c2cmr53502993plo.174.1670002217568;
        Fri, 02 Dec 2022 09:30:17 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:a85e:8886:e9cb:3b71])
        by smtp.gmail.com with ESMTPSA id ij19-20020a170902ab5300b001769e6d4fafsm5818766plb.57.2022.12.02.09.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 09:30:17 -0800 (PST)
Date:   Fri, 2 Dec 2022 10:30:15 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Maria Yu <quic_aiquny@quicinc.com>
Cc:     arnaud.pouliquen@foss.st.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, quic_clew@quicinc.com
Subject: Re: [PATCH v5 1/2] remoteproc: core: do pm relax when in
 RPROC_OFFLINE
Message-ID: <20221202173015.GC165812@p14s>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
 <20221202094532.2925-2-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221202094532.2925-2-quic_aiquny@quicinc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
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

Please add a newline here.

> +	if (rproc->state == RPROC_OFFLINE) {
> +		/* no need to recover if remote processor is offline */
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
