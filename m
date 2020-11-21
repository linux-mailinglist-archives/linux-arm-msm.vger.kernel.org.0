Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 798962BBCD9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 05:04:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727208AbgKUEDQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Nov 2020 23:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbgKUEDP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Nov 2020 23:03:15 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B75FC0613CF
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 20:03:15 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id t143so12924710oif.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2020 20:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d+Jt7Kw8tpbR0XZRec6xgDcNSJxFLJiVa/Gv05lalew=;
        b=V3ft2O8JeSSLMy1nZsUqp23pVt9eilwqNNaJ56mAPY3c4Px4/iFl7M1t8ww4Ilfhru
         4Sz1i4Rdgy9ormCWbNs36UPOAAZM7DbHZDP56Qth9Nxgqw6Zn1PGQygV4M3/kQcAx7RL
         x9+f4zU1depG3fJ1LmEFunDbPTePXby+FCOl3YdEwfmA26Edtg0MuMiYJKUnrn+1HAZE
         3u9nXxptvpeVxQ1adajzI/rH4xBMVKsMBte1uHGXMgBTa9ACOKW6FJ1S7zuV8s4wnc5Y
         tKeHrudxFAgkhGD4XNQxf8+DEWvQdR+3/GoAw2ZgKng94WulU1km7lCF1ejtbJk02zB9
         xF/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d+Jt7Kw8tpbR0XZRec6xgDcNSJxFLJiVa/Gv05lalew=;
        b=FxbTgJN4eZuWcQAbUq6RB0coY0Xw2LwfsIy8ht0hz6jwE3TwC2i/g8ZqwiZjY3aBjp
         dVCmR/GCHgjYrX7k6BAd+zIwVKbHhItwzkpEKxkiDWJ4L4hV04J296imakEX/RXnCH6t
         kBTwlPWTkwKPuqSyus1twfFB1zuA3H1IqfOgN/oeBqDu10V6KyBPyT6sw/LfTQtC79lB
         ONkDXAagPtA1AeFAlkGQw2/xgSJgkLm4XOo/5G1yt5udQW7yZP8RAdVjIU3dv1uhxxFs
         0bo3kud173A+8IyaC865uWOxFY186n+wpP0f6NfnGV4qEsPxCNHNqP6xa6ANF2ktsf1u
         d4MA==
X-Gm-Message-State: AOAM530DS44I08K/B/PZ7OmSvbuLdPyUYZ0Sx7+1AdhU9CF5NFwpfJa0
        +KlWlnswMaBLjNkclmVgrYVhPA==
X-Google-Smtp-Source: ABdhPJxVDjWGCc5NwMV+giup5gCgzYtcJnesWwSzwDESxca8dWpFgXUfe5hC+9eX7BMITuhs6jJQIA==
X-Received: by 2002:aca:a9c8:: with SMTP id s191mr8025691oie.11.1605931394890;
        Fri, 20 Nov 2020 20:03:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id o63sm2781105ooa.10.2020.11.20.20.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 20:03:14 -0800 (PST)
Date:   Fri, 20 Nov 2020 22:03:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v8 1/4] remoteproc: core: Add ops to enable custom
 coredump functionality
Message-ID: <20201121040312.GJ9177@builder.lan>
References: <1605819935-10726-1-git-send-email-sidgup@codeaurora.org>
 <1605819935-10726-2-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605819935-10726-2-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 19 Nov 15:05 CST 2020, Siddharth Gupta wrote:

> Each remoteproc might have different requirements for coredumps and might
> want to choose the type of dumps it wants to collect. This change allows
> remoteproc drivers to specify their own custom dump function to be executed
> in place of rproc_coredump. If the coredump op is not specified by the
> remoteproc driver it will be set to rproc_coredump by default.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/remoteproc_core.c | 6 +++++-
>  include/linux/remoteproc.h           | 2 ++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index dab2c0f..eba7543 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1704,7 +1704,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
>  		goto unlock_mutex;
>  
>  	/* generate coredump */
> -	rproc_coredump(rproc);
> +	rproc->ops->coredump(rproc);
>  
>  	/* load firmware */
>  	ret = request_firmware(&firmware_p, rproc->firmware, dev);
> @@ -2126,6 +2126,10 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
>  	if (!rproc->ops)
>  		return -ENOMEM;
>  
> +	/* Default to rproc_coredump if no coredump function is specified */
> +	if (!rproc->ops->coredump)
> +		rproc->ops->coredump = rproc_coredump;
> +
>  	if (rproc->ops->load)
>  		return 0;
>  
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 3fa3ba6..a419878 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -375,6 +375,7 @@ enum rsc_handling_status {
>   * @get_boot_addr:	get boot address to entry point specified in firmware
>   * @panic:	optional callback to react to system panic, core will delay
>   *		panic at least the returned number of milliseconds
> + * @coredump:	  collect firmware dump after the subsystem is shutdown
>   */
>  struct rproc_ops {
>  	int (*prepare)(struct rproc *rproc);
> @@ -393,6 +394,7 @@ struct rproc_ops {
>  	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
>  	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
>  	unsigned long (*panic)(struct rproc *rproc);
> +	void (*coredump)(struct rproc *rproc);
>  };
>  
>  /**
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
