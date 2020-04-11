Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 609C51A4D7E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 04:26:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbgDKC0V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 22:26:21 -0400
Received: from mail-pj1-f65.google.com ([209.85.216.65]:32981 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726650AbgDKC0U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 22:26:20 -0400
Received: by mail-pj1-f65.google.com with SMTP id ay6so730010pjb.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2020 19:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9QWTHRRLu2SNoXMVr8er30dtVtDUkqmUu8dqdXp0zBo=;
        b=gwGyNDkE+v0753EJpooO71QpVYwsLyrGTVnJYTW7Yzj6M0xU/QZj76chLAuTLZWSAG
         9lHH/MJUJLj4kFuBpNvzcZQPf1j9fZu7O9hvQENB7QVNK+S/54ggxGTxL1m6I0ymfRWV
         rkO3WVrqJECAUj5XBVaZWIG3U2bVUfy0yY0NskrWVbSysKwt+Dp3bPHtrllJ3u2ZurMS
         D4XSSm4pjVrZ8kVJNSQeFuijeEjqdnYSePe1hz44i2MzsEbSyi1fTzVdIgOkKodgYmFB
         5Q6p6aABytM5dpS+g2IPPItTlH0qU5SRAFRvv5uh5UNah6tRqWX/igx5ZsvwukX5xUX/
         IvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9QWTHRRLu2SNoXMVr8er30dtVtDUkqmUu8dqdXp0zBo=;
        b=bKDJkWHM/drwNTseLEnuzp0mGUNf82ENmg4W2otBYCJDhaY7iZulBX0wVrRRMkMUUa
         Ks/eQmCiB5juyXtv2DcIbYUKrOMaeMAQBj/bg4RKy2+mtQS4bBz4iU//hATIXKTB3rL5
         5cA3Mi83BJWV5hCbpKDNUpBnSK8h2FAIdI8hFcgTQ++2kuLlfRQO8TIfWiQ/TfOMpaau
         MMomdML7hSk8ZkLIc2XeQ2Zo/e0PZjMSw2H0AWYQ+qfJ/c+MtNauf368TAxh81jHobsJ
         kp9juYR6iWpwqHxjMui+SDU2zmIzkpcjkbDe5x1q82bomLMhiGzwx6xL81lLn2XhvlUA
         F8fg==
X-Gm-Message-State: AGi0PubM4M+zEUIV9JbM7rXn0lI75QZjO+w2Wy5308SpSAVnMqrp6XKO
        rdEhsyFM/SUyga+dPHYJAZU95A==
X-Google-Smtp-Source: APiQypIAUsk9JXZ4eZ7z5c+24lbiiLbP6zb1dK3BsKgHpLxi25S9VapHngUiDqP0Qg9FgGN/gX1gkg==
X-Received: by 2002:a17:90a:de0e:: with SMTP id m14mr8702041pjv.54.1586571977804;
        Fri, 10 Apr 2020 19:26:17 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g14sm2895868pjd.15.2020.04.10.19.26.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2020 19:26:17 -0700 (PDT)
Date:   Fri, 10 Apr 2020 19:26:27 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 2/2] remoteproc: core: Prevent sleep when rproc crashes
Message-ID: <20200411022627.GA826227@builder.lan>
References: <1586384305-7825-1-git-send-email-sidgup@codeaurora.org>
 <1586384305-7825-3-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586384305-7825-3-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 08 Apr 15:18 PDT 2020, Siddharth Gupta wrote:

> Remoteproc recovery should be fast and any delay will have an impact on the
> user-experience. Add a wakeup source to remoteproc which ensures that the
> system does not go into idle state while a remoteproc is recovering, thus
> prevent any delays that might occur during system resume.
> 

This is better, but I think it can be reworded further to show that it's
not a matter of making it "fast", it's a matter of preventing suspend
from interrupting the recovery of a remoteproc.

> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c   | 1 +
>  drivers/remoteproc/remoteproc_core.c | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 7a63efb..6bb2c7d 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -401,6 +401,7 @@ static int adsp_probe(struct platform_device *pdev)
>  
>  	adsp = (struct qcom_adsp *)rproc->priv;
>  	adsp->dev = &pdev->dev;
> +	device_wakeup_enable(adsp->dev);

Move this 5 lines down and give it an empty line before and after.

>  	adsp->rproc = rproc;
>  	adsp->pas_id = desc->pas_id;
>  	adsp->has_aggre2_clk = desc->has_aggre2_clk;
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 9f99fe2..19a360d 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1729,6 +1729,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
>  
>  	if (!rproc->recovery_disabled)
>  		rproc_trigger_recovery(rproc);
> +
> +	pm_relax(rproc->dev.parent);
>  }
>  
>  /**
> @@ -2273,6 +2275,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>  		return;
>  	}
>  

	/* Prevent suspend while the remoteproc is being recovered */


PS. This patch is unrelated to patch 1/2, so please resubmit it
separately.

Regards,
Bjorn

> +	pm_stay_awake(rproc->dev.parent);
> +
>  	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>  		rproc->name, rproc_crash_to_string(type));
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
