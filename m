Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF93115F7F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 21:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730150AbgBNUqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 15:46:33 -0500
Received: from mail-yb1-f193.google.com ([209.85.219.193]:36379 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727742AbgBNUqc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 15:46:32 -0500
Received: by mail-yb1-f193.google.com with SMTP id u26so1851473ybd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2020 12:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=RHUTZjwrI6vyJPU7Cd6NMy2222aPRYqDwkoKG9dpivU=;
        b=mR/7BlbbaPcm1TFrio9KZZVGbZenxL86ZeoD/IhmxSTrZTU/uPFHBdUzG6uOtw4Cyy
         8Dix5y9Clp+bxiLggGMBZYGSeKBMFCHlWPgI/Xq6aZsYpXAXYHvP0OKB3nuDIWpxPg6i
         2oDkE7waN/xjrcQOv8gRw3V45XF4cYD8//Qp0sPtE35+R137ilSQBQzZ8226RPDQyj7V
         BLiuDlgJYDHK4wxjxId1pdJNSRgTkJgLNA0DNqHQLUTfQxdNsnY2Z3+ZmLJm1pezXb6B
         54sYZs1LDs6A3oEdKr908SjvXYH0Hp24JoPNiqMUZY/TZ8M86c+g1hBfGgUaElV6RkJq
         S/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=RHUTZjwrI6vyJPU7Cd6NMy2222aPRYqDwkoKG9dpivU=;
        b=BFAhohPOzq0KBI9d96hJBX1ab4MPtioIgEXOnVjvQB6YpvorRfybsWBE5BBoUAH5zZ
         7QBkTlbqeNGSofen1xh6atUr780KrhfiqKoM6mKfHJR8oVwhjQfpHqAMjFXt31vZMZ0n
         TfZ7fxwtfqxCG+kVB4PPhcB9uGrImdOOcm2Qu9XiAUf5UWTNowrjwEqeQmyYqnMdEj6a
         aGyTWokWh7pQsFPnlaYjO7xvql5iPH4YAkLaEi/A0QlAeOyeV69w/CJWnkJCxBKfA+FD
         UB3uWZpkHE1deKNEuJ+lIbJHc3EbcYFZqHPyrpNp1//9KqG9ivyC0l7cff8ZEwSqLXrS
         KrAQ==
X-Gm-Message-State: APjAAAX44EbTD/8ZEUK6QSAQ4Kxh39vPzkAg3fK77avU+ulntU68pXow
        A2gmoRFKwCXevWrNHb8yW4Orxg==
X-Google-Smtp-Source: APXvYqzWrX92zq0OET7I04H3pFyNlAlJFnTJp+CnMdzXK1ZjaRPkGfu48U51xoK9TR8fB+x2/utopQ==
X-Received: by 2002:a5b:d07:: with SMTP id y7mr4491691ybp.96.1581713190209;
        Fri, 14 Feb 2020 12:46:30 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id 124sm2999657ywm.25.2020.02.14.12.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 12:46:29 -0800 (PST)
Date:   Fri, 14 Feb 2020 13:46:27 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, anibal.limon@linaro.org
Subject: Re: [PATCH] remoteproc: qcom: wcnss: Add iris completion barrier
Message-ID: <20200214204627.GA10464@xps15>
References: <1581530043-12112-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581530043-12112-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 12, 2020 at 06:54:03PM +0100, Loic Poulain wrote:
> There is no guarantee that the iris pointer will be assigned before
> remoteproc subsystem starts the wcnss rproc, actually it depends how
> fast rproc subsystem is able to get the firmware to trigger the start.
> 
> This leads to sporadic wifi/bluetooth initialization issue on db410c
> with the following output:
>  remoteproc remoteproc1: powering up a204000.wcnss
>  remoteproc remoteproc1: Booting fw image qcom/msm8916/wcnss.mdt...
>  qcom-wcnss-pil a204000.wcnss: no iris registered
>  remoteproc remoteproc1: can't start rproc a204000.wcnss: -22
> 
> This patch introduces a 'iris_assigned' completion barrier to fix
> this issue. Maybe not the most elegant way, but it does the trick.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
> index a0468b3..c888282 100644
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
> @@ -84,6 +84,7 @@ struct qcom_wcnss {
>  
>  	struct completion start_done;
>  	struct completion stop_done;
> +	struct completion iris_assigned;
>  
>  	phys_addr_t mem_phys;
>  	phys_addr_t mem_reloc;
> @@ -138,6 +139,7 @@ void qcom_wcnss_assign_iris(struct qcom_wcnss *wcnss,
>  
>  	wcnss->iris = iris;
>  	wcnss->use_48mhz_xo = use_48mhz_xo;
> +	complete(&wcnss->iris_assigned);
>  
>  	mutex_unlock(&wcnss->iris_lock);
>  }
> @@ -213,6 +215,10 @@ static int wcnss_start(struct rproc *rproc)
>  	struct qcom_wcnss *wcnss = (struct qcom_wcnss *)rproc->priv;
>  	int ret;
>  
> +	/* Grant some time for iris registration */
> +	wait_for_completion_timeout(&wcnss->iris_assigned,
> +				    msecs_to_jiffies(5000));
> +
>  	mutex_lock(&wcnss->iris_lock);
>  	if (!wcnss->iris) {
>  		dev_err(wcnss->dev, "no iris registered\n");
> @@ -494,6 +500,7 @@ static int wcnss_probe(struct platform_device *pdev)
>  
>  	init_completion(&wcnss->start_done);
>  	init_completion(&wcnss->stop_done);
> +	init_completion(&wcnss->iris_assigned);
>  
>  	mutex_init(&wcnss->iris_lock);

If I understand the problem correctly, if loading the fw image takes long enough,
qcom_iris_probe() that is triggered by of_platform_populate() has time to
complete and call qcom_wcnss_assign_iris().  Otherwise the remoteproc core calls
wcnss_start() before qcom_wcnss_assign_iris() had the opportunity to run.

If I am correct, would it be possible to call of_platform_populate() before
calling rproc_add()?  There might be some refactoring to do but that's probably
better than introducing a delay...

Thanks,
Mathieu

>  
> -- 
> 2.7.4
> 
